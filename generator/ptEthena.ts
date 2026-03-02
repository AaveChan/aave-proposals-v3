/**
 * PT Ethena listing generator for Aave V3 Ethereum
 *
 * Uses the standard generator pipeline (assetListing + eModeCreations build functions,
 * generateFiles/writeFiles) and adds the PT-specific extras:
 *   - _preExecute  (collector seed transfer)
 *   - setLiquidationProtocolFee calls
 *   - IAgentHub.addAllowedMarket whitelisting
 *   - _findFirstUnusedEmodeCategory helper
 *
 * New imports (MiscEthereum, IAgentHub, IPool) are auto-detected by importsResolver.
 *
 * Usage: npm run generate:pt-ethena
 */
import 'dotenv/config';
import {select, confirm} from '@inquirer/prompts';
import {getContract} from 'viem';
import {getClient, IERC20Metadata_ABI} from '@bgd-labs/toolbox';
import {VOTING_NETWORK, FEATURE, CodeArtifact, PoolConfigs} from './types';
import {assetListing} from './features/assetListing';
import {eModeCreations} from './features/eModesCreation';
import {generateFiles, writeFiles} from './generator';
import {getAssets, getDate, pascalCase, CHAIN_TO_CHAIN_ID, getPoolChain} from './common';
import {addressPrompt} from './prompts/addressPrompt';
import {percentPrompt} from './prompts/percentPrompt';
import {numberPrompt} from './prompts/numberPrompt';
import {stringPrompt} from './prompts/stringPrompt';
import type {Listing, EModeCategoryCreation} from './features/types';
import type {Hex} from 'viem';

// ---------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------

const POOL = 'AaveV3Ethereum' as const;

/** PT_USDe assets already listed on Aave (from address book) */
const PT_USDE_ASSETS = getAssets(POOL).filter((a) => a.startsWith('PT_USDe_'));
/** PT_sUSDE assets already listed on Aave (from address book) */
const PT_SUSDE_ASSETS = getAssets(POOL).filter((a) => a.startsWith('PT_sUSDE_'));

// Standard PT listing params — same across all Pendle PT proposals
const PT_BORROW_UPDATE = {
  enabledToBorrow: 'DISABLED',
  flashloanable: 'ENABLED',
  borrowableInIsolation: 'DISABLED',
  withSiloedBorrowing: 'DISABLED',
  reserveFactor: '45',
} as const;

const PT_COLLATERAL_UPDATE = {
  ltv: '0',
  liqThreshold: '0',
  liqBonus: '0',
  liqProtocolFee: '0',
  debtCeiling: '0',
} as const;

const PT_CAPS = {borrowCap: '1'} as const;

const PT_RATE_PARAMS = {
  optimalUtilizationRate: '45',
  baseVariableBorrowRate: '0',
  variableRateSlope1: '10',
  variableRateSlope2: '300',
} as const;

// Standard eMode borrowable sets
const STABLECOINS = ['USDC', 'USDT', 'USDe', 'USDtb'] as const;
const USDE_ONLY = ['USDe'] as const;

// ---------------------------------------------------------------------------
// Prompt helpers
// ---------------------------------------------------------------------------

async function promptNewPt(kind: 'PT_USDe' | 'PT_sUSDe') {
  console.log(`\n--- New ${kind} ---`);

  const address = await addressPrompt({message: `  ${kind} address`, required: true});

  // Fetch symbol on-chain and normalise hyphens → underscores (e.g. "PT-USDe-7AUG2026" → "PT_USDe_7AUG2026")
  let onChainSymbol = '';
  try {
    const erc20 = getContract({
      abi: IERC20Metadata_ABI,
      client: getClient(CHAIN_TO_CHAIN_ID[getPoolChain(POOL)], {}),
      address: address as Hex,
    });
    onChainSymbol = ((await erc20.read.symbol()) as string).replaceAll('-', '_');
  } catch {
    console.log('  (could not fetch symbol on-chain — please enter it manually)');
  }

  const symbol = await stringPrompt({
    message: `  Symbol`,
    defaultValue: onChainSymbol,
    required: true,
  });
  const priceFeed = await addressPrompt({message: `  ${symbol} price feed`, required: true});
  const supplyCap = await numberPrompt({
    message: `  ${symbol} supply cap (whole tokens)`,
    required: true,
  });
  const seedTokens = await numberPrompt({
    message: `  ${symbol} seed amount (whole tokens, default: 100)`,
    required: false,
  });
  const lmAdmin = await addressPrompt({
    message: `  ${symbol} LM admin (optional)`,
    required: false,
  });

  return {
    symbol,
    address: address as Hex,
    priceFeed: priceFeed as Hex,
    supplyCap,
    seedTokens: seedTokens || '100',
    lmAdmin,
  };
}

