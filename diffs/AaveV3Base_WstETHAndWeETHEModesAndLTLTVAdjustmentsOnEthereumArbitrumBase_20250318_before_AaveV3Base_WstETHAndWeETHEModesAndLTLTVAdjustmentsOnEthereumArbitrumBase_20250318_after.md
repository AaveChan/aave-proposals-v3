## Reserve changes

### Reserves altered

#### weETH ([0x04C0599Ae5A44757c0af6F9eC3b93da8976c150A](https://basescan.org/address/0x04C0599Ae5A44757c0af6F9eC3b93da8976c150A))

| description | value before | value after |
| --- | --- | --- |
| ltv | 72.5 % [7250] | 75 % [7500] |
| liquidationThreshold | 75 % [7500] | 77 % [7700] |


## Emodes changed

### EMode: ETH correlated(id: 1)



### EMode: ezETH wstETH(id: 2)



### EMode: ezETH Stablecoins(id: 3)



### EMode: LBTC_cbBTC(id: 4)



### EMode: rsETH/wstETH(id: 5)



### EMode: weETH/ETH(id: 6)

| description | value before | value after |
| --- | --- | --- |
| eMode.label | - | weETH/ETH |
| eMode.ltv | - | 93 % |
| eMode.liquidationThreshold | - | 95 % |
| eMode.liquidationBonus | - | 1.25 % |
| eMode.borrowableBitmap | - | WETH |
| eMode.collateralBitmap | - | weETH |


### EMode: wstETH/ETH(id: 7)

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
    "6": {
      "from": null,
      "to": {
        "borrowableBitmap": "1",
        "collateralBitmap": "32",
        "eModeCategory": 6,
        "label": "weETH/ETH",
        "liquidationBonus": 10125,
        "liquidationThreshold": 9500,
        "ltv": 9300
      }
    },
    "7": {
      "from": null,
      "to": {
        "borrowableBitmap": "1",
        "collateralBitmap": "8",
        "eModeCategory": 7,
        "label": "wstETH/ETH",
        "liquidationBonus": 10100,
        "liquidationThreshold": 9550,
        "ltv": 9350
      }
    }
  },
  "reserves": {
    "0x04C0599Ae5A44757c0af6F9eC3b93da8976c150A": {
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
    "0x2dc219e716793fb4b21548c0f009ba3af753ab01": {
      "label": "GovernanceV3Base.PAYLOADS_CONTROLLER",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x319d156ea750b20d5370ef7b348b6ff1ab5d0256": {
      "label": null,
      "balanceDiff": null,
      "stateDiff": {
        "0x163a647ba7edd41caabec3eace9ce83f1a89ebea06fc099aa7fb98088da75131": {
          "previousValue": "0x0067d9e5ec000000000002000000000000000000000000000000000000000000",
          "newValue": "0x0067d9e5ec000000000003000000000000000000000000000000000000000000"
        },
        "0x163a647ba7edd41caabec3eace9ce83f1a89ebea06fc099aa7fb98088da75132": {
          "previousValue": "0x000000000000000000093a8000000000000068080a6d00000000000000000000",
          "newValue": "0x000000000000000000093a8000000000000068080a6d00000000000067d9e5ed"
        }
      }
    },
    "0x43955b0899ab7232e3a454cf84aedd22ad46fd33": {
      "label": "AaveV3Base.ACL_MANAGER",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x5731a04b1e775f0fdd454bf70f3335886e9a96be": {
      "label": "AaveV3Base.POOL_CONFIGURATOR",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x6ef6b6176091f94a8ad52c08e571f81598b226a2": {
      "label": "AaveV3Base.POOL_IMPL",
      "balanceDiff": null,
      "stateDiff": {
        "0x01290583d43e205f46f8d824d1236df318521e471f570a5b36fa1844856e40d6": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000000000000000000000000000000020278d251c2454"
        },
        "0x01290583d43e205f46f8d824d1236df318521e471f570a5b36fa1844856e40d7": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x77654554482f4554480000000000000000000000000000000000000000000012"
        },
        "0x01290583d43e205f46f8d824d1236df318521e471f570a5b36fa1844856e40d8": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000000000000000000000000000000000000000000001"
        },
        "0x06511f122a6ecc4dc280e9f39df5119c2e43c998c438a2cdea36d46bbc885187": {
          "previousValue": "0x100000000000000000000103e80000138800000000011194851229fe1d4c1c52",
          "newValue": "0x100000000000000000000103e80000138800000000011194851229fe1e141d4c"
        },
        "0x1e4061ed12ce1f4439fe6c7922bd1dce45af754358ce2f94214f93749947e40a": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x00000000000000000000000000000000000000000000000000082774254e2486"
        },
        "0x1e4061ed12ce1f4439fe6c7922bd1dce45af754358ce2f94214f93749947e40b": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x7773744554482f45544800000000000000000000000000000000000000000014"
        },
        "0x1e4061ed12ce1f4439fe6c7922bd1dce45af754358ce2f94214f93749947e40c": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000000000000000000000000000000000000000000001"
        }
      }
    },
    "0x9390b1735def18560c509e2d0bc090e9d6ba257a": {
      "label": "AaveV3Base.ACL_ADMIN, GovernanceV3Base.EXECUTOR_LVL_1",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xa238dd80c259a72e81d7e4664a9801593f98d1c5": {
      "label": "AaveV3Base.POOL",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xe20fcbdbffc4dd138ce8b2e6fbb6cb49777ad64d": {
      "label": "AaveV3Base.POOL_ADDRESSES_PROVIDER",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xe5e48ad1f9d1a894188b483dcf91f4fad6aba43b": {
      "label": "AaveV3Base.POOL_CONFIGURATOR_IMPL",
      "balanceDiff": null,
      "stateDiff": {}
    }
  }
}
```