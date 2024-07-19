// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3BaseAssets} from 'aave-address-book/AaveV3Base.sol';
import {AaveV3PayloadBase} from 'aave-helpers/v3-config-engine/AaveV3PayloadBase.sol';
import {EngineFlags} from 'aave-helpers/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-helpers/v3-config-engine/IAaveV3ConfigEngine.sol';
/**
 * @title Reduce Reserve Factor on wstETH
 * @author Aave Chan Initiative
 * - Snapshot: https://snapshot.org/#/aave.eth/proposal/0x7ef3a8d68fa8a1b69d298aceddfafe9d2a24eefb19365d995c839b1cd1b0b97d
 * - Discussion: https://governance.aave.com/t/arfc-reduce-reserve-factor-on-wsteth/18044/1
 */
contract AaveV3Base_ReduceReserveFactorOnWstETH_20240716 is AaveV3PayloadBase {
  function borrowsUpdates()
    public
    pure
    override
    returns (IAaveV3ConfigEngine.BorrowUpdate[] memory)
  {
    IAaveV3ConfigEngine.BorrowUpdate[]
      memory borrowUpdates = new IAaveV3ConfigEngine.BorrowUpdate[](1);

    borrowUpdates[0] = IAaveV3ConfigEngine.BorrowUpdate({
      asset: AaveV3BaseAssets.wstETH_UNDERLYING,
      enabledToBorrow: EngineFlags.KEEP_CURRENT,
      flashloanable: EngineFlags.KEEP_CURRENT,
      stableRateModeEnabled: EngineFlags. KEEP_CURRENT,
      borrowableInIsolation: EngineFlags. KEEP_CURRENT,
      withSiloedBorrowing: EngineFlags. KEEP_CURRENT,
      reserveFactor: 5_00
    });

    return borrowUpdates;
  }
}
