---
title: "Onboard eUSDe to Aave v3 Core Instance"
author: "Aave-Chan Initiative"
discussions: "https://governance.aave.com/t/arfc-onboard-eusde-to-aave-v3-core-instance/21766"
snapshot: "https://snapshot.box/#/s:aavedao.eth/proposal/0xc1e93b8d3c8bd2530ba13ef01a6d83b9eed4f9fbff22e5aeb3bf92641baa0d0a"
---

## Simple Summary

## Motivation

## Specification

The table below illustrates the configured risk parameters for **eUSDe**

| Parameter                 |                                      Value |
| ------------------------- | -----------------------------------------: |
| Isolation Mode            |                                      false |
| Borrowable                |                                   DISABLED |
| Collateral Enabled        |                                       true |
| Supply Cap (eUSDe)        |                                150,000,000 |
| Borrow Cap (eUSDe)        |                                          1 |
| Debt Ceiling              |                                      USD 0 |
| LTV                       |                                     0.05 % |
| LT                        |                                      0.1 % |
| Liquidation Bonus         |                                      7.5 % |
| Liquidation Protocol Fee  |                                       10 % |
| Reserve Factor            |                                       45 % |
| Base Variable Borrow Rate |                                        0 % |
| Variable Slope 1          |                                       10 % |
| Variable Slope 2          |                                      300 % |
| Uoptimal                  |                                       45 % |
| Flashloanable             |                                    ENABLED |
| Siloed Borrowing          |                                   DISABLED |
| Borrowable in Isolation   |                                   DISABLED |
| Oracle                    | 0xc7Ad695ac0ae38Ae308640897E51468977A862a2 |

Additionally [0xac140648435d03f784879cd789130F22Ef588Fcd](https://etherscan.io/address/0xac140648435d03f784879cd789130F22Ef588Fcd) has been set as the emission admin for eUSDe and the corresponding aToken.

## References

- Implementation: [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20250501_AaveV3Ethereum_OnboardEUSDeToAaveV3CoreInstance/AaveV3Ethereum_OnboardEUSDeToAaveV3CoreInstance_20250501.sol)
- Tests: [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20250501_AaveV3Ethereum_OnboardEUSDeToAaveV3CoreInstance/AaveV3Ethereum_OnboardEUSDeToAaveV3CoreInstance_20250501.t.sol)
- [Snapshot](https://snapshot.box/#/s:aavedao.eth/proposal/0xc1e93b8d3c8bd2530ba13ef01a6d83b9eed4f9fbff22e5aeb3bf92641baa0d0a)
- [Discussion](https://governance.aave.com/t/arfc-onboard-eusde-to-aave-v3-core-instance/21766)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
