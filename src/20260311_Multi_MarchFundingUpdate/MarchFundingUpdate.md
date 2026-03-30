---
title: "March Funding Update"
author: "TokenLogic"
discussions: "https://governance.aave.com/t/direct-to-aip-march-2026-funding-update/24225"
---

## Simple Summary

This publication presents the March Funding Update, consisting of the following key activities:

- Acquire GHO to support runway;
- Consolidate assets on Ethereum and,
- Create Allowances to support Operations.

## Motivation

This publication addresses near-term operational requirements, consolidates asset holdings, and facilitates enabling the MainnetSwapSteward to utilise ETH to acquire AAVE and/or GHO to support buyback and runway initiatives.

The MainnetSwapSteward will continue executing a rolling GHO acquisition strategy to maintain adequate runway and support AAVE buybacks, while preserving sufficient budget to fund ongoing growth initiatives.

Reimburse TokenLogic for costs incurred facilitating the audit of two PRs intended to support the sGHO upgrade. The first PR reviewed was sGHO developed by kpk, which received updates to address outstanding comments, and a follow-up order was issued. The second PR was sGhoSteward, developed by BGD Labs to manage the rate at which GHO interest accrues on the sGho contract. The total cost of Sherlock’s audit was 24,900 USDC.

## Specification

### Mainnet

Update Aave Swapper Permission
To support continued AAVE and GHO Buybacks, extend the following permissions to the SwapStewardContract contract.

Swap From Asset: `wETH`
Swap To Asset: `GHO`, `AAVE`, `USDC`, `USDT`
Increase WETH budget by 3,000 WETH
Increase USDT budget by 2,000,000 USDT

Reimburse 24,900 GHO to TokenLogic for sGHO audit expenses incurred.

Asset: GHO: `0x40D16FC0246aD3160Ccc09B8D0D3A2cD28aE6C2f`
Amount: 24,900
Spender: TokenLogic `0xAA088dfF3dcF619664094945028d44E779F19894`

Deposit idle ETH on the Collector to aWETH on Aave V3.

### Polygon

With EURS trading above the peg, EURS will be withdrawn from Aave on Polygon and bridged to mainnet.

Create an Allowance that enables the AFC to receive EURS, convert it to USDC, and bridge the proceeds to Ethereum.

Amount: 79,000 aEURS `0x38d693cE1dF5AaDF7bC62595A37D667aD57922e5`
Spender: AFC `0x22740deBa78d5a0c24C58C740e3715ec29de1bFa`
Method: `approve()` above assets on the Aave Collector contract to the AFC address

Bridge all of the following via the AavePolygonEthereumBridge:

- DAI
- WBTC
- USDC.e
- WETH

To support bridging assets not supported by the above, an allowance will be created, enabling the AFC to bridge the following assets from Polygon to Ethereum.

Amount: 125,000 aUSDCn `0xA4D94019934D8333Ef880ABFFbF2FDd611C762BD`
Amount: 230,000 aUSDT0 (split between v2/v3) `0x6ab707Aca953eDAeFBc4fD23bA73294241490620`
Spender: AFC `0x22740deBa78d5a0c24C58C740e3715ec29de1bFa`
Method: `approve()` the above assets on the Aave Collector contract to the AFC address

### Base

To support asset bridging, an Allowance will be created, enabling the AFC to bridge the following assets from Base to Ethereum.

Amount: 1,300,000 aUSDC `0x4e65fE4DbA92790696d040ac24Aa414708F5c0AB`
Spender: AFC `0x22740deBa78d5a0c24C58C740e3715ec29de1bFa`
Method: `approve()` the above assets on the Aave Collector contract to the AFC address

### Arbitrum

To support asset bridging, an Allowance will be created, enabling the AFC to bridge the following assets from Arbitrum to Ethereum.

Amount: 3,300,000 aUSDCn `0x724dc807b04555b71ed48a6896b6F41593b8C637`
Amount: 1,300,000 aUSDT0 `0x6ab707Aca953eDAeFBc4fD23bA73294241490620`
Amount: 37 aWstETH `0x513c7E3a9c69cA3e22550eF58AC1C0088e918FFf`
Spender: AFC `0x22740deBa78d5a0c24C58C740e3715ec29de1bFa`
Method: `approve()` the above assets on the Aave Collector contract to the AFC address.

Bridge all of the following via the AaveArbitrumEthereumBridge:

- DAI
- LINK
- USDC.e

## References

- Implementation: [AaveV3Ethereum](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260311_Multi_MarchFundingUpdate/AaveV3Ethereum_MarchFundingUpdate_20260311.sol), [AaveV3Polygon](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260311_Multi_MarchFundingUpdate/AaveV3Polygon_MarchFundingUpdate_20260311.sol), [AaveV3Arbitrum](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260311_Multi_MarchFundingUpdate/AaveV3Arbitrum_MarchFundingUpdate_20260311.sol), [AaveV3Base](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260311_Multi_MarchFundingUpdate/AaveV3Base_MarchFundingUpdate_20260311.sol)
- Tests: [AaveV3Ethereum](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260311_Multi_MarchFundingUpdate/AaveV3Ethereum_MarchFundingUpdate_20260311.t.sol), [AaveV3Polygon](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260311_Multi_MarchFundingUpdate/AaveV3Polygon_MarchFundingUpdate_20260311.t.sol), [AaveV3Arbitrum](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260311_Multi_MarchFundingUpdate/AaveV3Arbitrum_MarchFundingUpdate_20260311.t.sol), [AaveV3Base](https://github.com/aave-dao/aave-proposals-v3/blob/main/src/20260311_Multi_MarchFundingUpdate/AaveV3Base_MarchFundingUpdate_20260311.t.sol)
- Snapshot: Direct-to-AIP
- [Discussion](https://governance.aave.com/t/direct-to-aip-march-2026-funding-update/24225)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
