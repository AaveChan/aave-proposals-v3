---
title: "sFrax Listing"
author: "Aave Chan Initiative"
discussions: "https://governance.aave.com/t/arfc-add-sfrax-on-ethereum-v3/16303"
snapshot: "https://snapshot.org/#/aave.eth/proposal/0xdba99e9c8da24424447d7c7b70eff93ad5b6055714b5f34cf9859c923fb3a38a"
---

## Simple Summary

This publication presents the community an opportunity to add sFRAX to the Ethereum Aave V3 Liquidity Pool.

## Motivation

Staked FRAX (sFRAX) is an ERC-4626 staking vault that distributes a portion of the Frax Protocol yield. sFRAX APY attempts to roughly track the interest on reserve balances (IORB) rate of the United States Federal Reserve.

Integrating sFRAX as collateral asset in the Aave V3 Ethereum Pool has the potential to create new demand for borrowable assets on Aave V3, such as stablecoins and FXS.

## Specification

The table below illustrates the configured risk parameters for **sFRAX**

| Parameter                          |                                      Value |
| ---------------------------------- | -----------------------------------------: |
| Isolation Mode                     |                                       true |
| Borrowable                         |                                   DISABLED |
| Collateral Enabled                 |                                       true |
| Supply Cap (sFRAX)                 |                                 10,000,000 |
| Borrow Cap (sFRAX)                 |                                          0 |
| Debt Ceiling                       |                                      USD 1 |
| LTV                                |                                       70 % |
| LT                                 |                                       75 % |
| Liquidation Bonus                  |                                        6 % |
| Liquidation Protocol Fee           |                                       20 % |
| Reserve Factor                     |                                       20 % |
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
| Flashloanable                      |                                    ENABLED |
| Siloed Borrowing                   |                                   DISABLED |
| Borrowable in Isolation            |                                   DISABLED |
| Oracle                             | 0x0000000000000000000000000000000000000000 |

## References

- Implementation: [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240325_AaveV3Ethereum_SFraxListing/AaveV3Ethereum_SFraxListing_20240325.sol)
- Tests: [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240325_AaveV3Ethereum_SFraxListing/AaveV3Ethereum_SFraxListing_20240325.t.sol)
- [Snapshot](https://snapshot.org/#/aave.eth/proposal/0xdba99e9c8da24424447d7c7b70eff93ad5b6055714b5f34cf9859c923fb3a38a)
- [Discussion](https://governance.aave.com/t/arfc-add-sfrax-on-ethereum-v3/16303)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
