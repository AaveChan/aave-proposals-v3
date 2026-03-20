import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    author: 'Aavechan Initiative @aci',
    pools: ['AaveV3Ethereum'],
    title: 'Onboard BTC.b to Aave V3 Core Instance',
    shortName: 'OnboardBTCBToAaveV3CoreInstance',
    date: '20260320',
    discussion:
      'https://governance.aave.com/t/direct-to-aip-onboard-btc-b-to-aave-v3-core-instance/23357',
    snapshot: 'direct-to-aip',
    votingNetwork: 'AVALANCHE',
  },
  poolOptions: {
    AaveV3Ethereum: {
      configs: {
        ASSET_LISTING: [
          {
            assetSymbol: 'BTCb',
            decimals: 8,
            priceFeed: '0xF4030086522a5bEEa4988F8cA5B36dbC97BeE88c',
            ltv: '73',
            liqThreshold: '78',
            liqBonus: '7.5',
            debtCeiling: '0',
            liqProtocolFee: '10',
            enabledToBorrow: 'DISABLED',
            flashloanable: 'ENABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '50',
            supplyCap: '600',
            borrowCap: '1',
            rateStrategyParams: {
              optimalUtilizationRate: '45',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '10',
              variableRateSlope2: '300',
            },
            asset: '0xB0F70C0bD6FD87dbEb7C10dC692a2a6106817072',
            admin: '0xac140648435d03f784879cd789130F22Ef588Fcd',
          },
        ],
      },
      cache: {blockNumber: 24699051},
    },
  },
};
