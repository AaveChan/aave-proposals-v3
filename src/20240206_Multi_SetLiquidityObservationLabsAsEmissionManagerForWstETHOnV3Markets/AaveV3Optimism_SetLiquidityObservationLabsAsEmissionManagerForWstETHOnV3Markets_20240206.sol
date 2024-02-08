// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IProposalGenericExecutor} from 'aave-helpers/interfaces/IProposalGenericExecutor.sol';
import {AaveV3Optimism, AaveV3OptimismAssets} from 'aave-address-book/AaveV3Optimism.sol';
import {IEmissionManager} from 'aave-v3-periphery/contracts/rewards/interfaces/IEmissionManager.sol';

/**
 * @title  Set Liquidity Observation Labs as Emission manager for wstETH on V3 markets
 * @author Aave Chan Initiative (ACI)
 * - Snapshot: https://snapshot.org/#/aave.eth/proposal/0xf30c35c586e283bae81fe1c22bd4b3cfc7f6da37bde19ac9e633414f28dc9e74
 * - Discussion: https://governance.aave.com/t/arfc-set-liquidity-observation-labs-as-emission-manager-for-wsteth-on-v3-markets/16479
 */
contract AaveV3Optimism_SetLiquidityObservationLabsAsEmissionManagerForWstETHOnV3Markets_20240206 is
  IProposalGenericExecutor
{
  address constant EMISSION_ADMIN = address(0);

  function execute() external {
    IEmissionManager(AaveV3Optimism.EMISSION_MANAGER).setEmissionAdmin(
      AaveV3OptimismAssets.wstETH_UNDERLYING,
      EMISSION_ADMIN
    );
  }
}
