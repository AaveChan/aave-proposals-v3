---
title: "weETH Onboarding on Arbitrum"
author: "Aave Chan Initiative"
discussions: "https://governance.aave.com/t/arfc-onboard-weeth-to-aave-v3-on-ethereum/16758/11"
snapshot: "https://snapshot.org/#/aave.eth/proposal/0xd5807ee6ec3d33e7d86805a4287540b0a9801430ee0900ff6babb698e4f2a273"
---

## Simple Summary

This ARFC seeks to add [Ether.fi](http://ether.fi/) Liquid Restaking Token weETH to Aave V3 Arbitrum. After the successful [ARFC Snapshot ](https://snapshot.org/#/aave.eth/proposal/0xd5807ee6ec3d33e7d86805a4287540b0a9801430ee0900ff6babb698e4f2a273) to onboard to Aave v3 Ethereum, this proposal will go direct-to-AIP following the asset onboarding framework.

## Motivation

eETH is an LRT that allows users to stake their ETH, accrue staking rewards, and receive additional rewards through native restaking on EigenLayer.

[Ether.fi](http://Ether.fi) has also launched eETH on Arbitrum, allowing users on the L2 to get exposure to the LRT yield and points. As weETH has already been approved for onboarding to Aave v3 Ethereum by the DAO, this proposal aims to extend the onboarding of weETH to Aave v3 Arbitrum.

## Proof of Liquidity and Deposit Commitments:

Anyone who deposits weETH into Aave on Arbitrum will accumulate [ether.fi](http://ether.fi/) and EigenLayer points to be used for future incentives.

## Specification

The table below illustrates the configured risk parameters for **weETH**

| Parameter                          |                                      Value |
| ---------------------------------- | -----------------------------------------: |
| Isolation Mode                     |                                       true |
| Borrowable                         |                                    ENABLED |
| Collateral Enabled                 |                                       true |
| Supply Cap (weETH)                 |                                      1,000 |
| Borrow Cap (weETH)                 |                                        100 |
| Debt Ceiling                       |                                      USD 0 |
| LTV                                |                                     72.5 % |
| LT                                 |                                       75 % |
| Liquidation Bonus                  |                                      7.5 % |
| Liquidation Protocol Fee           |                                       10 % |
| Reserve Factor                     |                                       15 % |
| Base Variable Borrow Rate          |                                        0 % |
| Variable Slope 1                   |                                        7 % |
| Variable Slope 2                   |                                      300 % |
| Uoptimal                           |                                       45 % |
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

- Implementation: [AaveV3Arbitrum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240409_AaveV3Arbitrum_WeETHOnboardingOnArbitrum/AaveV3Arbitrum_WeETHOnboardingOnArbitrum_20240409.sol)
- Tests: [AaveV3Arbitrum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240409_AaveV3Arbitrum_WeETHOnboardingOnArbitrum/AaveV3Arbitrum_WeETHOnboardingOnArbitrum_20240409.t.sol)
- [Snapshot](https://snapshot.org/#/aave.eth/proposal/0xd5807ee6ec3d33e7d86805a4287540b0a9801430ee0900ff6babb698e4f2a273)
- [Discussion](https://governance.aave.com/t/arfc-onboard-weeth-to-aave-v3-on-ethereum/16758/11)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
