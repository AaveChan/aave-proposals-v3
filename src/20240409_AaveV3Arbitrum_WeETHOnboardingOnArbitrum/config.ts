import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    author: 'Aave Chan Initiative',
    pools: ['AaveV3Arbitrum'],
    title: 'weETH Onboarding on Arbitrum',
    shortName: 'WeETHOnboardingOnArbitrum',
    date: '20240409',
    discussion: 'https://governance.aave.com/t/arfc-onboard-weeth-to-aave-v3-on-ethereum/16758/11',
    snapshot:
      'https://snapshot.org/#/aave.eth/proposal/0xd5807ee6ec3d33e7d86805a4287540b0a9801430ee0900ff6babb698e4f2a273',
  },
  poolOptions: {
    AaveV3Arbitrum: {
      configs: {
        ASSET_LISTING: [
          {
            assetSymbol: 'weETH',
            decimals: 18,
            priceFeed: '0x0000000000000000000000000000000000000000',
            ltv: '72.50',
            liqThreshold: '75',
            liqBonus: '7.5',
            debtCeiling: '0',
            liqProtocolFee: '10',
            enabledToBorrow: 'ENABLED',
            flashloanable: 'ENABLED',
            stableRateModeEnabled: 'DISABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '15',
            supplyCap: '1000',
            borrowCap: '100',
            rateStrategyParams: {
              optimalUtilizationRate: '45',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '7',
              variableRateSlope2: '300',
              stableRateSlope1: '0',
              stableRateSlope2: '0',
              baseStableRateOffset: '0',
              stableRateExcessOffset: '0',
              optimalStableToTotalDebtRatio: '0',
            },
            eModeCategory: 'AaveV3ArbitrumEModes.ETH_CORRELATED',
            asset: '0x35751007a407ca6FEFfE80b3cB397736D2cf4dbe',
          },
        ],
      },
      cache: {blockNumber: 199323378},
    },
  },
};
