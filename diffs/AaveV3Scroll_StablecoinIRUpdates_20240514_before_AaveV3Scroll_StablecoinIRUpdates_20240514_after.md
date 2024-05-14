## Reserve changes

### Reserves altered

#### USDC ([0x06eFdBFf2a14a7c8E15944D1F4A48F9F95F663A4](https://scrollscan.com/address/0x06eFdBFf2a14a7c8E15944D1F4A48F9F95F663A4))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x80E14993fE2cA5c64328B4a8DfC1D95960338bd5](https://scrollscan.com/address/0x80E14993fE2cA5c64328B4a8DfC1D95960338bd5) | [0xE9EcAE0EDA2A97BB6a06a6244FfdFa6b1D886967](https://scrollscan.com/address/0xE9EcAE0EDA2A97BB6a06a6244FfdFa6b1D886967) |
| variableRateSlope1 | 9 % | 7 % |
| baseStableBorrowRate | 10 % | 8 % |
| interestRate | ![before](/.assets/a47328fc7b24fdcc5b0874aea1c9aa52e00b8238.svg) | ![after](/.assets/777b8255d2f6297eb7cd103b4a201084666f8478.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x06eFdBFf2a14a7c8E15944D1F4A48F9F95F663A4": {
      "interestRateStrategy": {
        "from": "0x80E14993fE2cA5c64328B4a8DfC1D95960338bd5",
        "to": "0xE9EcAE0EDA2A97BB6a06a6244FfdFa6b1D886967"
      }
    }
  },
  "strategies": {
    "0x06eFdBFf2a14a7c8E15944D1F4A48F9F95F663A4": {
      "address": {
        "from": "0x80E14993fE2cA5c64328B4a8DfC1D95960338bd5",
        "to": "0xE9EcAE0EDA2A97BB6a06a6244FfdFa6b1D886967"
      },
      "baseStableBorrowRate": {
        "from": "100000000000000000000000000",
        "to": "80000000000000000000000000"
      },
      "variableRateSlope1": {
        "from": "90000000000000000000000000",
        "to": "70000000000000000000000000"
      }
    }
  }
}
```