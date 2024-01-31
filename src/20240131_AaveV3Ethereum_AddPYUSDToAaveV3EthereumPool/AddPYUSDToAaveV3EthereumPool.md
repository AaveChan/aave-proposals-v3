---
title: "Add PYUSD to Aave v3 Ethereum Pool"
author: "Aave Chan Initiative (ACI)"
discussions: "https://governance.aave.com/t/arfc-add-pyusd-to-aave-v3-ethereum-market/16218"
snapshot: "https://snapshot.org/#/aave.eth/proposal/0xb91949efad61b134b913d93b00f73ca8a122259e6d1458cf793f22a0eebfd5d5"
---

## Simple Summary

This AIP proposes the onboarding of the PYUSD stablecoin, minted by Paxos Trust Company, into the Aave V3 Ethereum pool.

## Motivation

PYUSD is a USD-pegged stablecoin minted through Paxos. While it’s still young, it has grown to a circulating supply of over $230M with strong peg resilience. Onboarding this asset into Aave will:

- Build synergies between Aave and PYUSD.
- Offer Aave users an additional stablecoin option.
- Strengthen the relationship between the PYUSD & the GHO stablecoin. (Trident may explore the deployment of a PYUSD/GHO pool)

We propose a PYUSD onboarding outside isolation mode but without collateral properties.

## Specification

Ticker: PYUSD
Contract address: [0x6c3ea9036406852006290770bedfcaba0e23a0e8](https://etherscan.io/token/0x6c3ea9036406852006290770bedfcaba0e23a0e8)
Price Feed: [0x8f1df6d7f2db73eece86a18b4381f4707b918fb1](https://etherscan.io/address/0x8f1df6d7f2db73eece86a18b4381f4707b918fb1)
The table below illustrates the configured risk parameters for **PYUSD**

| Parameter                          |                                      Value |
| ---------------------------------- | -----------------------------------------: |
| Isolation Mode                     |                                       true |
| Borrowable                         |                                    ENABLED |
| Collateral Enabled                 |                                       true |
| Supply Cap (PYUSD)                 |                                 10,000,000 |
| Borrow Cap (PYUSD)                 |                                  9,000,000 |
| Debt Ceiling                       |                                      USD 0 |
| LTV                                |                                        0 % |
| LT                                 |                                        0 % |
| Liquidation Bonus                  |                                        0 % |
| Liquidation Protocol Fee           |                                       10 % |
| Reserve Factor                     |                                       20 % |
| Base Variable Borrow Rate          |                                        0 % |
| Variable Slope 1                   |                                        6 % |
| Variable Slope 2                   |                                       80 % |
| Uoptimal                           |                                       80 % |
| Stable Borrowing                   |                                   DISABLED |
| Stable Slope1                      |                                       13 % |
| Stable Slope2                      |                                      300 % |
| Base Stable Rate Offset            |                                        3 % |
| Stable Rate Excess Offset          |                                        8 % |
| Optimal Stable To Total Debt Ratio |                                       20 % |
| Flashloanable                      |                                   DISABLED |
| Siloed Borrowing                   |                                   DISABLED |
| Borrowable in Isolation            |                                   DISABLED |
| Oracle                             | 0x8f1dF6D7F2db73eECE86a18b4381F4707b918FB1 |

## References

- Implementation: [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240131_AaveV3Ethereum_AddPYUSDToAaveV3EthereumPool/AaveV3Ethereum_AddPYUSDToAaveV3EthereumPool_20240131.sol)
- Tests: [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240131_AaveV3Ethereum_AddPYUSDToAaveV3EthereumPool/AaveV3Ethereum_AddPYUSDToAaveV3EthereumPool_20240131.t.sol)
- [Snapshot](https://snapshot.org/#/aave.eth/proposal/0xb91949efad61b134b913d93b00f73ca8a122259e6d1458cf793f22a0eebfd5d5)
- [Discussion](https://governance.aave.com/t/arfc-add-pyusd-to-aave-v3-ethereum-market/16218)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
