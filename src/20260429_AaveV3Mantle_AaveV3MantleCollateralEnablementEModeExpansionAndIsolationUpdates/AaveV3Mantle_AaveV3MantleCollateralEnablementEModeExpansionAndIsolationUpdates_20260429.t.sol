// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovV3Helpers} from 'aave-helpers/src/GovV3Helpers.sol';
import {AaveV3Mantle} from 'aave-address-book/AaveV3Mantle.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {IEmissionManager} from 'aave-v3-origin/contracts/rewards/interfaces/IEmissionManager.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Mantle_AaveV3MantleCollateralEnablementEModeExpansionAndIsolationUpdates_20260429} from './AaveV3Mantle_AaveV3MantleCollateralEnablementEModeExpansionAndIsolationUpdates_20260429.sol';

/**
 * @dev Test for AaveV3Mantle_AaveV3MantleCollateralEnablementEModeExpansionAndIsolationUpdates_20260429
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20260429_AaveV3Mantle_AaveV3MantleCollateralEnablementEModeExpansionAndIsolationUpdates/AaveV3Mantle_AaveV3MantleCollateralEnablementEModeExpansionAndIsolationUpdates_20260429.t.sol -vv
 */
contract AaveV3Mantle_AaveV3MantleCollateralEnablementEModeExpansionAndIsolationUpdates_20260429_Test is
  ProtocolV3TestBase
{
  AaveV3Mantle_AaveV3MantleCollateralEnablementEModeExpansionAndIsolationUpdates_20260429
    internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mantle'), 94939520);
    proposal = new AaveV3Mantle_AaveV3MantleCollateralEnablementEModeExpansionAndIsolationUpdates_20260429();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Mantle_AaveV3MantleCollateralEnablementEModeExpansionAndIsolationUpdates_20260429',
      AaveV3Mantle.POOL,
      address(proposal)
    );
  }

  function test_dustBinHasXAUtFunds() public {
    GovV3Helpers.executePayload(vm, address(proposal));
    address aTokenAddress = AaveV3Mantle.POOL.getReserveAToken(proposal.XAUt());
    assertGe(IERC20(aTokenAddress).balanceOf(address(AaveV3Mantle.DUST_BIN)), 10 ** 6);
  }

  function test_XAUtAdmin() public {
    GovV3Helpers.executePayload(vm, address(proposal));
    address aXAUt = AaveV3Mantle.POOL.getReserveAToken(proposal.XAUt());
    assertEq(
      IEmissionManager(AaveV3Mantle.EMISSION_MANAGER).getEmissionAdmin(proposal.XAUt()),
      proposal.XAUt_LM_ADMIN()
    );
    assertEq(
      IEmissionManager(AaveV3Mantle.EMISSION_MANAGER).getEmissionAdmin(aXAUt),
      proposal.XAUt_LM_ADMIN()
    );
  }
}
