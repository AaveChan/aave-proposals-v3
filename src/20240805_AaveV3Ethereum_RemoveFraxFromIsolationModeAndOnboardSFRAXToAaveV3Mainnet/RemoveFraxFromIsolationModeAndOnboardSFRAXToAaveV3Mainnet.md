---
title: "Remove Frax from Isolation Mode and onboard sFRAX to Aave v3 Mainnet"
author: "Aave Chan Initiative"
discussions: "https://governance.aave.com/t/arfc-remove-frax-from-isolation-mode-and-onboard-sfrax-to-aave-v3-mainnet/18506"
snapshot: "TODO"
---

## Simple Summary

This is an ARFC to finalize onboarding of sFRAX with a CAPO feed and remove FRAX from isolation mode.

## Motivation

FRAX and Aave DAO have found more synergies over the last months. The FRAX team has responded with major updates to security on sfrxETH in response to BGD Labs feedback. FRAX has also initated governance proposals to add GHO to Frax Lend. There are ongoing conversations to have a FRAX AMO included into Aave v3. sFRAX was [previously accepted ](https://governance.aave.com/t/arfc-add-sfrax-on-ethereum-v3/16303) for onboarding in a previous [ARFC vote](https://snapshot.org/#/aave.eth/proposal/0xdba99e9c8da24424447d7c7b70eff93ad5b6055714b5f34cf9859c923fb3a38a) before the introduction of CAPO feeds.

This proposal suggests finalizing the sFRAX onboarding by inviting risk service provider teams to provide CAPO recommendations.

In addition this proposal suggests removing FRAX from isolation mode to facilitate further AMO deployments.

## Specification

- FRAX will be removed from isolation mode on Aave v3 instances.
- FRAX will receive same parameters as DAI and a Reserve Factor of 15%

The table below illustrates the configured risk parameters for **sFRAX**

| Parameter                 |                                      Value |
| ------------------------- | -----------------------------------------: |
| Isolation Mode            |                                      false |
| Borrowable                |                                   DISABLED |
| Collateral Enabled        |                                       true |
| Supply Cap (sFRAX)        |                                 10,000,000 |
| Borrow Cap (sFRAX)        |                                          0 |
| Debt Ceiling              |                                      USD 0 |
| LTV                       |                                       70 % |
| LT                        |                                       75 % |
| Liquidation Bonus         |                                        6 % |
| Liquidation Protocol Fee  |                                       20 % |
| Reserve Factor            |                                       20 % |
| Base Variable Borrow Rate |                                        0 % |
| Variable Slope 1          |                                        0 % |
| Variable Slope 2          |                                        0 % |
| Uoptimal                  |                                        0 % |
| Stable Borrowing          |                                   DISABLED |
| Flashloanable             |                                   DISABLED |
| Siloed Borrowing          |                                   DISABLED |
| Borrowable in Isolation   |                                   DISABLED |
| Oracle                    | 0xB9E1E3A9feFf48998E45Fa90847ed4D467E8BcfD |

## References

- Implementation: [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240805_AaveV3Ethereum_RemoveFraxFromIsolationModeAndOnboardSFRAXToAaveV3Mainnet/AaveV3Ethereum_RemoveFraxFromIsolationModeAndOnboardSFRAXToAaveV3Mainnet_20240805.sol)
- Tests: [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240805_AaveV3Ethereum_RemoveFraxFromIsolationModeAndOnboardSFRAXToAaveV3Mainnet/AaveV3Ethereum_RemoveFraxFromIsolationModeAndOnboardSFRAXToAaveV3Mainnet_20240805.t.sol)
- [Snapshot](TODO)
- [Discussion](https://governance.aave.com/t/arfc-remove-frax-from-isolation-mode-and-onboard-sfrax-to-aave-v3-mainnet/18506)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
