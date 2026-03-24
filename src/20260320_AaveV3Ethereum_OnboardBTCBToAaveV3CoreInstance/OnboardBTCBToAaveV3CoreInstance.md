---
title: "Onboard BTC.b to Aave V3 Core Instance"
author: "Aavechan Initiative @aci"
discussions: "https://governance.aave.com/t/direct-to-aip-onboard-btc-b-to-aave-v3-core-instance/23357"
---

## Simple Summary

This proposal seeks to onboard BTC.b to the Aave V3 deployment on the Core Instance.

As the onboarding of BTC.b has already been approved and executed on the Avalanche Aave V3 instance, this proposal follows the Direct-to-AIP path to extend BTC.b support to the Core instance.

## Motivation

BTC.b is a liquid bridged Bitcoin token originally established by Ava Labs and recently transitioned to Lombard’s technical infrastructure, offering users access to native BTC liquidity while maintaining DeFi composability. The migration to Lombard’s architecture preserves token addresses, ensures full continuity for existing integrations and users, and enhances scalability and security. Its integration on Aave V3 Avalanche has proven successful in terms of risk profile and utility.

Given that BTC.b has already passed governance and risk assessments for the Avalanche Instance, and Lombard’s technical infrastructure has also been approved through onboarding of LBTC on the Core Instance, this proposal aims to onboard BTC.b to the V3 Core Instance under the same configuration parameters used for Avalanche, adjusted for market conditions where appropriate.

## Specification

The table below illustrates the configured risk parameters for **BTCb**

| Parameter                 |    Value |
| ------------------------- | -------: |
| Isolation Mode            |    false |
| Borrowable                | DISABLED |
| Collateral Enabled        |     true |
| Supply Cap (BTCb)         |      600 |
| Borrow Cap (BTCb)         |        1 |
| Debt Ceiling              |    USD 0 |
| LTV                       |     73 % |
| LT                        |     78 % |
| Liquidation Bonus         |    7.5 % |
| Liquidation Protocol Fee  |     10 % |
| Reserve Factor            |     50 % |
| Base Variable Borrow Rate |      0 % |
| Variable Slope 1          |     10 % |
| Variable Slope 2          |    300 % |
| Uoptimal                  |     45 % |
| Flashloanable             |  ENABLED |
| Siloed Borrowing          | DISABLED |
| Borrowable in Isolation   | DISABLED |

### Oracle

[chainlink SVR BTC/USD](https://etherscan.io/address/0xb41E773f507F7a7EA890b1afB7d2b660c30C8B0A)

Additionally [0xac140648435d03f784879cd789130F22Ef588Fcd](https://etherscan.io/address/0xac140648435d03f784879cd789130F22Ef588Fcd) has been set as the emission admin for BTCb and the corresponding aToken.

## References

- Implementation: [AaveV3Ethereum](https://github.com/aave-dao/aave-proposals-v3/blob/1f810a66b4bf85e6b9ad1fe5a2fe2f5c08f5486b/src/20260320_AaveV3Ethereum_OnboardBTCBToAaveV3CoreInstance/AaveV3Ethereum_OnboardBTCBToAaveV3CoreInstance_20260320.sol)
- Tests: [AaveV3Ethereum](https://github.com/aave-dao/aave-proposals-v3/blob/1f810a66b4bf85e6b9ad1fe5a2fe2f5c08f5486b/src/20260320_AaveV3Ethereum_OnboardBTCBToAaveV3CoreInstance/AaveV3Ethereum_OnboardBTCBToAaveV3CoreInstance_20260320.t.sol)
- Snapshot: Direct-to-AIP
- [Discussion](https://governance.aave.com/t/direct-to-aip-onboard-btc-b-to-aave-v3-core-instance/23357)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
