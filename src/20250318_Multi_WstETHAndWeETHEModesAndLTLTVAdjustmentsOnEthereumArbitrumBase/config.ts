import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    configFile:
      'src/20250318_Multi_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase/config.ts',
    author: 'Aave-Chan Initiative',
    pools: ['AaveV3Ethereum', 'AaveV3Arbitrum', 'AaveV3Base'],
    title: 'wstETH and weETH E-Modes and LT/LTV Adjustments on Ethereum, Arbitrum, Base',
    shortName: 'WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase',
    date: '20250318',
    discussion:
      'governance.aave.com/t/arfc-wsteth-and-weeth-e-modes-and-lt-ltv-adjustments-on-ethereum-arbitrum-base-03-12-25/21370',
    snapshot: 'direct-to-aip',
    votingNetwork: 'POLYGON',
  },
  poolOptions: {
    AaveV3Ethereum: {
      configs: {
        EMODES_UPDATES: [
          {eModeCategory: 7, ltv: '93', liqThreshold: '95', liqBonus: '1', label: 'weETH/ETH'},
          {eModeCategory: 8, ltv: '93.5', liqThreshold: '95.5', liqBonus: '1', label: 'wstETH/ETH'},
        ],
        EMODES_ASSETS: [
          {asset: 'WETH', eModeCategory: '7', collateral: 'DISABLED', borrowable: 'ENABLED'},
          {asset: 'WETH', eModeCategory: '8', collateral: 'DISABLED', borrowable: 'ENABLED'},
          {asset: 'wstETH', eModeCategory: '8', collateral: 'ENABLED', borrowable: 'DISABLED'},
          {asset: 'weETH', eModeCategory: '7', collateral: 'ENABLED', borrowable: 'DISABLED'},
        ],
      },
      cache: {blockNumber: 22076470},
    },
    AaveV3Arbitrum: {
      configs: {
        COLLATERALS_UPDATE: [
          {
            asset: 'weETH',
            ltv: '75',
            liqThreshold: '77',
            liqBonus: '',
            debtCeiling: '',
            liqProtocolFee: '',
          },
        ],
        EMODES_UPDATES: [
          {eModeCategory: 5, ltv: '93', liqThreshold: '95', liqBonus: '1', label: 'weETH/ETH'},
          {eModeCategory: 6, ltv: '93.5', liqThreshold: '95.5', liqBonus: '1', label: 'wstETH/ETH'},
        ],
        EMODES_ASSETS: [
          {asset: 'WETH', eModeCategory: '5', collateral: 'DISABLED', borrowable: 'ENABLED'},
          {asset: 'WETH', eModeCategory: '6', collateral: 'DISABLED', borrowable: 'ENABLED'},
          {asset: 'wstETH', eModeCategory: '6', collateral: 'ENABLED', borrowable: 'DISABLED'},
          {asset: 'weETH', eModeCategory: '5', collateral: 'ENABLED', borrowable: 'DISABLED'},
        ],
      },
      cache: {blockNumber: 69214986},
    },
    AaveV3Base: {
      configs: {
        COLLATERALS_UPDATE: [
          {
            asset: 'weETH',
            ltv: '75',
            liqThreshold: '77',
            liqBonus: '',
            debtCeiling: '',
            liqProtocolFee: '',
          },
        ],
        EMODES_UPDATES: [
          {eModeCategory: 6, ltv: '93', liqThreshold: '95', liqBonus: '1.25', label: 'weETH/ETH'},
          {eModeCategory: 7, ltv: '93.5', liqThreshold: '95.5', liqBonus: '1', label: 'wstETH/ETH'},
        ],
        EMODES_ASSETS: [
          {asset: 'WETH', eModeCategory: '6', collateral: 'DISABLED', borrowable: 'ENABLED'},
          {asset: 'WETH', eModeCategory: '7', collateral: 'DISABLED', borrowable: 'ENABLED'},
          {asset: 'wstETH', eModeCategory: '7', collateral: 'ENABLED', borrowable: 'DISABLED'},
          {asset: 'weETH', eModeCategory: '6', collateral: 'ENABLED', borrowable: 'DISABLED'},
        ],
      },
      cache: {blockNumber: 27772037},
    },
  },
};
