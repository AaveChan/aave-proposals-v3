---
title: "GHO Inclusion into E-Modes on Aave V3 Plasma"
author: "Chaos Labs (implemented by Aavechan Initiative @aci via Skyward)"
discussions: "https://governance.aave.com/t/direct-to-aip-change-of-supply-caps-and-adjustment-of-e-mode-assets-on-aave-v3-07-04-26/24396"
---

## Simple Summary

Chaos Labs proposed the following change to be implemented through AIP:

- Include GHO within the PT asset E-modes on the Plasma Instance

## Specification

Following the listing of the assets, we recommend the addition of GHO as a borrowable asset in the PT-sUSDe-18JUN2026/Stablecoins E-mode and in the PT-USDe-18JUN2026/Stablecoins E-mode.

**PT-sUSDe-18JUN2026/Stablecoins E-mode**

| **Asset**         | GHO |
| ----------------- | --- |
| Collateral        | No  |
| Borrowable        | Yes |
| LTV               | -   |
| LT                | -   |
| Liquidation Bonus | -   |

**PT-USDe-18JUN2026/Stablecoins E-mode**

| **Asset**         | GHO |
| ----------------- | --- |
| Collateral        | No  |
| Borrowable        | Yes |
| LTV               | -   |
| LT                | -   |
| Liquidation Bonus | -   |

## Disclosure

Chaos Labs has not been compensated by any third party for publishing this recommendation.

## References

- Implementation: [AaveV3Plasma](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260410_Multi_ChangeOfSupplyCapsAndEModeAdjustments/AaveV3Plasma_ChangeOfSupplyCapsAndEModeAdjustments_20260410.sol)
- Tests: [AaveV3Plasma](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260410_Multi_ChangeOfSupplyCapsAndEModeAdjustments/AaveV3Plasma_ChangeOfSupplyCapsAndEModeAdjustments_20260410.t.sol)
- Snapshot: Direct-to-AIP
- [Discussion](https://governance.aave.com/t/direct-to-aip-change-of-supply-caps-and-adjustment-of-e-mode-assets-on-aave-v3-07-04-26/24396)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
