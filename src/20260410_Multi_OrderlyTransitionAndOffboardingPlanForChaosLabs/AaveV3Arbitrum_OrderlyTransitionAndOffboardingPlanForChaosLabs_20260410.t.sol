// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Arbitrum} from 'aave-address-book/AaveV3Arbitrum.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Arbitrum_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410} from './AaveV3Arbitrum_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410.sol';

/**
 * @dev Test for AaveV3Arbitrum_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20260410_Multi_OrderlyTransitionAndOffboardingPlanForChaosLabs/AaveV3Arbitrum_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410.t.sol -vv
 */
contract AaveV3Arbitrum_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410_Test is
  ProtocolV3TestBase
{
  AaveV3Arbitrum_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 451063652);
    proposal = new AaveV3Arbitrum_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Arbitrum_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410',
      AaveV3Arbitrum.POOL,
      address(proposal)
    );
  }
}
