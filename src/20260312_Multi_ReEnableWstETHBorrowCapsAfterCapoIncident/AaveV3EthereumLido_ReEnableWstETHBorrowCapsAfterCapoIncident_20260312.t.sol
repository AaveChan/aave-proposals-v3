// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3EthereumLido} from 'aave-address-book/AaveV3EthereumLido.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312} from './AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312.sol';

/**
 * @dev Test for AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20260312_Multi_ReEnableWstETHBorrowCapsAfterCapoIncident/AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312.t.sol -vv
 */
contract AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312_Test is
  ProtocolV3TestBase
{
  AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 24641997);
    proposal = new AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312',
      AaveV3EthereumLido.POOL,
      address(proposal)
    );
  }
}
