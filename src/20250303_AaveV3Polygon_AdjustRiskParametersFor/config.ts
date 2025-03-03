import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    author: 'Aave-Chan Initiative',
    pools: ['AaveV3Polygon'],
    title: 'Adjust Risk Parameters for',
    shortName: 'AdjustRiskParametersFor',
    date: '20250303',
    discussion: '',
    snapshot: 'Direct-to-AIP',
    votingNetwork: 'POLYGON',
  },
  poolOptions: {
    AaveV3Polygon: {
      configs: {
        COLLATERALS_UPDATE: [
          {
            asset: 'USDT',
            ltv: '70',
            liqThreshold: '',
            liqBonus: '',
            debtCeiling: '',
            liqProtocolFee: '',
          },
          {
            asset: 'USDCn',
            ltv: '70',
            liqThreshold: '',
            liqBonus: '',
            debtCeiling: '',
            liqProtocolFee: '',
          },
        ],
        EMODES_UPDATES: [
          {
            eModeCategory: 'AaveV3PolygonEModes.STABLECOINS',
            ltv: '91.25',
            liqThreshold: '94.25',
            liqBonus: '',
            label: '',
          },
        ],
        EMODES_ASSETS: [
          {
            asset: 'DAI',
            eModeCategory: 'AaveV3PolygonEModes.STABLECOINS',
            collateral: 'KEEP_CURRENT',
            borrowable: 'DISABLED',
          },
          {
            asset: 'USDC',
            eModeCategory: 'AaveV3PolygonEModes.STABLECOINS',
            collateral: 'KEEP_CURRENT',
            borrowable: 'DISABLED',
          },
          {
            asset: 'USDT',
            eModeCategory: 'AaveV3PolygonEModes.STABLECOINS',
            collateral: 'KEEP_CURRENT',
            borrowable: 'DISABLED',
          },
          {
            asset: 'EURS',
            eModeCategory: 'AaveV3PolygonEModes.STABLECOINS',
            collateral: 'KEEP_CURRENT',
            borrowable: 'DISABLED',
          },
          {
            asset: 'jEUR',
            eModeCategory: 'AaveV3PolygonEModes.STABLECOINS',
            collateral: 'KEEP_CURRENT',
            borrowable: 'DISABLED',
          },
          {
            asset: 'EURA',
            eModeCategory: 'AaveV3PolygonEModes.STABLECOINS',
            collateral: 'KEEP_CURRENT',
            borrowable: 'DISABLED',
          },
          {
            asset: 'miMATIC',
            eModeCategory: 'AaveV3PolygonEModes.STABLECOINS',
            collateral: 'KEEP_CURRENT',
            borrowable: 'DISABLED',
          },
          {
            asset: 'USDCn',
            eModeCategory: 'AaveV3PolygonEModes.STABLECOINS',
            collateral: 'KEEP_CURRENT',
            borrowable: 'DISABLED',
          },
        ],
      },
      cache: {blockNumber: 68608670},
    },
  },
};
