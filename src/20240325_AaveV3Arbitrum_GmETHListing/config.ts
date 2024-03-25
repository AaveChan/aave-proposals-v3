import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    configFile: 'src/20240325_AaveV3Arbitrum_GmETHListing/config.ts',
    author: 'Aave Chan Initiative',
    pools: ['AaveV3Arbitrum'],
    title: 'gmETH Listing',
    shortName: 'GmETHListing',
    date: '20240325',
    discussion: 'https://governance.aave.com/t/arfc-add-gmeth-on-arbitrum-v3/16849',
    snapshot:
      'https://snapshot.org/#/aave.eth/proposal/0xc0b723e76fa6682a58983695b7a015c3a5b928c89c2f400375c6a971ef1aba99',
  },
  poolOptions: {
    AaveV3Arbitrum: {
      configs: {
        ASSET_LISTING: [
          {
            assetSymbol: 'gmETH',
            decimals: 18,
            priceFeed: '0xfB3264D1129824933a52374c2C1696F4470D041e',
            ltv: '60',
            liqThreshold: '65',
            liqBonus: '12',
            debtCeiling: '1',
            liqProtocolFee: '10',
            enabledToBorrow: 'DISABLED',
            flashloanable: 'DISABLED',
            stableRateModeEnabled: 'DISABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '20',
            supplyCap: '3500000',
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
            asset: '0x70d95587d40A2caf56bd97485aB3Eec10Bee6336',
          },
        ],
      },
      cache: {blockNumber: 194161855},
    },
  },
};
