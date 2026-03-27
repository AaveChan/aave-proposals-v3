---
title: "Listing PT Strata 25JUN2026"
author: "Aave Chan Initiative @aci"
discussions: "https://governance.aave.com/t/direct-to-aip-onboard-strata-srusde-june-expiry-pt-tokens-to-v3-core-instance/24313"
---

## Simple Summary

## Motivation

## Specification

The table below illustrates the configured risk parameters for **PT_srUSDe_25JUN2026**

| Parameter                        |                                      Value |
| -------------------------------- | -----------------------------------------: |
| Isolation Mode                   |                                      false |
| Borrowable                       |                                   DISABLED |
| Collateral Enabled               |                                      false |
| Supply Cap (PT_srUSDe_25JUN2026) |                                  1,000,000 |
| Borrow Cap (PT_srUSDe_25JUN2026) |                                          1 |
| Debt Ceiling                     |                                      USD 0 |
| LTV                              |                                        0 % |
| LT                               |                                        0 % |
| Liquidation Bonus                |                                        0 % |
| Liquidation Protocol Fee         |                                        0 % |
| Reserve Factor                   |                                       45 % |
| Base Variable Borrow Rate        |                                        0 % |
| Variable Slope 1                 |                                       10 % |
| Variable Slope 2                 |                                      300 % |
| Uoptimal                         |                                       45 % |
| Flashloanable                    |                                    ENABLED |
| Siloed Borrowing                 |                                   DISABLED |
| Borrowable in Isolation          |                                   DISABLED |
| Oracle                           | 0x0000000000000000000000000000000000000000 |

Additionally [0xac140648435d03f784879cd789130F22Ef588Fcd](https://etherscan.io/address/0xac140648435d03f784879cd789130F22Ef588Fcd) has been set as the emission admin for PT_srUSDe_25JUN2026 and the corresponding aToken.

## References

- Implementation: [AaveV3Ethereum](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260324_AaveV3Ethereum_ListingPTSrUsde25JUN2026/AaveV3Ethereum_ListingPTSrUsde25JUN2026_20260324.sol)
- Tests: [AaveV3Ethereum](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260324_AaveV3Ethereum_ListingPTSrUsde25JUN2026/AaveV3Ethereum_ListingPTSrUsde25JUN2026_20260324.t.sol)
- Snapshot: Direct-to-AIP
- [Discussion](https://governance.aave.com/t/direct-to-aip-onboard-strata-srusde-june-expiry-pt-tokens-to-v3-core-instance/24313)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
