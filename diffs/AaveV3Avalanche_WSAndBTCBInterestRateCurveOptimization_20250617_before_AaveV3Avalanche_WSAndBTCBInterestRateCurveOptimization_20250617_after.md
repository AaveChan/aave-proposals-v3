## Reserve changes

### Reserves altered

#### BTC.b ([0x152b9d0FdC40C096757F570A51E494bd4b943E50](https://snowtrace.io/address/0x152b9d0FdC40C096757F570A51E494bd4b943E50))

| description | value before | value after |
| --- | --- | --- |
| reserveFactor | 20 % [2000] | 50 % [5000] |
| optimalUsageRatio | 45 % | 80 % |
| maxVariableBorrowRate | 307 % | 84 % |
| variableRateSlope1 | 7 % | 4 % |
| variableRateSlope2 | 300 % | 80 % |
| interestRate | ![before](https://dash.onaave.com/api/static?variableRateSlope1=70000000000000000000000000&variableRateSlope2=3000000000000000000000000000&optimalUsageRatio=450000000000000000000000000&baseVariableBorrowRate=0&maxVariableBorrowRate=3070000000000000000000000000) | ![after](https://dash.onaave.com/api/static?variableRateSlope1=40000000000000000000000000&variableRateSlope2=800000000000000000000000000&optimalUsageRatio=800000000000000000000000000&baseVariableBorrowRate=0&maxVariableBorrowRate=840000000000000000000000000) |

## Raw diff

```json
{
  "reserves": {
    "0x152b9d0FdC40C096757F570A51E494bd4b943E50": {
      "reserveFactor": {
        "from": 2000,
        "to": 5000
      }
    }
  },
  "strategies": {
    "0x152b9d0FdC40C096757F570A51E494bd4b943E50": {
      "maxVariableBorrowRate": {
        "from": "3070000000000000000000000000",
        "to": "840000000000000000000000000"
      },
      "optimalUsageRatio": {
        "from": "450000000000000000000000000",
        "to": "800000000000000000000000000"
      },
      "variableRateSlope1": {
        "from": "70000000000000000000000000",
        "to": "40000000000000000000000000"
      },
      "variableRateSlope2": {
        "from": "3000000000000000000000000000",
        "to": "800000000000000000000000000"
      }
    }
  },
  "raw": {
    "0x1140cb7cafacc745771c2ea31e7b5c653c5d0b80": {
      "label": "GovernanceV3Avalanche.PAYLOADS_CONTROLLER",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x3c06dce358add17aaf230f2234bccc4afd50d090": {
      "label": "AaveV2Avalanche.POOL_ADMIN, AaveV3Avalanche.ACL_ADMIN, GovernanceV3Avalanche.EXECUTOR_LVL_1",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x5e06b10b3b9c3e1c0996d2544a35b9839be02922": {
      "label": null,
      "balanceDiff": null,
      "stateDiff": {
        "0x0cc2e7a263101f3ec4cff7d64ef5961ae18d1d70e854cb40c5302bf7c043d7b9": {
          "previousValue": "0x0068512595000000000002000000000000000000000000000000000000000000",
          "newValue": "0x0068512595000000000003000000000000000000000000000000000000000000"
        },
        "0x0cc2e7a263101f3ec4cff7d64ef5961ae18d1d70e854cb40c5302bf7c043d7ba": {
          "previousValue": "0x000000000000000000093a80000000000000687f4a1600000000000000000000",
          "newValue": "0x000000000000000000093a80000000000000687f4a1600000000000068512596"
        }
      }
    },
    "0x794a61358d6845594f94dc1db02a252b5b4814ad": {
      "label": "AaveV3Avalanche.POOL",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x8145edddf43f50276641b55bd3ad95944510021e": {
      "label": "AaveV3Avalanche.POOL_CONFIGURATOR",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xa0d9c1e9e48ca30c8d8c3b5d69ff5dc1f6dffc24": {
      "label": "AaveV3Avalanche.DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_2",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xa72636cbcaa8f5ff95b2cc47f3cdee83f3294a0b": {
      "label": "AaveV3Avalanche.ACL_MANAGER",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xa8669021776bc142dfca87c21b4a52595bcbb40a": {
      "label": "AaveV3Avalanche.ASSETS.BTCb.V_TOKEN",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xa97684ead0e402dc232d5a977953df7ecbab3cdb": {
      "label": "AaveV3Avalanche.POOL_ADDRESSES_PROVIDER",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xb7467b66d86ce80cc258f28d266a18a51db7fac8": {
      "label": "AaveV3Avalanche.POOL_IMPL",
      "balanceDiff": null,
      "stateDiff": {
        "0xb6daa7f42b4684a81e654680f3320ba6299809dbe8f4089d040ee5cdfce6b64d": {
          "previousValue": "0x100000000000000000000003e800000177000000012c07d08508299a1d4c1b58",
          "newValue": "0x100000000000000000000003e800000177000000012c13888508299a1d4c1b58"
        },
        "0xb6daa7f42b4684a81e654680f3320ba6299809dbe8f4089d040ee5cdfce6b64e": {
          "previousValue": "0x000000000000317d6e688dca00685b2e00000000033e1234a0be7dc1a67c2f49",
          "newValue": "0x00000000000009f132c13f5a25a8b30b00000000033e1234a1fb8a5937dc1508"
        },
        "0xb6daa7f42b4684a81e654680f3320ba6299809dbe8f4089d040ee5cdfce6b64f": {
          "previousValue": "0x0000000000059380bc4f28a05b67e298000000000350f00a63ff354cb9b065c4",
          "newValue": "0x000000000001cad71807ac76ba97a513000000000350f00a88881f7e1af35199"
        },
        "0xb6daa7f42b4684a81e654680f3320ba6299809dbe8f4089d040ee5cdfce6b650": {
          "previousValue": "0x000000000000000000000b006851258a000000000000000000000000000ad86e",
          "newValue": "0x000000000000000000000b0068512596000000000000000000000000000ad86e"
        },
        "0xb6daa7f42b4684a81e654680f3320ba6299809dbe8f4089d040ee5cdfce6b655": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000001404",
          "newValue": "0x000000000000000000000000000000000000000000000000000000000000140b"
        }
      }
    },
    "0xce1c5509f2f4d755aa64b8d135b15ec6f12a93da": {
      "label": "AaveV3Avalanche.ASSETS.DAIe.INTEREST_RATE_STRATEGY, AaveV3Avalanche.ASSETS.LINKe.INTEREST_RATE_STRATEGY, AaveV3Avalanche.ASSETS.USDC.INTEREST_RATE_STRATEGY, AaveV3Avalanche.ASSETS.WBTCe.INTEREST_RATE_STRATEGY, AaveV3Avalanche.ASSETS.WETHe.INTEREST_RATE_STRATEGY, AaveV3Avalanche.ASSETS.USDt.INTEREST_RATE_STRATEGY, AaveV3Avalanche.ASSETS.AAVEe.INTEREST_RATE_STRATEGY, AaveV3Avalanche.ASSETS.WAVAX.INTEREST_RATE_STRATEGY, AaveV3Avalanche.ASSETS.sAVAX.INTEREST_RATE_STRATEGY, AaveV3Avalanche.ASSETS.FRAX.INTEREST_RATE_STRATEGY, AaveV3Avalanche.ASSETS.MAI.INTEREST_RATE_STRATEGY, AaveV3Avalanche.ASSETS.BTCb.INTEREST_RATE_STRATEGY, AaveV3Avalanche.ASSETS.AUSD.INTEREST_RATE_STRATEGY",
      "balanceDiff": null,
      "stateDiff": {
        "0x22bdd7992f40d9be13ecde867eccd0cd86e660d3ce9d00c860eb6ca5ef57c4d5": {
          "previousValue": "0x00000000000000000000000000000000000000007530000002bc000000001194",
          "newValue": "0x00000000000000000000000000000000000000001f4000000190000000001f40"
        }
      }
    },
    "0xe5e48ad1f9d1a894188b483dcf91f4fad6aba43b": {
      "label": "AaveV3Avalanche.POOL_CONFIGURATOR_IMPL",
      "balanceDiff": null,
      "stateDiff": {}
    }
  }
}
```