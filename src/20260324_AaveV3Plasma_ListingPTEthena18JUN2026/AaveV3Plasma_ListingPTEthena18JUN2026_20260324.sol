// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Plasma, AaveV3PlasmaAssets} from 'aave-address-book/AaveV3Plasma.sol';
import {AaveV3PayloadPlasma} from 'aave-helpers/src/v3-config-engine/AaveV3PayloadPlasma.sol';
import {EngineFlags} from 'aave-v3-origin/contracts/extensions/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-v3-origin/contracts/extensions/v3-config-engine/IAaveV3ConfigEngine.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {SafeERC20} from 'openzeppelin-contracts/contracts/token/ERC20/utils/SafeERC20.sol';
import {GovernanceV3Plasma} from 'aave-address-book/GovernanceV3Plasma.sol';
import {IEmissionManager} from 'aave-v3-origin/contracts/rewards/interfaces/IEmissionManager.sol';
import {MiscPlasma} from 'aave-address-book/MiscPlasma.sol';
import {IAgentHub} from '../interfaces/chaos-agents/IAgentHub.sol';
import {IPool} from 'aave-v3-origin/contracts/interfaces/IPool.sol';

/**
 * @title Listing PT Ethena 18JUN2026
 * @author Aave Chan Initiative @aci
 * - Snapshot: direct-to-aip
 * - Discussion: https://governance.aave.com/t/direct-to-aip-onboard-usde-susde-june-expiry-pt-tokens-on-aave-v3-plasma-instance/24304
 */
