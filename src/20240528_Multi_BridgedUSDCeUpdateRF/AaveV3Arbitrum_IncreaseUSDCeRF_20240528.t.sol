// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Arbitrum} from 'aave-address-book/AaveV3Arbitrum.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {AaveV3Arbitrum_IncreaseUSDCeRF_20240528} from './AaveV3Arbitrum_IncreaseUSDCeRF_20240528.sol';

/**
 * @dev Test for AaveV3Arbitrum_IncreaseUSDCeRF_20240528
 * command: make test-contract filter=AaveV3Arbitrum_IncreaseUSDCeRF_20240528
 */
contract AaveV3Arbitrum_IncreaseUSDCeRF_20240528_Test is ProtocolV3TestBase {
  AaveV3Arbitrum_IncreaseUSDCeRF_20240528 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 221148973);
    proposal = new AaveV3Arbitrum_IncreaseUSDCeRF_20240528();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest('AaveV3Arbitrum_IncreaseUSDCeRF_20240528', AaveV3Arbitrum.POOL, address(proposal));
  }
}
