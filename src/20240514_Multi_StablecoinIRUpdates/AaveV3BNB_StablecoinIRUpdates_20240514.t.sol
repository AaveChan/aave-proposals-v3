// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3BNB} from 'aave-address-book/AaveV3BNB.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {AaveV3BNB_StablecoinIRUpdates_20240514} from './AaveV3BNB_StablecoinIRUpdates_20240514.sol';

/**
 * @dev Test for AaveV3BNB_StablecoinIRUpdates_20240514
 * command: FOUNDRY_PROFILE=bnb forge test --match-path=src/20240514_Multi_StablecoinIRUpdates/AaveV3BNB_StablecoinIRUpdates_20240514.t.sol -vv
 */
contract AaveV3BNB_StablecoinIRUpdates_20240514_Test is ProtocolV3TestBase {
  AaveV3BNB_StablecoinIRUpdates_20240514 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('bnb'), 38724367);
    proposal = new AaveV3BNB_StablecoinIRUpdates_20240514();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest('AaveV3BNB_StablecoinIRUpdates_20240514', AaveV3BNB.POOL, address(proposal));
  }
}
