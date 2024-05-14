## Reserve changes

### Reserve altered

#### USDC ([0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174](https://polygonscan.com/address/0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x15d31D8a5da6A57Ea8EaDc12261777768b1E8C60](https://polygonscan.com/address/0x15d31D8a5da6A57Ea8EaDc12261777768b1E8C60) | [0x7390a913B99fc3C0C064C2875709E9be7a183669](https://polygonscan.com/address/0x7390a913B99fc3C0C064C2875709E9be7a183669) |
| variableRateSlope1 | 9.75 % | 7 % |
| interestRate | ![before](/.assets/df4a7d9cc3f6a6d30ec065c93141fe49eee42c4d.svg) | ![after](/.assets/7b06b349af5a5417d8aa6284e99a476220ec72e4.svg) |

#### DAI ([0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063](https://polygonscan.com/address/0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x08487E1EB852e06779634A176194192a36894313](https://polygonscan.com/address/0x08487E1EB852e06779634A176194192a36894313) | [0x55F33b87f1c8F12DbE1322e841431bBce1572A75](https://polygonscan.com/address/0x55F33b87f1c8F12DbE1322e841431bBce1572A75) |
| variableRateSlope1 | 9.75 % | 7 % |
| interestRate | ![before](/.assets/4bbdb7d641ac53393afda2d993e24109f61f61a1.svg) | ![after](/.assets/e8ced45ce252f17972b42bbedae01105f607f703.svg) |

#### USDT ([0xc2132D05D31c914a87C6611C10748AEb04B58e8F](https://polygonscan.com/address/0xc2132D05D31c914a87C6611C10748AEb04B58e8F))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xC22014C5159bcf56110414A9FB71971974294e98](https://polygonscan.com/address/0xC22014C5159bcf56110414A9FB71971974294e98) | [0xEe9213B77eD95BDaDcE1aDA5812A3544b159E5E3](https://polygonscan.com/address/0xEe9213B77eD95BDaDcE1aDA5812A3544b159E5E3) |
| variableRateSlope1 | 9.75 % | 7 % |
| interestRate | ![before](/.assets/629673f8cf1a36a93dc0ebfe1dd5da5b11ead5be.svg) | ![after](/.assets/71ba43ba437071129f71fabe5ed7e7125601ad05.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174": {
      "interestRateStrategy": {
        "from": "0x15d31D8a5da6A57Ea8EaDc12261777768b1E8C60",
        "to": "0x7390a913B99fc3C0C064C2875709E9be7a183669"
      }
    },
    "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063": {
      "interestRateStrategy": {
        "from": "0x08487E1EB852e06779634A176194192a36894313",
        "to": "0x55F33b87f1c8F12DbE1322e841431bBce1572A75"
      }
    },
    "0xc2132D05D31c914a87C6611C10748AEb04B58e8F": {
      "interestRateStrategy": {
        "from": "0xC22014C5159bcf56110414A9FB71971974294e98",
        "to": "0xEe9213B77eD95BDaDcE1aDA5812A3544b159E5E3"
      }
    }
  },
  "strategies": {
    "0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174": {
      "address": {
        "from": "0x15d31D8a5da6A57Ea8EaDc12261777768b1E8C60",
        "to": "0x7390a913B99fc3C0C064C2875709E9be7a183669"
      },
      "variableRateSlope1": {
        "from": "97500000000000000000000000",
        "to": "70000000000000000000000000"
      }
    },
    "0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063": {
      "address": {
        "from": "0x08487E1EB852e06779634A176194192a36894313",
        "to": "0x55F33b87f1c8F12DbE1322e841431bBce1572A75"
      },
      "variableRateSlope1": {
        "from": "97500000000000000000000000",
        "to": "70000000000000000000000000"
      }
    },
    "0xc2132D05D31c914a87C6611C10748AEb04B58e8F": {
      "address": {
        "from": "0xC22014C5159bcf56110414A9FB71971974294e98",
        "to": "0xEe9213B77eD95BDaDcE1aDA5812A3544b159E5E3"
      },
      "variableRateSlope1": {
        "from": "97500000000000000000000000",
        "to": "70000000000000000000000000"
      }
    }
  }
}
```