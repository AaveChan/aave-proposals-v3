// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovV3Helpers, IPayloadsControllerCore, PayloadsControllerUtils} from 'aave-helpers/src/GovV3Helpers.sol';
import {GovernanceV3Ethereum} from 'aave-address-book/GovernanceV3Ethereum.sol';

import {EthereumScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';
import {AaveV3Ethereum_YearnStuff_20250926, AaveV3Ethereum_YearnStuff_part2_20250926} from './AaveV3Ethereum_YearnStuff_20250926.sol';

library PayloadsToDeploy {
  function part1() internal returns (address) {
    uint256 estimatedOnchainExecution = block.timestamp +
      7 days + // governance
      1 days + // executor delay
      2 days; // margin for error (time between payload deployment & proposal creation)
    return
      GovV3Helpers.deployDeterministic(
        abi.encodePacked(
          type(AaveV3Ethereum_YearnStuff_20250926).creationCode,
          abi.encode(estimatedOnchainExecution)
        )
      );
  }

  function part2(address payload) internal returns (address) {
    return
      GovV3Helpers.deployDeterministic(
        abi.encodePacked(
          type(AaveV3Ethereum_YearnStuff_part2_20250926).creationCode,
          abi.encode(payload)
        )
      );
  }
}

/**
 * @dev Deploy Ethereum
 * deploy-command: make deploy-ledger contract=src/20250926_AaveV3Ethereum_YearnStuff/YearnStuff_20250926.s.sol:DeployEthereum chain=mainnet
 * verify-command: FOUNDRY_PROFILE=deploy npx catapulta-verify -b broadcast/YearnStuff_20250926.s.sol/1/run-latest.json
 */
contract DeployEthereum is EthereumScript {
  function run() external broadcast {
    // deploy payloads
    address payload0 = PayloadsToDeploy.part1();
    address payload1 = PayloadsToDeploy.part2(address(payload0));

    // compose action
    IPayloadsControllerCore.ExecutionAction[]
      memory actions0 = new IPayloadsControllerCore.ExecutionAction[](1);
    actions0[0] = GovV3Helpers.buildAction(payload0);

    IPayloadsControllerCore.ExecutionAction[]
      memory actions1 = new IPayloadsControllerCore.ExecutionAction[](1);
    actions1[0] = GovV3Helpers.buildAction(payload1);

    // register action at payloadsController
    GovV3Helpers.createPayload(actions0);
    GovV3Helpers.createPayload(actions1);
  }
}

/**
 * @dev Create Proposal
 * command: make deploy-ledger contract=src/20250926_AaveV3Ethereum_YearnStuff/YearnStuff_20250926.s.sol:CreateProposal chain=mainnet
 */
contract CreateProposal is EthereumScript {
  function run() external {
    // create payloads
    PayloadsControllerUtils.Payload[] memory payloads = new PayloadsControllerUtils.Payload[](2);

    // compose actions for validation
    {
      IPayloadsControllerCore.ExecutionAction[]
        memory actionsEthereum0 = new IPayloadsControllerCore.ExecutionAction[](1);
      actionsEthereum0[0] = GovV3Helpers.buildAction(address(0)); // either we hardcode this or we hardcode the estimatedOnchainExecution
      payloads[0] = GovV3Helpers.buildMainnetPayload(vm, actionsEthereum0);

      IPayloadsControllerCore.ExecutionAction[]
        memory actionsEthereum1 = new IPayloadsControllerCore.ExecutionAction[](1);
      actionsEthereum1[0] = GovV3Helpers.buildAction(address(0)); // either we hardcode this or we hardcode the estimatedOnchainExecution
      payloads[1] = GovV3Helpers.buildMainnetPayload(vm, actionsEthereum1);
    }

    // create proposal
    vm.startBroadcast();
    GovV3Helpers.createProposal(
      vm,
      payloads,
      GovernanceV3Ethereum.VOTING_PORTAL_ETH_POL,
      GovV3Helpers.ipfsHashFile(vm, 'src/20250926_AaveV3Ethereum_YearnStuff/YearnStuff.md')
    );
  }
}
