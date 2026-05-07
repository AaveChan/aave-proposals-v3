---
title: "Aave V3 Mantle – Collateral Enablement, eMode Expansion, and Isolation Updates"
author: "Aavechan Initiative @aci"
discussions: "https://governance.aave.com/t/direct-to-aip-aave-v3-mantle-collateral-enablement-emode-expansion-and-isolation-updates-usdt0-usde-eth-xaut/24153"
---

## Simple Summary

This AIP proposes to implement the following configuration updates on Aave V3 Mantle Instance:

- Remove ETH from Isolation Mode
- Create a dedicated ETH-Stable eMode category with:
  - ETH as collateral
  - USDT0, USDC, and GHO as borrowable assets
- Add XAUT as standard (non-isolated) collateral
- Create a dedicated XAUT-Stable eMode category with:
  - XAUT as collateral
  - USDT0, USDC, and GHO as borrowable assets

## Motivation

These updates aim to improve capital efficiency, stablecoin peg arbitrage functionality, and market-making capabilities on Mantle.

Enabling USDT0 as collateral and expanding eMode Category 2 to include USDT0 bas collateral and USDe as debt enhances:

- Stablecoin-to-stablecoin arbitrage
- Market-making depth
- Borrow utilization and protocol revenue

**Subject to Risk validation:**

- Removing ETH from Isolation Mode increases composability and borrowing flexibility.
- Adding XAUT as standard collateral diversifies collateral types with a gold-backed asset.
- Creating a dedicated XAUT-Stable eMode improves capital efficiency for gold-backed liquidity strategies while containing risk within a clearly segmented category.

These changes align with Aave’s objective of improving risk segmentation, capital efficiency, and revenue generation across deployments while remaining fully subject to Risk Service Provider approval.

## Specification

### New listing

The table below illustrates the configured risk parameters for **XAUt**

| Parameter                 |    Value |
| ------------------------- | -------: |
| Isolation Mode            |    false |
| Borrowable                | DISABLED |
| Collateral Enabled        |     true |
| Supply Cap (XAUt)         |    4,000 |
| Borrow Cap (XAUt)         |        1 |
| Debt Ceiling              |    USD 0 |
| LTV                       |      0 % |
| LT                        |      0 % |
| Liquidation Bonus         |      0 % |
| Liquidation Protocol Fee  |     10 % |
| Reserve Factor            |     50 % |
| Base Variable Borrow Rate |      0 % |
| Variable Slope 1          |     10 % |
| Variable Slope 2          |    300 % |
| Uoptimal                  |     90 % |
| Flashloanable             |  ENABLED |
| Siloed Borrowing          | DISABLED |
| Borrowable in Isolation   | DISABLED |

#### Oracle :TODO

Additionally [0xac140648435d03f784879cd789130F22Ef588Fcd](https://mantlescan.xyz/address/0xac140648435d03f784879cd789130F22Ef588Fcd) has been set as the emission admin for XAUt and the corresponding aToken.

### Caps update

| Asset | Parameter  | Old Value | New Value |
| ----- | ---------- | --------- | --------- |
| WMNT  | Suppky Cap | 1.9M      | 5M        |

### Interest Rate update

| Asset | Parameter | Old Value | New Value |
| ----- | --------- | --------- | --------- |
| WETH  | Slope1    | 1.5%      | 2.5%      |
| WETH  | Slope2    | 1.5%      | 8.0%      |

### Isolation mode

The followings assets will be removed from isolation mode and receive a separate e-mode with stablecoin (sdetails in the e-mode section):

- WMNT
- WETH

# New E-mode

**XAUt Stablecoin E-Mode Configuration**

| Parameter  | Value            |
| ---------- | ---------------- |
| Collateral | XAUt             |
| Borrowable | USDT0, USDC, GHO |
| LTV        | 70%              |
| LT         | 75%              |
| LB         | 6%               |

**WETH Stablecoin E-Mode Configuration**

| Parameter  | Value            |
| ---------- | ---------------- |
| Collateral | WETH             |
| Borrowable | USDT0, USDC, GHO |
| LTV        | 80.5%            |
| LT         | 83%              |
| LB         | 5.5%             |

**WMNT Stablecoin E-Mode Configuration**

| Parameter  | Value            |
| ---------- | ---------------- |
| Collateral | WMNT             |
| Borrowable | USDT0, USDC, GHO |
| LTV        | 40%              |
| LT         | 45%              |
| LB         | 10%              |

## References

- Implementation: [AaveV3Mantle](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260429_AaveV3Mantle_AaveV3MantleCollateralEnablementEModeExpansionAndIsolationUpdates/AaveV3Mantle_AaveV3MantleCollateralEnablementEModeExpansionAndIsolationUpdates_20260429.sol)
- Tests: [AaveV3Mantle](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260429_AaveV3Mantle_AaveV3MantleCollateralEnablementEModeExpansionAndIsolationUpdates/AaveV3Mantle_AaveV3MantleCollateralEnablementEModeExpansionAndIsolationUpdates_20260429.t.sol)
- Snapshot: Direct-to-AIP
- [Discussion](https://governance.aave.com/t/direct-to-aip-aave-v3-mantle-collateral-enablement-emode-expansion-and-isolation-updates-usdt0-usde-eth-xaut/24153)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
