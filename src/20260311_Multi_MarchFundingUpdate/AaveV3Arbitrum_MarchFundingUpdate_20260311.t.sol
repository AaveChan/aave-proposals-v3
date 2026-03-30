// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {AaveV3Arbitrum, AaveV3ArbitrumAssets} from 'aave-address-book/AaveV3Arbitrum.sol';
import {MiscArbitrum} from 'aave-address-book/MiscArbitrum.sol';
import {ArbSysMock} from 'aave-helpers/tests/bridges/arbitrum/ArbSysMock.sol';
import {ProtocolV3TestBase} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Arbitrum_MarchFundingUpdate_20260311} from './AaveV3Arbitrum_MarchFundingUpdate_20260311.sol';

/**
 * @dev Test for AaveV3Arbitrum_MarchFundingUpdate_20260311
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20260311_Multi_MarchFundingUpdate/AaveV3Arbitrum_MarchFundingUpdate_20260311.t.sol -vv
 */
contract AaveV3Arbitrum_MarchFundingUpdate_20260311_Test is ProtocolV3TestBase {
  event Bridge(address indexed token, uint256 amount);

  AaveV3Arbitrum_MarchFundingUpdate_20260311 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 445295701);
    proposal = new AaveV3Arbitrum_MarchFundingUpdate_20260311();

    ArbSysMock arbsys = new ArbSysMock();
    vm.etch(address(0x0000000000000000000000000000000000000064), address(arbsys).code);
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Arbitrum_MarchFundingUpdate_20260311',
      AaveV3Arbitrum.POOL,
      address(proposal)
    );
  }

  function test_approvals() public {
    assertEq(
      IERC20(AaveV3ArbitrumAssets.USDCn_A_TOKEN).allowance(
        address(AaveV3Arbitrum.COLLECTOR),
        MiscArbitrum.AFC_SAFE
      ),
      0
    );

    assertEq(
      IERC20(AaveV3ArbitrumAssets.USDT_A_TOKEN).allowance(
        address(AaveV3Arbitrum.COLLECTOR),
        MiscArbitrum.AFC_SAFE
      ),
      0
    );

    assertEq(
      IERC20(AaveV3ArbitrumAssets.wstETH_A_TOKEN).allowance(
        address(AaveV3Arbitrum.COLLECTOR),
        MiscArbitrum.AFC_SAFE
      ),
      0
    );

    executePayload(vm, address(proposal));

    assertEq(
      IERC20(AaveV3ArbitrumAssets.USDCn_A_TOKEN).allowance(
        address(AaveV3Arbitrum.COLLECTOR),
        MiscArbitrum.AFC_SAFE
      ),
      proposal.USDC_ALLOWANCE()
    );

    assertEq(
      IERC20(AaveV3ArbitrumAssets.USDT_A_TOKEN).allowance(
        address(AaveV3Arbitrum.COLLECTOR),
        MiscArbitrum.AFC_SAFE
      ),
      proposal.USDT_ALLOWANCE()
    );

    assertEq(
      IERC20(AaveV3ArbitrumAssets.wstETH_A_TOKEN).allowance(
        address(AaveV3Arbitrum.COLLECTOR),
        MiscArbitrum.AFC_SAFE
      ),
      proposal.WSTETH_ALLOWANCE()
    );

    vm.startPrank(MiscArbitrum.AFC_SAFE);
    IERC20(AaveV3ArbitrumAssets.USDCn_A_TOKEN).transferFrom(
      address(AaveV3Arbitrum.COLLECTOR),
      MiscArbitrum.AFC_SAFE,
      proposal.USDC_ALLOWANCE() - 200_000e6 // Not full amount available yet
    );

    IERC20(AaveV3ArbitrumAssets.USDT_A_TOKEN).transferFrom(
      address(AaveV3Arbitrum.COLLECTOR),
      MiscArbitrum.AFC_SAFE,
      proposal.USDT_ALLOWANCE() - 30_000e6 // Not full amount available yet
    );

    IERC20(AaveV3ArbitrumAssets.wstETH_A_TOKEN).transferFrom(
      address(AaveV3Arbitrum.COLLECTOR),
      MiscArbitrum.AFC_SAFE,
      proposal.WSTETH_ALLOWANCE()
    );
    vm.stopPrank();
  }

  function test_bridges() public {
    uint256 daiCollectorBalanceBefore = IERC20(AaveV3ArbitrumAssets.DAI_UNDERLYING).balanceOf(
      address(AaveV3Arbitrum.COLLECTOR)
    );

    uint256 linkCollectorBalanceBefore = IERC20(AaveV3ArbitrumAssets.LINK_UNDERLYING).balanceOf(
      address(AaveV3Arbitrum.COLLECTOR)
    );

    uint256 usdcCollectorBalanceBefore = IERC20(AaveV3ArbitrumAssets.USDC_UNDERLYING).balanceOf(
      address(AaveV3Arbitrum.COLLECTOR)
    );

    assertGt(daiCollectorBalanceBefore, 0);
    assertGt(linkCollectorBalanceBefore, 0);
    assertGt(usdcCollectorBalanceBefore, 0);

    vm.expectEmit(true, true, true, true, MiscArbitrum.AAVE_ARB_ETH_BRIDGE);
    emit Bridge(AaveV3ArbitrumAssets.DAI_UNDERLYING, daiCollectorBalanceBefore);

    vm.expectEmit(true, true, true, true, MiscArbitrum.AAVE_ARB_ETH_BRIDGE);
    emit Bridge(AaveV3ArbitrumAssets.LINK_UNDERLYING, linkCollectorBalanceBefore);

    vm.expectEmit(true, true, true, true, MiscArbitrum.AAVE_ARB_ETH_BRIDGE);
    emit Bridge(AaveV3ArbitrumAssets.USDC_UNDERLYING, usdcCollectorBalanceBefore);

    executePayload(vm, address(proposal));

    assertEq(
      IERC20(AaveV3ArbitrumAssets.DAI_UNDERLYING).balanceOf(address(AaveV3Arbitrum.COLLECTOR)),
      0
    );

    assertEq(
      IERC20(AaveV3ArbitrumAssets.LINK_UNDERLYING).balanceOf(address(AaveV3Arbitrum.COLLECTOR)),
      0
    );

    assertEq(
      IERC20(AaveV3ArbitrumAssets.USDC_UNDERLYING).balanceOf(address(AaveV3Arbitrum.COLLECTOR)),
      0
    );
  }
}
