// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovV3Helpers, IPayloadsControllerCore, PayloadsControllerUtils} from 'aave-helpers/src/GovV3Helpers.sol';
import {GovernanceV3Ethereum} from 'aave-address-book/GovernanceV3Ethereum.sol';

import {EthereumScript, PlasmaScript, MantleScript} from 'solidity-utils/contracts/utils/ScriptUtils.sol';
import {AaveV3Ethereum_ChangeOfSupplyCapsAndEModeAdjustments_20260410} from './AaveV3Ethereum_ChangeOfSupplyCapsAndEModeAdjustments_20260410.sol';
import {AaveV3Plasma_ChangeOfSupplyCapsAndEModeAdjustments_20260410} from './AaveV3Plasma_ChangeOfSupplyCapsAndEModeAdjustments_20260410.sol';
import {AaveV3Mantle_ChangeOfSupplyCapsAndEModeAdjustments_20260410} from './AaveV3Mantle_ChangeOfSupplyCapsAndEModeAdjustments_20260410.sol';

/**
 * @dev Deploy Ethereum
 * deploy-command: make deploy-ledger contract=src/20260410_Multi_ChangeOfSupplyCapsAndEModeAdjustments/ChangeOfSupplyCapsAndEModeAdjustments_20260410.s.sol:DeployEthereum chain=mainnet
 * verify-command: FOUNDRY_PROFILE=deploy npx catapulta-verify -b broadcast/ChangeOfSupplyCapsAndEModeAdjustments_20260410.s.sol/1/run-latest.json
 */
contract DeployEthereum is EthereumScript {
  function run() external broadcast {
    // deploy payloads
    address payload0 = GovV3Helpers.deployDeterministic(
      type(AaveV3Ethereum_ChangeOfSupplyCapsAndEModeAdjustments_20260410).creationCode
    );

    // compose action
    IPayloadsControllerCore.ExecutionAction[]
      memory actions = new IPayloadsControllerCore.ExecutionAction[](1);
    actions[0] = GovV3Helpers.buildAction(payload0);

    // register action at payloadsController
    GovV3Helpers.createPayload(actions);
  }
}

/**
 * @dev Deploy Plasma
 * deploy-command: make deploy-ledger contract=src/20260410_Multi_ChangeOfSupplyCapsAndEModeAdjustments/ChangeOfSupplyCapsAndEModeAdjustments_20260410.s.sol:DeployPlasma chain=plasma
 * verify-command: FOUNDRY_PROFILE=deploy npx catapulta-verify -b broadcast/ChangeOfSupplyCapsAndEModeAdjustments_20260410.s.sol/9745/run-latest.json
 */
contract DeployPlasma is PlasmaScript {
  function run() external broadcast {
    // deploy payloads
    address payload0 = GovV3Helpers.deployDeterministic(
      type(AaveV3Plasma_ChangeOfSupplyCapsAndEModeAdjustments_20260410).creationCode
    );

    // compose action
    IPayloadsControllerCore.ExecutionAction[]
      memory actions = new IPayloadsControllerCore.ExecutionAction[](1);
    actions[0] = GovV3Helpers.buildAction(payload0);

    // register action at payloadsController
    GovV3Helpers.createPayload(actions);
  }
}

/**
 * @dev Deploy Mantle
 * deploy-command: make deploy-ledger contract=src/20260410_Multi_ChangeOfSupplyCapsAndEModeAdjustments/ChangeOfSupplyCapsAndEModeAdjustments_20260410.s.sol:DeployMantle chain=mantle
 * verify-command: FOUNDRY_PROFILE=deploy npx catapulta-verify -b broadcast/ChangeOfSupplyCapsAndEModeAdjustments_20260410.s.sol/5000/run-latest.json
 */
contract DeployMantle is MantleScript {
  function run() external broadcast {
    // deploy payloads
    address payload0 = GovV3Helpers.deployDeterministic(
      type(AaveV3Mantle_ChangeOfSupplyCapsAndEModeAdjustments_20260410).creationCode
    );

    // compose action
    IPayloadsControllerCore.ExecutionAction[]
      memory actions = new IPayloadsControllerCore.ExecutionAction[](1);
    actions[0] = GovV3Helpers.buildAction(payload0);

    // register action at payloadsController
    GovV3Helpers.createPayload(actions);
  }
}

/**
 * @dev Create Proposal
 * command: make deploy-ledger contract=src/20260410_Multi_ChangeOfSupplyCapsAndEModeAdjustments/ChangeOfSupplyCapsAndEModeAdjustments_20260410.s.sol:CreateProposal chain=mainnet
 */
contract CreateProposal is EthereumScript {
  function run() external {
    // create payloads
    PayloadsControllerUtils.Payload[] memory payloads = new PayloadsControllerUtils.Payload[](3);

    // compose actions for validation
    {
      IPayloadsControllerCore.ExecutionAction[]
        memory actionsEthereum = new IPayloadsControllerCore.ExecutionAction[](1);
      actionsEthereum[0] = GovV3Helpers.buildAction(
        type(AaveV3Ethereum_ChangeOfSupplyCapsAndEModeAdjustments_20260410).creationCode
      );
      payloads[0] = GovV3Helpers.buildMainnetPayload(vm, actionsEthereum);
    }

    {
      IPayloadsControllerCore.ExecutionAction[]
        memory actionsPlasma = new IPayloadsControllerCore.ExecutionAction[](1);
      actionsPlasma[0] = GovV3Helpers.buildAction(
        type(AaveV3Plasma_ChangeOfSupplyCapsAndEModeAdjustments_20260410).creationCode
      );
      payloads[1] = GovV3Helpers.buildPlasmaPayload(vm, actionsPlasma);
    }

    {
      IPayloadsControllerCore.ExecutionAction[]
        memory actionsMantle = new IPayloadsControllerCore.ExecutionAction[](1);
      actionsMantle[0] = GovV3Helpers.buildAction(
        type(AaveV3Mantle_ChangeOfSupplyCapsAndEModeAdjustments_20260410).creationCode
      );
      payloads[2] = GovV3Helpers.buildMantlePayload(vm, actionsMantle);
    }

    // create proposal
    vm.startBroadcast();
    GovV3Helpers.createProposal(
      vm,
      payloads,
      GovernanceV3Ethereum.VOTING_PORTAL_ETH_AVAX,
      GovV3Helpers.ipfsHashFile(
        vm,
        'src/20260410_Multi_ChangeOfSupplyCapsAndEModeAdjustments/ChangeOfSupplyCapsAndEModeAdjustments.md'
      )
    );
  }
}
