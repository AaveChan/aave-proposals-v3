// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IProposalGenericExecutor} from 'aave-helpers/src/interfaces/IProposalGenericExecutor.sol';
import {MiscEthereum} from 'aave-address-book/MiscEthereum.sol';
import {IAgentHub} from '../interfaces/chaos-agents/IAgentHub.sol';
import {AaveV3EthereumLido, AaveV3EthereumLidoAssets} from 'aave-address-book/AaveV3EthereumLido.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
/**
 * @title Orderly Transition and Offboarding Plan for Chaos Labs
 * @author ChaosLabs (implemented by Aavechan Initiative @aci via Skyward)
 * - Snapshot: TODO
 * - Discussion: https://governance.aave.com/t/orderly-transition-and-offboarding-plan-for-chaos-labs/24399
 */
contract AaveV3Ethereum_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410 is
  IProposalGenericExecutor
{
  address public constant CHAOS_LABS = 0xbC540e0729B732fb14afA240aA5A047aE9ba7dF0; // stream 100073 recipient
  uint256 public constant PREVIOUS_STREAM = 100073;
  uint256 public constant AMOUNT_PER_SECOND = 80859969558599695; // from stream 100073

  function execute() external {
    // custom code goes here
    uint256 agentCount = IAgentHub(MiscEthereum.AGENT_HUB).getAgentCount();
    for (uint256 i = 0; i < agentCount; i++) {
      IAgentHub(MiscEthereum.AGENT_HUB).setAgentEnabled(i, false);
    }

    // chaos labs mentionned cutting the stream themselves
    try AaveV3EthereumLido.COLLECTOR.cancelStream(PREVIOUS_STREAM) {} catch {}

    // bulk transfer
    AaveV3EthereumLido.COLLECTOR.transfer(
      IERC20(AaveV3EthereumLidoAssets.GHO_A_TOKEN),
      CHAOS_LABS,
      AMOUNT_PER_SECOND * 30 days
    );
  }
}
