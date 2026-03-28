---
title: "Listing PT Strata 25JUN2026"
author: "Aave Chan Initiative @aci"
discussions: "https://governance.aave.com/t/direct-to-aip-onboard-strata-srusde-june-expiry-pt-tokens-to-v3-core-instance/24313"
---

## Simple Summary

This proposal seeks to onboard Strata srUSDe June PT tokens to the Aave V3 Core Instance.

## Motivation

Given both the popularity of PT token collateral on Aave and the adoption of the srUSDe PT token by LPs on Pendle and successful onboarding of past srUSDe PT tokens, we believe that Aave users would welcome a renewal since new maturity is deployed.

## Specification

The table below illustrates the configured risk parameters for **PT_srUSDe_25JUN2026**

| Parameter                        |      Value |
| -------------------------------- | ---------: |
| Isolation Mode                   |      false |
| Borrowable                       |   DISABLED |
| Collateral Enabled               |      false |
| Supply Cap (PT_srUSDe_25JUN2026) | 30,000,000 |
| Borrow Cap (PT_srUSDe_25JUN2026) |          1 |
| Debt Ceiling                     |      USD 0 |
| LTV                              |        0 % |
| LT                               |        0 % |
| Liquidation Bonus                |        0 % |
| Liquidation Protocol Fee         |       10 % |
| Reserve Factor                   |       45 % |
| Base Variable Borrow Rate        |        0 % |
| Variable Slope 1                 |       10 % |
| Variable Slope 2                 |      300 % |
| Uoptimal                         |       45 % |
| Flashloanable                    |    ENABLED |
| Siloed Borrowing                 |   DISABLED |
| Borrowable in Isolation          |   DISABLED |

### Price Feed

For pricing PT-srUSDe-25JUN2026 on Aave, the [dynamic linear discount rate oracle](https://governance.aave.com/t/arfc-onboard-pendle-pt-tokens-to-aave-v3-core-instance/20541/5) developed by BGD Labs is recommended, consistent with the approach used for the April maturity.

The oracle prices the PT as a zero-coupon bond against the capped USDT/USD Chainlink feed, applying a linear discount that decays to par at maturity.

#### Linear Discount Rate Oracle

| **Parameter**              | **Value**                                                                                                                                    |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Oracle                     | [PT Capped srUSDe USDT/USD linear discount 25JUN2026 ](https://etherscan.io/address/0x9f336eb940730596548c342a8bf1fc530b10cc96#readContract) |
| initialDiscountRatePerYear | 4.6061%                                                                                                                                      |
| maxDiscountRatePerYear     | 16.6634%                                                                                                                                     |
| Last answer (March 28th)   | 98814596 ($0.98814596)                                                                                                                       |
| Capped USDT/USD            | [Capped USDT/USD](https://etherscan.io/address/0x260326c220E469358846b187eE53328303Efe19C#readContract)                                      |

### PT-srUSDe Stablecoins E-mode

| **Asset**         | **PT-srUSDe-25JUN2026** | **PT-srUSDe-2APR2026** | **sUSDe**              | **USDT** | **USDe** | **USDC** |
| ----------------- | ----------------------- | ---------------------- | ---------------------- | -------- | -------- | -------- |
| Collateral        | Yes                     | Yes                    | Yes                    | No       | No       | No       |
| Borrowable        | No                      | No                     | No                     | Yes      | Yes      | Yes      |
| LTV               | Subject to Risk Oracle  | Subject to Risk Oracle | Subject to Risk Oracle | -        | -        | -        |
| LT                | Subject to Risk Oracle  | Subject to Risk Oracle | Subject to Risk Oracle | -        | -        | -        |
| Liquidation Bonus | Subject to Risk Oracle  | Subject to Risk Oracle | Subject to Risk Oracle | -        | -        | -        |

### PT-srUSDe USDe E-mode

| **Asset**         | **PT-srUSDe-25JUN2026** | **PT-srUSDe-2APR2026** | **sUSDe**              | **USDe** |
| ----------------- | ----------------------- | ---------------------- | ---------------------- | -------- |
| Collateral        | Yes                     | Yes                    | Yes                    | No       |
| Borrowable        | No                      | No                     | No                     | Yes      |
| LTV               | Subject to Risk Oracle  | Subject to Risk Oracle | Subject to Risk Oracle | -        |
| LT                | Subject to Risk Oracle  | Subject to Risk Oracle | Subject to Risk Oracle | -        |
| Liquidation Bonus | Subject to Risk Oracle  | Subject to Risk Oracle | Subject to Risk Oracle | -        |

### E-mode setups

| **Parameter** | **Value**   | **Value** |
| ------------- | ----------- | --------- |
| E-Mode        | Stablecoins | USDe      |
| LTV           | 90%         | 91.2%     |
| LT            | 92%         | 93.2%     |
| LB            | 4.3%        | 3.3%      |

Additionally [0xac140648435d03f784879cd789130F22Ef588Fcd](https://etherscan.io/address/0xac140648435d03f784879cd789130F22Ef588Fcd) has been set as the emission admin for PT_srUSDe_25JUN2026 and the corresponding aToken.

### Useful Links

https://docs.pendle.finance/ProtocolMechanics/YieldTokenization/PT

### Disclaimer

ACI is not directly affiliated with Pendle and did not receive compensation for the creation of this proposal. Some ACI employees may hold Pendle tokens.

## References

- Implementation: [AaveV3Ethereum](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260324_AaveV3Ethereum_ListingPTSrUsde25JUN2026/AaveV3Ethereum_ListingPTSrUsde25JUN2026_20260324.sol)
- Tests: [AaveV3Ethereum](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260324_AaveV3Ethereum_ListingPTSrUsde25JUN2026/AaveV3Ethereum_ListingPTSrUsde25JUN2026_20260324.t.sol)
- Snapshot: Direct-to-AIP
- [Discussion](https://governance.aave.com/t/direct-to-aip-onboard-strata-srusde-june-expiry-pt-tokens-to-v3-core-instance/24313)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
