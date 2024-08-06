## Reserve changes

### Reserves added

#### sFRAX ([0xA663B02CF0a4b149d2aD41910CB81e23e1c41c32](https://etherscan.io/address/0xA663B02CF0a4b149d2aD41910CB81e23e1c41c32))

| description | value |
| --- | --- |
| decimals | 18 |
| isActive | true |
| isFrozen | false |
| supplyCap | 10,000,000 sFRAX |
| borrowCap | 0 sFRAX |
| debtCeiling | 0 $ [0] |
| isSiloed | false |
| isFlashloanable | false |
| eModeCategory | 0 |
| oracle | [0xB9E1E3A9feFf48998E45Fa90847ed4D467E8BcfD](https://etherscan.io/address/0xB9E1E3A9feFf48998E45Fa90847ed4D467E8BcfD) |
| oracleDecimals | 8 |
| oracleDescription | FRAX / USD |
| oracleLatestAnswer | 0.99695575 |
| usageAsCollateralEnabled | true |
| ltv | 70 % [7000] |
| liquidationThreshold | 75 % [7500] |
| liquidationBonus | 6 % |
| liquidationProtocolFee | 20 % [2000] |
| reserveFactor | 20 % [2000] |
| aToken | [0x10Ac93971cdb1F5c778144084242374473c350Da](https://etherscan.io/address/0x10Ac93971cdb1F5c778144084242374473c350Da) |
| aTokenImpl | [0x7EfFD7b47Bfd17e52fB7559d3f924201b9DbfF3d](https://etherscan.io/address/0x7EfFD7b47Bfd17e52fB7559d3f924201b9DbfF3d) |
| variableDebtToken | [0xAC50890a80A2731eb1eA2e9B4F29569CeB06D960](https://etherscan.io/address/0xAC50890a80A2731eb1eA2e9B4F29569CeB06D960) |
| variableDebtTokenImpl | [0xaC725CB59D16C81061BDeA61041a8A5e73DA9EC6](https://etherscan.io/address/0xaC725CB59D16C81061BDeA61041a8A5e73DA9EC6) |
| stableDebtToken | [0xCcf8413F9cA3bAE07EEF05E265D238d60abCb8Ca](https://etherscan.io/address/0xCcf8413F9cA3bAE07EEF05E265D238d60abCb8Ca) |
| stableDebtTokenImpl | [0x15C5620dfFaC7c7366EED66C20Ad222DDbB1eD57](https://etherscan.io/address/0x15C5620dfFaC7c7366EED66C20Ad222DDbB1eD57) |
| borrowingEnabled | false |
| stableBorrowRateEnabled | false |
| isBorrowableInIsolation | false |
| interestRateStrategy | [0x847A3364Cc5fE389283bD821cfC8A477288D9e82](https://etherscan.io/address/0x847A3364Cc5fE389283bD821cfC8A477288D9e82) |
| aTokenName | Aave Ethereum sFRAX |
| aTokenSymbol | aEthsFRAX |
| aTokenUnderlyingBalance | 10 sFRAX [10000000000000000000] |
| isPaused | false |
| stableDebtTokenName | Aave Ethereum Stable Debt sFRAX |
| stableDebtTokenSymbol | stableDebtEthsFRAX |
| variableDebtTokenName | Aave Ethereum Variable Debt sFRAX |
| variableDebtTokenSymbol | variableDebtEthsFRAX |
| virtualAccountingActive | true |
| virtualBalance | 10 sFRAX [10000000000000000000] |
| optimalUsageRatio | 80 % |
| maxVariableBorrowRate | 0 % |
| baseVariableBorrowRate | 0 % |
| variableRateSlope1 | 0 % |
| variableRateSlope2 | 0 % |
| interestRate | ![ir](/.assets/eaeda497300979f84cde6afbe2d89e04bc454a72.svg) |


### Reserves altered

#### FRAX ([0x853d955aCEf822Db058eb8505911ED77F175b99e](https://etherscan.io/address/0x853d955aCEf822Db058eb8505911ED77F175b99e))

| description | value before | value after |
| --- | --- | --- |
| supplyCap | 15,000,000 FRAX | 338,000,000 FRAX |
| borrowCap | 12,000,000 FRAX | 271,000,000 FRAX |
| debtCeiling | 10,000,000 $ [1000000000] | 0 $ [0] |
| ltv | 0 % [0] | 63 % [6300] |
| liquidationThreshold | 72 % [7200] | 77 % [7700] |
| liquidationBonus | 6 % | 5 % |
| reserveFactor | 20 % [2000] | 15 % [1500] |
| optimalUsageRatio | 90 % | 92 % |
| interestRate | ![before](/.assets/63ce7a55ac04d754c31aada64a733b5a0ecd6dd5.svg) | ![after](/.assets/e3cd41bda67a1fc3ece7a4100d0a7455722f244a.svg) |

## Raw diff

```json
{
  "reserves": {
    "0x853d955aCEf822Db058eb8505911ED77F175b99e": {
      "borrowCap": {
        "from": 12000000,
        "to": 271000000
      },
      "debtCeiling": {
        "from": 1000000000,
        "to": 0
      },
      "liquidationBonus": {
        "from": 10600,
        "to": 10500
      },
      "liquidationThreshold": {
        "from": 7200,
        "to": 7700
      },
      "ltv": {
        "from": 0,
        "to": 6300
      },
      "reserveFactor": {
        "from": 2000,
        "to": 1500
      },
      "supplyCap": {
        "from": 15000000,
        "to": 338000000
      }
    },
    "0xA663B02CF0a4b149d2aD41910CB81e23e1c41c32": {
      "from": null,
      "to": {
        "aToken": "0x10Ac93971cdb1F5c778144084242374473c350Da",
        "aTokenImpl": "0x7EfFD7b47Bfd17e52fB7559d3f924201b9DbfF3d",
        "aTokenName": "Aave Ethereum sFRAX",
        "aTokenSymbol": "aEthsFRAX",
        "aTokenUnderlyingBalance": "10000000000000000000",
        "borrowCap": 0,
        "borrowingEnabled": false,
        "debtCeiling": 0,
        "decimals": 18,
        "eModeCategory": 0,
        "interestRateStrategy": "0x847A3364Cc5fE389283bD821cfC8A477288D9e82",
        "isActive": true,
        "isBorrowableInIsolation": false,
        "isFlashloanable": false,
        "isFrozen": false,
        "isPaused": false,
        "isSiloed": false,
        "liquidationBonus": 10600,
        "liquidationProtocolFee": 2000,
        "liquidationThreshold": 7500,
        "ltv": 7000,
        "oracle": "0xB9E1E3A9feFf48998E45Fa90847ed4D467E8BcfD",
        "oracleDecimals": 8,
        "oracleDescription": "FRAX / USD",
        "oracleLatestAnswer": 99695575,
        "reserveFactor": 2000,
        "stableBorrowRateEnabled": false,
        "stableDebtToken": "0xCcf8413F9cA3bAE07EEF05E265D238d60abCb8Ca",
        "stableDebtTokenImpl": "0x15C5620dfFaC7c7366EED66C20Ad222DDbB1eD57",
        "stableDebtTokenName": "Aave Ethereum Stable Debt sFRAX",
        "stableDebtTokenSymbol": "stableDebtEthsFRAX",
        "supplyCap": 10000000,
        "symbol": "sFRAX",
        "underlying": "0xA663B02CF0a4b149d2aD41910CB81e23e1c41c32",
        "usageAsCollateralEnabled": true,
        "variableDebtToken": "0xAC50890a80A2731eb1eA2e9B4F29569CeB06D960",
        "variableDebtTokenImpl": "0xaC725CB59D16C81061BDeA61041a8A5e73DA9EC6",
        "variableDebtTokenName": "Aave Ethereum Variable Debt sFRAX",
        "variableDebtTokenSymbol": "variableDebtEthsFRAX",
        "virtualAccountingActive": true,
        "virtualBalance": "10000000000000000000"
      }
    }
  },
  "strategies": {
    "0x853d955aCEf822Db058eb8505911ED77F175b99e": {
      "optimalUsageRatio": {
        "from": "900000000000000000000000000",
        "to": "920000000000000000000000000"
      }
    },
    "0xA663B02CF0a4b149d2aD41910CB81e23e1c41c32": {
      "from": null,
      "to": {
        "address": "0x847A3364Cc5fE389283bD821cfC8A477288D9e82",
        "baseVariableBorrowRate": "0",
        "maxVariableBorrowRate": "0",
        "optimalUsageRatio": "800000000000000000000000000",
        "variableRateSlope1": "0",
        "variableRateSlope2": "0"
      }
    }
  }
}
```