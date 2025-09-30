import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    author: 'Aave-chan Initiative',
    pools: ['AaveV3Plasma'],
    title: 'Onboard wrsETH to Aave v3 Plasma Instance',
    shortName: 'OnboardWrsETHToAaveV3PlasmaInstance',
    date: '20250930',
    discussion:
      'https://governance.aave.com/t/direct-to-aip-onboard-wrseth-to-aave-v3-plasma-instance/23183',
    snapshot: 'direct-to-aip',
    votingNetwork: 'AVALANCHE',
  },
  poolOptions: {
    AaveV3Plasma: {
      configs: {
        ASSET_LISTING: [
          {
            assetSymbol: 'wrsETH',
            decimals: 18,
            priceFeed: '0x3acFddf27b85B5f773B610c6F7e4420aeB1Df8dD',
            ltv: '0.05',
            liqThreshold: '0.1',
            liqBonus: '7',
            debtCeiling: '0',
            liqProtocolFee: '10',
            enabledToBorrow: 'DISABLED',
            flashloanable: 'ENABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '20',
            supplyCap: '20000',
            borrowCap: '1',
            rateStrategyParams: {
              optimalUtilizationRate: '45',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '10',
              variableRateSlope2: '300',
            },
            asset: '0xA3D68b74bF0528fdD07263c60d6488749044914b',
            admin: '0xac140648435d03f784879cd789130F22Ef588Fcd',
          },
        ],
      },
      cache: {blockNumber: 2330645},
    },
  },
};
