import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    author: 'Chaos Labs (implemented by Aavechan Initiative @aci via Skyward)',
    pools: ['AaveV3Plasma'],
    title: 'GHO Inclusion into E-Modes on Aave V3 Plasma',
    shortName: 'ChangeOfSupplyCapsAndEModeAdjustments',
    date: '20260410',
    discussion:
      'https://governance.aave.com/t/direct-to-aip-change-of-supply-caps-and-adjustment-of-e-mode-assets-on-aave-v3-07-04-26/24396',
    snapshot: 'direct-to-aip',
    votingNetwork: 'AVALANCHE',
  },
  poolOptions: {
    AaveV3Plasma: {
      configs: {
        EMODES_UPDATES: [
          {
            eModeCategory: 'AaveV3PlasmaEModes.USDe_PT_USDe_9APR2026_PT_USDe_18JUN2026__USDT0_USDe',
            ltv: '',
            liqThreshold: '',
            liqBonus: '',
            label: 'USDe_PT_USDe_9APR2026_PT_USDe_18JUN2026__Stablecoins',
          },
          {
            eModeCategory:
              'AaveV3PlasmaEModes.sUSDe_PT_sUSDE_9APR2026_PT_sUSDE_18JUN2026__USDT0_USDe',
            ltv: '',
            liqThreshold: '',
            liqBonus: '',
            label: 'sUSDe_PT_sUSDE_9APR2026_PT_sUSDE_18JUN2026__Stablecoins',
          },
        ],
      },
      cache: {blockNumber: 18875103},
    },
  },
};
