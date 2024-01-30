// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IProposalGenericExecutor} from 'aave-helpers/interfaces/IProposalGenericExecutor.sol';

/**
 * @title Aave Treasury RWA Allocation - Legal documentation
 * @author @Khan - Centrifuge (Powered By ACI Skywards)
 * - Snapshot: https://snapshot.org/#/aave.eth/proposal/0x71db494e4b49e7533c5ccaa566686b2d045b0761cb3296a2d77af4b500566eb0
 * - Discussion: https://governance.aave.com/t/arfc-aave-treasury-rwa-allocation/14790
 */
contract AaveV3Ethereum_AaveTreasuryRWAAllocationLegalDocumentation_20240130 is
  IProposalGenericExecutor
{
  event Decision(string agreed);

  function execute() external {
    // This AIP payload serves as a DAO resolution providing binding approval from the Aave DAO to bring about a real-world asset specialised single-purpose vehicle, and approve and ratify the following documents:
    // The Articles of Association and the Memorandum of Association
    emit Decision(
      'The Aave DAO approves and ratifies the following documents : \n\n\
      1) The Articles of Association : <https://cloudflare-ipfs.com/ipfs/QmXvgvLb87tFr8JmJjx7pAThAU1gAsHFLqdMa12zt2f6R6>\n\
      2) The Memorandum Of Association : <https://cloudflare-ipfs.com/ipfs/QmaB3Z4oN4Bcc4SEZ8WH2duKLpPqRYKqYC5TMqpQaddfrB>'

      //Schedule A of the Articles of Association provides that a specific DAO resolution is
      //required to approve “Completing the onboarding process for real-world asset investment
      //opportunities that require KYC/AML compliance”. Each specific RWA investment
      //requiring KYC will be subject to a DAO approval.
    );
  }
}
