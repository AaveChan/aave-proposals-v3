## Reserve changes

### Reserve altered

#### USDC ([0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913](https://basescan.org/address/0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xA802E6c96572f4C7efbf1e611d161CF63ad74Ef9](https://basescan.org/address/0xA802E6c96572f4C7efbf1e611d161CF63ad74Ef9) | [0x0D9e605d77Ea2ADe3eEAfa86cE353899E9D3d72C](https://basescan.org/address/0x0D9e605d77Ea2ADe3eEAfa86cE353899E9D3d72C) |
| variableRateSlope1 | 9 % | 7 % |
| baseStableBorrowRate | 9 % | 7 % |
| interestRate | ![before](/.assets/f5485a1f322764552b7a360d6d4890b45801d1dc.svg) | ![after](/.assets/9540c697b0ff46c9d37ab1661b3fa4ef8a4be5e4.svg) |

#### USDbC ([0xd9aAEc86B65D86f6A7B5B1b0c42FFA531710b6CA](https://basescan.org/address/0xd9aAEc86B65D86f6A7B5B1b0c42FFA531710b6CA))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x992ff76913Db79eCA51666D1e09b4F5Cf078dF7D](https://basescan.org/address/0x992ff76913Db79eCA51666D1e09b4F5Cf078dF7D) | [0xA31AcCd744EBdbF1b36E4556Ea09C8b34CD65bb2](https://basescan.org/address/0xA31AcCd744EBdbF1b36E4556Ea09C8b34CD65bb2) |
| variableRateSlope1 | 10 % | 8 % |
| baseStableBorrowRate | 11 % | 9 % |
| interestRate | ![before](/.assets/1fcc1b0751c3b07af596103ceace9c8c3c9b63ea.svg) | ![after](/.assets/9e344800d1bbfcb4d0c23b965f510ec2985514f9.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913": {
      "interestRateStrategy": {
        "from": "0xA802E6c96572f4C7efbf1e611d161CF63ad74Ef9",
        "to": "0x0D9e605d77Ea2ADe3eEAfa86cE353899E9D3d72C"
      }
    },
    "0xd9aAEc86B65D86f6A7B5B1b0c42FFA531710b6CA": {
      "interestRateStrategy": {
        "from": "0x992ff76913Db79eCA51666D1e09b4F5Cf078dF7D",
        "to": "0xA31AcCd744EBdbF1b36E4556Ea09C8b34CD65bb2"
      }
    }
  },
  "strategies": {
    "0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913": {
      "address": {
        "from": "0xA802E6c96572f4C7efbf1e611d161CF63ad74Ef9",
        "to": "0x0D9e605d77Ea2ADe3eEAfa86cE353899E9D3d72C"
      },
      "baseStableBorrowRate": {
        "from": "90000000000000000000000000",
        "to": "70000000000000000000000000"
      },
      "variableRateSlope1": {
        "from": "90000000000000000000000000",
        "to": "70000000000000000000000000"
      }
    },
    "0xd9aAEc86B65D86f6A7B5B1b0c42FFA531710b6CA": {
      "address": {
        "from": "0x992ff76913Db79eCA51666D1e09b4F5Cf078dF7D",
        "to": "0xA31AcCd744EBdbF1b36E4556Ea09C8b34CD65bb2"
      },
      "baseStableBorrowRate": {
        "from": "110000000000000000000000000",
        "to": "90000000000000000000000000"
      },
      "variableRateSlope1": {
        "from": "100000000000000000000000000",
        "to": "80000000000000000000000000"
      }
    }
  }
}
```