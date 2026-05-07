// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Mantle, AaveV3MantleAssets} from 'aave-address-book/AaveV3Mantle.sol';
import {AaveV3PayloadMantle} from 'aave-helpers/src/v3-config-engine/AaveV3PayloadMantle.sol';
import {EngineFlags} from 'aave-v3-origin/contracts/extensions/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-v3-origin/contracts/extensions/v3-config-engine/IAaveV3ConfigEngine.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {SafeERC20} from 'openzeppelin-contracts/contracts/token/ERC20/utils/SafeERC20.sol';
import {IEmissionManager} from 'aave-v3-origin/contracts/rewards/interfaces/IEmissionManager.sol';

/**
 * @title Aave V3 Mantle – Collateral Enablement, eMode Expansion, and Isolation Updates
 * @author Aavechan Initiative @aci
 * - Snapshot: direct-to-AIP
 * - Discussion: https://governance.aave.com/t/direct-to-aip-aave-v3-mantle-collateral-enablement-emode-expansion-and-isolation-updates-usdt0-usde-eth-xaut/24153
 */
contract AaveV3Mantle_AaveV3MantleCollateralEnablementEModeExpansionAndIsolationUpdates_20260429 is
  AaveV3PayloadMantle
{
  using SafeERC20 for IERC20;

  address public constant XAUt = 0x6199CCd9273A1E0e41e2cC18d9dAcd1E9382F58E;
  uint256 public constant XAUt_SEED_AMOUNT = 1e6;
  address public constant XAUt_LM_ADMIN = 0xac140648435d03f784879cd789130F22Ef588Fcd;

  function _postExecute() internal override {
    _supplyAndConfigureLMAdmin(XAUt, XAUt_SEED_AMOUNT, XAUt_LM_ADMIN);
  }

  function rateStrategiesUpdates()
    public
    pure
    override
    returns (IAaveV3ConfigEngine.RateStrategyUpdate[] memory)
  {
    IAaveV3ConfigEngine.RateStrategyUpdate[]
      memory rateStrategies = new IAaveV3ConfigEngine.RateStrategyUpdate[](1);
    rateStrategies[0] = IAaveV3ConfigEngine.RateStrategyUpdate({
      asset: AaveV3MantleAssets.WETH_UNDERLYING,
      params: IAaveV3ConfigEngine.InterestRateInputData({
        optimalUsageRatio: EngineFlags.KEEP_CURRENT,
        baseVariableBorrowRate: EngineFlags.KEEP_CURRENT,
        variableRateSlope1: 2_50,
        variableRateSlope2: 8_00
      })
    });

    return rateStrategies;
  }
  function capsUpdates() public pure override returns (IAaveV3ConfigEngine.CapsUpdate[] memory) {
    IAaveV3ConfigEngine.CapsUpdate[] memory capsUpdate = new IAaveV3ConfigEngine.CapsUpdate[](1);

    capsUpdate[0] = IAaveV3ConfigEngine.CapsUpdate({
      asset: AaveV3MantleAssets.WMNT_UNDERLYING,
      supplyCap: 5_000_000,
      borrowCap: EngineFlags.KEEP_CURRENT
    });

    return capsUpdate;
  }
  function collateralsUpdates()
    public
    pure
    override
    returns (IAaveV3ConfigEngine.CollateralUpdate[] memory)
  {
    IAaveV3ConfigEngine.CollateralUpdate[]
      memory collateralUpdate = new IAaveV3ConfigEngine.CollateralUpdate[](2);

    collateralUpdate[0] = IAaveV3ConfigEngine.CollateralUpdate({
      asset: AaveV3MantleAssets.WETH_UNDERLYING,
      ltv: 0,
      liqThreshold: 80_00,
      liqBonus: EngineFlags.KEEP_CURRENT,
      debtCeiling: 0,
      liqProtocolFee: 10_00
    });
    collateralUpdate[1] = IAaveV3ConfigEngine.CollateralUpdate({
      asset: AaveV3MantleAssets.WMNT_UNDERLYING,
      ltv: 0,
      liqThreshold: EngineFlags.KEEP_CURRENT,
      liqBonus: EngineFlags.KEEP_CURRENT,
      debtCeiling: 0,
      liqProtocolFee: 10_00
    });

    return collateralUpdate;
  }
  function eModeCategoryCreations()
    public
    pure
    override
    returns (IAaveV3ConfigEngine.EModeCategoryCreation[] memory)
  {
    IAaveV3ConfigEngine.EModeCategoryCreation[]
      memory eModeCreations = new IAaveV3ConfigEngine.EModeCategoryCreation[](3);

    address[] memory collateralAssets_XAutStablecoin = new address[](1);
    address[] memory borrowableAssets_XAutStablecoin = new address[](3);

    collateralAssets_XAutStablecoin[0] = XAUt;
    borrowableAssets_XAutStablecoin[0] = AaveV3MantleAssets.USDT0_UNDERLYING;
    borrowableAssets_XAutStablecoin[1] = AaveV3MantleAssets.USDC_UNDERLYING;
    borrowableAssets_XAutStablecoin[2] = AaveV3MantleAssets.GHO_UNDERLYING;

    eModeCreations[0] = IAaveV3ConfigEngine.EModeCategoryCreation({
      ltv: 70_00,
      liqThreshold: 75_00,
      liqBonus: 6_00,
      label: 'XAut Stablecoin',
      collaterals: collateralAssets_XAutStablecoin,
      borrowables: borrowableAssets_XAutStablecoin
    });

    address[] memory collateralAssets_WETHStablecoin = new address[](1);
    address[] memory borrowableAssets_WETHStablecoin = new address[](3);

    collateralAssets_WETHStablecoin[0] = AaveV3MantleAssets.WETH_UNDERLYING;
    borrowableAssets_WETHStablecoin[0] = AaveV3MantleAssets.USDT0_UNDERLYING;
    borrowableAssets_WETHStablecoin[1] = AaveV3MantleAssets.USDC_UNDERLYING;
    borrowableAssets_WETHStablecoin[2] = AaveV3MantleAssets.GHO_UNDERLYING;

    eModeCreations[1] = IAaveV3ConfigEngine.EModeCategoryCreation({
      ltv: 80_50,
      liqThreshold: 83_00,
      liqBonus: 5_50,
      label: 'WETH Stablecoin',
      collaterals: collateralAssets_WETHStablecoin,
      borrowables: borrowableAssets_WETHStablecoin
    });

    address[] memory collateralAssets_WMNTStablecoin = new address[](1);
    address[] memory borrowableAssets_WMNTStablecoin = new address[](3);

    collateralAssets_WMNTStablecoin[0] = AaveV3MantleAssets.WMNT_UNDERLYING;
    borrowableAssets_WMNTStablecoin[0] = AaveV3MantleAssets.USDT0_UNDERLYING;
    borrowableAssets_WMNTStablecoin[1] = AaveV3MantleAssets.USDC_UNDERLYING;
    borrowableAssets_WMNTStablecoin[2] = AaveV3MantleAssets.GHO_UNDERLYING;

    eModeCreations[2] = IAaveV3ConfigEngine.EModeCategoryCreation({
      ltv: 40_00,
      liqThreshold: 45_00,
      liqBonus: 10_00,
      label: 'WMNT stablecoin',
      collaterals: collateralAssets_WMNTStablecoin,
      borrowables: borrowableAssets_WMNTStablecoin
    });

    return eModeCreations;
  }
  function newListings() public pure override returns (IAaveV3ConfigEngine.Listing[] memory) {
    IAaveV3ConfigEngine.Listing[] memory listings = new IAaveV3ConfigEngine.Listing[](1);

    listings[0] = IAaveV3ConfigEngine.Listing({
      asset: XAUt,
      assetSymbol: 'XAUt',
      priceFeed: 0x5bc7Cf88EB131DB18b5d7930e793095140799aD5, // waiting for mantle XAUt/USD pricefeed
      enabledToBorrow: EngineFlags.DISABLED,
      borrowableInIsolation: EngineFlags.DISABLED,
      withSiloedBorrowing: EngineFlags.DISABLED,
      flashloanable: EngineFlags.ENABLED,
      ltv: 0,
      liqThreshold: 0,
      liqBonus: 0,
      reserveFactor: 50_00,
      supplyCap: 4_000,
      borrowCap: 1,
      debtCeiling: 0,
      liqProtocolFee: 10_00,
      rateStrategyParams: IAaveV3ConfigEngine.InterestRateInputData({
        optimalUsageRatio: 90_00,
        baseVariableBorrowRate: 0,
        variableRateSlope1: 10_00,
        variableRateSlope2: 300_00
      })
    });

    return listings;
  }
  function _supplyAndConfigureLMAdmin(address asset, uint256 seedAmount, address lmAdmin) internal {
    IERC20(asset).forceApprove(address(AaveV3Mantle.POOL), seedAmount);
    AaveV3Mantle.POOL.supply(asset, seedAmount, address(AaveV3Mantle.DUST_BIN), 0);

    if (lmAdmin != address(0)) {
      address aToken = AaveV3Mantle.POOL.getReserveAToken(asset);
      address vToken = AaveV3Mantle.POOL.getReserveVariableDebtToken(asset);
      IEmissionManager(AaveV3Mantle.EMISSION_MANAGER).setEmissionAdmin(asset, lmAdmin);
      IEmissionManager(AaveV3Mantle.EMISSION_MANAGER).setEmissionAdmin(aToken, lmAdmin);
      IEmissionManager(AaveV3Mantle.EMISSION_MANAGER).setEmissionAdmin(vToken, lmAdmin);
    }
  }
}
