---
title: "Listing PT Ethena 18JUN2026"
author: "Aave Chan Initiative @aci"
discussions: "https://governance.aave.com/t/direct-to-aip-onboard-usde-susde-june-expiry-pt-tokens-on-aave-v3-plasma-instance/24304"
---

## Simple Summary

This AIP proposes to onboard USDe and sUSDe June expiry PT tokens on Aave V3 Plasma Instance.

## Motivation

The previous USDe and sUSDe PT tokens that were onboarded have brought significant inflows to Aave, in preparation for the expiry and rollover we propose to onboard the next expiry of this PT token. We expect at a minimum that deposits will match those in the current expiry PT token, with potentially some sidelined demand.

## Specification

**PT sUSDe 18 Jun 2026:**

https://plasmascan.to/address/0x30559e3d35e33ab69399a3fe9f383d32bd3c016e

**PT USDe 18 Jun 2026:**

https://plasmascan.to/address/0x23b17d3944742ace3d0c71586fcb320d1e4a1ed2

### PT-USDe-18JUN2026

**Initial E-mode Risk Oracle**

| **Parameter** | **Value**   | **Value** |
| ------------- | ----------- | --------- |
| E-Mode        | Stablecoins | USDe      |
| LTV           | 91%         | 93%       |
| LT            | 93%         | 95%       |
| LB            | 3.1%        | 2.1%      |

**Linear Discount Rate Oracle**