async function promptEmodeParams(
  label: string,
  defaults: {ltv: string; liqThreshold: string; liqBonus: string},
) {
  console.log(`\n  eMode: ${label}`);
  const ltv = await percentPrompt({message: `    LTV`}, {default: defaults.ltv});
  const liqThreshold = await percentPrompt(
    {message: `    LiqThreshold`},
    {default: defaults.liqThreshold},
  );
  const liqBonus = await percentPrompt({message: `    LiqBonus`}, {default: defaults.liqBonus});
  return {ltv, liqThreshold, liqBonus};
}

// ---------------------------------------------------------------------------
// Artifact patching helpers
// ---------------------------------------------------------------------------

/** Replace assetListing's hardcoded 1e18 with the actual seed amount */
function patchSeedAmount(artifact: CodeArtifact, symbol: string, seedTokens: string) {
  if (!artifact.code?.constants) return;
  artifact.code.constants = artifact.code.constants.map((c) =>
    c.replace(`${symbol}_SEED_AMOUNT = 1e18`, `${symbol}_SEED_AMOUNT = ${seedTokens}e18`),
  );
}

/**
 * eModeCreations.build() references new PTs via AaveV3EthereumAssets.SYMBOL_UNDERLYING,
 * but they aren't in the address book yet — replace with the contract constant instead.
 */
function patchNewPtInEmodeArtifact(artifact: CodeArtifact, symbol: string) {
  if (!artifact.code?.fn) return;
  artifact.code.fn = artifact.code.fn.map((f) =>
    f.replaceAll(`AaveV3EthereumAssets.${symbol}_UNDERLYING`, symbol),
  );
}

// ---------------------------------------------------------------------------
// Custom PT Ethena CodeArtifact (preExecute + liqFee + agent hub)
// ---------------------------------------------------------------------------

