---
title: "Onboard syrupUSDC to Aave V3 Core Instance"
author: "Aavechan Initiative @aci"
discussions: "https://governance.aave.com/t/arfc-onboard-syrupusdc-to-aave-v3-core-instance/22456"
snapshot: "https://snapshot.org/#/s:aavedao.eth/proposal/0xf5951af5d6d7d70be998a72c531708db3ff9c46b033e3e27bfd59fb87542d0ea"
---

## Simple Summary

## Motivation

## Specification

The table below illustrates the configured risk parameters for **syrupUSDC**

| Parameter                 |                                      Value |
| ------------------------- | -----------------------------------------: |
| Isolation Mode            |                                      false |
| Borrowable                |                                   DISABLED |
| Collateral Enabled        |                                       true |
| Supply Cap (syrupUSDC)    |                                200,000,000 |
| Borrow Cap (syrupUSDC)    |                                          1 |
| Debt Ceiling              |                                      USD 0 |
| LTV                       |                                        0 % |
| LT                        |                                        0 % |
| Liquidation Bonus         |                                        0 % |
| Liquidation Protocol Fee  |                                       10 % |
| Reserve Factor            |                                       50 % |
| Base Variable Borrow Rate |                                        0 % |
| Variable Slope 1          |                                       10 % |
| Variable Slope 2          |                                      300 % |
| Uoptimal                  |                                       45 % |
| Flashloanable             |                                    ENABLED |
| Siloed Borrowing          |                                   DISABLED |
| Borrowable in Isolation   |                                   DISABLED |
| Oracle                    | 0xe4e9d021d3a44e8bc9949690e298c6b41c6ef354 |

Additionally [0xac140648435d03f784879cd789130F22Ef588Fcd](https://etherscan.io/address/0xac140648435d03f784879cd789130F22Ef588Fcd) has been set as the emission admin for syrupUSDC and the corresponding aToken, vToken and underlying token.

## References

- Implementation: [AaveV3Ethereum](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260421_AaveV3Ethereum_OnboardSyrupUSDCToAaveV3CoreInstance/AaveV3Ethereum_OnboardSyrupUSDCToAaveV3CoreInstance_20260421.sol)
- Tests: [AaveV3Ethereum](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260421_AaveV3Ethereum_OnboardSyrupUSDCToAaveV3CoreInstance/AaveV3Ethereum_OnboardSyrupUSDCToAaveV3CoreInstance_20260421.t.sol)
- [Snapshot](https://snapshot.org/#/s:aavedao.eth/proposal/0xf5951af5d6d7d70be998a72c531708db3ff9c46b033e3e27bfd59fb87542d0ea)
- [Discussion](https://governance.aave.com/t/arfc-onboard-syrupusdc-to-aave-v3-core-instance/22456)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
