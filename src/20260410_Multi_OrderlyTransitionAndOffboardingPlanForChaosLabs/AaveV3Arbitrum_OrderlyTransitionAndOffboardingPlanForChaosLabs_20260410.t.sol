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
    // The Chainlink Automation Registry on Arbitrum calls the arbBlockNumber() precompile
    // (0x0000...0064) inside cancelUpkeep. Foundry fork mode does not replicate Arbitrum
    // native precompiles so the call hits INVALID (0xFE) — known limitation:
    //   https://github.com/foundry-rs/foundry/issues/5085
    //   https://github.com/foundry-rs/foundry/issues/7294
    //   https://github.com/foundry-rs/foundry/issues/6035
    // The proposal executes correctly on Arbitrum mainnet where the precompile is native.
    vm.mockCall(
      address(0x0000000000000000000000000000000000000064),
      abi.encodeWithSignature('arbBlockNumber()'),
      abi.encode(uint256(451063652))
    );
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
