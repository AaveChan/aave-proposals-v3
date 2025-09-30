---
title: "Onboard wrsETH to Aave v3 Plasma Instance"
author: "Aave-chan Initiative"
discussions: "https://governance.aave.com/t/direct-to-aip-onboard-wrseth-to-aave-v3-plasma-instance/23183"
---

## Simple Summary

## Motivation

## Specification

The table below illustrates the configured risk parameters for **wrsETH**

| Parameter                 |                                      Value |
| ------------------------- | -----------------------------------------: |
| Isolation Mode            |                                      false |
| Borrowable                |                                   DISABLED |
| Collateral Enabled        |                                       true |
| Supply Cap (wrsETH)       |                                     20,000 |
| Borrow Cap (wrsETH)       |                                          1 |
| Debt Ceiling              |                                      USD 0 |
| LTV                       |                                     0.05 % |
| LT                        |                                      0.1 % |
| Liquidation Bonus         |                                        7 % |
| Liquidation Protocol Fee  |                                       10 % |
| Reserve Factor            |                                       20 % |
| Base Variable Borrow Rate |                                        0 % |
| Variable Slope 1          |                                       10 % |
| Variable Slope 2          |                                      300 % |
| Uoptimal                  |                                       45 % |
| Flashloanable             |                                    ENABLED |
| Siloed Borrowing          |                                   DISABLED |
| Borrowable in Isolation   |                                   DISABLED |
| Oracle                    | 0x3acFddf27b85B5f773B610c6F7e4420aeB1Df8dD |

**Pricefeed details**

| Parameter            |                                                                                                 Value |
| -------------------- | ----------------------------------------------------------------------------------------------------: |
| Oracle               | [Capped rsETH / ETH / USD ](https://plasmascan.to/address/0x3acFddf27b85B5f773B610c6F7e4420aeB1Df8dD) |
| BASE/USD Oracle      |         [Chainlink ETH/USD](https://plasmascan.to/address/0x43A7dd2125266c5c4c26EB86cd61241132426Fe7) |
| Ratio Provider       |  [WRSETH-ETH Exchange Rate](https://plasmascan.to/address/0xee3d5f65B03fabA5B2bF2eCE893399EA88b18e78) |
| Oracle Latest Answer |                                                                        (2025-09-30) USD 4388.18307326 |
| min snapshot         |                                                                                               14 days |
| max yearly growth    |                                                                                                 9.83% |

### Emode

| Parameter             | wrsETH | WETH |
| --------------------- | ------ | ---- |
| Collateral            | Yes    | No   |
| Borrowable            | No     | Yes  |
| Max LTV               | 93%    | -    |
| Liquidation Threshold | 95%    | -    |
| Liquidation Bonus     | 1.0%   | -    |

| Parameter             | wrsETH | USDT | USDE |
| --------------------- | ------ | ---- | ---- |
| Collateral            | Yes    | No   | No   |
| Borrowable            | No     | Yes  | Yes  |
| Max LTV               | 75%    | -    | -    |
| Liquidation Threshold | 78%    | -    | -    |
| Liquidation Bonus     | 7.5%   | -    | -    |

Additionally [0xac140648435d03f784879cd789130F22Ef588Fcd](https://plasmascan.to/address/0xac140648435d03f784879cd789130F22Ef588Fcd) has been set as the emission admin for wrsETH and the corresponding aToken.

## References

- Implementation: [AaveV3Plasma](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20250930_AaveV3Plasma_OnboardWrsETHToAaveV3PlasmaInstance/AaveV3Plasma_OnboardWrsETHToAaveV3PlasmaInstance_20250930.sol)
- Tests: [AaveV3Plasma](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20250930_AaveV3Plasma_OnboardWrsETHToAaveV3PlasmaInstance/AaveV3Plasma_OnboardWrsETHToAaveV3PlasmaInstance_20250930.t.sol)
- Snapshot: Direct-to-AIP
- [Discussion](https://governance.aave.com/t/direct-to-aip-onboard-wrseth-to-aave-v3-plasma-instance/23183)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
