---
title: "wstETH and weETH E-Modes and LT/LTV Adjustments on Ethereum, Arbitrum, Base"
author: "Aave-Chan Initiative"
discussions: "governance.aave.com/t/arfc-wsteth-and-weeth-e-modes-and-lt-ltv-adjustments-on-ethereum-arbitrum-base-03-12-25/21370"
---

## Simple Summary

Chaos Labs proposes establishing the addition of the following E-Modes:

- weETH/WETH Liquid E-Mode on Arbitrum, Base, and Core Instances.
- wstETH/WETH Liquid E-Mode on Arbitrum, Base, and Core Instances.

We also propose adjusting weETH’s LTV on Base and Arbitrum to enhance user capital efficiency.

## Motivation

# weETH

After carefully observing weETH’s liquidity and volatility across multiple chains, we recommend a series of changes to improve the asset’s capital efficiency.

Below, we present weETH’s liquidity across Base and Arbitrum over the past six months.

weETH’s liquidity on Arbitrum has shown a strong reliance over the past six months, steadily increasing despite the recent price changes. Currently, selling 500 weETH incurs less than 2% price slippage.

weETH’s liquidity on Base has remained similarly stable following an increase in the 4th quarter of 2024. Currently, selling 650 weETH incurs less than 2% price slippage.

### Peg Stability

Below, we analyze weETH’s peg stability during the August 5, 2024, market stress event, in which WETH fell 21%. Evaluating weETH’s exchange rate stability is critical for assessing LTV and E-mode parameters, as price deviations between weETH and WETH can lead to delays in liquidation and arbitrage-driven borrowing, impacting risk exposure.

On August 5, the weETH/WETH market rate followed a similar trajectory, with a maximum deviation reaching 140 bps. While the recovery speed on both chains was comparable, Ethereum exhibited a slightly faster reversion to the internal exchange rate. On Arbitrum, the market rate took longer to revert compared to Base and Ethereum. However, all three instances demonstrated a successful recovery and quick mean reversion.

### LT & LTV

Based on the above observations, weETH’s liquidity on Base has remained stable after recent improvements, and its ability to maintain a stable peg under stressful market conditions supports an LTV&LT increase. Therefore, we recommend increasing LTV to 75% and LT to 77%. Additionally, we propose establishing a separate weETH/WETH Liquid E-Mode with higher parameters to enhance users’ capital efficiency rather than adjusting the parameters within the existing E-Mode.

On Arbitrum, weETH demonstrates similar stability in liquidity compared to Base but exhibits slightly weaker peg stability than on Base and Ethereum. However, its properties are still sufficient to recommend increasing its collateral parameters to 75% and 77%, aligning them with those on Base.

However, given the reduced liquidity present on the Base chain we recommend adjusting the Liquidation Bonus within the weETH/WETH E-Mode to 1.25% to mitigate the price impact caused by large highly correlated positions.

Additionally, in order to provide the DAO with more granularity during future adjustments, we recommend the creation of a weETH/WETH Liquid E-Mode on Arbitrum and Core Instances such that its parameters are aligned with the currently active ETH-Correlated E-Mode on the respective chains.

# wstETH

Following the introduction to Liquid E-Modes with Aave v3.2, which enables targeted combinations of collateral and debt assets, we propose aligning the wstETH’s more aggressive parameters currently present on the Prime instance across all Aave deployments. Thanks to wstETH’s battle-tested stability, this change will improve capital efficiency while maintaining reduced risk.

To align the LT and LTV of wstETH to those used within Prime’s E-Mode, we cover the asset’s volatility and peg over multiple instances.

On Base, wstETH’s liquidity against WETH has declined in recent months. However, thanks to the fast bridging speed and quick mean reversion properties, it is still sufficient to support the proposed parameters.

Its liquidity has also fallen slightly on Arbitrum, though it has been more stable in the past two months, with a 1,000 wstETH for WETH swap able to be completed for less than 1% price slippage.

