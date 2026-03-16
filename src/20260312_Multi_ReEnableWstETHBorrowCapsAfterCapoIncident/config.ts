import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    author: 'Chaos Labs (implemented by Aavechan Initiative @aci via Skyward)',
    pools: ['AaveV3Ethereum', 'AaveV3EthereumLido'],
    title: 'Re-enable wstETH borrow caps after capo incident',
    shortName: 'ReEnableWstETHBorrowCapsAfterCapoIncident',
    date: '20260312',
    discussion:
      'https://governance.aave.com/t/post-mortem-exchange-rate-misallignment-on-wsteth-core-and-prime-instances/24269',
    snapshot: 'direct-to-aip',
    votingNetwork: 'AVALANCHE',
  },
  poolOptions: {
    AaveV3Ethereum: {
      configs: {CAPS_UPDATE: [{asset: 'wstETH', supplyCap: '', borrowCap: '180000'}]},
      cache: {blockNumber: 24641996},
    },
    AaveV3EthereumLido: {
      configs: {CAPS_UPDATE: [{asset: 'wstETH', supplyCap: '', borrowCap: '70000'}]},
      cache: {blockNumber: 24641997},
    },
  },
};
