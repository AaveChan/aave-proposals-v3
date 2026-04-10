## Reserve changes

### Reserves altered

#### PT-srUSDe-25JUN2026 ([0x619D75E3b790eBC21c289f2805Bb7177A7D732E2](https://etherscan.io/address/0x619D75E3b790eBC21c289f2805Bb7177A7D732E2))

| description | value before | value after |
| --- | --- | --- |
| supplyCap | 30,000,000 PT-srUSDe-25JUN2026 | 100,000,000 PT-srUSDe-25JUN2026 |


## Event logs

#### 0x64b761D848206f447Fe2dd461b0c635Ec39EbB27 (AaveV3Ethereum.POOL_CONFIGURATOR)

| index | event |
| --- | --- |
| 0 | SupplyCapChanged(asset: 0x619D75E3b790eBC21c289f2805Bb7177A7D732E2 (symbol: PT-srUSDe-25JUN2026), oldSupplyCap: 30000000, newSupplyCap: 100000000) |

#### 0x5300A1a15135EA4dc7aD5a167152C01EFc9b192A (AaveV2Ethereum.POOL_ADMIN, AaveV2EthereumAMM.POOL_ADMIN, AaveV3Ethereum.ACL_ADMIN, AaveV3EthereumEtherFi.ACL_ADMIN, AaveV3EthereumHorizon.ACL_ADMIN, AaveV3EthereumLido.ACL_ADMIN, GovernanceV3Ethereum.EXECUTOR_LVL_1)

| index | event |
| --- | --- |
| 1 | ExecutedAction(target: 0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f, value: 0, signature: execute(), data: 0x, executionTime: 1775806919, withDelegatecall: true, resultData: 0x) |

#### 0xdAbad81aF85554E9ae636395611C58F7eC1aAEc5 (GovernanceV3Ethereum.PAYLOADS_CONTROLLER)

| index | event |
| --- | --- |
| 2 | PayloadExecuted(payloadId: 427) |

## Raw storage changes

### 0x87870bca3f3fd6335c3f4ce8392d69350b4fa4e2 (AaveV3Ethereum.POOL)

| slot | previous value | new value |
| --- | --- | --- |
| 0x66c867f65b965475b8c0187fe9caa2b05fc7208239d95583f8fee6a54e923846 | 0x100000000000000000000003e8001c9c38000000000111948112000000000000 | 0x100000000000000000000003e8005f5e10000000000111948112000000000000 |

### 0xdabad81af85554e9ae636395611c58f7ec1aaec5 (GovernanceV3Ethereum.PAYLOADS_CONTROLLER)

| slot | previous value | new value |
| --- | --- | --- |
| 0x99334b505fe371b927d043d4d49ba0173d80ed1acda424ff8a00a9a17fc2bbbd | 0x0069d8a9c6000000000002000000000000000000000000000000000000000000 | 0x0069d8a9c6000000000003000000000000000000000000000000000000000000 |
| 0x99334b505fe371b927d043d4d49ba0173d80ed1acda424ff8a00a9a17fc2bbbe | 0x000000000000000000093a800000000000006a06ce4700000000000000000000 | 0x000000000000000000093a800000000000006a06ce4700000000000069d8a9c7 |


## Raw diff

```json
{
  "reserves": {
    "0x619D75E3b790eBC21c289f2805Bb7177A7D732E2": {
      "supplyCap": {
        "from": 30000000,
        "to": 100000000
      }
    }
  }
}
```