### Peg Stability

Price deviations can cause problems like arbitrage exploitation, where, given the underlying liquidation threshold, users take advantage of price differences between the protocol’s fundamental valuation of an asset and its market price, potentially destabilizing liquidity. This can lead to WETH debt accrual and thus, in tandem with WETH collateral liquidations and withdrawals due to the underwriting of temporary mispriced debt, lead to interest rate and utilization spikes, with LST/LRT-collateralized e-mode LTVs gradually (net) increasing while WETH collateralized stablecoin debt positions risk unperformed liquidations due to such utilization rates.

These deviations typically arise during periods of market stress. In such scenarios, deviations are driven by complex factors, including investor de-risking from volatile assets, liquidation cascades triggered by non-correlated positions such as stablecoin borrows against WETH, and, in rare cases, slashing events that erode confidence in an asset. The speed of reversion is generally contingent on the market priced implied duration risk associated with such a WETH-correlated asset, which can be dynamic dictated by exit queue considerations, as well as the game-theoretic value given by the fundamental robustness and on-chain liquidity of the asset itself.

For this reason, to gauge the resilience of wstETH’s peg to ETH across different chains, given by the available liquidity and leverage on the chain, we analyze price behavior during the market drop that occurred on August 5, 2024, during which WETH suffered a 21% daily drop, with the rest of the market following suit and LST/LRT assets showing significant deviations. Despite that, wstETH demonstrated strong reversion characteristics across Base, Arbitrum, and Scroll. This observation indicates a high degree of stability that supports the proposed E-Mode parameters.

- **Ethereum:** On Ethereum, wstETH dropped to a minimum of 1.1531 WETH, representing a 1.85% depeg. The asset quickly returned within 0.5% from its exchange rate, showing a strong mean reversion tendency.

- **Base**: On Base, wstETH dropped to a minimum of 1.1490 WETH, representing a 2.1% depeg. Despite this dip, the asset quickly returned to its peg, demonstrating resilience and a tendency toward mean reversion under stress.

- **Arbitrum**: On Arbitrum, wstETH experienced a smaller depeg of 1.66%, reaching a low of 1.1550 WETH. Although this recovery was slightly slower than on Base, wstETH still demonstrated consistent mean reversion and stability.

### LT and LTV

The combination of robust liquidity, strong peg stability, and the inherent resilience of wstETH ensures that aligning LTV and LT parameters for the wstETH/WETH E-Mode on Arbitrum, Base and Core to the one on Lido instance is both feasible and prudent. This is because the ETH-correlated E-Mode configuration is constrained by the least liquid and least stable assets within the pool, limiting capital efficiency across the board. However, with these updated configurations, we can adopt parameters that better reflect the liquidity and stability of wstETH, allowing for higher capital efficiency in isolated E-Modes.

Hence, we recommend setting the LTV at 93.5% and the LT at 95.5%. By enabling a high level of leverage, these parameters are also expected to increase demand for WETH across the chains.

### Collateral and Borrowable

