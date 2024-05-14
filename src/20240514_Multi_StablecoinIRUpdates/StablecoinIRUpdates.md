---
title: "Stablecoin IR Curve Amendment"
author: "Chaos Labs, ACI"
discussions: "https://governance.aave.com/t/arfc-stablecoin-ir-curve-amendment-on-aave-v2-and-v3-05-13-2024/17692"
snapshot: "Direct-to-AIP"
---

## Simple Summary

A proposal to decrease stablecoin Interest Rate parameters across all Aave deployments.

## Motivation

Following the anticipated decrease in DSR — from 10% to 8% — we believe it is prudent to update Aave stablecoin interest rates to best align with the broader market. Previously, we [recommended](https://governance.aave.com/t/arfc-stablecoin-ir-curve-amendment-on-aave-v2-and-v3-04-22-2024/17450) reducing rates concurrent with the last DSR decrease from 13% to 10% in April.

The new parameters went into effect on May 6, 2024, and thus far have helped improve rate stability and utilization rates. As part of our ongoing monitoring of broader markets, we note that MakerDAO is in the process of reducing the DAI Savings Rate, which could impact stablecoin rates throughout DeFi.

Following our methodology laid out in previous [recommendations](https://governance.aave.com/t/arfc-stablecoin-ir-curve-amendment-on-aave-v2-and-v3/16864/2), we recommend closely aligning Slope1 with the DSR to reduce the opportunity of rate arbitrage and ensure that Aave remains competitive. As a result, we propose decreasing Slope1 by an equivalent amount: from 9% to 7%.

Caveats:

1. We do not recommend an update to the following assets on lower-cap stablecoins on Ethereum V2, as they are currently being deprecated.
2. Similar to the previous proposals, we recommend bridged USDC.e on all deployments to have a 1% higher slope1 to motivate the borrowing of native USDC.

## Specification

| Market       | Asset  | Current Slope1 | Recommended Slope1 |
| ------------ | ------ | -------------- | ------------------ |
| Ethereum V2  | USDC   | 9%             | 7%                 |
| Ethereum V2  | USDT   | 9%             | 7%                 |
| Ethereum V2  | DAI    | 9%             | 7%                 |
| Ethereum V2  | FRAX   | 12%            | No Change          |
| Ethereum V2  | sUSD   | 12%            | No Change          |
| Ethereum V2  | GUSD   | 12%            | No Change          |
| Ethereum V2  | LUSD   | 12%            | No Change          |
| Ethereum V2  | USDP   | 12%            | No Change          |
| Ethereum V3  | USDC   | 9%             | 7%                 |
| Ethereum V3  | USDT   | 9%             | 7%                 |
| Ethereum V3  | FRAX   | 9%             | 7%                 |
| Ethereum V3  | DAI    | 9%             | 7%                 |
| Ethereum V3  | LUSD   | 9%             | 7%                 |
| Ethereum V3  | pyUSD  | 9%             | 7%                 |
| Ethereum V3  | crvUSD | 9%             | 7%                 |
| Avalanche V2 | USDC.e | 10%            | 8%                 |
| Avalanche V2 | USDT   | 9%             | 7%                 |
| Avalanche V2 | DAI    | 9%             | 7%                 |
| Avalanche V3 | USDC   | 9%             | 7%                 |
| Avalanche V3 | USDT   | 9%             | 7%                 |
| Avalanche V3 | DAI    | 9%             | 7%                 |
| Avalanche V3 | MAI    | 9%             | 7%                 |
| Avalanche V3 | FRAX   | 9%             | 7%                 |
| Polygon V2   | USDC   | 9%             | 7%                 |
| Polygon V2   | USDT   | 9%             | 7%                 |
| Polygon V2   | DAI    | 9%             | 7%                 |
| Polygon V3   | USDC   | 9%             | 7%                 |
| Polygon V3   | USDT   | 9%             | 7%                 |
| Polygon V3   | DAI    | 9%             | 7%                 |
| Polygon V3   | MAI    | 9%             | 7%                 |
| Polygon V3   | EURA   | 9%             | 7%                 |
| Polygon V3   | EURS   | 9%             | 7%                 |
| Polygon V3   | jEUR   | 9%             | 7%                 |
| Polygon V3   | USDC.e | 10%            | 8%                 |
| Optimism V3  | USDC   | 9%             | 7%                 |
| Optimism V3  | USDT   | 9%             | 7%                 |
| Optimism V3  | DAI    | 9%             | 7%                 |
| Optimism V3  | sUSD   | 9%             | 7%                 |
| Optimism V3  | LUSD   | 9%             | 7%                 |
| Optimism V3  | MAI    | 9%             | 7%                 |
| Optimism V3  | USDC.e | 10%            | 8%                 |
| Arbitrum V3  | USDC   | 9%             | 7%                 |
| Arbitrum V3  | USDC.e | 10%            | 8%                 |
| Arbitrum V3  | USDT   | 9%             | 7%                 |
| Arbitrum V3  | DAI    | 9%             | 7%                 |
| Arbitrum V3  | LUSD   | 9%             | 7%                 |
| Arbitrum V3  | FRAX   | 9%             | 7%                 |
| Arbitrum V3  | MAI    | 9%             | 7%                 |
| Arbitrum V3  | EURS   | 9%             | 7%                 |
| Base V3      | USDbC  | 10%            | 8%                 |
| Base V3      | USDC   | 9%             | 7%                 |
| Metis V3     | m.USDC | 6%             | No Change          |
| Metis V3     | m.USDT | 6%             | No Change          |
| Metis V3     | m.DAI  | 6%             | No Change          |
| BNB Chain V3 | USDT   | 9%             | 7%                 |
| BNB Chain V3 | USDC   | 9%             | 7%                 |
| BNB Chain V3 | FDUSD  | 9%             | 7%                 |
| Scroll V3    | USDC   | 9%             | 7%                 |
| Gnosis V3    | WXDAI  | 9%             | 7%                 |
| Gnosis V3    | USDC   | 9%             | 7%                 |
| Gnosis V3    | EURe   | 9%             | 7%                 |

## References

- Implementation: [AaveV2Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV2Ethereum_StablecoinIRUpdates_20240514.sol), [AaveV2Avalanche](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV2Avalanche_StablecoinIRUpdates_20240514.sol), [AaveV2Polygon](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV2Polygon_StablecoinIRUpdates_20240514.sol), [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Ethereum_StablecoinIRUpdates_20240514.sol), [AaveV3Polygon](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Polygon_StablecoinIRUpdates_20240514.sol), [AaveV3Avalanche](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Avalanche_StablecoinIRUpdates_20240514.sol), [AaveV3Optimism](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Optimism_StablecoinIRUpdates_20240514.sol), [AaveV3Arbitrum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Arbitrum_StablecoinIRUpdates_20240514.sol), [AaveV3Base](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Base_StablecoinIRUpdates_20240514.sol), [AaveV3Gnosis](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Gnosis_StablecoinIRUpdates_20240514.sol), [AaveV3Scroll](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Scroll_StablecoinIRUpdates_20240514.sol), [AaveV3BNB](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3BNB_StablecoinIRUpdates_20240514.sol)
- Tests: [AaveV2Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV2Ethereum_StablecoinIRUpdates_20240514.t.sol), [AaveV2Avalanche](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV2Avalanche_StablecoinIRUpdates_20240514.t.sol), [AaveV2Polygon](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV2Polygon_StablecoinIRUpdates_20240514.t.sol), [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Ethereum_StablecoinIRUpdates_20240514.t.sol), [AaveV3Polygon](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Polygon_StablecoinIRUpdates_20240514.t.sol), [AaveV3Avalanche](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Avalanche_StablecoinIRUpdates_20240514.t.sol), [AaveV3Optimism](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Optimism_StablecoinIRUpdates_20240514.t.sol), [AaveV3Arbitrum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Arbitrum_StablecoinIRUpdates_20240514.t.sol), [AaveV3Base](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Base_StablecoinIRUpdates_20240514.t.sol), [AaveV3Gnosis](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Gnosis_StablecoinIRUpdates_20240514.t.sol), [AaveV3Scroll](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3Scroll_StablecoinIRUpdates_20240514.t.sol), [AaveV3BNB](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240514_Multi_StablecoinIRUpdates/AaveV3BNB_StablecoinIRUpdates_20240514.t.sol)
- [Snapshot](Direct-to-AIP)
- [Discussion](https://governance.aave.com/t/arfc-stablecoin-ir-curve-amendment-on-aave-v2-and-v3-05-13-2024/17692)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
