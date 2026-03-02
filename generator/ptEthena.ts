/**
 * PT Ethena listing generator for any Aave V3 chain
 *
 * Uses the standard generator pipeline (assetListing + eModeCreations build functions,
 * generateFiles/writeFiles) and adds the PT-specific extras:
 *   - _preExecute  (commented-out collector seed transfer)
 *   - setLiquidationProtocolFee calls
 *   - IAgentHub.addAllowedMarket whitelisting (optional, per-chain)
 *   - _findFirstUnusedEmodeCategory helper (when agent hub is enabled)
 *
 * New imports (MiscX, IAgentHub, IPool, GovernanceV3X) are auto-detected by importsResolver.
 *
 * Usage: npm run generate:pt-ethena
 */
import 'dotenv/config';
import {select, confirm} from '@inquirer/prompts';
import {getContract} from 'viem';
import {getClient, IERC20Metadata_ABI} from '@bgd-labs/toolbox';
import {VOTING_NETWORK, FEATURE, CodeArtifact, PoolConfigs, V3_POOLS} from './types';
import type {PoolIdentifierV3} from './types';
import {assetListing} from './features/assetListing';
import {eModeCreations} from './features/eModesCreation';
import {writeConfigOnly} from './generator';
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

/** Standard PT listing params — same across all Pendle PT proposals */
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

// ---------------------------------------------------------------------------
// Prompt helpers
// ---------------------------------------------------------------------------

async function promptNewPt(kind: 'PT_USDe' | 'PT_sUSDe', pool: PoolIdentifierV3) {
  console.log(`\n--- New ${kind} ---`);

  const address = await addressPrompt({message: `  ${kind} address`, required: true});

  // Fetch symbol on-chain and normalise hyphens → underscores (e.g. "PT-USDe-7AUG2026" → "PT_USDe_7AUG2026")
  let onChainSymbol = '';
  try {
    const erc20 = getContract({
      abi: IERC20Metadata_ABI,
      client: getClient(
        CHAIN_TO_CHAIN_ID[getPoolChain(pool) as keyof typeof CHAIN_TO_CHAIN_ID],
        {},
      ),
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
 * eModeCreations.build() references new PTs via ${pool}Assets.SYMBOL_UNDERLYING,
 * but they aren't in the address book yet — replace with the contract constant instead.
 */
function patchNewPtInEmodeArtifact(artifact: CodeArtifact, symbol: string, pool: string) {
  if (!artifact.code?.fn) return;
  artifact.code.fn = artifact.code.fn.map((f) =>
    f.replaceAll(`${pool}Assets.${symbol}_UNDERLYING`, symbol),
  );
}

// ---------------------------------------------------------------------------
// Custom PT Ethena CodeArtifact (preExecute + liqFee + optional agent hub)
// ---------------------------------------------------------------------------

function buildPtEthenaArtifact(
  usdeSymbol: string,
  susdeSymbol: string,
  pool: string,
  gov: string,
  misc: string,
): CodeArtifact {
  const preExecuteFn = `
function _preExecute() internal override {
  // Uncomment if seed tokens need to be sourced from the Collector
  // (e.g. if direct funding to the executor was sent to the wrong address)
  // ${pool}.COLLECTOR.transfer(
  //   IERC20(${usdeSymbol}),
  //   ${gov}.EXECUTOR_LVL_1,
  //   ${usdeSymbol}_SEED_AMOUNT
  // );
  // ${pool}.COLLECTOR.transfer(
  //   IERC20(${susdeSymbol}),
  //   ${gov}.EXECUTOR_LVL_1,
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

  const liqFeeExecute = `
${pool}.POOL_CONFIGURATOR.setLiquidationProtocolFee(${usdeSymbol}, 1000);
${pool}.POOL_CONFIGURATOR.setLiquidationProtocolFee(${susdeSymbol}, 1000);

uint8 nextID = _findFirstUnusedEmodeCategory(${pool}.POOL);

// whitelist the new eModes on automated chaos-agents [agentId 0: EModeCategoryUpdate_Core]
IAgentHub(${misc}.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 1)));
IAgentHub(${misc}.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 2)));
IAgentHub(${misc}.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 3)));
IAgentHub(${misc}.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 4)));