To prevent same-asset looping, which could undermine future use of liquidity incentives and lead to unintended utilization, we recommend configuring wstETH as collateral and WETH as borrowable in the proposed E-Mode. This structure aligns with the approach detailed in [this post](https://governance.aave.com/t/arfc-chaos-labs-risk-parameter-updates-wsteth-weth-e-mode-parameters-for-lido-market-10-20-24/19542), which advocates for selective collateral and borrowing configurations to maintain market efficiency.

## Specification

Based on the observations and considerations outlined above, we recommend implementing the following liquid E-Mode configuration for the weETH/WETH pair on Arbitrum, Base, and Core Instances and proposing an LTV adjustment for weETH on both Arbitrum, Base, and Core Instances.

### **weETH/WETH E-Mode (Base)**

| **Parameter**         | **Value** | **Value** |
| --------------------- | --------- | --------- |
| Asset                 | weETH     | WETH      |
| Collateral            | Yes       | No        |
| Borrowable            | No        | Yes       |
| Max LTV               | 93%       | -         |
| Liquidation Threshold | 95%       | -         |
| Liquidation Penalty   | 1.25%     | -         |

### **weETH/WETH E-Mode (Ethereum Core)**

| **Parameter**         | **Value** | **Value** |
| --------------------- | --------- | --------- |
| Asset                 | weETH     | WETH      |
| Collateral            | Yes       | No        |
| Borrowable            | No        | Yes       |
| Max LTV               | 93%       | -         |
| Liquidation Threshold | 95%       | -         |
| Liquidation Penalty   | 1.00%     | -         |

### **weETH/WETH E-Mode (Arbitrum)**

| **Parameter**         | **Value** | **Value** |
| --------------------- | --------- | --------- |
| Asset                 | weETH     | WETH      |
| Collateral            | Yes       | No        |
| Borrowable            | No        | Yes       |
| Max LTV               | 93%       | -         |
| Liquidation Threshold | 95%       | -         |
| Liquidation Penalty   | 1.00%     | -         |

### **weETH LT&LTV**

| **Asset** | **Chain** | **Current LTV** | **Recommended LTV** | **Current LT** | **Recommended LT** |
| --------- | --------- | --------------- | ------------------- | -------------- | ------------------ |
| weETH     | Base      | 72.5%           | 75%                 | 75%            | 77%                |
| weETH     | Arbitrum  | 72.5%           | 75%                 | 75%            | 77%                |

### wstETH/ WETH **E-Mode** (Base)

| **Parameter**         | **Value** | **Value** |
| --------------------- | --------- | --------- |
| Asset                 | wstETH    | WETH      |
| Collateral            | Yes       | No        |
| Borrowable            | No        | Yes       |
| Max LTV               | 93.5%     | 93.5%     |
| Liquidation Threshold | 95.5%     | 95.5%     |
| Liquidation Penalty   | 1.00%     | 1.00%     |

### wstETH/ WETH **E-Mode** (Arbitrum)

| **Parameter**         | **Value** | **Value** |
| --------------------- | --------- | --------- |
| Asset                 | wstETH    | WETH      |
| Collateral            | Yes       | No        |
| Borrowable            | No        | Yes       |
| Max LTV               | 93.5%     | 93.5%     |
| Liquidation Threshold | 95.5%     | 95.5%     |
| Liquidation Penalty   | 1.00%     | 1.00%     |

### wstETH/ WETH **E-Mode** (Ethereum Core)

| **Parameter**         | **Value** | **Value** |
| --------------------- | --------- | --------- |
| Asset                 | wstETH    | WETH      |
| Collateral            | Yes       | No        |
| Borrowable            | No        | Yes       |
| Max LTV               | 93.5%     | 93.5%     |
| Liquidation Threshold | 95.5%     | 95.5%     |
| Liquidation Penalty   | 1.00%     | 1.00%     |

## References

- Implementation: [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20250318_Multi_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase/AaveV3Ethereum_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase_20250318.sol), [AaveV3Arbitrum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20250318_Multi_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase/AaveV3Arbitrum_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase_20250318.sol), [AaveV3Base](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20250318_Multi_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase/AaveV3Base_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase_20250318.sol)
- Tests: [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20250318_Multi_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase/AaveV3Ethereum_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase_20250318.t.sol), [AaveV3Arbitrum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20250318_Multi_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase/AaveV3Arbitrum_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase_20250318.t.sol), [AaveV3Base](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20250318_Multi_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase/AaveV3Base_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase_20250318.t.sol)
- Snapshot: Direct-to-AIP
- [Discussion](governance.aave.com/t/arfc-wsteth-and-weeth-e-modes-and-lt-ltv-adjustments-on-ethereum-arbitrum-base-03-12-25/21370)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
