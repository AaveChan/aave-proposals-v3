// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3GnosisAssets} from 'aave-address-book/AaveV3Gnosis.sol';
import {AaveV3PayloadGnosis} from 'aave-helpers/v3-config-engine/AaveV3PayloadGnosis.sol';
import {EngineFlags} from 'aave-helpers/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-helpers/v3-config-engine/IAaveV3ConfigEngine.sol';

/**
 * @title Increase Caps for Aave V3 GnosisChain Market
 * @author Alice Rozengarden (@Rozengarden - Aave-chan initiative)
 * - Snapshot: TODO
 * - Discussion: https://governance.aave.com/t/arfc-increase-caps-for-aave-v3-gnosischain-market/15464
 */
contract AaveV3Gnosis_IncreaseCapsForAaveV3GnosisChainMarket_20231114 is AaveV3PayloadGnosis {
  function capsUpdates() public pure override returns (IAaveV3ConfigEngine.CapsUpdate[] memory) {
    IAaveV3ConfigEngine.CapsUpdate[] memory capsUpdate = new IAaveV3ConfigEngine.CapsUpdate[](2);

    capsUpdate[0] = IAaveV3ConfigEngine.CapsUpdate({
      asset: AaveV3GnosisAssets.WETH_UNDERLYING,
      supplyCap: 6_000,
      borrowCap: 5_000
    });
    capsUpdate[1] = IAaveV3ConfigEngine.CapsUpdate({
      asset: AaveV3GnosisAssets.GNO_UNDERLYING,
      supplyCap: 40_000,
      borrowCap: EngineFlags.KEEP_CURRENT
    });

    return capsUpdate;
  }
}