// whitelist the new pt-assets on automated chaos-agents [agentId 1: PendleDiscountRateUpdate_Core]
IAgentHub(${misc}.AGENT_HUB).addAllowedMarket(1, ${usdeSymbol});
IAgentHub(${misc}.AGENT_HUB).addAllowedMarket(1, ${susdeSymbol});`;

  const constants = ['error NoAvailableEmodeCategory();'];
  const fn = [preExecuteFn, findFirstUnusedFn];

  return {
    code: {
      constants,
      fn,
      execute: [liqFeeExecute],
    },
  };
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

console.log('\nPT Ethena listing generator');
console.log('Generates all proposal files via the standard generator pipeline\n');

// 1. Select pool
const POOL = (await select({
  message: 'Select pool:',
  choices: V3_POOLS.map((p) => ({name: p, value: p})),
})) as PoolIdentifierV3;

const chain = getPoolChain(POOL);
const GOV = `GovernanceV3${chain}`;
const MISC = `Misc${chain}`;

// Derive stablecoins available on this pool (for eMode borrowable assets)
const poolAssetSet = new Set(getAssets(POOL));
const STABLECOINS = ['USDC', 'USDT', 'USDe', 'USDtb'].filter((a) => poolAssetSet.has(a));
const USDE_ONLY = ['USDe'];

// 2. Select old PT tokens from address book (optional — skipped on first listing)
const PT_USDE_ASSETS = getAssets(POOL).filter((a) => a.startsWith('PT_USDe_'));
const PT_SUSDE_ASSETS = getAssets(POOL).filter((a) => a.startsWith('PT_sUSDE_'));

let oldPtUsde: string | undefined;
if (PT_USDE_ASSETS.length > 0) {
  oldPtUsde = await select({
    message: 'Select old PT_USDe (from address book) to include in eModes as collateral:',
    choices: PT_USDE_ASSETS.map((a) => ({name: a, value: a})),
  });
} else {
  console.log('No existing PT_USDe found in address book — first PT_USDe listing on this pool.');
}

let oldPtSusde: string | undefined;
if (PT_SUSDE_ASSETS.length > 0) {
  oldPtSusde = await select({
    message: 'Select old PT_sUSDE (from address book) to include in eModes as collateral:',
    choices: PT_SUSDE_ASSETS.map((a) => ({name: a, value: a})),
  });
} else {
  console.log('No existing PT_sUSDE found in address book — first PT_sUSDE listing on this pool.');
}

// 3. New PT listing configs
const newPtUsde = await promptNewPt('PT_USDe', POOL);
const newPtSusde = await promptNewPt('PT_sUSDe', POOL);

// 4. eMode parameters — defaults from the established PT Ethena pattern
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

// 5. Proposal metadata
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
  pools: [POOL],
  votingNetwork: VOTING_NETWORK.AVALANCHE,
};

const blockNumber = Number(
  await getClient(CHAIN_TO_CHAIN_ID[chain as keyof typeof CHAIN_TO_CHAIN_ID], {}).getBlockNumber(),
);
const cache = {blockNumber};

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
// ${POOL}Assets.SYMBOL_UNDERLYING for them — we patch that out afterwards.
const eModeCfg: EModeCategoryCreation[] = [
  {
    ...eModeParams.usdeStablecoins,
    label: `${newPtUsde.symbol}__Stablecoins`,
    collateralAssets: [newPtUsde.symbol, 'USDe', ...(oldPtUsde ? [oldPtUsde] : [])],
    borrowableAssets: STABLECOINS,
  },
  {
    ...eModeParams.usdeUsde,
    label: `${newPtUsde.symbol}__USDe`,
    collateralAssets: [newPtUsde.symbol, 'USDe', ...(oldPtUsde ? [oldPtUsde] : [])],
    borrowableAssets: USDE_ONLY,
  },
  {
    ...eModeParams.susdeStablecoins,
    label: `${newPtSusde.symbol}__Stablecoins`,
    collateralAssets: [newPtSusde.symbol, 'sUSDe', ...(oldPtSusde ? [oldPtSusde] : [])],
    borrowableAssets: STABLECOINS,
  },
  {
    ...eModeParams.susdeUsde,
    label: `${newPtSusde.symbol}__USDe`,
    collateralAssets: [newPtSusde.symbol, 'sUSDe', ...(oldPtSusde ? [oldPtSusde] : [])],
    borrowableAssets: USDE_ONLY,
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
patchNewPtInEmodeArtifact(eModesArtifact, newPtUsde.symbol, POOL);
patchNewPtInEmodeArtifact(eModesArtifact, newPtSusde.symbol, POOL);

// PT-specific extras: preExecute + liqFee + optional agent hub whitelisting
const ptEthenaArtifact = buildPtEthenaArtifact(
  newPtUsde.symbol,
  newPtSusde.symbol,
  POOL,
  GOV,
  MISC,
);

// ---------------------------------------------------------------------------
// Assemble pool config and generate all files
// ---------------------------------------------------------------------------

const poolConfigs: PoolConfigs = {
  [POOL]: {
    artifacts: [listingArtifact, eModesArtifact, ptEthenaArtifact],
    configs: {
      [FEATURE.ASSET_LISTING]: listingCfg,
      [FEATURE.EMODES_CREATION]: eModeCfg,
      // Persisted so ptEthena.ts can rebuild the artifact when re-run with --configFile
      [FEATURE.OTHERS]: ptEthenaArtifact.code,
    },
    cache,
  },
};

const folderName = `src/${date}_${POOL}_${options.shortName}`;
console.log(`\nFolder: ${folderName}`);

const proceed = await confirm({message: 'Generate config?', default: true});
if (!proceed) process.exit(0);

const configPath = await writeConfigOnly(options, poolConfigs);

console.log(`\nConfig written to ${configPath}`);
console.log(`\nTo generate all proposal files run:`);
console.log(`  npm run generate -- --configFile ${folderName}/config.ts`);
