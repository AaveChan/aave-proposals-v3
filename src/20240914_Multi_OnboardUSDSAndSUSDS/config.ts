import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    configFile: 'src/20240914_AaveV3Ethereum_OnboardUSDSAndSUSDS/config.ts',
    pools: ['AaveV3Ethereum', 'AaveV3EthereumLido'],
    title: 'Onboard USDS and SUSDS',
    shortName: 'OnboardUSDSAndSUSDS',
    date: '20240914',
    author: 'ACI',
    discussion: 'https://governance.aave.com/t/arfc-onboard-usds-and-susds-to-aave-v3/18987',
    snapshot: 'Direct-to-AIP',
    votingNetwork: 'POLYGON',
  },
  poolOptions: {
    AaveV3Ethereum: {
      configs: {
        ASSET_LISTING: [
          {
            assetSymbol: 'sUSDS',
            decimals: 18,
            priceFeed: '0x408e905577653430Bb80d91e0ca433b338CEA7C6',
            ltv: '75',
            liqThreshold: '78',
            liqBonus: '7.5',
            debtCeiling: '0',
            liqProtocolFee: '10',
            enabledToBorrow: 'ENABLED',
            flashloanable: 'ENABLED',
            stableRateModeEnabled: 'DISABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '50',
            supplyCap: '35000000',
            borrowCap: '0',
            rateStrategyParams: {
              optimalUtilizationRate: '92',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '2',
              variableRateSlope2: '50',
            },
            eModeCategory: 'AaveV3EthereumEModes.NONE',
            asset: '0xa3931d71877C0E7a3148CB7Eb4463524FEc27fbD',
          },
        ],
      },
      cache: {blockNumber: 20747338},
    },
    AaveV3EthereumLido: {
      configs: {
        ASSET_LISTING: [
          {
            assetSymbol: 'USDS',
            decimals: 18,
            priceFeed: '0x4F01b76391A05d32B20FA2d05dD5963eE8db20E6',
            ltv: '0',
            liqThreshold: '0',
            liqBonus: '70',
            debtCeiling: '0',
            liqProtocolFee: '10',
            enabledToBorrow: 'ENABLED',
            flashloanable: 'ENABLED',
            stableRateModeEnabled: 'DISABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '10',
            supplyCap: '50000000',
            borrowCap: '45000000',
            rateStrategyParams: {
              optimalUtilizationRate: '92',
              baseVariableBorrowRate: '0.75',
              variableRateSlope1: '6.25',
              variableRateSlope2: '75',
            },
            eModeCategory: 'AaveV3EthereumEModes.NONE',
            asset: '0xdC035D45d973E3EC169d2276DDab16f1e407384F',
          },
        ],
      },
      cache: {blockNumber: 20747338},
    },
  },
};
