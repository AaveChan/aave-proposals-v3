import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    configFile: 'src/20240409_AaveV3BNB_OnboardingWbETH/config.ts',
    force: true,
    author: 'Aave Chan Initiative',
    pools: ['AaveV3BNB'],
    title: 'Onboarding wBETH',
    shortName: 'OnboardingWBETH',
    date: '20240409',
    discussion: 'https://governance.aave.com/t/arfc-onboard-wbeth-to-aave-v3-bnb-chain/17210',
    snapshot:
      'https://snapshot.org/#/aave.eth/proposal/0x0ad8168a1b388b0e9771cae6d317619ad5428dd6788a457fea7d533d2fcd88d2',
  },
  poolOptions: {
    AaveV3BNB: {
      configs: {
        ASSET_LISTING: [
          {
            assetSymbol: 'wBETH',
            decimals: 18,
            priceFeed: '0x0000000000000000000000000000000000000000',
            ltv: '67',
            liqThreshold: '74',
            liqBonus: '7',
            debtCeiling: '0',
            liqProtocolFee: '10',
            enabledToBorrow: 'ENABLED',
            flashloanable: 'DISABLED',
            stableRateModeEnabled: 'DISABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '15',
            supplyCap: '3000',
            borrowCap: '300',
            rateStrategyParams: {
              optimalUtilizationRate: '45',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '7',
              variableRateSlope2: '300',
              stableRateSlope1: '13',
              stableRateSlope2: '300',
              baseStableRateOffset: '3',
              stableRateExcessOffset: '5',
              optimalStableToTotalDebtRatio: '20',
            },
            eModeCategory: 'AaveV3BNBEModes.NONE',
            asset: '0xa2E3356610840701BDf5611a53974510Ae27E2e1',
          },
        ],
      },
      cache: {blockNumber: 37719217},
    },
  },
};
