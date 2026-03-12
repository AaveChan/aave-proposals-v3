---
title: "Re-enable wstETH borrow caps after capo incident"
author: "Chaos Labs (implemented by Aavechan Initiative @aci via Skyward)"
discussions: "https://governance.aave.com/t/post-mortem-exchange-rate-misallignment-on-wsteth-core-and-prime-instances/24269"
---

## Summary

A technical incident affecting the CAPO risk oracle caused the reported wstETH/stETH exchange rate cap to fall below the currently valid market exchange rate on Ethereum Core and Prime instances.

This resulted in an approximately 2.85% decrease in the effective exchange rate used by the protocol, triggering roughly 10938 wstETH in E-Mode liquidations.

During this, protocol incurred no bad debt. However, liquidators captured approximately 512 ETH in liquidation bonuses and value realized through the exchange rate deviation. Since then, Aave has been able to recapture 141 ETH of liquidation bonus revenue through BuilderNet refunds, in addition to roughly 13 ETH in liquidation fees. These recovered funds will be used to compensate impacted users who were liquidated as a result of the incident, with DAO treasury funds to cover any excess. Active work is ongoing to contact relevant ecosystem players to further recoup possible liquidation-linked revenue.

The root cause was differing update constraints at the smart contract level, which ultimately resulted in a misalignment between the snapshot ratio and snapshot timestamp onchain.

Due to onchain constraints, the snapshot ratio could not be increased as quickly as intended, while the snapshot timestamp was not validated against that constrained update path and still reflected a 7-day-old reference point. This created an inconsistent configuration that caused CAPO to compute a maximum allowed exchange rate below the live rate.

## Background

As described in the original CAPO framework, the system is designed to protect lending protocols from oracle-driven inflation attacks and donation-style exploits.

CAPO does this by placing a deterministic, time-weighted upper bound on the exchange rate between a yield-bearing asset, such as wstETH, and its base asset, such as stETH.

The purpose of this bound is to capture the upper envelope of organic yield accrual, while rejecting abrupt or malicious upward deviations that could otherwise be used to create unbacked borrowing power.

This protection is especially important in adversarial scenarios, including:

- compromised EOAs controlling an oracle input,
- centralized oracle dependencies,
- contract upgrade vulnerabilities,
- donation attacks or exchange-rate manipulation.

The upper bound is governed by three parameters:

- **`snapshotRatio`**: the reference exchange rate,
- **`snapshotTimestamp`**: the timestamp associated with that reference,
- **`maxYearlyRatioGrowthPercent`**: the maximum annualized rate at which the ratio is allowed to grow.

The maximum permitted ratio is computed from the snapshot ratio plus a time-based growth allowance based on the difference between the snapshot timestamp and the current block time.

Conceptually, CAPO logic requires that the snapshot ratio and snapshot timestamp remain aligned. The snapshot ratio serves as the anchor, and the timestamp determines how much growth to apply to it. If those two values become inconsistent, the derived cap can drift away from the real exchange rate.

## What happened

The incident was caused by an inconsistency between the configured snapshot ratio and the snapshot delay/timestamp used for CAPO.

Operationally, our offchain process determined that the snapshot ratio should be updated to approximately ~1.2282, the appropriate value corresponding to the exchange rate 7 days earlier, as derived in our framework.

However, the snapshot ratio parameter is subject to an onchain constraint: it can only be increased by 3% every 3 days.

Because the previously configured snapshot ratio, on the contract was ~1.1572, it was not possible to set it to ~1.2282 in a single update. Instead, the ratio could only be increased to ~1.1919.

At the same time, the snapshot timestamp was still set to the value corresponding to 7 days earlier (`1772535647`), as intended by the offchain algorithm.

This created a mismatch:

- the timestamp assumed a 7-day-old anchor,
- but the ratio was not actually updated to the 7-day-old exchange rate,
- so the CAPO formula extrapolated growth from a reference point that was too low.

As a result, the calculated maximum exchange rate was roughly 1.1939, which was below the already configured/prevalent exchange rate. That lower CAPO-derived value then overrode the existing exchange rate used by the protocol, producing an effective downward move of around 2.855%.

That artificial decrease in the oracle rate triggered liquidations, particularly in E-Mode, affecting the positions with a health factor lower than 1.0288, resulting in roughly 10938 wstETH of liquidation volume.

