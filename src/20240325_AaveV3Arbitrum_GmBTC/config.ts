import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    configFile: 'src/20240325_AaveV3Arbitrum_GmBTC/config.ts',
    author: 'Aave Chan Initiative',
    pools: ['AaveV3Arbitrum'],
    title: 'gmBTC',
    shortName: 'GmBTC',
    date: '20240325',
    discussion: 'https://governance.aave.com/t/arfc-add-gmbtc-on-arbitrum-v3/16767/3',
    snapshot:
      'https://snapshot.org/#/aave.eth/proposal/0x166051b26be60fa3a64d7815b848b9b670a284b3da01c2d440c7815c400d7950',
  },
  poolOptions: {
    AaveV3Arbitrum: {
      configs: {
        ASSET_LISTING: [
          {
            assetSymbol: 'gmBTC',
            decimals: 18,
            priceFeed: '0x395D5c5D552Df670dc4B2B1cef0c4EABfFba492f',
            ltv: '55',
            liqThreshold: '60',
            liqBonus: '12',
            debtCeiling: '1',
            liqProtocolFee: '10',
            enabledToBorrow: 'DISABLED',
            flashloanable: 'DISABLED',
            stableRateModeEnabled: 'DISABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '10',
            supplyCap: '4300000',
            borrowCap: '0',
            rateStrategyParams: {
              optimalUtilizationRate: '10',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '10',
              variableRateSlope2: '300',
              stableRateSlope1: '0',
              stableRateSlope2: '0',
              baseStableRateOffset: '0',
              stableRateExcessOffset: '0',
              optimalStableToTotalDebtRatio: '0',
            },
            eModeCategory: 'AaveV3ArbitrumEModes.NONE',
            asset: '0x47c031236e19d024b42f8AE6780E44A573170703',
          },
        ],
      },
      cache: {blockNumber: 194169071},
    },
  },
};
