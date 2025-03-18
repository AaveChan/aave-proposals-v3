// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Base} from 'aave-address-book/AaveV3Base.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Base_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase_20250318} from './AaveV3Base_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase_20250318.sol';

/**
 * @dev Test for AaveV3Base_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase_20250318
 * command: FOUNDRY_PROFILE=base forge test --match-path=src/20250318_Multi_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase/AaveV3Base_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase_20250318.t.sol -vv
 */
contract AaveV3Base_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase_20250318_Test is
  ProtocolV3TestBase
{
  AaveV3Base_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase_20250318
    internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('base'), 27772037);
    proposal = new AaveV3Base_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase_20250318();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Base_WstETHAndWeETHEModesAndLTLTVAdjustmentsOnEthereumArbitrumBase_20250318',
      AaveV3Base.POOL,
      address(proposal)
    );
  }
}
