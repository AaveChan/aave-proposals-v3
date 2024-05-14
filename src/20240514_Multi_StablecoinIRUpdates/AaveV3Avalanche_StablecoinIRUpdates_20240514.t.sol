// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Avalanche} from 'aave-address-book/AaveV3Avalanche.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {AaveV3Avalanche_StablecoinIRUpdates_20240514} from './AaveV3Avalanche_StablecoinIRUpdates_20240514.sol';

/**
 * @dev Test for AaveV3Avalanche_StablecoinIRUpdates_20240514
 * command: FOUNDRY_PROFILE=avalanche forge test --match-path=src/20240514_Multi_StablecoinIRUpdates/AaveV3Avalanche_StablecoinIRUpdates_20240514.t.sol -vv
 */
contract AaveV3Avalanche_StablecoinIRUpdates_20240514_Test is ProtocolV3TestBase {
  AaveV3Avalanche_StablecoinIRUpdates_20240514 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('avalanche'), 45438858);
    proposal = new AaveV3Avalanche_StablecoinIRUpdates_20240514();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Avalanche_StablecoinIRUpdates_20240514',
      AaveV3Avalanche.POOL,
      address(proposal)
    );
  }
}
