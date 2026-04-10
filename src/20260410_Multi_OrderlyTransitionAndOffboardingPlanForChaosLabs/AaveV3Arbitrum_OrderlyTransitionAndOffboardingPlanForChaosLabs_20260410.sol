// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IProposalGenericExecutor} from 'aave-helpers/src/interfaces/IProposalGenericExecutor.sol';
import {MiscArbitrum} from 'aave-address-book/MiscArbitrum.sol';
import {IAgentHub} from '../interfaces/chaos-agents/IAgentHub.sol';
/**
 * @title Orderly Transition and Offboarding Plan for Chaos Labs
 * @author ChaosLabs (implemented by Aavechan Initiative @aci via Skyward)
 * - Snapshot: TODO
 * - Discussion: https://governance.aave.com/t/orderly-transition-and-offboarding-plan-for-chaos-labs/24399
 */
contract AaveV3Arbitrum_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410 is
  IProposalGenericExecutor
{
  function execute() external {
    // custom code goes here
    uint256 agentCount = IAgentHub(MiscArbitrum.AGENT_HUB).getAgentCount();
    for (uint256 i = 0; i < agentCount; i++) {
      IAgentHub(MiscArbitrum.AGENT_HUB).setAgentEnabled(i, false);
    }
  }
}
