// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3InkWhitelabel} from 'aave-address-book/AaveV3InkWhitelabel.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3InkWhitelabel_TransferCollectorRevenue_20260304} from './AaveV3InkWhitelabel_TransferCollectorRevenue_20260304.sol';

/**
 * @dev Test for AaveV3InkWhitelabel_TransferCollectorRevenue_20260304
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20260304_AaveV3InkWhitelabel_TransferCollectorRevenue/AaveV3InkWhitelabel_TransferCollectorRevenue_20260304.t.sol -vv
 */
contract AaveV3InkWhitelabel_TransferCollectorRevenue_20260304_Test is ProtocolV3TestBase {
  AaveV3InkWhitelabel_TransferCollectorRevenue_20260304 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('ink'), 39167733);
    proposal = new AaveV3InkWhitelabel_TransferCollectorRevenue_20260304();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3InkWhitelabel_TransferCollectorRevenue_20260304',
      AaveV3InkWhitelabel.POOL,
      address(proposal),
      true,
      true
    );
  }

  function test_transfers() public {
    address safe = proposal.INK_TYDRO_TEAM_SAFE();
    address collector = address(AaveV3InkWhitelabel.COLLECTOR);
    address[] memory tokens = proposal.getTokens();

    uint256[] memory balancesBefore = new uint256[](tokens.length);
    uint256[] memory collectorBalancesBefore = new uint256[](tokens.length);
    for (uint256 i = 0; i < tokens.length; i++) {
      balancesBefore[i] = IERC20(tokens[i]).balanceOf(safe);
      collectorBalancesBefore[i] = IERC20(tokens[i]).balanceOf(collector);
    }

    executePayload(vm, address(proposal));

    for (uint256 i = 0; i < tokens.length; i++) {
      uint256 balanceAfter = IERC20(tokens[i]).balanceOf(safe);
      uint256 collectorBalanceAfter = IERC20(tokens[i]).balanceOf(collector);

      assertGe(balanceAfter, balancesBefore[i] + collectorBalancesBefore[i]);
      assertEq(collectorBalanceAfter, 0);
    }
  }
}
