import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    author: 'Aave Chan Initiative',
    pools: ['AaveV3Ethereum'],
    title: 'Remove Frax from Isolation Mode and onboard sFRAX to Aave v3 Mainnet',
    shortName: 'RemoveFraxFromIsolationModeAndOnboardSFRAXToAaveV3Mainnet',
    date: '20240805',
    discussion:
      'https://governance.aave.com/t/arfc-remove-frax-from-isolation-mode-and-onboard-sfrax-to-aave-v3-mainnet/18506',
    snapshot: 'TODO',
    votingNetwork: 'POLYGON',
  },
  poolOptions: {
    AaveV3Ethereum: {
      configs: {
        RATE_UPDATE_V3: [
          {
            asset: 'FRAX',
            params: {
              optimalUtilizationRate: '92',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '6.5',
              variableRateSlope2: '75',
            },
          },
        ],
        CAPS_UPDATE: [{asset: 'FRAX', supplyCap: '338000000', borrowCap: '271000000'}],
        COLLATERALS_UPDATE: [
          {
            asset: 'FRAX',
            ltv: '63',
            liqThreshold: '77',
            liqBonus: '5',
            debtCeiling: '0',
            liqProtocolFee: '10',
          },
        ],
        BORROWS_UPDATE: [
          {
            enabledToBorrow: 'KEEP_CURRENT',
            flashloanable: 'KEEP_CURRENT',
            stableRateModeEnabled: 'DISABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '15',
            asset: 'FRAX',
          },
        ],
        ASSET_LISTING: [
          {
            assetSymbol: 'sFRAX',
            decimals: 18,
            priceFeed: '0xB9E1E3A9feFf48998E45Fa90847ed4D467E8BcfD',
            ltv: '70',
            liqThreshold: '75',
            liqBonus: '6',
            debtCeiling: '0',
            liqProtocolFee: '20',
            enabledToBorrow: 'DISABLED',
            flashloanable: 'DISABLED',
            stableRateModeEnabled: 'DISABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '20',
            supplyCap: '10000000',
            borrowCap: '0',
            rateStrategyParams: {
              optimalUtilizationRate: '80',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '0',
              variableRateSlope2: '0',
            },
            eModeCategory: 'AaveV3EthereumEModes.NONE',
            asset: '0xA663B02CF0a4b149d2aD41910CB81e23e1c41c32',
          },
        ],
      },
      cache: {blockNumber: 20468040},
    },
  },
};
