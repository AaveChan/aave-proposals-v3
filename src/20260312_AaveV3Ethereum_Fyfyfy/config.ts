import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    pools: ['AaveV3Ethereum'],
    title: 'fyfyfy',
    shortName: 'Fyfyfy',
    date: '20260312',
    author: 'ydfyfy',
    discussion: '',
    snapshot: '',
    votingNetwork: 'AVALANCHE',
  },
  poolOptions: {AaveV3Ethereum: {configs: {BORROWS_UPDATE: []}, cache: {blockNumber: 24642211}}},
};
