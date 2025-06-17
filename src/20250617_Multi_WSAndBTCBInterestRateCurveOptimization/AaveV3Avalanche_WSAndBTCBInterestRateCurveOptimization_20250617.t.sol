// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Avalanche} from 'aave-address-book/AaveV3Avalanche.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Avalanche_WSAndBTCBInterestRateCurveOptimization_20250617} from './AaveV3Avalanche_WSAndBTCBInterestRateCurveOptimization_20250617.sol';

/**
 * @dev Test for AaveV3Avalanche_WSAndBTCBInterestRateCurveOptimization_20250617
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20250617_Multi_WSAndBTCBInterestRateCurveOptimization/AaveV3Avalanche_WSAndBTCBInterestRateCurveOptimization_20250617.t.sol -vv
 */
contract AaveV3Avalanche_WSAndBTCBInterestRateCurveOptimization_20250617_Test is
  ProtocolV3TestBase
{
  AaveV3Avalanche_WSAndBTCBInterestRateCurveOptimization_20250617 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('avalanche'), 63994727);
    proposal = new AaveV3Avalanche_WSAndBTCBInterestRateCurveOptimization_20250617();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Avalanche_WSAndBTCBInterestRateCurveOptimization_20250617',
      AaveV3Avalanche.POOL,
      address(proposal)
    );
  }
}
