// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3EthereumLido, AaveV3EthereumLidoAssets} from 'aave-address-book/AaveV3EthereumLido.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {IPool} from 'aave-v3-origin/contracts/interfaces/IPool.sol';
import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312} from './AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312.sol';

/**
 * @dev Test for AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20260312_Multi_ReEnableWstETHBorrowCapsAfterCapoIncident/AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312.t.sol -vv
 */
contract AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312_Test is
  ProtocolV3TestBase
{
  AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 24641997);
    proposal = new AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3EthereumLido_ReEnableWstETHBorrowCapsAfterCapoIncident_20260312',
      AaveV3EthereumLido.POOL,
      address(proposal)
    );
  }

  function test_borrowWstETHAfterProposal() public {
    executePayload(vm, address(proposal));
    skip(3600);

    address user = 0x2e2A6815ec3E7280E01ef03ED26B3Bb13F3920fb;
    IPool pool = IPool(address(AaveV3EthereumLido.POOL));

    uint256 borrowAmount = 1e18;
    uint256 debtBefore = IERC20(AaveV3EthereumLidoAssets.wstETH_V_TOKEN).balanceOf(user);

    vm.prank(user);
    pool.borrow(AaveV3EthereumLidoAssets.wstETH_UNDERLYING, borrowAmount, 2, 0, user);

    uint256 debtAfter = IERC20(AaveV3EthereumLidoAssets.wstETH_V_TOKEN).balanceOf(user);
    assertGe(
      debtAfter - debtBefore,
      borrowAmount,
      'User debt should increase by at least 1 wstETH'
    );
  }
}
