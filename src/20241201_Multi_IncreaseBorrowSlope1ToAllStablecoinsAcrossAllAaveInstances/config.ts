import {ConfigFile} from '../../generator/types';
export const config: ConfigFile = {
  rootOptions: {
    author: 'Aave Chan Initiative',
    pools: [
      'AaveV2Ethereum',
      'AaveV2Polygon',
      'AaveV2Avalanche',
      'AaveV3Ethereum',
      'AaveV3EthereumLido',
      'AaveV3EthereumEtherFi',
      'AaveV3Polygon',
      'AaveV3Avalanche',
      'AaveV3Optimism',
      'AaveV3Arbitrum',
      'AaveV3Metis',
      'AaveV3Base',
      'AaveV3Gnosis',
      'AaveV3Scroll',
      'AaveV3BNB',
      'AaveV3ZkSync',
    ],
    title: 'Increase Borrow Slope1 to all Stablecoins across all Aave Instances',
    shortName: 'IncreaseBorrowSlope1ToAllStablecoinsAcrossAllAaveInstances',
    date: '20241201',
    discussion:
      'https://governance.aave.com/t/arfc-increase-borrow-slope1-to-all-stablecoins-across-all-aave-instances/19979',
    snapshot: 'Direct-to-AIP',
    votingNetwork: 'POLYGON',
  },
  poolOptions: {
    AaveV2Ethereum: {
      configs: {
        RATE_UPDATE_V2: [
          {
            asset: 'USDT',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
              stableRateSlope1: '',
              stableRateSlope2: '',
            },
          },
          {
            asset: 'DAI',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
              stableRateSlope1: '',
              stableRateSlope2: '',
            },
          },
          {
            asset: 'USDC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
              stableRateSlope1: '',
              stableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 21309616},
    },
    AaveV2Polygon: {
      configs: {
        RATE_UPDATE_V2: [
          {
            asset: 'DAI',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
              stableRateSlope1: '',
              stableRateSlope2: '',
            },
          },
          {
            asset: 'USDC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
              stableRateSlope1: '',
              stableRateSlope2: '',
            },
          },
          {
            asset: 'USDT',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
              stableRateSlope1: '',
              stableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 64964081},
    },
    AaveV2Avalanche: {
      configs: {
        RATE_UPDATE_V2: [
          {
            asset: 'DAIe',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
              stableRateSlope1: '',
              stableRateSlope2: '',
            },
          },
          {
            asset: 'USDTe',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
              stableRateSlope1: '',
              stableRateSlope2: '',
            },
          },
          {
            asset: 'USDCe',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
              stableRateSlope1: '',
              stableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 53797597},
    },
    AaveV3Ethereum: {
      configs: {
        RATE_UPDATE_V3: [
          {
            asset: 'USDC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'DAI',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDT',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'LUSD',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'FRAX',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'crvUSD',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'PYUSD',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDe',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDS',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 21309860},
    },
    AaveV3EthereumLido: {
      configs: {
        RATE_UPDATE_V3: [
          {
            asset: 'USDS',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 21309958},
    },
    AaveV3EthereumEtherFi: {
      configs: {
        RATE_UPDATE_V3: [
          {
            asset: 'USDC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'PYUSD',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'FRAX',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 21309961},
    },
    AaveV3Polygon: {
      configs: {
        RATE_UPDATE_V3: [
          {
            asset: 'DAI',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDT',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'EURS',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDCn',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 64965941},
    },
    AaveV3Avalanche: {
      configs: {
        RATE_UPDATE_V3: [
          {
            asset: 'DAIe',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDt',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'FRAX',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 53799626},
    },
    AaveV3Optimism: {
      configs: {
        RATE_UPDATE_V3: [
          {
            asset: 'DAI',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDT',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'sUSD',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'LUSD',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDCn',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 128742634},
    },
    AaveV3Arbitrum: {
      configs: {
        RATE_UPDATE_V3: [
          {
            asset: 'DAI',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDT',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'LUSD',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDCn',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'FRAX',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'GHO',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 280332171},
    },
    AaveV3Metis: {
      configs: {
        RATE_UPDATE_V3: [
          {
            asset: 'mDAI',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'mUSDC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'mUSDT',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 19090067},
    },
    AaveV3Base: {
      configs: {
        RATE_UPDATE_V3: [
          {
            asset: 'USDbC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 23147457},
    },
    AaveV3Gnosis: {
      configs: {
        RATE_UPDATE_V3: [
          {
            asset: 'USDC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'WXDAI',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'EURe',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDCe',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 37308300},
    },
    AaveV3Scroll: {
      configs: {
        RATE_UPDATE_V3: [
          {
            asset: 'USDC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 11565449},
    },
    AaveV3BNB: {
      configs: {
        RATE_UPDATE_V3: [
          {
            asset: 'USDC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDT',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'FDUSD',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 44501491},
    },
    AaveV3ZkSync: {
      configs: {
        RATE_UPDATE_V3: [
          {
            asset: 'USDC',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
          {
            asset: 'USDT',
            params: {
              optimalUtilizationRate: '',
              baseVariableBorrowRate: '',
              variableRateSlope1: '9.5',
              variableRateSlope2: '',
            },
          },
        ],
      },
      cache: {blockNumber: 50263640},
    },
  },
};