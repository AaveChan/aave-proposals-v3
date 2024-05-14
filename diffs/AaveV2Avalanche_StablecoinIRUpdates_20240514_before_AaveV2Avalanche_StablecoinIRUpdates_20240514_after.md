## Reserve changes

### Reserve altered

#### USDC.e ([0xA7D7079b0FEaD91F3e65f86E8915Cb59c1a4C664](https://snowscan.xyz/address/0xA7D7079b0FEaD91F3e65f86E8915Cb59c1a4C664))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0x6b410D0d53Efc7d4cAF23b9df2F38558998A1716](https://snowscan.xyz/address/0x6b410D0d53Efc7d4cAF23b9df2F38558998A1716) | [0x3dED180433c1cb0B0697eD2e85cE598414DaCE58](https://snowscan.xyz/address/0x3dED180433c1cb0B0697eD2e85cE598414DaCE58) |
| variableRateSlope1 | 10 % | 8 % |
| interestRate | ![before](/.assets/2633c80d8197b26e77ccf20e99ba7d7d77c645d7.svg) | ![after](/.assets/5266c26cddecadc29acc5fe12444d1696bfc1570.svg) |

#### USDT.e ([0xc7198437980c041c805A1EDcbA50c1Ce5db95118](https://snowscan.xyz/address/0xc7198437980c041c805A1EDcbA50c1Ce5db95118))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xd814D29bBd27b97d58255632C498c34b25DC72bD](https://snowscan.xyz/address/0xd814D29bBd27b97d58255632C498c34b25DC72bD) | [0xD9Dee878Eb31303FD58D412cE79439400b340A22](https://snowscan.xyz/address/0xD9Dee878Eb31303FD58D412cE79439400b340A22) |
| variableRateSlope1 | 9 % | 7 % |
| interestRate | ![before](/.assets/cefc020957a48e5032cf475e71d8fc065adbfc61.svg) | ![after](/.assets/f47a984b0bc84d6733cdc8087b63a3aea36bf814.svg) |

#### DAI.e ([0xd586E7F844cEa2F87f50152665BCbc2C279D8d70](https://snowscan.xyz/address/0xd586E7F844cEa2F87f50152665BCbc2C279D8d70))

| description | value before | value after |
| --- | --- | --- |
| interestRateStrategy | [0xd814D29bBd27b97d58255632C498c34b25DC72bD](https://snowscan.xyz/address/0xd814D29bBd27b97d58255632C498c34b25DC72bD) | [0xD9Dee878Eb31303FD58D412cE79439400b340A22](https://snowscan.xyz/address/0xD9Dee878Eb31303FD58D412cE79439400b340A22) |
| variableRateSlope1 | 9 % | 7 % |
| interestRate | ![before](/.assets/cefc020957a48e5032cf475e71d8fc065adbfc61.svg) | ![after](/.assets/f47a984b0bc84d6733cdc8087b63a3aea36bf814.svg) |

## Raw diff

```json
{
  "reserves": {
    "0xA7D7079b0FEaD91F3e65f86E8915Cb59c1a4C664": {
      "interestRateStrategy": {
        "from": "0x6b410D0d53Efc7d4cAF23b9df2F38558998A1716",
        "to": "0x3dED180433c1cb0B0697eD2e85cE598414DaCE58"
      }
    },
    "0xc7198437980c041c805A1EDcbA50c1Ce5db95118": {
      "interestRateStrategy": {
        "from": "0xd814D29bBd27b97d58255632C498c34b25DC72bD",
        "to": "0xD9Dee878Eb31303FD58D412cE79439400b340A22"
      }
    },
    "0xd586E7F844cEa2F87f50152665BCbc2C279D8d70": {
      "interestRateStrategy": {
        "from": "0xd814D29bBd27b97d58255632C498c34b25DC72bD",
        "to": "0xD9Dee878Eb31303FD58D412cE79439400b340A22"
      }
    }
  },
  "strategies": {
    "0xA7D7079b0FEaD91F3e65f86E8915Cb59c1a4C664": {
      "address": {
        "from": "0x6b410D0d53Efc7d4cAF23b9df2F38558998A1716",
        "to": "0x3dED180433c1cb0B0697eD2e85cE598414DaCE58"
      },
      "variableRateSlope1": {
        "from": "100000000000000000000000000",
        "to": "80000000000000000000000000"
      }
    },
    "0xc7198437980c041c805A1EDcbA50c1Ce5db95118": {
      "address": {
        "from": "0xd814D29bBd27b97d58255632C498c34b25DC72bD",
        "to": "0xD9Dee878Eb31303FD58D412cE79439400b340A22"
      },
      "variableRateSlope1": {
        "from": "90000000000000000000000000",
        "to": "70000000000000000000000000"
      }
    },
    "0xd586E7F844cEa2F87f50152665BCbc2C279D8d70": {
      "address": {
        "from": "0xd814D29bBd27b97d58255632C498c34b25DC72bD",
        "to": "0xD9Dee878Eb31303FD58D412cE79439400b340A22"
      },
      "variableRateSlope1": {
        "from": "90000000000000000000000000",
        "to": "70000000000000000000000000"
      }
    }
  }
}
```