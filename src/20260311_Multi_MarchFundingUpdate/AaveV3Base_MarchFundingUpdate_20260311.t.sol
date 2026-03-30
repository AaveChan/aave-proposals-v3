// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {AaveV3Base, AaveV3BaseAssets} from 'aave-address-book/AaveV3Base.sol';
import {MiscBase} from 'aave-address-book/MiscBase.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Base_MarchFundingUpdate_20260311} from './AaveV3Base_MarchFundingUpdate_20260311.sol';

/**
 * @dev Test for AaveV3Base_MarchFundingUpdate_20260311
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20260311_Multi_MarchFundingUpdate/AaveV3Base_MarchFundingUpdate_20260311.t.sol -vv
 */
contract AaveV3Base_MarchFundingUpdate_20260311_Test is ProtocolV3TestBase {
  AaveV3Base_MarchFundingUpdate_20260311 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('base'), 43233365);
    proposal = new AaveV3Base_MarchFundingUpdate_20260311();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest('AaveV3Base_MarchFundingUpdate_20260311', AaveV3Base.POOL, address(proposal));
  }

  function test_approvals() public {
    assertEq(
      IERC20(AaveV3BaseAssets.USDC_A_TOKEN).allowance(
        address(AaveV3Base.COLLECTOR),
        MiscBase.AFC_SAFE
      ),
      0
    );

    executePayload(vm, address(proposal));

    assertEq(
      IERC20(AaveV3BaseAssets.USDC_A_TOKEN).allowance(
        address(AaveV3Base.COLLECTOR),
        MiscBase.AFC_SAFE
      ),
      proposal.USDC_ALLOWANCE()
    );

    vm.startPrank(MiscBase.AFC_SAFE);
    IERC20(AaveV3BaseAssets.USDC_A_TOKEN).transferFrom(
      address(AaveV3Base.COLLECTOR),
      MiscBase.AFC_SAFE,
      proposal.USDC_ALLOWANCE()
    );
    vm.stopPrank();
  }
}
