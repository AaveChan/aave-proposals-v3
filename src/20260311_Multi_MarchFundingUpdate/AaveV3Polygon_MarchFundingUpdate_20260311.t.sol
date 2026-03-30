// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {AaveV2Polygon, AaveV2PolygonAssets} from 'aave-address-book/AaveV2Polygon.sol';
import {AaveV3Polygon, AaveV3PolygonAssets} from 'aave-address-book/AaveV3Polygon.sol';
import {MiscPolygon} from 'aave-address-book/MiscPolygon.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Polygon_MarchFundingUpdate_20260311} from './AaveV3Polygon_MarchFundingUpdate_20260311.sol';

/**
 * @dev Test for AaveV3Polygon_MarchFundingUpdate_20260311
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20260311_Multi_MarchFundingUpdate/AaveV3Polygon_MarchFundingUpdate_20260311.t.sol -vv
 */
contract AaveV3Polygon_MarchFundingUpdate_20260311_Test is ProtocolV3TestBase {
  event Bridge(address token, uint256 amount);

  AaveV3Polygon_MarchFundingUpdate_20260311 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('polygon'), 84634770);
    proposal = new AaveV3Polygon_MarchFundingUpdate_20260311();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest('AaveV3Polygon_MarchFundingUpdate_20260311', AaveV3Polygon.POOL, address(proposal));
  }

  function test_approvals() public {
    assertEq(
      IERC20(AaveV3PolygonAssets.USDCn_A_TOKEN).allowance(
        address(AaveV3Polygon.COLLECTOR),
        MiscPolygon.AFC_SAFE
      ),
      0
    );
    assertEq(
      IERC20(AaveV3PolygonAssets.USDT0_A_TOKEN).allowance(
        address(AaveV3Polygon.COLLECTOR),
        MiscPolygon.AFC_SAFE
      ),
      0
    );
    assertEq(
      IERC20(AaveV2PolygonAssets.USDT0_A_TOKEN).allowance(
        address(AaveV3Polygon.COLLECTOR),
        MiscPolygon.AFC_SAFE
      ),
      0
    );
    assertEq(
      IERC20(AaveV3PolygonAssets.EURS_A_TOKEN).allowance(
        address(AaveV3Polygon.COLLECTOR),
        MiscPolygon.AFC_SAFE
      ),
      0
    );

    executePayload(vm, address(proposal));

    assertEq(
      IERC20(AaveV3PolygonAssets.USDCn_A_TOKEN).allowance(
        address(AaveV3Polygon.COLLECTOR),
        MiscPolygon.AFC_SAFE
      ),
      proposal.USDC_ALLOWANCE()
    );
    assertEq(
      IERC20(AaveV3PolygonAssets.USDT0_A_TOKEN).allowance(
        address(AaveV3Polygon.COLLECTOR),
        MiscPolygon.AFC_SAFE
      ),
      proposal.USDT_ALLOWANCE_V3()
    );
    assertEq(
      IERC20(AaveV2PolygonAssets.USDT0_A_TOKEN).allowance(
        address(AaveV3Polygon.COLLECTOR),
        MiscPolygon.AFC_SAFE
      ),
      proposal.USDT_ALLOWANCE_V2()
    );
    assertEq(
      IERC20(AaveV3PolygonAssets.EURS_A_TOKEN).allowance(
        address(AaveV3Polygon.COLLECTOR),
        MiscPolygon.AFC_SAFE
      ),
      proposal.EURS_ALLOWANCE()
    );

    vm.startPrank(MiscPolygon.AFC_SAFE);
    IERC20(AaveV3PolygonAssets.USDCn_A_TOKEN).transferFrom(
      address(AaveV3Polygon.COLLECTOR),
      MiscPolygon.AFC_SAFE,
      proposal.USDC_ALLOWANCE()
    );

    IERC20(AaveV3PolygonAssets.USDT0_A_TOKEN).transferFrom(
      address(AaveV3Polygon.COLLECTOR),
      MiscPolygon.AFC_SAFE,
      proposal.USDT_ALLOWANCE_V3()
    );

    IERC20(AaveV2PolygonAssets.USDT0_A_TOKEN).transferFrom(
      address(AaveV3Polygon.COLLECTOR),
      MiscPolygon.AFC_SAFE,
      proposal.USDT_ALLOWANCE_V2()
    );

    IERC20(AaveV3PolygonAssets.EURS_A_TOKEN).transferFrom(
      address(AaveV3Polygon.COLLECTOR),
      MiscPolygon.AFC_SAFE,
      proposal.EURS_ALLOWANCE()
    );
    vm.stopPrank();
  }

  function test_bridges() public {
    uint256 daiCollectorBalanceBefore = IERC20(AaveV3PolygonAssets.DAI_UNDERLYING).balanceOf(
      address(AaveV3Polygon.COLLECTOR)
    );
    uint256 usdcCollectorBalanceBefore = IERC20(AaveV3PolygonAssets.USDC_UNDERLYING).balanceOf(
      address(AaveV3Polygon.COLLECTOR)
    );
    uint256 wbtcCollectorBalanceBefore = IERC20(AaveV3PolygonAssets.WBTC_UNDERLYING).balanceOf(
      address(AaveV3Polygon.COLLECTOR)
    );
    uint256 wethCollectorBalanceBefore = IERC20(AaveV3PolygonAssets.WETH_UNDERLYING).balanceOf(
      address(AaveV3Polygon.COLLECTOR)
    );

    assertGt(daiCollectorBalanceBefore, 0);
    assertGt(usdcCollectorBalanceBefore, 0);
    assertGt(wbtcCollectorBalanceBefore, 0);
    assertGt(wethCollectorBalanceBefore, 0);

    vm.expectEmit(true, true, true, true, MiscPolygon.AAVE_POL_ETH_BRIDGE);
    emit Bridge(AaveV3PolygonAssets.DAI_UNDERLYING, daiCollectorBalanceBefore);
    vm.expectEmit(true, true, true, true, MiscPolygon.AAVE_POL_ETH_BRIDGE);
    emit Bridge(AaveV3PolygonAssets.USDC_UNDERLYING, usdcCollectorBalanceBefore);
    vm.expectEmit(true, true, true, true, MiscPolygon.AAVE_POL_ETH_BRIDGE);
    emit Bridge(AaveV3PolygonAssets.WBTC_UNDERLYING, wbtcCollectorBalanceBefore);
    vm.expectEmit(true, true, true, true, MiscPolygon.AAVE_POL_ETH_BRIDGE);
    emit Bridge(AaveV3PolygonAssets.WETH_UNDERLYING, wethCollectorBalanceBefore);

    executePayload(vm, address(proposal));

    assertEq(
      IERC20(AaveV3PolygonAssets.DAI_UNDERLYING).balanceOf(address(AaveV3Polygon.COLLECTOR)),
      0
    );
    assertEq(
      IERC20(AaveV3PolygonAssets.USDC_UNDERLYING).balanceOf(address(AaveV3Polygon.COLLECTOR)),
      0
    );
    assertEq(
      IERC20(AaveV3PolygonAssets.WBTC_UNDERLYING).balanceOf(address(AaveV3Polygon.COLLECTOR)),
      0
    );
    assertEq(
      IERC20(AaveV3PolygonAssets.WETH_UNDERLYING).balanceOf(address(AaveV3Polygon.COLLECTOR)),
      0
    );
  }
}
