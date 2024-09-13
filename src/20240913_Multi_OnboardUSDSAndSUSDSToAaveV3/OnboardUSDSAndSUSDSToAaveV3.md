---
title: "Onboard USDS and sUSDS to Aave v3"
author: "Aave Chan Initiative"
discussions: "https://governance.aave.com/t/arfc-onboard-usds-and-susds-to-aave-v3/18987"
snapshot: "TODO"
---

## Simple Summary

This proposal aims to onboard USDS and sUSDS, the rebranded DAI and sDAI tokens to Aave v3. In addition, DAI and sDAI caps are lowered.

## Motivation

DAI has been a cornerstone asset in the Aave ecosystem, with a long and successful history of supply across various versions of the protocol. MakerDAO marked a significant milestone with a rebranded to Sky, introducing USDS and sUSDS as the new iterations of DAI and sDAI. Given the established track record and widespread adoption of their predecessors, we propose to onboard these new assets to Aave v3.

By integrating USDS and sUSDS into Aave v3, we aim to maintain continuity for users who have relied on DAI and sDAI while embracing the evolution of these assets under the Sky brand.

### Benefits of listing USDS and sUSDS

DAI and sDAI have been a success and in order to not lose marketshare to other protocols as some DAI holders migrate to the new tokens, it is in the DAO’s interest to capture this demand. As there will be incentive programs running this also provides the opportunity for Aave users to benefit from these.

## Specification

The table below illustrates the configured risk parameters for **sUSDS**

| Parameter                 |                                      Value |
| ------------------------- | -----------------------------------------: |
| Isolation Mode            |                                      false |
| Borrowable                |                                   DISABLED |
| Collateral Enabled        |                                       true |
| Supply Cap (sUSDS)        |                                 35,000,000 |
| Borrow Cap (sUSDS)        |                                          0 |
| Debt Ceiling              |                                      USD 0 |
| LTV                       |                                       75 % |
| LT                        |                                       78 % |
| Liquidation Bonus         |                                      7.5 % |
| Liquidation Protocol Fee  |                                       10 % |
| Reserve Factor            |                                       10 % |
| Base Variable Borrow Rate |                                        0 % |
| Variable Slope 1          |                                        0 % |
| Variable Slope 2          |                                        0 % |
| Uoptimal                  |                                       90 % |
| Stable Borrowing          |                                   DISABLED |
| Flashloanable             |                                    ENABLED |
| Siloed Borrowing          |                                   DISABLED |
| Borrowable in Isolation   |                                   DISABLED |
| Oracle                    | 0x4b764F16B18e4ED8deB7E74258B0f01BE93D3a38 |

The table below illustrates the configured risk parameters for **USDS**

| Parameter                 |                                      Value |
| ------------------------- | -----------------------------------------: |
| Isolation Mode            |                                      false |
| Borrowable                |                                    ENABLED |
| Collateral Enabled        |                                       true |
| Supply Cap (USDS)         |                                 50,000,000 |
| Borrow Cap (USDS)         |                                 45,000,000 |
| Debt Ceiling              |                                      USD 0 |
| LTV                       |                                       63 % |
| LT                        |                                       72 % |
| Liquidation Bonus         |                                      7.5 % |
| Liquidation Protocol Fee  |                                       10 % |
| Reserve Factor            |                                       25 % |
| Base Variable Borrow Rate |                                        0 % |
| Variable Slope 1          |                                      5.5 % |
| Variable Slope 2          |                                       75 % |
| Uoptimal                  |                                       90 % |
| Stable Borrowing          |                                   DISABLED |
| Flashloanable             |                                    ENABLED |
| Siloed Borrowing          |                                   DISABLED |
| Borrowable in Isolation   |                                   DISABLED |
| Oracle                    | 0x13Bbe098309ca4F847baE2f512f594Af68cC7B59 |

Additionally, we recommend the following supply and borrow cap changes on Ethereum.

|      | Current Supply Cap | Rec. Supply Cap | Current Borrow Cap | Rec. Borrow Cap |
| ---- | ------------------ | --------------- | ------------------ | --------------- |
| sDAI | 340,000,000        | 70,000,000      | -                  | -               |
| DAI  | 338,000,000        | 150,000,000     | 271,000,000        | 140,000,000     |

### CAPO

For USDS, we recommend aligning to stablecoin markets on Aave.

Price Cap:
4%

For sUSDS:

| MINIMUM_SNAPSHOT_DELAY | ratioReferenceTime | maxYearlyRatioGrowthPercent |
| ---------------------- | ------------------ | --------------------------- |
| 4 days                 | monthly            | 15%                         |

## References

- Implementation: [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240913_Multi_OnboardUSDSAndSUSDSToAaveV3/AaveV3Ethereum_OnboardUSDSAndSUSDSToAaveV3_20240913.sol), [AaveV3EthereumLido](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240913_Multi_OnboardUSDSAndSUSDSToAaveV3/AaveV3EthereumLido_OnboardUSDSAndSUSDSToAaveV3_20240913.sol)
- Tests: [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240913_Multi_OnboardUSDSAndSUSDSToAaveV3/AaveV3Ethereum_OnboardUSDSAndSUSDSToAaveV3_20240913.t.sol), [AaveV3EthereumLido](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240913_Multi_OnboardUSDSAndSUSDSToAaveV3/AaveV3EthereumLido_OnboardUSDSAndSUSDSToAaveV3_20240913.t.sol)
- [Snapshot](TODO)
- [Discussion](https://governance.aave.com/t/arfc-onboard-usds-and-susds-to-aave-v3/18987)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
