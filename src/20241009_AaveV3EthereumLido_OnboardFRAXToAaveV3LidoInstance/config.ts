import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    author: 'Aave Chan Initiative',
    pools: ['AaveV3EthereumLido'],
    title: 'Onboard FRAX to Aave V3 Lido Instance',
    shortName: 'OnboardFRAXToAaveV3LidoInstance',
    date: '20241009',
    discussion: 'https://governance.aave.com/t/arfc-onboard-frax-to-aave-v3-lido-instance/19300',
    snapshot:
      'https://snapshot.org/#/aave.eth/proposal/0x4ee3ae8c9046a2b50eb1fcaa5266b86786923635d143dd5ed9e4acb898ec5fe5',
    votingNetwork: 'POLYGON',
  },
  poolOptions: {
    AaveV3EthereumLido: {
      configs: {
        ASSET_LISTING: [
          {
            assetSymbol: 'FRAX',
            decimals: 18,
            priceFeed: '0x45D270263BBee500CF8adcf2AbC0aC227097b036',
            ltv: '0',
            liqThreshold: '0',
            liqBonus: '0',
            debtCeiling: '0',
            liqProtocolFee: '0',
            enabledToBorrow: 'ENABLED',
            flashloanable: 'ENABLED',
            stableRateModeEnabled: 'DISABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '20',
            supplyCap: '20000000',
            borrowCap: '18000000',
            rateStrategyParams: {
              optimalUtilizationRate: '90',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '5.5',
              variableRateSlope2: '75',
            },
            eModeCategory: 'AaveV3EthereumLidoEModes.NONE',
            asset: '0x853d955aCEf822Db058eb8505911ED77F175b99e',
            admin: '0xac140648435d03f784879cd789130F22Ef588Fcd',
          },
        ],
      },
      cache: {blockNumber: 20929931},
    },
  },
};
