---
title: "gmBTC"
author: "Aave Chan Initiative"
discussions: "https://governance.aave.com/t/arfc-add-gmbtc-on-arbitrum-v3/16767/3"
snapshot: "https://snapshot.org/#/aave.eth/proposal/0x166051b26be60fa3a64d7815b848b9b670a284b3da01c2d440c7815c400d7950"
---

## Simple Summary

This publication presents the community an opportunity to add gmBTC on the Arbitrum Aave v3 Liquidity Pool.

## Motivation

GMX Protocol is the largest DEX offering derivatives and one of the most popular DeFi’s today. The introduction of several new features and integration with Chainlink Data Stream in GMX V2 has significantly reduced the risks of front-running and price manipulation compared to GMX V1. gmBTC is a BTC-USD’s Liquidity Token on the GMX V2 and earn fees from leverage trading, borrowing fees and swaps.

Integrating gmBTC as collateral asset in the Aave V3 Arbitrum Pool has the potential to create new demand for borrowable assets on Aave V3.

## Specification

The table below illustrates the configured risk parameters for **gmBTC**

| Parameter                          |                                      Value |
| ---------------------------------- | -----------------------------------------: |
| Isolation Mode                     |                                       true |
| Borrowable                         |                                   DISABLED |
| Collateral Enabled                 |                                       true |
| Supply Cap (gmBTC)                 |                                  4,300,000 |
| Borrow Cap (gmBTC)                 |                                          0 |
| Debt Ceiling                       |                                      USD 1 |
| LTV                                |                                       55 % |
| LT                                 |                                       60 % |
| Liquidation Bonus                  |                                       12 % |
| Liquidation Protocol Fee           |                                       10 % |
| Reserve Factor                     |                                       10 % |
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
| Oracle                             | 0x395D5c5D552Df670dc4B2B1cef0c4EABfFba492f |

## References

- Implementation: [AaveV3Arbitrum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240325_AaveV3Arbitrum_GmBTC/AaveV3Arbitrum_GmBTC_20240325.sol)
- Tests: [AaveV3Arbitrum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240325_AaveV3Arbitrum_GmBTC/AaveV3Arbitrum_GmBTC_20240325.t.sol)
- [Snapshot](https://snapshot.org/#/aave.eth/proposal/0x166051b26be60fa3a64d7815b848b9b670a284b3da01c2d440c7815c400d7950)
- [Discussion](https://governance.aave.com/t/arfc-add-gmbtc-on-arbitrum-v3/16767/3)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
