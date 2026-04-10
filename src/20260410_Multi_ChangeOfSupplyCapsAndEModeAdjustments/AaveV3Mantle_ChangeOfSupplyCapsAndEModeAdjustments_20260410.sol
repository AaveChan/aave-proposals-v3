// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3MantleAssets} from 'aave-address-book/AaveV3Mantle.sol';
import {AaveV3PayloadMantle} from 'aave-helpers/src/v3-config-engine/AaveV3PayloadMantle.sol';
import {EngineFlags} from 'aave-v3-origin/contracts/extensions/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-v3-origin/contracts/extensions/v3-config-engine/IAaveV3ConfigEngine.sol';

/**
 * @title Change of supply caps and e-mode adjustments
 * @author Chaos Labs (implemented by Aavechan Initiative @aci via Skyward)
 * - Snapshot: direct-to-aip
 * - Discussion: https://governance.aave.com/t/direct-to-aip-change-of-supply-caps-and-adjustment-of-e-mode-assets-on-aave-v3-07-04-26/24396
 */
contract AaveV3Mantle_ChangeOfSupplyCapsAndEModeAdjustments_20260410 is AaveV3PayloadMantle {
  function capsUpdates() public pure override returns (IAaveV3ConfigEngine.CapsUpdate[] memory) {
    IAaveV3ConfigEngine.CapsUpdate[] memory capsUpdate = new IAaveV3ConfigEngine.CapsUpdate[](2);

    capsUpdate[0] = IAaveV3ConfigEngine.CapsUpdate({
      asset: AaveV3MantleAssets.FBTC_UNDERLYING,
      supplyCap: 100,
      borrowCap: EngineFlags.KEEP_CURRENT
    });
    capsUpdate[1] = IAaveV3ConfigEngine.CapsUpdate({
      asset: AaveV3MantleAssets.wrsETH_UNDERLYING,
      supplyCap: 70_000,
      borrowCap: EngineFlags.KEEP_CURRENT
    });

    return capsUpdate;
  }
}
