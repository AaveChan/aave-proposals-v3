---
title: "Onboard FRAX to Aave V3 Lido Instance"
author: "Aave Chan Initiative"
discussions: "https://governance.aave.com/t/arfc-onboard-frax-to-aave-v3-lido-instance/19300"
snapshot: "https://snapshot.org/#/aave.eth/proposal/0x4ee3ae8c9046a2b50eb1fcaa5266b86786923635d143dd5ed9e4acb898ec5fe5"
---

## Simple Summary

## Motivation

## Specification

The table below illustrates the configured risk parameters for **FRAX**

| Parameter                 |                                      Value |
| ------------------------- | -----------------------------------------: |
| Isolation Mode            |                                      false |
| Borrowable                |                                    ENABLED |
| Collateral Enabled        |                                       true |
| Supply Cap (FRAX)         |                                 20,000,000 |
| Borrow Cap (FRAX)         |                                 18,000,000 |
| Debt Ceiling              |                                      USD 0 |
| LTV                       |                                        0 % |
| LT                        |                                        0 % |
| Liquidation Bonus         |                                        0 % |
| Liquidation Protocol Fee  |                                        0 % |
| Reserve Factor            |                                       20 % |
| Base Variable Borrow Rate |                                        0 % |
| Variable Slope 1          |                                      5.5 % |
| Variable Slope 2          |                                       75 % |
| Uoptimal                  |                                       90 % |
| Flashloanable             |                                    ENABLED |
| Siloed Borrowing          |                                   DISABLED |
| Borrowable in Isolation   |                                   DISABLED |
| Oracle                    | 0x45D270263BBee500CF8adcf2AbC0aC227097b036 |

Additionaly [0xac140648435d03f784879cd789130F22Ef588Fcd](https://etherscan.io/address/0xac140648435d03f784879cd789130F22Ef588Fcd) has been set as the emission admin for FRAX and the corresponding aToken.

## References

- Implementation: [AaveV3EthereumLido](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20241009_AaveV3EthereumLido_OnboardFRAXToAaveV3LidoInstance/AaveV3EthereumLido_OnboardFRAXToAaveV3LidoInstance_20241009.sol)
- Tests: [AaveV3EthereumLido](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20241009_AaveV3EthereumLido_OnboardFRAXToAaveV3LidoInstance/AaveV3EthereumLido_OnboardFRAXToAaveV3LidoInstance_20241009.t.sol)
- [Snapshot](https://snapshot.org/#/aave.eth/proposal/0x4ee3ae8c9046a2b50eb1fcaa5266b86786923635d143dd5ed9e4acb898ec5fe5)
- [Discussion](https://governance.aave.com/t/arfc-onboard-frax-to-aave-v3-lido-instance/19300)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
