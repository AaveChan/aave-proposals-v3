/**
 * PT listing generator for any Aave V3 chain
 *
 * Supports two listing types selectable at runtime:
 *   - PT Ethena: lists PT_USDe + PT_sUSDe (2 tokens, 4 eModes)
 *   - Strata:    lists PT_srUSDe           (1 token,  2 eModes)
 *
 * For both types the e-mode pattern is the same: each new PT gets a
 * Stablecoins eMode and a USDe eMode, with the previous-maturity PT
 * included as collateral so users can migrate between maturities.
 *
 * Uses the standard generator pipeline (assetListing + eModeCreations build
 * functions, generateFiles/writeFiles) and adds the PT-specific extras:
 *   - _preExecute  (commented-out collector seed transfer)
 *   - setLiquidationProtocolFee calls
 *   - IAgentHub.addAllowedMarket whitelisting
 *   - _findFirstUnusedEmodeCategory helper
 *
 * Usage: npm run generate:pt
 */
import 'dotenv/config';
import {select, confirm} from '@inquirer/prompts';
import {getContract} from 'viem';
import {getClient, IERC20Metadata_ABI} from '@bgd-labs/toolbox';
import {VOTING_NETWORK, FEATURE, CodeArtifact, PoolConfigs, V3_POOLS} from './types';
import type {PoolIdentifierV3} from './types';
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
// Types
// ---------------------------------------------------------------------------

type NewPt = {
  symbol: string;
  address: Hex;
  priceFeed: Hex;
  supplyCap: string;
  seedTokens: string;
  lmAdmin?: Hex;
};

type EmodeParamSet = {ltv: string; liqThreshold: string; liqBonus: string};

// ---------------------------------------------------------------------------
// Prompt helpers
// ---------------------------------------------------------------------------

