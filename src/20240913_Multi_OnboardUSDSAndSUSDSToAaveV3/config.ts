import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    author: 'Aave Chan Initiative',
    pools: ['AaveV3Ethereum', 'AaveV3EthereumLido'],
    title: 'Onboard USDS and sUSDS to Aave v3',
    shortName: 'OnboardUSDSAndSUSDSToAaveV3',
    date: '20240913',
    discussion: 'https://governance.aave.com/t/arfc-onboard-usds-and-susds-to-aave-v3/18987',
    snapshot: 'TODO',
    votingNetwork: 'POLYGON',
  },
  poolOptions: {
    AaveV3Ethereum: {
      configs: {
        CAPS_UPDATE: [
          {asset: 'DAI', supplyCap: '150000000', borrowCap: '140000000'},
          {asset: 'sDAI', supplyCap: '70000000', borrowCap: ''},
        ],
        ASSET_LISTING: [
          {
            assetSymbol: 'sUSDS',
            decimals: 18,
            priceFeed: '0x4b764F16B18e4ED8deB7E74258B0f01BE93D3a38',
            ltv: '75',
            liqThreshold: '78',
            liqBonus: '7.5',
            debtCeiling: '0',
            liqProtocolFee: '10',
            enabledToBorrow: 'DISABLED',
            flashloanable: 'ENABLED',
            stableRateModeEnabled: 'DISABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '10',
            supplyCap: '35000000',
            borrowCap: '0',
            rateStrategyParams: {
              optimalUtilizationRate: '90',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '0',
              variableRateSlope2: '0',
            },
            eModeCategory: 'AaveV3EthereumEModes.NONE',
            asset: '0xa3931d71877C0E7a3148CB7Eb4463524FEc27fbD',
          },
        ],
      },
      cache: {blockNumber: 20743989},
    },
    AaveV3EthereumLido: {
      configs: {
        ASSET_LISTING: [
          {
            assetSymbol: 'USDS',
            decimals: 18,
            priceFeed: '0x13Bbe098309ca4F847baE2f512f594Af68cC7B59',
            ltv: '63',
            liqThreshold: '72',
            liqBonus: '7.5',
            debtCeiling: '0',
            liqProtocolFee: '10',
            enabledToBorrow: 'ENABLED',
            flashloanable: 'ENABLED',
            stableRateModeEnabled: 'DISABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '25',
            supplyCap: '50000000',
            borrowCap: '45000000',
            rateStrategyParams: {
              optimalUtilizationRate: '90',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '5.5',
              variableRateSlope2: '75',
            },
            eModeCategory: 'AaveV3EthereumLidoEModes.NONE',
            asset: '0xdC035D45d973E3EC169d2276DDab16f1e407384F',
          },
        ],
      },
      cache: {blockNumber: 20744030},
    },
  },
};
