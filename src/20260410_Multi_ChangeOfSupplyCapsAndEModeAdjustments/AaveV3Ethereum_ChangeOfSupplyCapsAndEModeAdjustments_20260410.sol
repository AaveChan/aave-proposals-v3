// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3EthereumAssets} from 'aave-address-book/AaveV3Ethereum.sol';
import {AaveV3PayloadEthereum} from 'aave-helpers/src/v3-config-engine/AaveV3PayloadEthereum.sol';
import {EngineFlags} from 'aave-v3-origin/contracts/extensions/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-v3-origin/contracts/extensions/v3-config-engine/IAaveV3ConfigEngine.sol';

/**
 * @title Change of supply caps and e-mode adjustments
 * @author Chaos Labs (implemented by Aavechan Initiative @aci via Skyward)
 * - Snapshot: direct-to-aip
 * - Discussion: https://governance.aave.com/t/direct-to-aip-change-of-supply-caps-and-adjustment-of-e-mode-assets-on-aave-v3-07-04-26/24396
 */
contract AaveV3Ethereum_ChangeOfSupplyCapsAndEModeAdjustments_20260410 is AaveV3PayloadEthereum {
  function capsUpdates() public pure override returns (IAaveV3ConfigEngine.CapsUpdate[] memory) {
    IAaveV3ConfigEngine.CapsUpdate[] memory capsUpdate = new IAaveV3ConfigEngine.CapsUpdate[](1);

    capsUpdate[0] = IAaveV3ConfigEngine.CapsUpdate({
      asset: AaveV3EthereumAssets.PT_srUSDe_25JUN2026_UNDERLYING,
      supplyCap: 100_000_000,
      borrowCap: EngineFlags.KEEP_CURRENT
    });

    return capsUpdate;
  }
}
