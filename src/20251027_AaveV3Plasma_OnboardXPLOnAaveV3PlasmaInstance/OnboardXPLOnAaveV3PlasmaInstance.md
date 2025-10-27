---
title: "Onboard XPL on Aave V3 Plasma Instance"
author: "Aave-chan Initiative"
discussions: "https://governance.aave.com/t/direct-to-aip-onboard-xpl-on-aave-v3-plasma-instance/23197"
---

## Simple Summary

This AIP proposes to onboard XPL on Aave V3 Plasma Instance.

## Motivation

XPL is the native token of the Plasma blockchain. It was initially approved by governance for onboarding to the Plasma instance during the Plasma instance deployment yet was paused due to reservations of some service providers. Given there is now sufficient liquidity for the token we believe it is time to reconsider onboarding XPL to the Plasma instance.

## Specification

The table below illustrates the configured risk parameters for **WXPL**

| Parameter                 |      Value |
| ------------------------- | ---------: |
| Isolation Mode            |      false |
| Borrowable                |   DISABLED |
| Collateral Enabled        |       true |
| Supply Cap (WXPL)         | 14,000,000 |
| Borrow Cap (WXPL)         |          1 |
| Debt Ceiling              |      USD 0 |
| LTV                       |     0.05 % |
| LT                        |      0.1 % |
| Liquidation Bonus         |       10 % |
| Liquidation Protocol Fee  |       10 % |
| Reserve Factor            |       50 % |
| Base Variable Borrow Rate |        0 % |
| Variable Slope 1          |       10 % |
| Variable Slope 2          |      300 % |
| Uoptimal                  |       45 % |
| Flashloanable             |    ENABLED |
| Siloed Borrowing          |   DISABLED |
| Borrowable in Isolation   |   DISABLED |

### Oracle

| Paramater |                                                                                          Value |
| --------- | ---------------------------------------------------------------------------------------------: |
| Oracle    | [Chainlink WXPL/USD](https://plasmascan.to/address/0xF932477C37715aE6657Ab884414Bd9876FE3f750) |

### Emode

| **Parameter**         | **Value** | **Value** | **Value** |
| --------------------- | --------- | --------- | --------- |
| Asset                 | WXPL      | USDT0     | GHO       |
| Collateral            | Yes       | No        | No        |
| Borrowable            | No        | Yes       | Yes       |
| Max LTV               | 50%       | -         | -         |
| Liquidation Threshold | 55%       | -         | -         |
| Liquidation Bonus     | 10%       | -         | -         |

Additionally [0xac140648435d03f784879cd789130F22Ef588Fcd](https://plasmascan.to/address/0xac140648435d03f784879cd789130F22Ef588Fcd) has been set as the emission admin for WXPL and the corresponding aToken.

## References

- Implementation: [AaveV3Plasma](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20251027_AaveV3Plasma_OnboardXPLOnAaveV3PlasmaInstance/AaveV3Plasma_OnboardXPLOnAaveV3PlasmaInstance_20251027.sol)
- Tests: [AaveV3Plasma](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20251027_AaveV3Plasma_OnboardXPLOnAaveV3PlasmaInstance/AaveV3Plasma_OnboardXPLOnAaveV3PlasmaInstance_20251027.t.sol)
- Snapshot: Direct-to-AIP
- [Discussion](https://governance.aave.com/t/direct-to-aip-onboard-xpl-on-aave-v3-plasma-instance/23197)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
