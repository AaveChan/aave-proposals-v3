---
title: "Onboarding wBETH"
author: "Aave Chan Initiative"
discussions: "https://governance.aave.com/t/arfc-onboard-wbeth-to-aave-v3-bnb-chain/17210"
snapshot: "https://snapshot.org/#/aave.eth/proposal/0x0ad8168a1b388b0e9771cae6d317619ad5428dd6788a457fea7d533d2fcd88d2"
---

## Simple Summary

This ARFC proposes the addition of wbETH the Binance Liquid Staked ETH Token to Aave V3 BNB Chain to enhance LST liquidity and asset diversity.

## Motivation

Liquid Staked Tokens are one of the premier collateral types on Aave and drive most of the ETH borrow demand. wBETH is one of the largest Liquid Staking Tokens on the market and one of the more productive assets available on BNB Chain.

The Aave-Chan Initiative supports LST diversity in Aave V3 and looks to add more LST to the new BNB Chain deployment.

## Specification

The table below illustrates the configured risk parameters for **wBETH**

| Parameter                          |                                      Value |
| ---------------------------------- | -----------------------------------------: |
| Isolation Mode                     |                                       true |
| Borrowable                         |                                    ENABLED |
| Collateral Enabled                 |                                       true |
| Supply Cap (wBETH)                 |                                      3,000 |
| Borrow Cap (wBETH)                 |                                        300 |
| Debt Ceiling                       |                                      USD 0 |
| LTV                                |                                       67 % |
| LT                                 |                                       74 % |
| Liquidation Bonus                  |                                        7 % |
| Liquidation Protocol Fee           |                                       10 % |
| Reserve Factor                     |                                       15 % |
| Base Variable Borrow Rate          |                                        0 % |
| Variable Slope 1                   |                                        7 % |
| Variable Slope 2                   |                                      300 % |
| Uoptimal                           |                                       45 % |
| Stable Borrowing                   |                                   DISABLED |
| Stable Slope1                      |                                       13 % |
| Stable Slope2                      |                                      300 % |
| Base Stable Rate Offset            |                                        3 % |
| Stable Rate Excess Offset          |                                        5 % |
| Optimal Stable To Total Debt Ratio |                                       20 % |
| Flashloanable                      |                                   DISABLED |
| Siloed Borrowing                   |                                   DISABLED |
| Borrowable in Isolation            |                                   DISABLED |
| Oracle                             | 0x0000000000000000000000000000000000000000 |

## References

- Implementation: [AaveV3BNB](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240409_AaveV3BNB_OnboardingWBETH/AaveV3BNB_OnboardingWBETH_20240409.sol)
- Tests: [AaveV3BNB](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240409_AaveV3BNB_OnboardingWBETH/AaveV3BNB_OnboardingWBETH_20240409.t.sol)
- [Snapshot](https://snapshot.org/#/aave.eth/proposal/0x0ad8168a1b388b0e9771cae6d317619ad5428dd6788a457fea7d533d2fcd88d2)
- [Discussion](https://governance.aave.com/t/arfc-onboard-wbeth-to-aave-v3-bnb-chain/17210)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
