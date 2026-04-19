// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IAgentHub} from '../interfaces/chaos-agents/IAgentHub.sol';
import {IACLManager} from 'aave-address-book/AaveV3.sol';

/**
 * @title Orderly Transition and Offboarding Plan for Chaos Labs
 * @author ChaosLabs (implemented by Aavechan Initiative @aci via Skyward)
 */

library DelistAllAgents {
  function delist(address AGENT_HUB, address ACL_MANAGER) internal {
    uint256 agentCount = IAgentHub(AGENT_HUB).getAgentCount();
    for (uint256 i = 0; i < agentCount; i++) {
      IAgentHub(AGENT_HUB).setAgentEnabled(i, false);
      IACLManager(ACL_MANAGER).removeRiskAdmin(
        IAgentHub(AGENT_HUB).getAgentAddress(i)
      );
    }
  }
}

