import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    author: 'Aave-chan Initiative',
    force: true,
    pools: ['AaveV3Plasma'],
    title: 'Onboard XPL on Aave V3 Plasma Instance',
    shortName: 'OnboardXPLOnAaveV3PlasmaInstance',
    date: '20251027',
    discussion:
      'https://governance.aave.com/t/direct-to-aip-onboard-xpl-on-aave-v3-plasma-instance/23197',
    snapshot: 'direct-to-AIP',
    votingNetwork: 'AVALANCHE',
  },
  poolOptions: {
    AaveV3Plasma: {
      configs: {
        EMODES_CREATION: [
          {
            ltv: '50',
            liqThreshold: '55',
            liqBonus: '10',
            label: 'WPXL__Stablecoins',
            collateralAssets: ['WXPL'],
            borrowableAssets: ['USDT0', 'GHO'],
          },
        ],
        ASSET_LISTING: [
          {
            assetSymbol: 'WXPL',
            decimals: 18,
            priceFeed: '0xF932477C37715aE6657Ab884414Bd9876FE3f750',
            ltv: '0.05',
            liqThreshold: '0.1',
            liqBonus: '10',
            debtCeiling: '0',
            liqProtocolFee: '10',
            enabledToBorrow: 'DISABLED',
            flashloanable: 'ENABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '50',
            supplyCap: '14000000',
            borrowCap: '1',
            rateStrategyParams: {
              optimalUtilizationRate: '45',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '10',
              variableRateSlope2: '300',
            },
            asset: '0x6100E367285b01F48D07953803A2d8dCA5D19873',
            admin: '0xac140648435d03f784879cd789130F22Ef588Fcd',
          },
        ],
      },
      cache: {blockNumber: 4657780},
    },
  },
};
