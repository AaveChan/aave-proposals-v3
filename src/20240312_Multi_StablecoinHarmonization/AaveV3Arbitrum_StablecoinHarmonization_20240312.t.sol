// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Arbitrum} from 'aave-address-book/AaveV3Arbitrum.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {AaveV3Arbitrum_StablecoinHarmonization_20240312} from './AaveV3Arbitrum_StablecoinHarmonization_20240312.sol';

/**
 * @dev Test for AaveV3Arbitrum_StablecoinHarmonization_20240312
 * command: make test-contract filter=AaveV3Arbitrum_StablecoinHarmonization_20240312
 */
contract AaveV3Arbitrum_StablecoinHarmonization_20240312_Test is ProtocolV3TestBase {
  AaveV3Arbitrum_StablecoinHarmonization_20240312 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 189749095);
    proposal = new AaveV3Arbitrum_StablecoinHarmonization_20240312();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Arbitrum_StablecoinHarmonization_20240312',
      AaveV3Arbitrum.POOL,
      address(proposal)
    );
  }
}