In practical terms, for the configuration to work correctly at the smart contract level, the snapshot timestamp would have needed to be aligned with the constrained onchain snapshot ratio update, and likely adjusted again over subsequent updates until the onchain value converged with the offchain-calculated level. Because that alignment did not occur, the timestamp and ratio reflected different effective reference points.

## Root cause

The root cause was a configuration issue arising from differing operational constraints at the smart contract level.

- **`snapshotRatio`** was subject to an onchain rate-limited update constraint
- **`snapshotTimestamp`** was not subject to the same effective constraint
- our offchain logic correctly targeted the intended configuration, but under the constrained onchain update path, the snapshot ratio and snapshot timestamp did not remain aligned throughout execution
- in practice, only the timestamp fully reflected the 7-day update target

In other words, the system combined:

- a partially updated ratio
- with a fully advanced timestamp

That combination caused the CAPO cap to be computed from an anchor that was too low for the elapsed time basis being used.

More broadly, in order for this configuration to function correctly under the existing ratio constraint, the snapshot timestamp would have needed to remain aligned with the constrained onchain ratio update path, potentially across multiple successive updates, until the onchain snapshot ratio reached the offchain-calculated target level.

## Impact

The incident had the following impact:

- approximately 2.85% downward deviation in the effective exchange rate used by the protocol,
- roughly 10938 wstETH in E-Mode liquidation volume across 34 accounts.
- approximately 116 ETH in liquidation bonuses captured by third-party liquidators and Aave Liquidation Protocol fees.
- approximately 382 ETH in profit captured by third-party liquidators stemming from the underpricing of the oracle.
- no bad debt accrued by the protocol.

## Immediate steps taken

Following the incident, we took immediate steps to contain further risk and restore alignment on the impacted instances:

- Temporarily reduced the wstETH borrow cap to 1 on Aave Core and Aave Prime, the two impacted instances by this oracle configuration, in order to minimize additional exposure while remediation was underway.
- Aligned the snapshot ratio parameter with the current snapshot timestamp reference window through manual Risk Steward intervention, so that the configured onchain parameters move back into a consistent state and uncap the oracle, reverting to its true value.
- Following the reversion of the oracle price, we are proposing the reinstating of the wstETH borrow caps back to its original levels.
  | **Asset** | **Instance** | **Current Value** | **Recommended Value** |
  | --------- | -------------- | ----------------- | --------------------- |
  | wstETH | Ethereum Core | 1 | 180K |
  | wstETH | Ethereum Prime | 1 | 70K |

## Recovery and compensation

During the incident, Aave was able to recapture a substantial amount of lost liquidation bonus revenue (141.5 ETH) through BuilderNet refunds leveraged for reading the associated risk oracle update. We recommend that these recovered funds will be used to partially compensate users who were liquidated as a result of the incident. The rest of the user funds impacted shall be covered through the Aave treasury through a defined compensation plan, to be communicated shortly. Different parties are actively working on recovering more funds extracted outside of the system, and we can confirm that no more than 358 ETH will need to be compensated ad-hoc from the DAO.

## Closing

To summarize, this was a configuration incident based on smart contract level constraints which caused incorrect price updates for wstETH, resulting in $26M in liquidation volume.

Ultimately, this incident did not reflect a flaw in the underlying CAPO or offchain risk oracle design, but rather an onchain configuration misalignment under differing onchain update constraints that led the snapshot ratio and snapshot timestamp to become misaligned.

The protocol has since been reverted to its prior price oracle configuration, no bad debt was incurred, and the liquidation bonus value extracted during the incident has been substantially recaptured and will be returned to affected users through the compensation process described above.

We will continue to share additional details as compensation is finalized and further remediation steps are completed.

## References

- Implementation: [AaveV3Ethereum](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260312_Multi_ReEnableWstETHBorrowCapsAfterCapoIncident/AaveV3Ethereum_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312.sol), [AaveV3EthereumLido](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260312_Multi_ReEnableWstETHBorrowCapsAfterCapoIncident/AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312.sol)
- Tests: [AaveV3Ethereum](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260312_Multi_ReEnableWstETHBorrowCapsAfterCapoIncident/AaveV3Ethereum_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312.t.sol), [AaveV3EthereumLido](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260312_Multi_ReEnableWstETHBorrowCapsAfterCapoIncident/AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312.t.sol)
- Snapshot: Direct-to-AIP
- [Discussion](https://governance.aave.com/t/post-mortem-exchange-rate-misallignment-on-wsteth-core-and-prime-instances/24269)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
