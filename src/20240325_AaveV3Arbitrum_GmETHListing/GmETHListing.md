---
title: "gmETH Listing"
author: "Aave Chan Initiative"
discussions: "https://governance.aave.com/t/arfc-add-gmeth-on-arbitrum-v3/16849"
snapshot: "https://snapshot.org/#/aave.eth/proposal/0xc0b723e76fa6682a58983695b7a015c3a5b928c89c2f400375c6a971ef1aba99"
---

## Simple Summary

This publication presents the community an opportunity to add gmETH on the Arbitrum Aave v3 Liquidity Pool.

## Motivation

GMX Protocol is the largest DEX offering derivatives and one of the most popular DeFi’s today. The introduction of several new features and integration with Chainlink Data Stream in GMX V2 has significantly reduced the risks of front-running and price manipulation compared to GMX V1. gmETH is a ETH-USD’s Liquidity Token on the GMX V2 and earn fees from leverage trading, borrowing fees and swaps.

Integrating gmETH as collateral asset in the Aave V3 Arbitrum Pool has the potential to create new demand for borrowable assets on Aave V3.

## Specification

The table below illustrates the configured risk parameters for **gmETH**

| Parameter                          |                                      Value |
| ---------------------------------- | -----------------------------------------: |
| Isolation Mode                     |                                       true |
| Borrowable                         |                                   DISABLED |
| Collateral Enabled                 |                                       true |
| Supply Cap (gmETH)                 |                                  3,500,000 |
| Borrow Cap (gmETH)                 |                                          0 |
| Debt Ceiling                       |                                      USD 1 |
| LTV                                |                                       60 % |
| LT                                 |                                       65 % |
| Liquidation Bonus                  |                                       12 % |
| Liquidation Protocol Fee           |                                       10 % |
| Reserve Factor                     |                                        0 % |
| Base Variable Borrow Rate          |                                        0 % |
| Variable Slope 1                   |                                        0 % |
| Variable Slope 2                   |                                        0 % |
| Uoptimal                           |                                        0 % |
| Stable Borrowing                   |                                   DISABLED |
| Stable Slope1                      |                                        0 % |
| Stable Slope2                      |                                        0 % |
| Base Stable Rate Offset            |                                        0 % |
| Stable Rate Excess Offset          |                                        0 % |
| Optimal Stable To Total Debt Ratio |                                        0 % |
| Flashloanable                      |                                   DISABLED |
| Siloed Borrowing                   |                                   DISABLED |
| Borrowable in Isolation            |                                   DISABLED |
| Oracle                             | 0xfB3264D1129824933a52374c2C1696F4470D041e |

## References

- Implementation: [AaveV3Arbitrum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240325_AaveV3Arbitrum_GmETHListing/AaveV3Arbitrum_GmETHListing_20240325.sol)
- Tests: [AaveV3Arbitrum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240325_AaveV3Arbitrum_GmETHListing/AaveV3Arbitrum_GmETHListing_20240325.t.sol)
- [Snapshot](https://snapshot.org/#/aave.eth/proposal/0xc0b723e76fa6682a58983695b7a015c3a5b928c89c2f400375c6a971ef1aba99)
- [Discussion](https://governance.aave.com/t/arfc-add-gmeth-on-arbitrum-v3/16849)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
