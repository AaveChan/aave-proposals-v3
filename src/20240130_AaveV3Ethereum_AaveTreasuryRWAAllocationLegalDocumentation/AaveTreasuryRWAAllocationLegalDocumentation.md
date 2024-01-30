---
title: "Aave Treasury RWA Allocation - Legal documentation"
author: "@Khan - Centrifuge (Powered By ACI Skywards)"
discussions: "https://governance.aave.com/t/arfc-aave-treasury-rwa-allocation/14790"
---

## Simple Summary

Following [AIP-331](https://app.aave.com/governance/proposal/331/) giving mandate to Centrifuge to create a Association to represent the Aave DAO off-chain, this AIP proposes the activation of the A-C Prime Foundation.

## Motivation

The A-C Prime Foundation is a Cayman island foundation company created by Centrifuge on behalf of the Aave DAO. It is the legal entity that will represent the Aave DAO off-chain. It will be the entity that will be able to sign contracts, hold assets, and enter into agreements on behalf of the Aave DAO.

This AIP proposes the activation of the A-C Prime Foundation. and the pre-approval of a investment in the Anemoy Liquid Treasury Fund 1 with an initial investment of the equivalent of $1m in shares.

## Specification

This AIP does not require any on-chain changes. It is a proposal to activate the A-C Prime Foundation.

To explicitly convey the Aave DAO approval via its governance, an event is created on-chain casting the following message:

```
   The Aave DAO approves and ratify the following documents :

    1) The articles of Association : https://cloudflare-ipfs.com/ipfs/QmXvgvLb87tFr8JmJjx7pAThAU1gAsHFLqdMa12zt2f6R6
    2) The Memorandum Of association : https://cloudflare-ipfs.com/ipfs/QmaB3Z4oN4Bcc4SEZ8WH2duKLpPqRYKqYC5TMqpQaddfrB
```

## References

- Implementation: [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240130_AaveV3Ethereum_AaveTreasuryRWAAllocationLegalDocumentation/AaveV3Ethereum_AaveTreasuryRWAAllocationLegalDocumentation_20240130.sol)
- Tests: [AaveV3Ethereum](https://github.com/bgd-labs/aave-proposals-v3/blob/main/src/20240130_AaveV3Ethereum_AaveTreasuryRWAAllocationLegalDocumentation/AaveV3Ethereum_AaveTreasuryRWAAllocationLegalDocumentation_20240130.t.sol)
- [Snapshot](https://snapshot.org/#/aave.eth/proposal/0x71db494e4b49e7533c5ccaa566686b2d045b0761cb3296a2d77af4b500566eb0)
- [Discussion](https://governance.aave.com/t/arfc-aave-treasury-rwa-allocation/14790)

## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
