## Reserve changes

### Reserves altered

#### weETH ([0x35751007a407ca6FEFfE80b3cB397736D2cf4dbe](https://arbiscan.io/address/0x35751007a407ca6FEFfE80b3cB397736D2cf4dbe))

| description | value before | value after |
| --- | --- | --- |
| ltv | 72.5 % [7250] | 75 % [7500] |
| liquidationThreshold | 75 % [7500] | 77 % [7700] |


## Emodes changed

### EMode: Stablecoins(id: 1)



### EMode: ETH correlated(id: 2)



### EMode: ezETH wstETH(id: 3)



### EMode: ezETH Stablecoins(id: 4)



### EMode: weETH/ETH(id: 5)

| description | value before | value after |
| --- | --- | --- |
| eMode.label | - | weETH/ETH |
| eMode.ltv | - | 93 % |
| eMode.liquidationThreshold | - | 95 % |
| eMode.liquidationBonus | - | 1 % |
| eMode.borrowableBitmap | - | WETH |
| eMode.collateralBitmap | - | weETH |


### EMode: wstETH/ETH(id: 6)

| description | value before | value after |
| --- | --- | --- |
| eMode.label | - | wstETH/ETH |
| eMode.ltv | - | 93.5 % |
| eMode.liquidationThreshold | - | 95.5 % |
| eMode.liquidationBonus | - | 1 % |
| eMode.borrowableBitmap | - | WETH |
| eMode.collateralBitmap | - | wstETH |


## Raw diff

```json
{
  "eModes": {
    "5": {
      "from": null,
      "to": {
        "borrowableBitmap": "16",
        "collateralBitmap": "32768",
        "eModeCategory": 5,
        "label": "weETH/ETH",
        "liquidationBonus": 10100,
        "liquidationThreshold": 9500,
        "ltv": 9300
      }
    },
    "6": {
      "from": null,
      "to": {
        "borrowableBitmap": "16",
        "collateralBitmap": "256",
        "eModeCategory": 6,
        "label": "wstETH/ETH",
        "liquidationBonus": 10100,
        "liquidationThreshold": 9550,
        "ltv": 9350
      }
    }
  },
  "reserves": {
    "0x35751007a407ca6FEFfE80b3cB397736D2cf4dbe": {
      "liquidationThreshold": {
        "from": 7500,
        "to": 7700
      },
      "ltv": {
        "from": 7250,
        "to": 7500
      }
    }
  },
  "raw": {
    "0x118dfd5418890c0332042ab05173db4a2c1d283c": {
      "label": null,
      "balanceDiff": null,
      "stateDiff": {
        "0x0cc2e7a263101f3ec4cff7d64ef5961ae18d1d70e854cb40c5302bf7c043d7b9": {
          "previousValue": "0x0067d9eff2000000000002000000000000000000000000000000000000000000",
          "newValue": "0x0067d9eff2000000000003000000000000000000000000000000000000000000"
        },
        "0x0cc2e7a263101f3ec4cff7d64ef5961ae18d1d70e854cb40c5302bf7c043d7ba": {
          "previousValue": "0x000000000000000000093a800000000000006808147300000000000000000000",
          "newValue": "0x000000000000000000093a800000000000006808147300000000000067d9eff3"
        }
      }
    },
    "0x794a61358d6845594f94dc1db02a252b5b4814ad": {
      "label": "AaveV3Arbitrum.POOL",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x7f775bb7af2e7e09d5dc9506c95516159a5ca0d0": {
      "label": "AaveV3Arbitrum.POOL_IMPL",
      "balanceDiff": null,
      "stateDiff": {
        "0x01290583d43e205f46f8d824d1236df318521e471f570a5b36fa1844856e40d6": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x00000000000000000000000000000000000000000000000001002774254e2486"
        },
        "0x01290583d43e205f46f8d824d1236df318521e471f570a5b36fa1844856e40d7": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x7773744554482f45544800000000000000000000000000000000000000000014"
        },
        "0x01290583d43e205f46f8d824d1236df318521e471f570a5b36fa1844856e40d8": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000000000000000000000000000000000000000000010"
        },
        "0x4f0da5bca7ea3ed2a5fd7fbf6d310bc05d68502cf438424218eeef530670c853": {
          "previousValue": "0x100000000000000000000203e800001adb00000000011194851229fe1d4c1c52",
          "newValue": "0x100000000000000000000203e800001adb00000000011194851229fe1e141d4c"
        },
        "0x50039cf134a124858bd88bbc9225ec3c537b89a0e9237ce39fe1813e6edf8257": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x00000000000000000000000000000000000000000000000080002774251c2454"
        },
        "0x50039cf134a124858bd88bbc9225ec3c537b89a0e9237ce39fe1813e6edf8258": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x77654554482f4554480000000000000000000000000000000000000000000012"
        },
        "0x50039cf134a124858bd88bbc9225ec3c537b89a0e9237ce39fe1813e6edf8259": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000000000000000000000000000000000000000000010"
        }
      }
    },
    "0x8145edddf43f50276641b55bd3ad95944510021e": {
      "label": "AaveV3Arbitrum.POOL_CONFIGURATOR",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x89644ca1bb8064760312ae4f03ea41b05da3637c": {
      "label": "GovernanceV3Arbitrum.PAYLOADS_CONTROLLER",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xa72636cbcaa8f5ff95b2cc47f3cdee83f3294a0b": {
      "label": "AaveV3Arbitrum.ACL_MANAGER",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xa97684ead0e402dc232d5a977953df7ecbab3cdb": {
      "label": "AaveV3Arbitrum.POOL_ADDRESSES_PROVIDER",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xe5e48ad1f9d1a894188b483dcf91f4fad6aba43b": {
      "label": "AaveV3Arbitrum.POOL_CONFIGURATOR_IMPL",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xff1137243698caa18ee364cc966cf0e02a4e6327": {
      "label": "AaveV3Arbitrum.ACL_ADMIN, GovernanceV3Arbitrum.EXECUTOR_LVL_1",
      "balanceDiff": null,
      "stateDiff": {}
    }
  }
}
```