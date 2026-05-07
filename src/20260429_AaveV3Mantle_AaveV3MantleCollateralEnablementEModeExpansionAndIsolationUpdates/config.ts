import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    author: 'Aavechan Initiative @aci',
    pools: ['AaveV3Mantle'],
    title: 'Aave V3 Mantle – Collateral Enablement, eMode Expansion, and Isolation Updates',
    shortName: 'AaveV3MantleCollateralEnablementEModeExpansionAndIsolationUpdates',
    date: '20260429',
    discussion:
      'https://governance.aave.com/t/direct-to-aip-aave-v3-mantle-collateral-enablement-emode-expansion-and-isolation-updates-usdt0-usde-eth-xaut/24153',
    snapshot: 'direct-to-AIP',
    votingNetwork: 'AVALANCHE',
  },
  poolOptions: {
    AaveV3Mantle: {
      configs: {
        RATE_UPDATE_V3: [
          {
            asset: 'WETH',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '2.5',
              variableRateSlope2: '8',
            },
          },
        ],
        CAPS_UPDATE: [{asset: 'WMNT', supplyCap: '5000000', borrowCap: ''}],
        COLLATERALS_UPDATE: [
          {
            asset: 'WETH',
            ltv: '78',
            liqThreshold: '80',
            liqBonus: '',
            debtCeiling: '0',
            liqProtocolFee: '10',
          },
          {
            asset: 'WMNT',
            ltv: '0',
            liqThreshold: '',
            liqBonus: '',
            debtCeiling: '0',
            liqProtocolFee: '10',
          },
        ],
        EMODES_CREATION: [
          {
            ltv: '70',
            liqThreshold: '75',
            liqBonus: '6',
            label: 'XAut Stablecoin',
            collateralAssets: ['WETH'],
            borrowableAssets: ['USDT0', 'USDC', 'GHO'],
          },
          {
            ltv: '80.5',
            liqThreshold: '83',
            liqBonus: '5.5',
            label: 'WETH Stablecoin',
            collateralAssets: ['WETH'],
            borrowableAssets: ['USDT0', 'USDC', 'GHO'],
          },
          {
            ltv: '40',
            liqThreshold: '45',
            liqBonus: '10',
            label: 'WMNT stablecoin',
            collateralAssets: ['WMNT'],
            borrowableAssets: ['USDT0', 'USDC', 'GHO'],
          },
        ],
        ASSET_LISTING: [
          {
            assetSymbol: 'XAUt',
            decimals: 6,
            priceFeed: '0x214eD9Da11D2fbe465a6fc601a91E62EbEc1a0D6',
            ltv: '0',
            liqThreshold: '0',
            liqBonus: '0',
            debtCeiling: '0',
            liqProtocolFee: '10',
            enabledToBorrow: 'DISABLED',
            flashloanable: 'ENABLED',
            borrowableInIsolation: 'DISABLED',
            withSiloedBorrowing: 'DISABLED',
            reserveFactor: '50',
            supplyCap: '4000',
            borrowCap: '1',
            rateStrategyParams: {
              optimalUtilizationRate: '90',
              baseVariableBorrowRate: '0',
              variableRateSlope1: '10',
              variableRateSlope2: '300',
            },
            asset: '0x6199CCd9273A1E0e41e2cC18d9dAcd1E9382F58E',
            admin: '0xac140648435d03f784879cd789130F22Ef588Fcd',
          },
        ],
      },
      cache: {blockNumber: 94673594},
    },
  },
};
