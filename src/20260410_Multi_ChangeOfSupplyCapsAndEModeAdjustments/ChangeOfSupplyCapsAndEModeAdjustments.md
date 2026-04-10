---
title: "Change of supply caps and e-mode adjustments"
author: "Chaos Labs (implemented by Aavechan Initiative @aci via Skyward)"
discussions: "https://governance.aave.com/t/direct-to-aip-change-of-supply-caps-and-adjustment-of-e-mode-assets-on-aave-v3-07-04-26/24396"
---

## Simple Summary

Chaos Labs proposed the following changes to be implemented through AIP:

- Increase the supply cap of PT-srUSDe-25JUN2026 on the Ethereum Core Instance
- Increase the supply cap of PT-srUSDe-25JUN2026 on the Plasma Instance
- Increase the supply cap of wrsETH on the Mantle Instance.
- Increase the supply cap of FBTC on the Mantle Instance.
- Include GHO within the PT asset E-modes on the Plasma Instance

All cap increases are backed by [Chaos Labs’ risk simulations](https://cdn.sanity.io/files/zmh9mnff/production/130e1060165f7ab0766bb4c70cc2ec41c1d1e458.pdf), which consider user behavior, on-chain liquidity, and price impact, ensuring that higher caps do not introduce additional risk to the platform.

## Specification

### PT-srUSDe-25JUN2026 (Ethereum Core)

PT-srUSDe-25JUN2026 has reached its 30M supply cap. Its supply growth over the past 7 days indicates sustained demand, warranting an increase in the supply cap.

![image|1259x149](upload://bGfU58zsHtfoC1UQn8Kb9Uop4bs.png)

#### Supply Distribution

The supply of PT-srUSDe-25JUN2026 is highly concentrated, with the largest supplier accounting for over 60% of the total supply. The user is adopting a mixed collateral strategy combining sUSDe and PT-srUSDe-25JUN2026, likely as a consequence of the limited supply cap of the asset.

![image (1)|1264x539](upload://tONbn8Da2Vqwzrd7xYIS27TpzT8.png)

#### Liquidity

At the time of writing, PT-srUSDe-25JUN2026 has sufficient liquidity in the Pendle AMM to support a sell of 10M tokens with around 3% slippage, which supports increasing the supply cap.

![image (2)|1000x800](upload://tIICwFT0chCuvoWu3pmqWFXbp2R.png)

#### Recommendation

Given the sufficient on-chain liquidity and the limited liquidation risk, we recommend increasing the supply cap for PT-srUSDe-25JUN2026 on the Ethereum Core instance.

### PT-sUSDe-18JUN2026 (Plasma)

PT-sUSDe-18JUN2026 has reached its 150M supply cap. Its supply growth over the past 7 days indicates sustained demand, warranting an increase in the supply cap.

#### Supply Distribution

The supply of PT-sUSDe-18JUN2026 is fairly concentrated, with the largest supplier accounting for about 30% of the total supply. Borrowing activity is primarily in USDe and USDT, and users are largely employing recursive strategies where yield bearing collateral is used to borrow stablecoins and resupplied to increase position size, allowing them to capture the spread between PT-sUSDe implied yield and stablecoin borrowing costs. Given the strong correlation between the collateral and borrowed assets, overall liquidation risk remains limited.

![image (3)|2000x994](upload://bwx7agiiabDkLxJkRgOKpfsKQZt.png)

#### Liquidity

At the time of writing, PT-sUSDe-18JUN2026 has sufficient liquidity in the Pendle AMM to support a sell of 4.8M tokens with around 3% slippage, which supports increasing the supply cap.

![image (4)|1000x800](upload://sUC12XRl3uUgJIBrhto2jDeVAmW.png)

#### Recommendation

Given the sufficient on-chain liquidity and the limited liquidation risk, we recommend increasing the supply cap for PT-sUSDe-18JUN2026 on the Plasma instance.

#### E-Mode Adjustments

Following the listing of the assets, we recommend the addition of GHO as a borrowable asset in the PT-sUSDe-18JUN2026/Stablecoins E-mode and in the PT-USDe-18JUN2026/Stablecoins E-mode.

### wrsETH (Mantle)

wrsETH has reached 100% utilization of its supply cap, with total supply at 52K on the Mantle instance, warranting an increase in the supply cap.

#### Supply Distribution

wrsETH’s supply is highly concentrated, with the top four suppliers accounting for nearly the entire distribution, and the largest supplier alone representing approximately 47% of total supply. However, none of these positions currently present material liquidation risk, as they are primarily engaged in leverage looping strategies where the collateral and borrowed assets move closely in price.

![image (5)|2000x995](upload://bVC5jCtgJugAFJgDQXHiHezFmBy.png)

#### Liquidity

At the time of writing, on-chain liquidity is sufficient to support a sell of 500 wrsETH into WETH with under 4% slippage, which supports a conservative increase in the supply cap.

#### Recommendation

Most suppliers are currently borrowing WETH to implement leverage looping strategies, which results in minimal liquidation risk due to the strong price correlation between the collateral and the borrowed asset. However, on-chain liquidity is still insufficient to support a meaningful increase in exposure, so we recommend a conservative increase to the wrsETH supply cap.

### FBTC (Mantle)

FBTC has reached 97% utilization of its supply cap, with total supply at 48.78 FBTC on the Mantle instance, warranting an increase in the supply cap.

#### Supply Distribution

FBTC’s supply is highly concentrated, with the top suppliers accounting for the entire distribution. However, the top position maintains a safe health factor of 1.5 and, as such, does not present material liquidation risk.

![image (6)|2000x989](upload://vAE5vOiNwVqZ1EAPpOz0TSpJR8U.png)

#### Liquidity

At the time of writing, on-chain liquidity is sufficient to support a sell of 5 FBTC into USDC with under 8% slippage, which supports a conservative increase in the supply cap.

#### Recommendation

Given the sufficient on-chain liquidity and safe position of the top users, we recommend increasing the supply cap for FBTC on the Mantle instance.

#### Specification

| **Instance**  | **Asset**           | **Current Supply Cap** | **Recommended Supply Cap** | **Current Borrow Cap** | **Recommended Borrow Cap** |
| ------------- | ------------------- | ---------------------- | -------------------------- | ---------------------- | -------------------------- |
| Plasma        | PT-sUSDe-18JUN2026  | 150,000,000            | 500,000,000                | -                      | -                          |
| Ethereum Core | PT-srUSDe-25JUN2026 | 30,000,000             | 100,000,000                | -                      | -                          |
| Mantle        | wrsETH              | 52,000                 | 70,000                     | -                      | -                          |
| Mantle        | FBTC                | 50                     | 100                        | -                      | -                          |

We also recommend additions to the following E-Modes on Plasma:

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

- Implementation: [AaveV3Ethereum](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260410_Multi_ChangeOfSupplyCapsAndEModeAdjustments/AaveV3Ethereum_ChangeOfSupplyCapsAndEModeAdjustments_20260410.sol), [AaveV3Plasma](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260410_Multi_ChangeOfSupplyCapsAndEModeAdjustments/AaveV3Plasma_ChangeOfSupplyCapsAndEModeAdjustments_20260410.sol), [AaveV3Mantle](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260410_Multi_ChangeOfSupplyCapsAndEModeAdjustments/AaveV3Mantle_ChangeOfSupplyCapsAndEModeAdjustments_20260410.sol)
- Tests: [AaveV3Ethereum](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260410_Multi_ChangeOfSupplyCapsAndEModeAdjustments/AaveV3Ethereum_ChangeOfSupplyCapsAndEModeAdjustments_20260410.t.sol), [AaveV3Plasma](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260410_Multi_ChangeOfSupplyCapsAndEModeAdjustments/AaveV3Plasma_ChangeOfSupplyCapsAndEModeAdjustments_20260410.t.sol), [AaveV3Mantle](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260410_Multi_ChangeOfSupplyCapsAndEModeAdjustments/AaveV3Mantle_ChangeOfSupplyCapsAndEModeAdjustments_20260410.t.sol)
- Snapshot: Direct-to-AIP
- [Discussion](https://governance.aave.com/t/direct-to-aip-change-of-supply-caps-and-adjustment-of-e-mode-assets-on-aave-v3-07-04-26/24396)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
