## Reserve changes

### Reserve altered

#### USDC ([0xDDAfbb505ad214D7b80b1f830fcCc89B60fb7A83](https://gnosisscan.io/address/0xDDAfbb505ad214D7b80b1f830fcCc89B60fb7A83))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x7b846F0bE2A2c3434b353130B312Dd978514D04d](https://gnosisscan.io/address/0x7b846F0bE2A2c3434b353130B312Dd978514D04d) | [0xD3120200c339f608C394CCF9cBAD4bABab63B5dD](https://gnosisscan.io/address/0xD3120200c339f608C394CCF9cBAD4bABab63B5dD) |
| variableRateSlope1 | 9 % | 7 % |
| baseStableBorrowRate | 10 % | 8 % |
| interestRate | ![before](/.assets/9c6c2ac04f36e8884c02f7bd8e4fedeff98c9211.svg) | ![after](/.assets/91d21e009e84b5163b47bd0dc7395bf2b1847ad4.svg) |

#### EURe ([0xcB444e90D8198415266c6a2724b7900fb12FC56E](https://gnosisscan.io/address/0xcB444e90D8198415266c6a2724b7900fb12FC56E))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x83506d1B6DC58390Ca52baF0314779c2525BB814](https://gnosisscan.io/address/0x83506d1B6DC58390Ca52baF0314779c2525BB814) | [0x4F29DA9DA689652827b7192B373B3eE71BC2Df2B](https://gnosisscan.io/address/0x4F29DA9DA689652827b7192B373B3eE71BC2Df2B) |
| variableRateSlope1 | 9 % | 7 % |
| baseStableBorrowRate | 10 % | 8 % |
| interestRate | ![before](/.assets/54011ffd1c8f70f6c81bff9e84e73b6caf224f66.svg) | ![after](/.assets/385b5e9c64a504f43d1c1e4b2b81348369fed3e4.svg) |

#### WXDAI ([0xe91D153E0b41518A2Ce8Dd3D7944Fa863463a97d](https://gnosisscan.io/address/0xe91D153E0b41518A2Ce8Dd3D7944Fa863463a97d))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x7b846F0bE2A2c3434b353130B312Dd978514D04d](https://gnosisscan.io/address/0x7b846F0bE2A2c3434b353130B312Dd978514D04d) | [0xD3120200c339f608C394CCF9cBAD4bABab63B5dD](https://gnosisscan.io/address/0xD3120200c339f608C394CCF9cBAD4bABab63B5dD) |
| variableRateSlope1 | 9 % | 7 % |
| baseStableBorrowRate | 10 % | 8 % |
| interestRate | ![before](/.assets/9c6c2ac04f36e8884c02f7bd8e4fedeff98c9211.svg) | ![after](/.assets/91d21e009e84b5163b47bd0dc7395bf2b1847ad4.svg) |

## Raw diff

```json
{
  "reserves": {
    "0xDDAfbb505ad214D7b80b1f830fcCc89B60fb7A83": {
      "interestRateStrategy": {
        "from": "0x7b846F0bE2A2c3434b353130B312Dd978514D04d",
        "to": "0xD3120200c339f608C394CCF9cBAD4bABab63B5dD"
      }
    },
    "0xcB444e90D8198415266c6a2724b7900fb12FC56E": {
      "interestRateStrategy": {
        "from": "0x83506d1B6DC58390Ca52baF0314779c2525BB814",
        "to": "0x4F29DA9DA689652827b7192B373B3eE71BC2Df2B"
      }
    },
    "0xe91D153E0b41518A2Ce8Dd3D7944Fa863463a97d": {
      "interestRateStrategy": {
        "from": "0x7b846F0bE2A2c3434b353130B312Dd978514D04d",
        "to": "0xD3120200c339f608C394CCF9cBAD4bABab63B5dD"
      }
    }
  },
  "strategies": {
    "0xDDAfbb505ad214D7b80b1f830fcCc89B60fb7A83": {
      "address": {
        "from": "0x7b846F0bE2A2c3434b353130B312Dd978514D04d",
        "to": "0xD3120200c339f608C394CCF9cBAD4bABab63B5dD"
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
    "0xcB444e90D8198415266c6a2724b7900fb12FC56E": {
      "address": {
        "from": "0x83506d1B6DC58390Ca52baF0314779c2525BB814",
        "to": "0x4F29DA9DA689652827b7192B373B3eE71BC2Df2B"
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
    "0xe91D153E0b41518A2Ce8Dd3D7944Fa863463a97d": {
      "address": {
        "from": "0x7b846F0bE2A2c3434b353130B312Dd978514D04d",
        "to": "0xD3120200c339f608C394CCF9cBAD4bABab63B5dD"
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