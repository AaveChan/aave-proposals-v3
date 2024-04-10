import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    author: 'Aave Chan Initiative',
    pools: ['AaveV3Ethereum'],
    title: 'sUSDe Onboarding',
    shortName: 'SUSDeOnboarding',
    date: '20240411',
    discussion: 'https://governance.aave.com/t/arfc-onboard-susde-to-aave-v3-on-ethereum/17191',
    snapshot:
      'https://snapshot.org/#/aave.eth/proposal/0x9c6dcf2af7d79467f34e52b505c25d5e4c89af77f00396307d42fc4816797cd9',
  },
  poolOptions: {
    AaveV3Ethereum: {
      configs: {
        ASSET_LISTING: [
          {
            assetSymbol: 'sUSDe',
            decimals: 18,
            priceFeed: '0x0000000000000000000000000000000000000000',
            ltv: '72',
            liqThreshold: '75',
            liqBonus: '8.5',
            debtCeiling: '40000000',
            liqProtocolFee: '10',
            enabledToBorrow: 'DISABLED',
            flashloanable: 'DISABLED',
            stableRateModeEnabled: 'DISABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '100',
            supplyCap: '85000000',
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
            asset: '0x9D39A5DE30e57443BfF2A8307A4256c8797A3497',
          },
        ],
      },
      cache: {blockNumber: 19628183},
    },
  },
};