async function promptNewPt(
  kind: 'PT_USDe' | 'PT_sUSDe' | 'PT_srUSDe',
  pool: PoolIdentifierV3,
): Promise<NewPt> {
  console.log(`\n--- New ${kind} ---`);

  const address = await addressPrompt({message: `  ${kind} address`, required: true});

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

async function promptEmodeParams(label: string, defaults: EmodeParamSet): Promise<EmodeParamSet> {
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
// Config builders
// ---------------------------------------------------------------------------

function buildPtListing(pt: NewPt): Listing {
  return {
    asset: pt.address,
    assetSymbol: pt.symbol,
    decimals: 18,
    priceFeed: pt.priceFeed,
    supplyCap: pt.supplyCap,
    admin: pt.lmAdmin as Hex,
    eModeCategory: '',
    ...PT_BORROW_UPDATE,
    ...PT_COLLATERAL_UPDATE,
    ...PT_CAPS,
    rateStrategyParams: {...PT_RATE_PARAMS},
  };
}

function buildEmodePair(
  symbol: string,
  pairedUnderlying: string,
  oldPt: string | undefined,
  stablecoinsParams: EmodeParamSet,
  usdeParams: EmodeParamSet,
  stablecoins: string[],
): EModeCategoryCreation[] {
  const collaterals = [symbol, pairedUnderlying, ...(oldPt ? [oldPt] : [])];
  return [
    {
      ...stablecoinsParams,
      label: `${symbol}__Stablecoins`,
      collateralAssets: collaterals,
      borrowableAssets: stablecoins,
    },
    {
      ...usdeParams,
      label: `${symbol}__USDe`,
      collateralAssets: collaterals,
      borrowableAssets: ['USDe'],
    },
  ];
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
// PT-specific CodeArtifact (preExecute + liqFee + agent hub whitelisting)
// ---------------------------------------------------------------------------

/**
 * @param ptSymbols  Symbols of the new PTs being listed (1 for Strata, 2 for Ethena).
 * @param emodeCount Number of new eModes created (2 for Strata, 4 for Ethena).
 */
function buildPtArtifact(
  ptSymbols: string[],
  emodeCount: number,
  pool: string,
  gov: string,
  misc: string,
): CodeArtifact {
  const seedTransfers = ptSymbols
    .map(
      (sym) => `
  // ${pool}.COLLECTOR.transfer(
  //   IERC20(${sym}),
  //   ${gov}.EXECUTOR_LVL_1,
  //   ${sym}_SEED_AMOUNT
  // );`,
    )
    .join('');

  const preExecuteFn = `
function _preExecute() internal override {
  // Uncomment if seed tokens need to be sourced from the Collector
  // (e.g. if direct funding to the executor was sent to the wrong address)${seedTransfers}
}`;

  const findFirstUnusedFn = `
function _findFirstUnusedEmodeCategory(IPool pool) private view returns (uint8) {
  // eMode id 0 is skipped intentionally as it is the reserved default
  for (uint8 i = 1; i < 256; i++) {
    if (pool.getEModeCategoryCollateralConfig(i).liquidationThreshold == 0) return i;
  }
  revert NoAvailableEmodeCategory();
}`;

  const liqFees = ptSymbols
    .map((sym) => `${pool}.POOL_CONFIGURATOR.setLiquidationProtocolFee(${sym}, 1000);`)
    .join('\n');

  const emodeWhitelists = Array.from(
    {length: emodeCount},
    (_, i) =>
      `IAgentHub(${misc}.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - ${i + 1})));`,
  ).join('\n');

  const ptWhitelists = ptSymbols
    .map((sym) => `IAgentHub(${misc}.AGENT_HUB).addAllowedMarket(1, ${sym});`)
    .join('\n');

  const liqFeeExecute = `
${liqFees}

uint8 nextID = _findFirstUnusedEmodeCategory(${pool}.POOL);

// whitelist the new eModes on automated chaos-agents [agentId 0: EModeCategoryUpdate_Core]
${emodeWhitelists}

// whitelist the new pt-assets on automated chaos-agents [agentId 1: PendleDiscountRateUpdate_Core]
${ptWhitelists}`;

  return {
    code: {
      constants: ['error NoAvailableEmodeCategory();'],
      fn: [preExecuteFn, findFirstUnusedFn],
      execute: [liqFeeExecute],
    },
  };
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

console.log('\nPT listing generator');
console.log('Generates all proposal files via the standard generator pipeline\n');

// 1. Select pool
const POOL = (await select({
  message: 'Select pool:',
  choices: V3_POOLS.map((p) => ({name: p, value: p})),
})) as PoolIdentifierV3;

const chain = getPoolChain(POOL);
const GOV = `GovernanceV3${chain}`;
const MISC = `Misc${chain}`;

const poolAssets = getAssets(POOL);
const poolAssetSet = new Set(poolAssets);
const STABLECOINS = ['USDC', 'USDT', 'USDe', 'USDtb'].filter((a) => poolAssetSet.has(a));

// 2. Select listing type
const listingType = (await select({
  message: 'Listing type:',
  choices: [
    {name: 'PT Ethena  (PT_USDe + PT_sUSDe — 2 tokens, 4 eModes)', value: 'ethena'},
    {name: 'Strata     (PT_srUSDe           — 1 token,  2 eModes)', value: 'strata'},
  ],
})) as 'ethena' | 'strata';

// ---------------------------------------------------------------------------
// Listing-type-specific prompts and config
// ---------------------------------------------------------------------------

let expiry: string;
let shortName: string;
let listingCfg: Listing[];
let eModeCfg: EModeCategoryCreation[];
let newPts: NewPt[];

if (listingType === 'ethena') {
  const PT_USDE_ASSETS = poolAssets.filter((a) => a.startsWith('PT_USDe_'));
  const PT_SUSDE_ASSETS = poolAssets.filter((a) => a.startsWith('PT_sUSDE_'));

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
    console.log(
      'No existing PT_sUSDE found in address book — first PT_sUSDE listing on this pool.',
    );
  }

  const newPtUsde = await promptNewPt('PT_USDe', POOL);
  const newPtSusde = await promptNewPt('PT_sUSDe', POOL);
  newPts = [newPtUsde, newPtSusde];

  console.log('\n--- eMode parameters (% values, e.g. 87.2 → 87.20%) ---');
  const usdeStablecoins = await promptEmodeParams(`${newPtUsde.symbol}__Stablecoins`, {
    ltv: '87.2',
    liqThreshold: '89.2',
    liqBonus: '4.4',
  });
  const usdeUsde = await promptEmodeParams(`${newPtUsde.symbol}__USDe`, {
    ltv: '88.1',
    liqThreshold: '90.1',
    liqBonus: '3.4',
  });
  const susdeStablecoins = await promptEmodeParams(`${newPtSusde.symbol}__Stablecoins`, {
    ltv: '86.4',
    liqThreshold: '88.4',
    liqBonus: '5.5',
  });
  const susdeUsde = await promptEmodeParams(`${newPtSusde.symbol}__USDe`, {
    ltv: '87.2',
    liqThreshold: '89.2',
    liqBonus: '4.5',
  });

  expiry = newPtUsde.symbol.replace(/^PT_USDe_/, '');
  shortName = `ListingPTEthena${expiry}`;
  listingCfg = newPts.map(buildPtListing);
  eModeCfg = [
    ...buildEmodePair(newPtUsde.symbol, 'USDe', oldPtUsde, usdeStablecoins, usdeUsde, STABLECOINS),
    ...buildEmodePair(
      newPtSusde.symbol,
      'sUSDe',
      oldPtSusde,
      susdeStablecoins,
      susdeUsde,
      STABLECOINS,
    ),
  ];
} else {
  // Strata: PT_srUSDe — 1 token, 2 eModes
  const PT_SRUSDE_ASSETS = poolAssets.filter((a) => a.startsWith('PT_srUSDe_'));

  let oldPtSrUsde: string | undefined;
  if (PT_SRUSDE_ASSETS.length > 0) {
    oldPtSrUsde = await select({
      message: 'Select old PT_srUSDe (from address book) to include in eModes as collateral:',
      choices: PT_SRUSDE_ASSETS.map((a) => ({name: a, value: a})),
    });
  } else {
    console.log(
      'No existing PT_srUSDe found in address book — first PT_srUSDe listing on this pool.',
    );
  }

  const newPtSrUsde = await promptNewPt('PT_srUSDe', POOL);
  newPts = [newPtSrUsde];

  console.log('\n--- eMode parameters (% values, e.g. 87.2 → 87.20%) ---');
  const stablecoins = await promptEmodeParams(`${newPtSrUsde.symbol}__Stablecoins`, {
    ltv: '87.2',
    liqThreshold: '89.2',
    liqBonus: '4.4',
  });
  const usde = await promptEmodeParams(`${newPtSrUsde.symbol}__USDe`, {
    ltv: '88.1',
    liqThreshold: '90.1',
    liqBonus: '3.4',
  });

  expiry = newPtSrUsde.symbol.replace(/^PT_srUSDe_/, '');
  shortName = `ListingPTSrUsde${expiry}`;
  listingCfg = newPts.map(buildPtListing);
  eModeCfg = buildEmodePair(
    newPtSrUsde.symbol,
    'sUSDe',
    oldPtSrUsde,
    stablecoins,
    usde,
    STABLECOINS,
  );
}

// ---------------------------------------------------------------------------
// Shared: proposal metadata
// ---------------------------------------------------------------------------

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

const title =
  listingType === 'ethena' ? `Listing PT Ethena ${expiry}` : `Listing PT Strata ${expiry}`;

const date = getDate();

const options = {
  title,
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

// ---------------------------------------------------------------------------
// Build & patch artifacts
// ---------------------------------------------------------------------------

const listingArtifact = assetListing.build({pool: POOL, cfg: listingCfg, options, cache});
for (const pt of newPts) {
  patchSeedAmount(listingArtifact, pt.symbol, pt.seedTokens);
}

const eModesArtifact = eModeCreations.build({pool: POOL, cfg: eModeCfg, options, cache});
for (const pt of newPts) {
  patchNewPtInEmodeArtifact(eModesArtifact, pt.symbol, POOL);
}

const ptArtifact = buildPtArtifact(
  newPts.map((pt) => pt.symbol),
  eModeCfg.length,
  POOL,
  GOV,
  MISC,
);

// ---------------------------------------------------------------------------
// Assemble pool config and write all files
// ---------------------------------------------------------------------------

const poolConfigs: PoolConfigs = {
  [POOL]: {
    artifacts: [listingArtifact, eModesArtifact, ptArtifact],
    configs: {
      [FEATURE.ASSET_LISTING]: listingCfg,
      [FEATURE.EMODES_CREATION]: eModeCfg,
      [FEATURE.OTHERS]: ptArtifact.code,
    },
    cache,
  },
};

const folderName = `src/${date}_${POOL}_${options.shortName}`;
console.log(`\nFolder: ${folderName}`);

const proceed = await confirm({message: 'Generate all files?', default: true});
if (!proceed) process.exit(0);

const files = await generateFiles(options, poolConfigs);
await writeFiles(options, files);

console.log(`\nProposal files written to ${folderName}`);
