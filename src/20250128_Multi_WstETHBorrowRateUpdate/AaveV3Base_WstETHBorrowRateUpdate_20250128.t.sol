// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Base} from 'aave-address-book/AaveV3Base.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Base_WstETHBorrowRateUpdate_20250128} from './AaveV3Base_WstETHBorrowRateUpdate_20250128.sol';

/**
 * @dev Test for AaveV3Base_WstETHBorrowRateUpdate_20250128
 * command: FOUNDRY_PROFILE=base forge test --match-path=src/20250128_Multi_WstETHBorrowRateUpdate/AaveV3Base_WstETHBorrowRateUpdate_20250128.t.sol -vv
 */
contract AaveV3Base_WstETHBorrowRateUpdate_20250128_Test is ProtocolV3TestBase {
  AaveV3Base_WstETHBorrowRateUpdate_20250128 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('base'), 25638941);
    proposal = new AaveV3Base_WstETHBorrowRateUpdate_20250128();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest('AaveV3Base_WstETHBorrowRateUpdate_20250128', AaveV3Base.POOL, address(proposal));
  }
}
