// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Avalanche} from 'aave-address-book/AaveV3Avalanche.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Avalanche_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410} from './AaveV3Avalanche_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410.sol';

/**
 * @dev Test for AaveV3Avalanche_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20260410_Multi_OrderlyTransitionAndOffboardingPlanForChaosLabs/AaveV3Avalanche_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410.t.sol -vv
 */
contract AaveV3Avalanche_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410_Test is
  ProtocolV3TestBase
{
  AaveV3Avalanche_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('avalanche'), 82595973);
    proposal = new AaveV3Avalanche_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Avalanche_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410',
      AaveV3Avalanche.POOL,
      address(proposal)
    );
  }
}
