## Reserve changes

### Reserves altered

#### wS ([0x039e2fB66102314Ce7b64Ce5Ce3E5183bc94aD38](https://sonicscan.org//address/0x039e2fB66102314Ce7b64Ce5Ce3E5183bc94aD38))

| description | value before | value after |
| --- | --- | --- |
| optimalUsageRatio | 45 % | 80 % |
| maxVariableBorrowRate | 307 % | 84 % |
| variableRateSlope1 | 7 % | 4 % |
| variableRateSlope2 | 300 % | 80 % |
| interestRate | ![before](https://dash.onaave.com/api/static?variableRateSlope1=70000000000000000000000000&variableRateSlope2=3000000000000000000000000000&optimalUsageRatio=450000000000000000000000000&baseVariableBorrowRate=0&maxVariableBorrowRate=3070000000000000000000000000) | ![after](https://dash.onaave.com/api/static?variableRateSlope1=40000000000000000000000000&variableRateSlope2=800000000000000000000000000&optimalUsageRatio=800000000000000000000000000&baseVariableBorrowRate=0&maxVariableBorrowRate=840000000000000000000000000) |

## Raw diff

```json
{
  "strategies": {
    "0x039e2fB66102314Ce7b64Ce5Ce3E5183bc94aD38": {
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
    "0x0846c28dd54dea4fd7fb31bcc5eb81673d68c695": {
      "label": "GovernanceV3Sonic.PAYLOADS_CONTROLLER",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x3a790a47c4d531fd333fad24f70b0ccb521b3b5a": {
      "label": "AaveV3Sonic.ACL_MANAGER",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x46dcd5f4600319b02649fd76b55aa6c1035ca478": {
      "label": "AaveV3Sonic.POOL_IMPL",
      "balanceDiff": null,
      "stateDiff": {
        "0x1c6109d2bbfbdadfc462a8d70dd8be07bf59af5d98a33599fd824b82f078f1ae": {
          "previousValue": "0x00000000000acb934f9f6ee7e335634900000000033ddf550ea426d40ed3c4ca",
          "newValue": "0x000000000003784acf59c790bf567a1000000000033ddf568527f0208f94c9ea"
        },
        "0x1c6109d2bbfbdadfc462a8d70dd8be07bf59af5d98a33599fd824b82f078f1af": {
          "previousValue": "0x0000000000286cc77517105ee8617d8c000000000344c2babfa0f9f8e789816f",
          "newValue": "0x00000000000cfe64bdd6c8d7369329ed000000000344c2c045b7bf41a5b1a73d"
        },
        "0x1c6109d2bbfbdadfc462a8d70dd8be07bf59af5d98a33599fd824b82f078f1b0": {
          "previousValue": "0x0000000000000000000002006851263800000000000000000000000000000000",
          "newValue": "0x0000000000000000000002006851267900000000000000000000000000000000"
        },
        "0x1c6109d2bbfbdadfc462a8d70dd8be07bf59af5d98a33599fd824b82f078f1b5": {
          "previousValue": "0x000000000000000000000000000000000000000000000003f2fc66f001ed054b",
          "newValue": "0x000000000000000000000000000000000000000000000003fad07cc279ff7abf"
        }
      }
    },
    "0x50c70feb95abc1a92fc30b9acc41bd349e5de2f0": {
      "label": "AaveV3Sonic.POOL_CONFIGURATOR",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x5362dbb1e601abf3a4c14c22ffeda64042e5eaa3": {
      "label": "AaveV3Sonic.POOL",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x5c2e738f6e27bce0f7558051bf90605dd6176900": {
      "label": "AaveV3Sonic.POOL_ADDRESSES_PROVIDER",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x5cc4f782cfe249286476a7effd9d7bd215768194": {
      "label": "AaveV3Sonic.POOL_CONFIGURATOR_IMPL",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x7b62461a3570c6ac8a9f8330421576e417b71ee7": {
      "label": "AaveV3Sonic.ACL_ADMIN, GovernanceV3Sonic.EXECUTOR_LVL_1",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xcb85c501b3a5e9851850d66648d69b26a4c90942": {
      "label": "AaveV3Sonic.DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xdff435bccf782f11187d3a4454d96702ed78e092": {
      "label": "AaveV3Sonic.ASSETS.WETH.INTEREST_RATE_STRATEGY, AaveV3Sonic.ASSETS.USDCe.INTEREST_RATE_STRATEGY, AaveV3Sonic.ASSETS.wS.INTEREST_RATE_STRATEGY, AaveV3Sonic.ASSETS.stS.INTEREST_RATE_STRATEGY",
      "balanceDiff": null,
      "stateDiff": {
        "0x6c25d4659e21d12be9149fe56708ccaa64adf240a47e26b06a5deef01e2dddf2": {
          "previousValue": "0x00000000000000000000000000000000000000007530000002bc000000001194",
          "newValue": "0x00000000000000000000000000000000000000001f4000000190000000001f40"
        }
      }
    },
    "0xf6089b790fbf8f4812a79a31cfabeb00b06ba7bd": {
      "label": "AaveV3Sonic.ASSETS.wS.V_TOKEN",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xff1137243698caa18ee364cc966cf0e02a4e6327": {
      "label": null,
      "balanceDiff": null,
      "stateDiff": {
        "0x83ec6a1f0257b830b5e016457c9cf1435391bf56cc98f369a58a54fe93772465": {
          "previousValue": "0x0068512678000000000002000000000000000000000000000000000000000000",
          "newValue": "0x0068512678000000000003000000000000000000000000000000000000000000"
        },
        "0x83ec6a1f0257b830b5e016457c9cf1435391bf56cc98f369a58a54fe93772466": {
          "previousValue": "0x000000000000000000093a80000000000000687f4af900000000000000000000",
          "newValue": "0x000000000000000000093a80000000000000687f4af900000000000068512679"
        }
      }
    }
  }
}
```