import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    title: 'Listing PT Strata 25JUN2026',
    shortName: 'ListingPTSrUsde25JUN2026',
    author: 'Aave Chan Initiative @aci',
    discussion:
      'https://governance.aave.com/t/direct-to-aip-onboard-strata-srusde-june-expiry-pt-tokens-to-v3-core-instance/24313',
    snapshot: 'direct-to-aip',
    date: '20260324',
    pools: ['AaveV3Ethereum'],
    votingNetwork: 'AVALANCHE',
  },
  poolOptions: {
    AaveV3Ethereum: {
      configs: {
        ASSET_LISTING: [
          {
            asset: '0x619D75E3b790eBC21c289f2805Bb7177A7D732E2',
            assetSymbol: 'PT_srUSDe_25JUN2026',
            decimals: 18,
            priceFeed: '0x0000000000000000000000000000000000000000',
            supplyCap: '1000000',
            admin: '0xac140648435d03f784879cd789130F22Ef588Fcd',
            eModeCategory: '',
            enabledToBorrow: 'DISABLED',
            flashloanable: 'ENABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '45',
            ltv: '0',
            liqThreshold: '0',
            liqBonus: '0',
            liqProtocolFee: '0',
            debtCeiling: '0',
            borrowCap: '1',
            rateStrategyParams: {
              optimalUtilizationRate: '45',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '10',
              variableRateSlope2: '300',
            },
          },
        ],
        EMODES_CREATION: [
          {
            ltv: '50',
            liqThreshold: '55',
            liqBonus: '6',
            label: 'PT_srUSDe_25JUN2026__Stablecoins',
            collateralAssets: ['PT_srUSDe_25JUN2026', 'sUSDe', 'PT_srUSDe_2APR2026'],
            borrowableAssets: ['USDC', 'USDT', 'USDe', 'USDtb'],
          },
          {
            ltv: '60',
            liqThreshold: '70',
            liqBonus: '3',
            label: 'PT_srUSDe_25JUN2026__USDe',
            collateralAssets: ['PT_srUSDe_25JUN2026', 'sUSDe', 'PT_srUSDe_2APR2026'],
            borrowableAssets: ['USDe'],
          },
        ],
        OTHERS: {
          constants: ['error NoAvailableEmodeCategory();'],
          fn: [
            '\nfunction _preExecute() internal override {\n  // Uncomment if seed tokens need to be sourced from the Collector\n  // (e.g. if direct funding to the executor was sent to the wrong address)\n  // AaveV3Ethereum.COLLECTOR.transfer(\n  //   IERC20(PT_srUSDe_25JUN2026),\n  //   GovernanceV3Ethereum.EXECUTOR_LVL_1,\n  //   PT_srUSDe_25JUN2026_SEED_AMOUNT\n  // );\n}',
            '\nfunction _findFirstUnusedEmodeCategory(IPool pool) private view returns (uint8) {\n  // eMode id 0 is skipped intentionally as it is the reserved default\n  for (uint8 i = 1; i < 256; i++) {\n    if (pool.getEModeCategoryCollateralConfig(i).liquidationThreshold == 0) return i;\n  }\n  revert NoAvailableEmodeCategory();\n}',
          ],
          execute: [
            '\nAaveV3Ethereum.POOL_CONFIGURATOR.setLiquidationProtocolFee(PT_srUSDe_25JUN2026, 1000);\n\nuint8 nextID = _findFirstUnusedEmodeCategory(AaveV3Ethereum.POOL);\n\n// whitelist the new eModes on automated chaos-agents [agentId 0: EModeCategoryUpdate_Core]\nIAgentHub(MiscEthereum.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 1)));\nIAgentHub(MiscEthereum.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 2)));\n\n// whitelist the new pt-assets on automated chaos-agents [agentId 1: PendleDiscountRateUpdate_Core]\nIAgentHub(MiscEthereum.AGENT_HUB).addAllowedMarket(1, PT_srUSDe_25JUN2026);',
          ],
        },
      },
      cache: {blockNumber: 24727462},
    },
  },
};
