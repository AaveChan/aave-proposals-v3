// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IProposalGenericExecutor} from 'aave-helpers/src/interfaces/IProposalGenericExecutor.sol';
import {MiscEthereum} from 'aave-address-book/MiscEthereum.sol';
import {AaveV3EthereumLido, AaveV3EthereumLidoAssets} from 'aave-address-book/AaveV3EthereumLido.sol';
import {DelistAllAgents} from './DelistAllAgents.sol';
import {AaveV3Ethereum} from 'aave-address-book/AaveV3Ethereum.sol';
import {IAaveCLRobotOperator} from '../interfaces/IAaveCLRobotOperator.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
/**
 * @title Orderly Transition and Offboarding Plan for Chaos Labs
 * @author ChaosLabs (implemented by Aavechan Initiative @aci via Skyward)
 * - Snapshot: direct-to-AIP
 * - Discussion: https://governance.aave.com/t/orderly-transition-and-offboarding-plan-for-chaos-labs/24399
 */
contract AaveV3Ethereum_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410 is
  IProposalGenericExecutor
{
  address public constant CHAOS_LABS = 0xbC540e0729B732fb14afA240aA5A047aE9ba7dF0; // stream 100073 recipient
  uint256 public constant PREVIOUS_STREAM = 100073;
  uint256 public constant AMOUNT_PER_SECOND = 80859969558599695; // from stream 100073

  function execute() external {
    DelistAllAgents.delist(MiscEthereum.AGENT_HUB, address(AaveV3Ethereum.ACL_MANAGER));
    DelistAllAgents.delist(MiscEthereum.AGENT_HUB, address(AaveV3EthereumLido.ACL_MANAGER));

    // chaos labs mentioned cutting the stream themselves
    try AaveV3EthereumLido.COLLECTOR.cancelStream(PREVIOUS_STREAM) {} catch {}

    // bulk transfer
    AaveV3EthereumLido.COLLECTOR.transfer(
      IERC20(AaveV3EthereumLidoAssets.GHO_A_TOKEN),
      CHAOS_LABS,
      AMOUNT_PER_SECOND * 30 days
    );

    // Cancel all Chainlink robots registered for AGENT_HUB_AUTOMATION.
    // withdrawLink() is permissionless and can be called by anyone ~20 blocks after execution.
    IAaveCLRobotOperator operator = IAaveCLRobotOperator(MiscEthereum.AAVE_CL_ROBOT_OPERATOR);
    uint256[] memory keeperIds = operator.getKeepersList();
    for (uint256 i = 0; i < keeperIds.length; i++) {
      if (operator.getKeeperInfo(keeperIds[i]).upkeep == MiscEthereum.AGENT_HUB_AUTOMATION) {
        operator.cancel(keeperIds[i]);
      }
    }
  }
}
