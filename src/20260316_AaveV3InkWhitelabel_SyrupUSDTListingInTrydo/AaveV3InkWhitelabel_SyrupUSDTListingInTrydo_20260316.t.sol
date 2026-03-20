// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3InkWhitelabel} from 'aave-address-book/AaveV3InkWhitelabel.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {IEmissionManager} from 'aave-v3-origin/contracts/rewards/interfaces/IEmissionManager.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3InkWhitelabel_SyrupUSDTListingInTrydo_20260316} from './AaveV3InkWhitelabel_SyrupUSDTListingInTrydo_20260316.sol';

/**
 * @dev Test for AaveV3InkWhitelabel_SyrupUSDTListingInTrydo_20260316
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20260316_AaveV3InkWhitelabel_SyrupUSDTListingInTrydo/AaveV3InkWhitelabel_SyrupUSDTListingInTrydo_20260316.t.sol -vv
 */
contract AaveV3InkWhitelabel_SyrupUSDTListingInTrydo_20260316_Test is ProtocolV3TestBase {
  AaveV3InkWhitelabel_SyrupUSDTListingInTrydo_20260316 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('ink'), 40519576);
    proposal = new AaveV3InkWhitelabel_SyrupUSDTListingInTrydo_20260316();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3InkWhitelabel_SyrupUSDTListingInTrydo_20260316',
      AaveV3InkWhitelabel.POOL,
      address(proposal),
      true,
      true
    );
  }

  function test_dustBinHassyrupUSDTFunds() public {
    executePayload(vm, address(proposal), AaveV3InkWhitelabel.POOL);
    address aTokenAddress = AaveV3InkWhitelabel.POOL.getReserveAToken(proposal.syrupUSDT());
    assertGe(IERC20(aTokenAddress).balanceOf(address(AaveV3InkWhitelabel.DUST_BIN)), 10 ** 6);
  }

  function test_syrupUSDTAdmin() public {
    executePayload(vm, address(proposal), AaveV3InkWhitelabel.POOL);
    address asyrupUSDT = AaveV3InkWhitelabel.POOL.getReserveAToken(proposal.syrupUSDT());
    assertEq(
      IEmissionManager(AaveV3InkWhitelabel.EMISSION_MANAGER).getEmissionAdmin(proposal.syrupUSDT()),
      proposal.syrupUSDT_LM_ADMIN()
    );
    assertEq(
      IEmissionManager(AaveV3InkWhitelabel.EMISSION_MANAGER).getEmissionAdmin(asyrupUSDT),
      proposal.syrupUSDT_LM_ADMIN()
    );
  }
}
