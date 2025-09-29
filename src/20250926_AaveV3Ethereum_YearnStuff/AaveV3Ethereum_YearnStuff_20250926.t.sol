// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Ethereum} from 'aave-address-book/AaveV3Ethereum.sol';
import {AaveV2Ethereum} from 'aave-address-book/AaveV2Ethereum.sol';
import {IAaveIncentivesController} from 'aave-address-book/AaveV2.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Ethereum_YearnStuff_20250926, AaveV3Ethereum_YearnStuff_part2_20250926} from './AaveV3Ethereum_YearnStuff_20250926.sol';
import {PayloadsToDeploy} from './YearnStuff_20250926.s.sol';
/**
 * @dev Test for AaveV3Ethereum_YearnStuff_20250926
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20250926_AaveV3Ethereum_YearnStuff/AaveV3Ethereum_YearnStuff_20250926.t.sol -vv
 */
contract AaveV3Ethereum_YearnStuff_20250926_Test is ProtocolV3TestBase {
  AaveV3Ethereum_YearnStuff_20250926 internal proposal1;
  AaveV3Ethereum_YearnStuff_part2_20250926 internal proposal2;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 23448361);
    proposal1 = AaveV3Ethereum_YearnStuff_20250926(PayloadsToDeploy.part1());
    proposal2 = AaveV3Ethereum_YearnStuff_part2_20250926(
      PayloadsToDeploy.part2(address(proposal1))
    );
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    assert(proposal1.EXECUTION_TIME() >= block.timestamp + 7 days);
    vm.warp(proposal1.EXECUTION_TIME() - 2 days);
    executePayload(vm, address(proposal1));
    vm.warp(proposal1.EXECUTION_TIME());
    executePayload(vm, address(proposal2));
    assertEq(
      IAaveIncentivesController(AaveV2Ethereum.DEFAULT_INCENTIVES_CONTROLLER).getClaimer(
        proposal1.YEARN_STRATEGY()
      ),
      proposal1.YEARN_TEAM_SAFE()
    );
  }
}
