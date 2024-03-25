import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    author: 'Aave Chan Initiative',
    pools: ['AaveV3Ethereum'],
    title: 'sFrax Listing',
    shortName: 'SFraxListing',
    date: '20240325',
    discussion: 'https://governance.aave.com/t/arfc-add-sfrax-on-ethereum-v3/16303',
    snapshot:
      'https://snapshot.org/#/aave.eth/proposal/0xdba99e9c8da24424447d7c7b70eff93ad5b6055714b5f34cf9859c923fb3a38a',
  },
  poolOptions: {
    AaveV3Ethereum: {
      configs: {
        ASSET_LISTING: [
          {
            assetSymbol: 'sFRAX',
            decimals: 18,
            priceFeed: '0x0000000000000000000000000000000000000000',
            ltv: '70',
            liqThreshold: '75',
            liqBonus: '6',
            debtCeiling: '1',
            liqProtocolFee: '20',
            enabledToBorrow: 'DISABLED',
            flashloanable: 'ENABLED',
            stableRateModeEnabled: 'DISABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '20',
            supplyCap: '10000000',
            borrowCap: '0',
            rateStrategyParams: {
              optimalUtilizationRate: '0',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '0',
              variableRateSlope2: '0',
              stableRateSlope1: '0',
              stableRateSlope2: '0',
              baseStableRateOffset: '0',
              stableRateExcessOffset: '0',
              optimalStableToTotalDebtRatio: '0',
            },
            eModeCategory: 'AaveV3EthereumEModes.NONE',
            asset: '0xA663B02CF0a4b149d2aD41910CB81e23e1c41c32',
          },
        ],
      },
      cache: {blockNumber: 19513488},
    },
  },
};
