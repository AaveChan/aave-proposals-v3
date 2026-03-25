import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    author: 'Trydo (implemented by Aavechan Initiative @aci via Skyward)',
    pools: ['AaveV3InkWhitelabel'],
    title: 'SyrupUSDT listing in Trydo ',
    shortName: 'SyrupUSDTListingInTrydo',
    date: '20260316',
  },
  poolOptions: {
    AaveV3InkWhitelabel: {
      configs: {
        ASSET_LISTING: [
          {
            assetSymbol: 'syrupUSDT',
            decimals: 6,
            priceFeed: '0x24FdD142b34C6B5D55299709DB0966681933c9aF',
            ltv: '0',
            liqThreshold: '0',
            liqBonus: '10',
            debtCeiling: '0',
            liqProtocolFee: '10',
            enabledToBorrow: 'DISABLED',
            flashloanable: 'ENABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '45',
            supplyCap: '50000000',
            borrowCap: '1',
            rateStrategyParams: {
              optimalUtilizationRate: '45',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '10',
              variableRateSlope2: '300',
            },
            asset: '0x8A76fe7fA6da27f85a626c5C53730B38D13603d7',
            admin: '0xac140648435d03f784879cd789130F22Ef588Fcd',
          },
        ],
      },
      cache: {blockNumber: 40179226},
    },
  },
};
