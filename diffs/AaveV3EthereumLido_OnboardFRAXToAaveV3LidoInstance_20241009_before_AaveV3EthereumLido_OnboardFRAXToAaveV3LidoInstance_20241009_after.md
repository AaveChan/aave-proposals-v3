## Reserve changes

### Reserves added

#### FRAX ([0x853d955aCEf822Db058eb8505911ED77F175b99e](https://etherscan.io/address/0x853d955aCEf822Db058eb8505911ED77F175b99e))

| description | value |
| --- | --- |
| decimals | 18 |
| isActive | true |
| isFrozen | false |
| supplyCap | 20,000,000 FRAX |
| borrowCap | 18,000,000 FRAX |
| debtCeiling | 0 $ [0] |
| isSiloed | false |
| isFlashloanable | true |
| oracle | [0x45D270263BBee500CF8adcf2AbC0aC227097b036](https://etherscan.io/address/0x45D270263BBee500CF8adcf2AbC0aC227097b036) |
| oracleDecimals | 8 |
| oracleDescription | Capped FRAX/USD |
| oracleLatestAnswer | 0.99709762 |
| usageAsCollateralEnabled | false |
| ltv | 0 % [0] |
| liquidationThreshold | 0 % [0] |
| liquidationBonus | 0 % |
| liquidationProtocolFee | 0 % [0] |
| reserveFactor | 20 % [2000] |
| aToken | [0x74e5664394998f13B07aF42446380ACef637969f](https://etherscan.io/address/0x74e5664394998f13B07aF42446380ACef637969f) |
| aTokenImpl | [0x7F8Fc14D462bdF93c681c1f2Fd615389bF969Fb2](https://etherscan.io/address/0x7F8Fc14D462bdF93c681c1f2Fd615389bF969Fb2) |
| variableDebtToken | [0x08e1bba76D27841dD91FAb4b3a636A0D5CF8c3E9](https://etherscan.io/address/0x08e1bba76D27841dD91FAb4b3a636A0D5CF8c3E9) |
| variableDebtTokenImpl | [0x3E59212c34588a63350142EFad594a20C88C2CEd](https://etherscan.io/address/0x3E59212c34588a63350142EFad594a20C88C2CEd) |
| borrowingEnabled | true |
| isBorrowableInIsolation | false |
| interestRateStrategy | [0x8958b1C39269167527821f8c276Ef7504883f2fa](https://etherscan.io/address/0x8958b1C39269167527821f8c276Ef7504883f2fa) |
| aTokenName | Aave Ethereum Lido FRAX |
| aTokenSymbol | aEthLidoFRAX |
| aTokenUnderlyingBalance | 0 FRAX [0] |
| id | 4 |
| isPaused | false |
| variableDebtTokenName | Aave Ethereum Lido Variable Debt FRAX |
| variableDebtTokenSymbol | variableDebtEthLidoFRAX |
| virtualAccountingActive | true |
| virtualBalance | 0 FRAX [0] |
| optimalUsageRatio | 90 % |
| maxVariableBorrowRate | 80.5 % |
| baseVariableBorrowRate | 0 % |
| variableRateSlope1 | 5.5 % |
| variableRateSlope2 | 75 % |
| interestRate | ![ir](/.assets/68f0c3f131505d467299c6d2d0361ad88296a642.svg) |


## Emodes changes

## Raw diff

```json
{
  "reserves": {
    "0x853d955aCEf822Db058eb8505911ED77F175b99e": {
      "from": null,
      "to": {
        "aToken": "0x74e5664394998f13B07aF42446380ACef637969f",
        "aTokenImpl": "0x7F8Fc14D462bdF93c681c1f2Fd615389bF969Fb2",
        "aTokenName": "Aave Ethereum Lido FRAX",
        "aTokenSymbol": "aEthLidoFRAX",
        "aTokenUnderlyingBalance": "0",
        "borrowCap": 18000000,
        "borrowingEnabled": true,
        "debtCeiling": 0,
        "decimals": 18,
        "id": 4,
        "interestRateStrategy": "0x8958b1C39269167527821f8c276Ef7504883f2fa",
        "isActive": true,
        "isBorrowableInIsolation": false,
        "isFlashloanable": true,
        "isFrozen": false,
        "isPaused": false,
        "isSiloed": false,
        "liquidationBonus": 0,
        "liquidationProtocolFee": 0,
        "liquidationThreshold": 0,
        "ltv": 0,
        "oracle": "0x45D270263BBee500CF8adcf2AbC0aC227097b036",
        "oracleDecimals": 8,
        "oracleDescription": "Capped FRAX/USD",
        "oracleLatestAnswer": "99709762",
        "reserveFactor": 2000,
        "supplyCap": 20000000,
        "symbol": "FRAX",
        "underlying": "0x853d955aCEf822Db058eb8505911ED77F175b99e",
        "usageAsCollateralEnabled": false,
        "variableDebtToken": "0x08e1bba76D27841dD91FAb4b3a636A0D5CF8c3E9",
        "variableDebtTokenImpl": "0x3E59212c34588a63350142EFad594a20C88C2CEd",
        "variableDebtTokenName": "Aave Ethereum Lido Variable Debt FRAX",
        "variableDebtTokenSymbol": "variableDebtEthLidoFRAX",
        "virtualAccountingActive": true,
        "virtualBalance": "0"
      }
    }
  },
  "strategies": {
    "0x853d955aCEf822Db058eb8505911ED77F175b99e": {
      "from": null,
      "to": {
        "address": "0x8958b1C39269167527821f8c276Ef7504883f2fa",
        "baseVariableBorrowRate": "0",
        "maxVariableBorrowRate": "805000000000000000000000000",
        "optimalUsageRatio": "900000000000000000000000000",
        "variableRateSlope1": "55000000000000000000000000",
        "variableRateSlope2": "750000000000000000000000000"
      }
    }
  }
}
```