| **Parameter**            | **Value**                                                                                                                                  |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------ |
| Oracle                   | [PT Capped USDe USDT/USD linear discount 18JUN2026](https://plasmascan.to/address/0x0521d52A7eA98A8B737D367F81975019360e444f#readContract) |
| discountRatePerYear      | 2.952%                                                                                                                                     |
| maxDiscountRatePerYear   | 13.5693%                                                                                                                                   |
| Last answer (March 24th) | 99279807 ($0.99279807)                                                                                                                     |
| USDT/USD Oracle          | [Capped USDT/USD](https://plasmascan.to/address/0xdBbB0b5DD13E7AC9C56624834ef193df87b022c3#readContract)                                   |

**PT-USDe Stablecoins E-mode**

| **Asset**         | **PT-USDe-18JUN2026**  | **PT-USDe-9APR2026**   | **USDe**               | **USDT0** |
| ----------------- | ---------------------- | ---------------------- | ---------------------- | --------- |
| Collateral        | Yes                    | Yes                    | Yes                    | No        |
| Borrowable        | No                     | No                     | Yes                    | Yes       |
| LTV               | Subject to Risk Oracle | Subject to Risk Oracle | Subject to Risk Oracle | -         |
| LT                | Subject to Risk Oracle | Subject to Risk Oracle | Subject to Risk Oracle | -         |
| Liquidation Bonus | Subject to Risk Oracle | Subject to Risk Oracle | Subject to Risk Oracle | -         |

**PT-USDe USDe E-mode**

| **Asset**         | **PT-USDe-18JUN2026**  | **PT-USDe-9APR2026**   | **USDe**               |
| ----------------- | ---------------------- | ---------------------- | ---------------------- |
| Collateral        | Yes                    | Yes                    | Yes                    |
| Borrowable        | No                     | No                     | Yes                    |
| LTV               | Subject to Risk Oracle | Subject to Risk Oracle | Subject to Risk Oracle |
| LT                | Subject to Risk Oracle | Subject to Risk Oracle | Subject to Risk Oracle |
| Liquidation Bonus | Subject to Risk Oracle | Subject to Risk Oracle | Subject to Risk Oracle |

### PT-sUSDe-18JUN2026

**Initial E-mode Risk Oracle**

| **Parameter** | **Value**   | **Value** |
| ------------- | ----------- | --------- |
| E-Mode        | Stablecoins | USDe      |
| LTV           | 90%         | 91.9%     |
| LT            | 92%         | 93.9%     |
| LB            | 4.1%        | 3.1%      |

**Linear Discount Rate Oracle**

| **Parameter**                 | **Value**                                                                                                                                   |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| Oracle                        | [PT Capped sUSDe USDT/USD linear discount 18JUN2026](https://plasmascan.to/address/0x02d8bf797271e6e0ab65a6d235b93d6e673c055b#readContract) |
| discountRatePerYear (Initial) | 3.9617%                                                                                                                                     |
| maxDiscountRatePerYear        | 14.4575%                                                                                                                                    |
| Last answer (March 24th)      | 99043771 ($0.99043771)                                                                                                                      |
| USDT/USD Oracle               | [Capped USDT/USD](https://plasmascan.to/address/0xdBbB0b5DD13E7AC9C56624834ef193df87b022c3#readContract)                                    |

**PT-sUSDe Stablecoins E-mode**

| **Asset**         | **PT-sUSDe-18JUN2026** | **PT-sUSDe-9APR2026**  | **sUSDe**              | **USDT0** | **USDe** |
| ----------------- | ---------------------- | ---------------------- | ---------------------- | --------- | -------- |
| Collateral        | Yes                    | Yes                    | Yes                    | No        | No       |
| Borrowable        | No                     | No                     | No                     | Yes       | Yes      |
| LTV               | Subject to Risk Oracle | Subject to Risk Oracle | Subject to Risk Oracle | -         | -        |
| LT                | Subject to Risk Oracle | Subject to Risk Oracle | Subject to Risk Oracle | -         | -        |
| Liquidation Bonus | Subject to Risk Oracle | Subject to Risk Oracle | Subject to Risk Oracle | -         | -        |

**PT-sUSDe USDe E-mode**

| **Asset**         | **PT-sUSDe-18JUN2026** | **PT-sUSDe-9APR2026**  | **sUSDe**              | **USDe** |
| ----------------- | ---------------------- | ---------------------- | ---------------------- | -------- |
| Collateral        | Yes                    | Yes                    | Yes                    | No       |
| Borrowable        | No                     | No                     | No                     | Yes      |
| LTV               | Subject to Risk Oracle | Subject to Risk Oracle | Subject to Risk Oracle | -        |
| LT                | Subject to Risk Oracle | Subject to Risk Oracle | Subject to Risk Oracle | -        |
| Liquidation Bonus | Subject to Risk Oracle | Subject to Risk Oracle | Subject to Risk Oracle | -        |

The table below illustrates the configured risk parameters for **PT_USDe_18JUN2026**

| Parameter                      |                                      Value |
| ------------------------------ | -----------------------------------------: |
| Isolation Mode                 |                                      false |
| Borrowable                     |                                   DISABLED |
| Collateral Enabled             |                                      false |
| Supply Cap (PT_USDe_18JUN2026) |                                 30,000,000 |
| Borrow Cap (PT_USDe_18JUN2026) |                                          1 |
| Debt Ceiling                   |                                      USD 0 |
| LTV                            |                                        0 % |
| LT                             |                                        0 % |
| Liquidation Bonus              |                                        0 % |
| Liquidation Protocol Fee       |                                       10 % |
| Reserve Factor                 |                                       45 % |
| Base Variable Borrow Rate      |                                        0 % |
| Variable Slope 1               |                                       10 % |
| Variable Slope 2               |                                      300 % |
| Uoptimal                       |                                       45 % |
| Flashloanable                  |                                    ENABLED |
| Siloed Borrowing               |                                   DISABLED |
| Borrowable in Isolation        |                                   DISABLED |
| Oracle                         | 0x0521d52A7eA98A8B737D367F81975019360e444f |

Additionally [0xac140648435d03f784879cd789130F22Ef588Fcd](https://plasmascan.to/address/0xac140648435d03f784879cd789130F22Ef588Fcd) has been set as the emission admin for PT_USDe_18JUN2026 and the corresponding aToken.

The table below illustrates the configured risk parameters for **PT_sUSDE_18JUN2026**

| Parameter                       |                                      Value |
| ------------------------------- | -----------------------------------------: |
| Isolation Mode                  |                                      false |
| Borrowable                      |                                   DISABLED |
| Collateral Enabled              |                                      false |
| Supply Cap (PT_sUSDE_18JUN2026) |                                150,000,000 |
| Borrow Cap (PT_sUSDE_18JUN2026) |                                          1 |
| Debt Ceiling                    |                                      USD 0 |
| LTV                             |                                        0 % |
| LT                              |                                        0 % |
| Liquidation Bonus               |                                        0 % |
| Liquidation Protocol Fee        |                                       10 % |
| Reserve Factor                  |                                       45 % |
| Base Variable Borrow Rate       |                                        0 % |
| Variable Slope 1                |                                       10 % |
| Variable Slope 2                |                                      300 % |
| Uoptimal                        |                                       45 % |
| Flashloanable                   |                                    ENABLED |
| Siloed Borrowing                |                                   DISABLED |
| Borrowable in Isolation         |                                   DISABLED |
| Oracle                          | 0x02d8BF797271E6e0AB65A6D235B93d6e673C055B |

Additionally [0xac140648435d03f784879cd789130F22Ef588Fcd](https://plasmascan.to/address/0xac140648435d03f784879cd789130F22Ef588Fcd) has been set as the emission admin for PT_sUSDE_18JUN2026 and the corresponding aToken.

## Disclaimer

ACI is not directly affiliated with Pendle and did not receive compensation for the creation of this proposal. Some ACI employees may hold Pendle tokens.

## References

- Implementation: [AaveV3Plasma](https://github.com/aave-dao/aave-proposals-v3/blob/36c3a3661eadc0cf7dfa0b906218198cc0603bc2/src/20260324_AaveV3Plasma_ListingPTEthena18JUN2026/AaveV3Plasma_ListingPTEthena18JUN2026_20260324.sol)
- Tests: [AaveV3Plasma](https://github.com/aave-dao/aave-proposals-v3/blob/36c3a3661eadc0cf7dfa0b906218198cc0603bc2/src/20260324_AaveV3Plasma_ListingPTEthena18JUN2026/AaveV3Plasma_ListingPTEthena18JUN2026_20260324.t.sol)
- Snapshot: Direct-to-AIP
- [Discussion](https://governance.aave.com/t/direct-to-aip-onboard-usde-susde-june-expiry-pt-tokens-on-aave-v3-plasma-instance/24304)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
