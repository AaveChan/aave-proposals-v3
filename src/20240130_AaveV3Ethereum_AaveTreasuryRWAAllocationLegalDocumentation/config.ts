import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    pools: ['AaveV3Ethereum'],
    title: 'Aave Treasury RWA Allocation - Legal documentation',
    shortName: 'AaveTreasuryRWAAllocationLegalDocumentation',
    date: '20240130',
    author: '@Khan - Centrifuge (Powered By ACI Skywards)',
    discussion: 'https://governance.aave.com/t/arfc-aave-treasury-rwa-allocation/14790',
    snapshot:
      'https://snapshot.org/#/aave.eth/proposal/0x71db494e4b49e7533c5ccaa566686b2d045b0761cb3296a2d77af4b500566eb0',
  },
  poolOptions: {AaveV3Ethereum: {configs: {}, cache: {blockNumber: 19115652}}},
};
