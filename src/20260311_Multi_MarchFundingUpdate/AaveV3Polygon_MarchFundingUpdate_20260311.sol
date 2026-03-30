// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {AaveV2Polygon, AaveV2PolygonAssets} from 'aave-address-book/AaveV2Polygon.sol';
import {AaveV3Polygon, AaveV3PolygonAssets} from 'aave-address-book/AaveV3Polygon.sol';
import {MiscPolygon} from 'aave-address-book/MiscPolygon.sol';
import {IAavePolEthERC20Bridge} from 'aave-helpers/src/bridges/polygon/IAavePolEthERC20Bridge.sol';
import {IProposalGenericExecutor} from 'aave-helpers/src/interfaces/IProposalGenericExecutor.sol';

/**
 * @title March Funding Update
 * @author TokenLogic
 * - Snapshot: Direct-to-AIP
 * - Discussion: https://governance.aave.com/t/direct-to-aip-march-2026-funding-update/24225
 */
contract AaveV3Polygon_MarchFundingUpdate_20260311 is IProposalGenericExecutor {
  uint256 public constant USDC_ALLOWANCE = 125_000e6;
  uint256 public constant USDT_ALLOWANCE_V3 = 180_000e6;
  uint256 public constant USDT_ALLOWANCE_V2 = 50_000e6;
  uint256 public constant EURS_ALLOWANCE = 79_000e2;

  function execute() external {
    _approvals();
    _bridges();
  }

  function _approvals() internal {
    AaveV3Polygon.COLLECTOR.approve(
      IERC20(AaveV3PolygonAssets.USDCn_A_TOKEN),
      MiscPolygon.AFC_SAFE,
      USDC_ALLOWANCE
    );
    AaveV3Polygon.COLLECTOR.approve(
      IERC20(AaveV3PolygonAssets.USDT0_A_TOKEN),
      MiscPolygon.AFC_SAFE,
      USDT_ALLOWANCE_V3
    );
    AaveV2Polygon.COLLECTOR.approve(
      IERC20(AaveV2PolygonAssets.USDT0_A_TOKEN),
      MiscPolygon.AFC_SAFE,
      USDT_ALLOWANCE_V2
    );
    AaveV3Polygon.COLLECTOR.approve(
      IERC20(AaveV3PolygonAssets.EURS_A_TOKEN),
      MiscPolygon.AFC_SAFE,
      EURS_ALLOWANCE
    );
  }

  function _bridges() internal {
    // DAI
    uint256 daiBalance = IERC20(AaveV3PolygonAssets.DAI_UNDERLYING).balanceOf(
      address(AaveV3Polygon.COLLECTOR)
    );
    AaveV3Polygon.COLLECTOR.transfer(
      IERC20(AaveV3PolygonAssets.DAI_UNDERLYING),
      MiscPolygon.AAVE_POL_ETH_BRIDGE,
      daiBalance
    );
    IAavePolEthERC20Bridge(MiscPolygon.AAVE_POL_ETH_BRIDGE).bridge(
      AaveV3PolygonAssets.DAI_UNDERLYING,
      daiBalance
    );

    // USDC
    uint256 usdcBalance = IERC20(AaveV3PolygonAssets.USDC_UNDERLYING).balanceOf(
      address(AaveV3Polygon.COLLECTOR)
    );
    AaveV3Polygon.COLLECTOR.transfer(
      IERC20(AaveV3PolygonAssets.USDC_UNDERLYING),
      MiscPolygon.AAVE_POL_ETH_BRIDGE,
      usdcBalance
    );
    IAavePolEthERC20Bridge(MiscPolygon.AAVE_POL_ETH_BRIDGE).bridge(
      AaveV3PolygonAssets.USDC_UNDERLYING,
      usdcBalance
    );

    /// WBTC
    uint256 wbtcBalance = IERC20(AaveV3PolygonAssets.WBTC_UNDERLYING).balanceOf(
      address(AaveV3Polygon.COLLECTOR)
    );
    AaveV3Polygon.COLLECTOR.transfer(
      IERC20(AaveV3PolygonAssets.WBTC_UNDERLYING),
      MiscPolygon.AAVE_POL_ETH_BRIDGE,
      wbtcBalance
    );
    IAavePolEthERC20Bridge(MiscPolygon.AAVE_POL_ETH_BRIDGE).bridge(
      AaveV3PolygonAssets.WBTC_UNDERLYING,
      wbtcBalance
    );

    /// WETH
    uint256 wethBalance = IERC20(AaveV3PolygonAssets.WETH_UNDERLYING).balanceOf(
      address(AaveV3Polygon.COLLECTOR)
    );
    AaveV3Polygon.COLLECTOR.transfer(
      IERC20(AaveV3PolygonAssets.WETH_UNDERLYING),
      MiscPolygon.AAVE_POL_ETH_BRIDGE,
      wethBalance
    );
    IAavePolEthERC20Bridge(MiscPolygon.AAVE_POL_ETH_BRIDGE).bridge(
      AaveV3PolygonAssets.WETH_UNDERLYING,
      wethBalance
    );
  }
}
