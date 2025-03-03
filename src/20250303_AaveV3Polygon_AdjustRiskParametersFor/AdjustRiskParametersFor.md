---
title: "Adjust Risk Parameters for"
author: "Aave-Chan Initiative Aave V3 on Polygon"
discussions: TODO
---

## Simple Summary

This proposal addendum seeks governance approval for adjustment of the AIP 254 to reintroduce LTV for non-bridged stablecoins in Aave Polygon V3.

## Motivation

Based on service provider and community feedback, this proposal aims to adjust AIP-254 to reintroduce LTV for non-bridged stablecoins in Aave Polygon V3, as they carry no rehypothecation risk. It also reduces stablecoin Emode LT in Aave Polygon V3 due to insufficient stablecoin/stablecoin trading volume to justify the current risk level.

The Aave V3 infrastructure forces users with LTV0 assets as collateral to withdraw them before performing certain protocol actions, creating a poor user experience. Implementing a very low LTV (such as 1%) for bridged stablecoins would virtually eliminate risk while maintaining a better user experience.

USDT is scheduled to migrate to the USDT0 standard soon, as recently implemented on networks like Arbitrum. To promote stablecoin diversity and taking an optimistic view on the reduction of bridge risk for this asset, this proposal aims to restore an LTV for USDT.

## Specification

Aave Polygon V3 stablecoins suggested risk parameters

| **Deployment** | **Asset** | **Current LTV** | **Proposed LTV** |
| -------------- | --------- | --------------- | ---------------- |
| Polygon V3     | USDT      | 0%              | 70%              |
| Polygon V3     | USDC      | 0%              | 70%              |

---

Aave Polygon Stablecoin emode

- Make all stablecoins non-borrowable in emode

| **Current LTV** | **Proposed LTV** | **Current LT** | **Proposed LT** |
| --------------- | ---------------- | -------------- | --------------- |
| 93%             | 91.25%           | 95%            | 94.25%          |

## References

- Implementation: [AaveV3Polygon](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20250303_AaveV3Polygon_AdjustRiskParametersFor/AaveV3Polygon_AdjustRiskParametersFor_20250303.sol)
- Tests: [AaveV3Polygon](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20250303_AaveV3Polygon_AdjustRiskParametersFor/AaveV3Polygon_AdjustRiskParametersFor_20250303.t.sol)
- Snapshot: Direct-to-AIP
- [Discussion](TODO)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
