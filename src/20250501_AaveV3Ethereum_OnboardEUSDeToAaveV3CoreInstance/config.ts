import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    configFile: 'src/20250501_AaveV3Ethereum_OnboardEUSDeToAaveV3CoreInstance/config.ts',
    force: true,
    author: 'Aave-Chan Initiative',
    pools: ['AaveV3Ethereum'],
    title: 'Onboard eUSDe to Aave v3 Core Instance',
    shortName: 'OnboardEUSDeToAaveV3CoreInstance',
    date: '20250501',
    discussion: 'https://governance.aave.com/t/arfc-onboard-eusde-to-aave-v3-core-instance/21766',
    snapshot:
      'https://snapshot.box/#/s:aavedao.eth/proposal/0xc1e93b8d3c8bd2530ba13ef01a6d83b9eed4f9fbff22e5aeb3bf92641baa0d0a',
    votingNetwork: 'POLYGON',
  },
  poolOptions: {
    AaveV3Ethereum: {
      configs: {
        EMODES_UPDATES: [
          {
            eModeCategory: 10,
            ltv: '90',
            liqThreshold: '93',
            liqBonus: '2',
            label: 'eUSDe/Stablecoin',
          },
        ],
        EMODES_ASSETS: [
          {asset: 'USDC', eModeCategory: '10', collateral: 'DISABLED', borrowable: 'ENABLED'},
          {asset: 'eUSDe', eModeCategory: '10', collateral: 'ENABLED', borrowable: 'DISABLED'},
          {asset: 'USDT', eModeCategory: '10', collateral: 'DISABLED', borrowable: 'ENABLED'},
          {asset: 'USDS', eModeCategory: '10', collateral: 'DISABLED', borrowable: 'ENABLED'},
        ],
        ASSET_LISTING: [
          {
            assetSymbol: 'eUSDe',
            decimals: 18,
            priceFeed: '0xc7Ad695ac0ae38Ae308640897E51468977A862a2',
            ltv: '0.05',
            liqThreshold: '0.1',
            liqBonus: '7.5',
            debtCeiling: '0',
            liqProtocolFee: '10',
            enabledToBorrow: 'DISABLED',
            flashloanable: 'ENABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '45',
            supplyCap: '150000000',
            borrowCap: '1',
            rateStrategyParams: {
              optimalUtilizationRate: '45',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '10',
              variableRateSlope2: '300',
            },
            asset: '0x90D2af7d622ca3141efA4d8f1F24d86E5974Cc8F',
            admin: '0xac140648435d03f784879cd789130F22Ef588Fcd',
          },
        ],
      },
      cache: {blockNumber: 22387721},
    },
  },
};