function buildPtEthenaArtifact(usdeSymbol: string, susdeSymbol: string): CodeArtifact {
  const preExecuteFn = `
function _preExecute() internal override {
  // Uncomment if seed tokens need to be sourced from the Collector
  // (e.g. if direct funding to the executor was sent to the wrong address)
  // AaveV3Ethereum.COLLECTOR.transfer(
  //   IERC20(${usdeSymbol}),
  //   GovernanceV3Ethereum.EXECUTOR_LVL_1,
  //   ${usdeSymbol}_SEED_AMOUNT
  // );
  // AaveV3Ethereum.COLLECTOR.transfer(
  //   IERC20(${susdeSymbol}),
  //   GovernanceV3Ethereum.EXECUTOR_LVL_1,
  //   ${susdeSymbol}_SEED_AMOUNT
  // );
}`;

  const findFirstUnusedFn = `
function _findFirstUnusedEmodeCategory(IPool pool) private view returns (uint8) {
  // eMode id 0 is skipped intentionally as it is the reserved default
  for (uint8 i = 1; i < 256; i++) {
    if (pool.getEModeCategoryCollateralConfig(i).liquidationThreshold == 0) return i;
  }
  revert NoAvailableEmodeCategory();
}`;

  const agentHubExecute = `
AaveV3Ethereum.POOL_CONFIGURATOR.setLiquidationProtocolFee(${usdeSymbol}, 1000);
AaveV3Ethereum.POOL_CONFIGURATOR.setLiquidationProtocolFee(${susdeSymbol}, 1000);

uint8 nextID = _findFirstUnusedEmodeCategory(AaveV3Ethereum.POOL);

// whitelist the new eModes on automated chaos-agents [agentId 0: EModeCategoryUpdate_Core]
IAgentHub(MiscEthereum.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 1)));
IAgentHub(MiscEthereum.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 2)));
IAgentHub(MiscEthereum.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 3)));
IAgentHub(MiscEthereum.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 4)));

// whitelist the new pt-assets on automated chaos-agents [agentId 1: PendleDiscountRateUpdate_Core]
IAgentHub(MiscEthereum.AGENT_HUB).addAllowedMarket(1, ${usdeSymbol});
IAgentHub(MiscEthereum.AGENT_HUB).addAllowedMarket(1, ${susdeSymbol});`;

  return {
    code: {
      constants: ['error NoAvailableEmodeCategory();'],
      fn: [preExecuteFn, findFirstUnusedFn],
      execute: [agentHubExecute],
    },
  };
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

console.log('\nPT Ethena listing generator');
console.log('Generates all proposal files via the standard generator pipeline\n');

// 1. Select old PT tokens from address book (collateral in new eModes)
const oldPtUsde = await select({
  message: 'Select old PT_USDe (from address book) to include in eModes as collateral:',
  choices: PT_USDE_ASSETS.map((a) => ({name: a, value: a})),
});

const oldPtSusde = await select({
  message: 'Select old PT_sUSDE (from address book) to include in eModes as collateral:',
  choices: PT_SUSDE_ASSETS.map((a) => ({name: a, value: a})),
});

// 2. New PT listing configs
const newPtUsde = await promptNewPt('PT_USDe');
const newPtSusde = await promptNewPt('PT_sUSDe');

// 3. eMode parameters — defaults from the established PT Ethena pattern
console.log('\n--- eMode parameters (% values, e.g. 87.2 → 87.20%) ---');
const eModeParams = {
  usdeStablecoins: await promptEmodeParams(`${newPtUsde.symbol}__Stablecoins`, {
    ltv: '87.2',
    liqThreshold: '89.2',
    liqBonus: '4.4',
  }),
  usdeUsde: await promptEmodeParams(`${newPtUsde.symbol}__USDe`, {
    ltv: '88.1',
    liqThreshold: '90.1',
    liqBonus: '3.4',
  }),
  susdeStablecoins: await promptEmodeParams(`${newPtSusde.symbol}__Stablecoins`, {
    ltv: '86.4',
    liqThreshold: '88.4',
    liqBonus: '5.5',
  }),
  susdeUsde: await promptEmodeParams(`${newPtSusde.symbol}__USDe`, {
    ltv: '87.2',
    liqThreshold: '89.2',
    liqBonus: '4.5',
  }),
};

// 4. Proposal metadata
console.log('\n--- Proposal metadata ---');
const discussion = await stringPrompt({message: 'Forum discussion link', required: false});
const snapshot = await stringPrompt({
  message: 'Snapshot link (empty = direct-to-aip)',
  required: false,
});
const author = await stringPrompt({
  message: 'Author',
  required: true,
  defaultValue: 'Aave Chan Initiative @aci',
});

// ---------------------------------------------------------------------------
// Build generator inputs
// ---------------------------------------------------------------------------

const expiry = newPtUsde.symbol.replace(/^PT_USDe_/, ''); // e.g. "7AUG2026"
const shortName = `ListingPTEthena${expiry}`;
const date = getDate();

const options = {
  title: `Listing PT Ethena ${expiry}`,
  shortName: pascalCase(shortName),
  author,
  discussion: discussion || 'TODO',
  snapshot: snapshot || 'direct-to-aip',
  date,
  pools: [POOL] as (typeof POOL)[],
  votingNetwork: VOTING_NETWORK.AVALANCHE,
};

const cache = {blockNumber: 0};

// — Listing config —
const listingCfg: Listing[] = [
  {
    asset: newPtUsde.address,
    assetSymbol: newPtUsde.symbol,
    decimals: 18,
    priceFeed: newPtUsde.priceFeed,
    supplyCap: newPtUsde.supplyCap,
    admin: newPtUsde.lmAdmin as Hex,
    eModeCategory: '',
    ...PT_BORROW_UPDATE,
    ...PT_COLLATERAL_UPDATE,
    ...PT_CAPS,
    rateStrategyParams: {...PT_RATE_PARAMS},
  },
  {
    asset: newPtSusde.address,
    assetSymbol: newPtSusde.symbol,
    decimals: 18,
    priceFeed: newPtSusde.priceFeed,
    supplyCap: newPtSusde.supplyCap,
    admin: newPtSusde.lmAdmin as Hex,
    eModeCategory: '',
    ...PT_BORROW_UPDATE,
    ...PT_COLLATERAL_UPDATE,
    ...PT_CAPS,
    rateStrategyParams: {...PT_RATE_PARAMS},
  },
];

// — eMode creation config —
// new PT symbols are placed first in collaterals; eModeCreations.build() will generate
// AaveV3EthereumAssets.SYMBOL_UNDERLYING for them — we patch that out afterwards.
const eModeCfg: EModeCategoryCreation[] = [
  {
    ...eModeParams.usdeStablecoins,
    label: `${newPtUsde.symbol}__Stablecoins`,
    collateralAssets: [newPtUsde.symbol, 'USDe', oldPtUsde],
    borrowableAssets: [...STABLECOINS],
  },
  {
    ...eModeParams.usdeUsde,
    label: `${newPtUsde.symbol}__USDe`,
    collateralAssets: [newPtUsde.symbol, 'USDe', oldPtUsde],
    borrowableAssets: [...USDE_ONLY],
  },
  {
    ...eModeParams.susdeStablecoins,
    label: `${newPtSusde.symbol}__Stablecoins`,
    collateralAssets: [newPtSusde.symbol, 'sUSDe', oldPtSusde],
    borrowableAssets: [...STABLECOINS],
  },
  {
    ...eModeParams.susdeUsde,
    label: `${newPtSusde.symbol}__USDe`,
    collateralAssets: [newPtSusde.symbol, 'sUSDe', oldPtSusde],
    borrowableAssets: [...USDE_ONLY],
  },
];

// ---------------------------------------------------------------------------
// Build & patch artifacts
// ---------------------------------------------------------------------------

// assetListing artifact — fix seed amount (generator hardcodes 1e18)
const listingArtifact = assetListing.build({pool: POOL, cfg: listingCfg, options, cache});
patchSeedAmount(listingArtifact, newPtUsde.symbol, newPtUsde.seedTokens);
patchSeedAmount(listingArtifact, newPtSusde.symbol, newPtSusde.seedTokens);

// eModeCreations artifact — fix new PT collateral references (not yet in address book)
const eModesArtifact = eModeCreations.build({pool: POOL, cfg: eModeCfg, options, cache});
patchNewPtInEmodeArtifact(eModesArtifact, newPtUsde.symbol);
patchNewPtInEmodeArtifact(eModesArtifact, newPtSusde.symbol);

// PT-specific extras: preExecute + liqFee + agent hub whitelisting
const ptEthenaArtifact = buildPtEthenaArtifact(newPtUsde.symbol, newPtSusde.symbol);

// ---------------------------------------------------------------------------
// Assemble pool config and generate all files
// ---------------------------------------------------------------------------

const poolConfigs: PoolConfigs = {
  [POOL]: {
    artifacts: [listingArtifact, eModesArtifact, ptEthenaArtifact],
    configs: {
      [FEATURE.ASSET_LISTING]: listingCfg,
      [FEATURE.EMODES_CREATION]: eModeCfg,
    },
    cache,
  },
};

console.log(`\nFolder: src/${date}_${POOL}_${options.shortName}`);
console.log(`Contract: ${POOL}_${options.shortName}_${date}.sol`);

const proceed = await confirm({message: 'Generate files?', default: true});
if (!proceed) process.exit(0);

const files = await generateFiles(options, poolConfigs);
await writeFiles(options, files);

console.log('\nDone! All files generated via the standard generator pipeline.');
console.log('The payload .sol includes: newListings, eModeCategoryCreations,');
console.log('_preExecute (collector seed), _postExecute (supply + liqFee + agent hub).');
