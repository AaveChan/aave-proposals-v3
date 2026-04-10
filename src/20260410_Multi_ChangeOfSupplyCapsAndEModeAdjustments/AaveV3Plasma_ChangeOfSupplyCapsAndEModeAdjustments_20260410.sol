// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3PlasmaAssets, AaveV3PlasmaEModes} from 'aave-address-book/AaveV3Plasma.sol';
import {AaveV3PayloadPlasma} from 'aave-helpers/src/v3-config-engine/AaveV3PayloadPlasma.sol';
import {EngineFlags} from 'aave-v3-origin/contracts/extensions/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-v3-origin/contracts/extensions/v3-config-engine/IAaveV3ConfigEngine.sol';

/**
 * @title Change of supply caps and e-mode adjustments
 * @author Chaos Labs (implemented by Aavechan Initiative @aci via Skyward)
 * - Snapshot: direct-to-aip
 * - Discussion: https://governance.aave.com/t/direct-to-aip-change-of-supply-caps-and-adjustment-of-e-mode-assets-on-aave-v3-07-04-26/24396
 */
contract AaveV3Plasma_ChangeOfSupplyCapsAndEModeAdjustments_20260410 is AaveV3PayloadPlasma {
  function capsUpdates() public pure override returns (IAaveV3ConfigEngine.CapsUpdate[] memory) {
    IAaveV3ConfigEngine.CapsUpdate[] memory capsUpdate = new IAaveV3ConfigEngine.CapsUpdate[](1);

    capsUpdate[0] = IAaveV3ConfigEngine.CapsUpdate({
      asset: AaveV3PlasmaAssets.PT_sUSDE_18JUN2026_UNDERLYING,
      supplyCap: 500_000_000,
      borrowCap: EngineFlags.KEEP_CURRENT
    });

    return capsUpdate;
  }
  function eModeCategoriesUpdates()
    public
    pure
    override
    returns (IAaveV3ConfigEngine.EModeCategoryUpdate[] memory)
  {
    IAaveV3ConfigEngine.EModeCategoryUpdate[]
      memory eModeUpdates = new IAaveV3ConfigEngine.EModeCategoryUpdate[](2);

    eModeUpdates[0] = IAaveV3ConfigEngine.EModeCategoryUpdate({
      eModeCategory: AaveV3PlasmaEModes.USDe_PT_USDe_9APR2026_PT_USDe_18JUN2026__USDT0_USDe,
      ltv: EngineFlags.KEEP_CURRENT,
      liqThreshold: EngineFlags.KEEP_CURRENT,
      liqBonus: EngineFlags.KEEP_CURRENT,
      label: 'USDe_PT_USDe_9APR2026_PT_USDe_18JUN2026__Stablecoins'
    });
    eModeUpdates[1] = IAaveV3ConfigEngine.EModeCategoryUpdate({
      eModeCategory: AaveV3PlasmaEModes.sUSDe_PT_sUSDE_9APR2026_PT_sUSDE_18JUN2026__USDT0_USDe,
      ltv: EngineFlags.KEEP_CURRENT,
      liqThreshold: EngineFlags.KEEP_CURRENT,
      liqBonus: EngineFlags.KEEP_CURRENT,
      label: 'sUSDe_PT_sUSDE_9APR2026_PT_sUSDE_18JUN2026__Stablecoins'
    });

    return eModeUpdates;
  }

  function assetsEModeUpdates()
    public
    pure
    override
    returns (IAaveV3ConfigEngine.AssetEModeUpdate[] memory)
  {
    IAaveV3ConfigEngine.AssetEModeUpdate[]
      memory assetEModeUpdates = new IAaveV3ConfigEngine.AssetEModeUpdate[](2);

    assetEModeUpdates[0] = IAaveV3ConfigEngine.AssetEModeUpdate({
      asset: AaveV3PlasmaAssets.GHO_UNDERLYING,
      eModeCategory: AaveV3PlasmaEModes.sUSDe_PT_sUSDE_9APR2026_PT_sUSDE_18JUN2026__USDT0_USDe,
      borrowable: EngineFlags.ENABLED,
      collateral: EngineFlags.KEEP_CURRENT,
      ltvzero: EngineFlags.KEEP_CURRENT
    });
    assetEModeUpdates[1] = IAaveV3ConfigEngine.AssetEModeUpdate({
      asset: AaveV3PlasmaAssets.PT_sUSDE_18JUN2026_UNDERLYING,
      eModeCategory: AaveV3PlasmaEModes.USDe_PT_USDe_9APR2026_PT_USDe_18JUN2026__USDT0_USDe,
      borrowable: EngineFlags.ENABLED,
      collateral: EngineFlags.KEEP_CURRENT,
      ltvzero: EngineFlags.KEEP_CURRENT
    });
    return assetEModeUpdates;
  }
}