contract AaveV3Plasma_ListingPTEthena18JUN2026_20260324 is AaveV3PayloadPlasma {
  using SafeERC20 for IERC20;

  address public constant PT_USDe_18JUN2026 = 0x23B17d3944742ACe3d0C71586FcB320d1e4a1Ed2;
  uint256 public constant PT_USDe_18JUN2026_SEED_AMOUNT = 100e18;
  address public constant PT_USDe_18JUN2026_LM_ADMIN = 0xac140648435d03f784879cd789130F22Ef588Fcd;

  address public constant PT_sUSDE_18JUN2026 = 0x30559E3d35e33AB69399a3fe9F383d32bd3c016E;
  uint256 public constant PT_sUSDE_18JUN2026_SEED_AMOUNT = 100e18;
  address public constant PT_sUSDE_18JUN2026_LM_ADMIN = 0xac140648435d03f784879cd789130F22Ef588Fcd;

  error NoAvailableEmodeCategory();

  function _postExecute() internal override {
    _supplyAndConfigureLMAdmin(
      PT_USDe_18JUN2026,
      PT_USDe_18JUN2026_SEED_AMOUNT,
      PT_USDe_18JUN2026_LM_ADMIN
    );

    _supplyAndConfigureLMAdmin(
      PT_sUSDE_18JUN2026,
      PT_sUSDE_18JUN2026_SEED_AMOUNT,
      PT_sUSDE_18JUN2026_LM_ADMIN
    );

    AaveV3Plasma.POOL_CONFIGURATOR.setLiquidationProtocolFee(PT_USDe_18JUN2026, 1000);
    AaveV3Plasma.POOL_CONFIGURATOR.setLiquidationProtocolFee(PT_sUSDE_18JUN2026, 1000);

    uint8 nextID = _findFirstUnusedEmodeCategory(AaveV3Plasma.POOL);

    // whitelist the new eModes on automated chaos-agents [agentId 0: EModeCategoryUpdate_Core]
    IAgentHub(MiscPlasma.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 1)));
    IAgentHub(MiscPlasma.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 2)));
    IAgentHub(MiscPlasma.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 3)));
    IAgentHub(MiscPlasma.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 4)));

    // whitelist the new pt-assets on automated chaos-agents [agentId 1: PendleDiscountRateUpdate_Core]
    IAgentHub(MiscPlasma.AGENT_HUB).addAllowedMarket(1, PT_USDe_18JUN2026);
    IAgentHub(MiscPlasma.AGENT_HUB).addAllowedMarket(1, PT_sUSDE_18JUN2026);
  }

  function newListings() public pure override returns (IAaveV3ConfigEngine.Listing[] memory) {
    IAaveV3ConfigEngine.Listing[] memory listings = new IAaveV3ConfigEngine.Listing[](2);

    listings[0] = IAaveV3ConfigEngine.Listing({
      asset: PT_USDe_18JUN2026,
      assetSymbol: 'PT_USDe_18JUN2026',
      priceFeed: 0x0521d52A7eA98A8B737D367F81975019360e444f,
      enabledToBorrow: EngineFlags.DISABLED,
      borrowableInIsolation: EngineFlags.DISABLED,
      withSiloedBorrowing: EngineFlags.DISABLED,
      flashloanable: EngineFlags.ENABLED,
      ltv: 0,
      liqThreshold: 0,
      liqBonus: 0,
      reserveFactor: 45_00,
      supplyCap: 15_000_000,
      borrowCap: 1,
      debtCeiling: 0,
      liqProtocolFee: 0,
      rateStrategyParams: IAaveV3ConfigEngine.InterestRateInputData({
        optimalUsageRatio: 45_00,
        baseVariableBorrowRate: 0,
        variableRateSlope1: 10_00,
        variableRateSlope2: 300_00
      })
    });
    listings[1] = IAaveV3ConfigEngine.Listing({
      asset: PT_sUSDE_18JUN2026,
      assetSymbol: 'PT_sUSDE_18JUN2026',
      priceFeed: 0x13f2EA8dfa948c5247826283079615Ee4d0A1AA5, // previous capo, To-do when capo will be deployed update it here
      enabledToBorrow: EngineFlags.DISABLED,
      borrowableInIsolation: EngineFlags.DISABLED,
      withSiloedBorrowing: EngineFlags.DISABLED,
      flashloanable: EngineFlags.ENABLED,
      ltv: 0,
      liqThreshold: 0,
      liqBonus: 0,
      reserveFactor: 45_00,
      supplyCap: 50_000_000,
      borrowCap: 1,
      debtCeiling: 0,
      liqProtocolFee: 0,
      rateStrategyParams: IAaveV3ConfigEngine.InterestRateInputData({
        optimalUsageRatio: 45_00,
        baseVariableBorrowRate: 0,
        variableRateSlope1: 10_00,
        variableRateSlope2: 300_00
      })
    });

    return listings;
  }
  function _supplyAndConfigureLMAdmin(address asset, uint256 seedAmount, address lmAdmin) internal {
    IERC20(asset).forceApprove(address(AaveV3Plasma.POOL), seedAmount);
    AaveV3Plasma.POOL.supply(asset, seedAmount, address(AaveV3Plasma.DUST_BIN), 0);

    if (lmAdmin != address(0)) {
      address aToken = AaveV3Plasma.POOL.getReserveAToken(asset);
      address vToken = AaveV3Plasma.POOL.getReserveVariableDebtToken(asset);
      IEmissionManager(AaveV3Plasma.EMISSION_MANAGER).setEmissionAdmin(asset, lmAdmin);
      IEmissionManager(AaveV3Plasma.EMISSION_MANAGER).setEmissionAdmin(aToken, lmAdmin);
      IEmissionManager(AaveV3Plasma.EMISSION_MANAGER).setEmissionAdmin(vToken, lmAdmin);
    }
  }
  function eModeCategoryCreations()
    public
    pure
    override
    returns (IAaveV3ConfigEngine.EModeCategoryCreation[] memory)
  {
    IAaveV3ConfigEngine.EModeCategoryCreation[]
      memory eModeCreations = new IAaveV3ConfigEngine.EModeCategoryCreation[](4);

    address[] memory collateralAssets_PT_USDe_18JUN2026__Stablecoins = new address[](3);
    address[] memory borrowableAssets_PT_USDe_18JUN2026__Stablecoins = new address[](1);

    collateralAssets_PT_USDe_18JUN2026__Stablecoins[0] = PT_USDe_18JUN2026;
    collateralAssets_PT_USDe_18JUN2026__Stablecoins[1] = AaveV3PlasmaAssets.USDe_UNDERLYING;
    collateralAssets_PT_USDe_18JUN2026__Stablecoins[2] = AaveV3PlasmaAssets
      .PT_USDe_9APR2026_UNDERLYING;
    borrowableAssets_PT_USDe_18JUN2026__Stablecoins[0] = AaveV3PlasmaAssets.USDe_UNDERLYING;

    eModeCreations[0] = IAaveV3ConfigEngine.EModeCategoryCreation({
      ltv: 91_00,
      liqThreshold: 93_00,
      liqBonus: 3_10,
      label: 'PT_USDe_18JUN2026__Stablecoins',
      collaterals: collateralAssets_PT_USDe_18JUN2026__Stablecoins,
      borrowables: borrowableAssets_PT_USDe_18JUN2026__Stablecoins
    });

    address[] memory collateralAssets_PT_USDe_18JUN2026__USDe = new address[](3);
    address[] memory borrowableAssets_PT_USDe_18JUN2026__USDe = new address[](1);

    collateralAssets_PT_USDe_18JUN2026__USDe[0] = PT_USDe_18JUN2026;
    collateralAssets_PT_USDe_18JUN2026__USDe[1] = AaveV3PlasmaAssets.USDe_UNDERLYING;
    collateralAssets_PT_USDe_18JUN2026__USDe[2] = AaveV3PlasmaAssets.PT_USDe_9APR2026_UNDERLYING;
    borrowableAssets_PT_USDe_18JUN2026__USDe[0] = AaveV3PlasmaAssets.USDe_UNDERLYING;

    eModeCreations[1] = IAaveV3ConfigEngine.EModeCategoryCreation({
      ltv: 93_00,
      liqThreshold: 95_00,
      liqBonus: 2_10,
      label: 'PT_USDe_18JUN2026__USDe',
      collaterals: collateralAssets_PT_USDe_18JUN2026__USDe,
      borrowables: borrowableAssets_PT_USDe_18JUN2026__USDe
    });

    address[] memory collateralAssets_PT_sUSDE_18JUN2026__Stablecoins = new address[](3);
    address[] memory borrowableAssets_PT_sUSDE_18JUN2026__Stablecoins = new address[](1);

    collateralAssets_PT_sUSDE_18JUN2026__Stablecoins[0] = PT_sUSDE_18JUN2026;
    collateralAssets_PT_sUSDE_18JUN2026__Stablecoins[1] = AaveV3PlasmaAssets.sUSDe_UNDERLYING;
    collateralAssets_PT_sUSDE_18JUN2026__Stablecoins[2] = AaveV3PlasmaAssets
      .PT_sUSDE_9APR2026_UNDERLYING;
    borrowableAssets_PT_sUSDE_18JUN2026__Stablecoins[0] = AaveV3PlasmaAssets.USDe_UNDERLYING;

    eModeCreations[2] = IAaveV3ConfigEngine.EModeCategoryCreation({
      ltv: 90_00,
      liqThreshold: 92_00,
      liqBonus: 4_10,
      label: 'PT_sUSDE_18JUN2026__Stablecoins',
      collaterals: collateralAssets_PT_sUSDE_18JUN2026__Stablecoins,
      borrowables: borrowableAssets_PT_sUSDE_18JUN2026__Stablecoins
    });

    address[] memory collateralAssets_PT_sUSDE_18JUN2026__USDe = new address[](3);
    address[] memory borrowableAssets_PT_sUSDE_18JUN2026__USDe = new address[](1);

    collateralAssets_PT_sUSDE_18JUN2026__USDe[0] = PT_sUSDE_18JUN2026;
    collateralAssets_PT_sUSDE_18JUN2026__USDe[1] = AaveV3PlasmaAssets.sUSDe_UNDERLYING;
    collateralAssets_PT_sUSDE_18JUN2026__USDe[2] = AaveV3PlasmaAssets.PT_sUSDE_9APR2026_UNDERLYING;
    borrowableAssets_PT_sUSDE_18JUN2026__USDe[0] = AaveV3PlasmaAssets.USDe_UNDERLYING;

    eModeCreations[3] = IAaveV3ConfigEngine.EModeCategoryCreation({
      ltv: 91_90,
      liqThreshold: 93_90,
      liqBonus: 3_10,
      label: 'PT_sUSDE_18JUN2026__USDe',
      collaterals: collateralAssets_PT_sUSDE_18JUN2026__USDe,
      borrowables: borrowableAssets_PT_sUSDE_18JUN2026__USDe
    });

    return eModeCreations;
  }

  function _preExecute() internal override {
    // Uncomment if seed tokens need to be sourced from the Collector
    // (e.g. if direct funding to the executor was sent to the wrong address)
    // AaveV3Plasma.COLLECTOR.transfer(
    //   IERC20(PT_USDe_18JUN2026),
    //   GovernanceV3Plasma.EXECUTOR_LVL_1,
    //   PT_USDe_18JUN2026_SEED_AMOUNT
    // );
    // AaveV3Plasma.COLLECTOR.transfer(
    //   IERC20(PT_sUSDE_18JUN2026),
    //   GovernanceV3Plasma.EXECUTOR_LVL_1,
    //   PT_sUSDE_18JUN2026_SEED_AMOUNT
    // );
  }

  function _findFirstUnusedEmodeCategory(IPool pool) private view returns (uint8) {
    // eMode id 0 is skipped intentionally as it is the reserved default
    for (uint8 i = 1; i < 256; i++) {
      if (pool.getEModeCategoryCollateralConfig(i).liquidationThreshold == 0) return i;
    }
    revert NoAvailableEmodeCategory();
  }
}
