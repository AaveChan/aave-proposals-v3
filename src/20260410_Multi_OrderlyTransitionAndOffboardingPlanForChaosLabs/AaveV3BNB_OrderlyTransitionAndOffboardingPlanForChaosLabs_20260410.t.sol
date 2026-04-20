// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3BNB} from 'aave-address-book/AaveV3BNB.sol';
import {MiscBNB} from 'aave-address-book/MiscBNB.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3BNB_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410} from './AaveV3BNB_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410.sol';
import {IAaveCLRobotOperator} from '../interfaces/IAaveCLRobotOperator.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';

interface IKeeperRegistry {
  // https://github.com/smartcontractkit/chainlink/blob/contracts-v1.3.0/contracts/src/v0.8/automation/v2_1/KeeperRegistryBase2_1.sol
  function getCancellationDelay() external view returns (uint256);
}

/**
 * @dev Test for AaveV3BNB_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20260410_Multi_OrderlyTransitionAndOffboardingPlanForChaosLabs/AaveV3BNB_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410.t.sol -vv
 */
contract AaveV3BNB_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410_Test is
  ProtocolV3TestBase
{
  AaveV3BNB_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('bnb'), 91740832);
    proposal = new AaveV3BNB_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3BNB_OrderlyTransitionAndOffboardingPlanForChaosLabs_20260410',
      AaveV3BNB.POOL,
      address(proposal)
    );
  }

  function test_linkReturnedToCollectorAfterCancellation() public {
    address CHAINLINK_REGISTRY = 0xDc21E279934fF6721CaDfDD112DAfb3261f09A2C; // not in address book
    address LINK = 0x404460C6A5EdE2D891e8297795264fDe62ADBB75; // LINK on BNB, not in address book

    IAaveCLRobotOperator operator = IAaveCLRobotOperator(MiscBNB.AAVE_CL_ROBOT_OPERATOR);
    uint256[] memory ids = operator.getKeepersList();

    uint256[] memory agentRobotIds = new uint256[](ids.length);
    uint256 agentRobotCount = 0;
    for (uint256 i = 0; i < ids.length; i++) {
      if (operator.getKeeperInfo(ids[i]).upkeep == MiscBNB.AGENT_HUB_AUTOMATION) {
        agentRobotIds[agentRobotCount++] = ids[i];
      }
    }
    require(agentRobotCount > 0, 'no agent hub robots found');

    executePayload(vm, address(proposal));

    uint256 delay = IKeeperRegistry(CHAINLINK_REGISTRY).getCancellationDelay();
    vm.roll(block.number + delay);

    uint256 collectorLinkBefore = IERC20(LINK).balanceOf(address(AaveV3BNB.COLLECTOR));

    for (uint256 i = 0; i < agentRobotCount; i++) {
      operator.withdrawLink(agentRobotIds[i]);
    }

    uint256 collectorLinkAfter = IERC20(LINK).balanceOf(address(AaveV3BNB.COLLECTOR));
    assertGt(collectorLinkAfter, collectorLinkBefore, 'LINK not returned to collector');
  }
}
