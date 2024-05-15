## Reserve changes

### Reserve altered

#### USDT ([0x55d398326f99059fF775485246999027B3197955](https://bscscan.com/address/0x55d398326f99059fF775485246999027B3197955))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xD161Cd855089c33c00F7D30C56452e5B4B8a8599](https://bscscan.com/address/0xD161Cd855089c33c00F7D30C56452e5B4B8a8599) | [0x77498A4A946e0303E92B78676851f861906e6eF4](https://bscscan.com/address/0x77498A4A946e0303E92B78676851f861906e6eF4) |
| variableRateSlope1 | 9 % | 7 % |
| baseStableBorrowRate | 10 % | 8 % |
| interestRate | ![before](/.assets/189b1048cfb01ad4ab7283e7ad5c7292c5ec484d.svg) | ![after](/.assets/c937c43b9091402740a6cca1a33c3dd4408d0972.svg) |

#### USDC ([0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d](https://bscscan.com/address/0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x4e4B860383B9C35615f2dc0C3b78F83009A46720](https://bscscan.com/address/0x4e4B860383B9C35615f2dc0C3b78F83009A46720) | [0x34E8e73bFB04454bd203410b009124527A57Ea3F](https://bscscan.com/address/0x34E8e73bFB04454bd203410b009124527A57Ea3F) |
| variableRateSlope1 | 9 % | 7 % |
| baseStableBorrowRate | 10 % | 8 % |
| interestRate | ![before](/.assets/caf98330fb34eb7b2e26a2107766215407decc6a.svg) | ![after](/.assets/6cdc756037f3ba1b940704e1ff4edd60648ff4f7.svg) |

#### FDUSD ([0xc5f0f7b66764F6ec8C8Dff7BA683102295E16409](https://bscscan.com/address/0xc5f0f7b66764F6ec8C8Dff7BA683102295E16409))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x6415754564745A50adB508D3B94d10870FE220eb](https://bscscan.com/address/0x6415754564745A50adB508D3B94d10870FE220eb) | [0xbD77cb6a17cCCca5D8fB634f664E4e4950c9fF89](https://bscscan.com/address/0xbD77cb6a17cCCca5D8fB634f664E4e4950c9fF89) |
| variableRateSlope1 | 9 % | 7 % |
| baseStableBorrowRate | 12 % | 10 % |
| interestRate | ![before](/.assets/2fa239413d25864a0b99b39868a3fb49e63010ad.svg) | ![after](/.assets/79ece0fc31d1323af03c105783346eb76498e07f.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x55d398326f99059fF775485246999027B3197955": {
      "interestRateStrategy": {
        "from": "0xD161Cd855089c33c00F7D30C56452e5B4B8a8599",
        "to": "0x77498A4A946e0303E92B78676851f861906e6eF4"
      }
    },
    "0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d": {
      "interestRateStrategy": {
        "from": "0x4e4B860383B9C35615f2dc0C3b78F83009A46720",
        "to": "0x34E8e73bFB04454bd203410b009124527A57Ea3F"
      }
    },
    "0xc5f0f7b66764F6ec8C8Dff7BA683102295E16409": {
      "interestRateStrategy": {
        "from": "0x6415754564745A50adB508D3B94d10870FE220eb",
        "to": "0xbD77cb6a17cCCca5D8fB634f664E4e4950c9fF89"
      }
    }
  },
  "strategies": {
    "0x55d398326f99059fF775485246999027B3197955": {
      "address": {
        "from": "0xD161Cd855089c33c00F7D30C56452e5B4B8a8599",
        "to": "0x77498A4A946e0303E92B78676851f861906e6eF4"
      },
      "baseStableBorrowRate": {
        "from": "100000000000000000000000000",
        "to": "80000000000000000000000000"
      },
      "variableRateSlope1": {
        "from": "90000000000000000000000000",
        "to": "70000000000000000000000000"
      }
    },
    "0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d": {
      "address": {
        "from": "0x4e4B860383B9C35615f2dc0C3b78F83009A46720",
        "to": "0x34E8e73bFB04454bd203410b009124527A57Ea3F"
      },
      "baseStableBorrowRate": {
        "from": "100000000000000000000000000",
        "to": "80000000000000000000000000"
      },
      "variableRateSlope1": {
        "from": "90000000000000000000000000",
        "to": "70000000000000000000000000"
      }
    },
    "0xc5f0f7b66764F6ec8C8Dff7BA683102295E16409": {
      "address": {
        "from": "0x6415754564745A50adB508D3B94d10870FE220eb",
        "to": "0xbD77cb6a17cCCca5D8fB634f664E4e4950c9fF89"
      },
      "baseStableBorrowRate": {
        "from": "120000000000000000000000000",
        "to": "100000000000000000000000000"
      },
      "variableRateSlope1": {
        "from": "90000000000000000000000000",
        "to": "70000000000000000000000000"
      }
    }
  }
}
```