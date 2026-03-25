// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3InkWhitelabel, AaveV3InkWhitelabelAssets} from 'aave-address-book/AaveV3InkWhitelabel.sol';
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
  address internal syrupUSDTHolder = 0x9e786E5E2fFE875cdEb3bDd34f932B9bAeD69423;

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
    assertGe(IERC20(aTokenAddress).balanceOf(address(AaveV3InkWhitelabel.DUST_BIN)), 100 * 10 ** 6);
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

  function _findEModeCategoryId(string memory label) internal view returns (uint8) {
    for (uint8 i = 1; i < 256; i++) {
      if (
        keccak256(bytes(AaveV3InkWhitelabel.POOL.getEModeCategoryLabel(i))) ==
        keccak256(bytes(label))
      ) {
        return i;
      }
    }
    revert('eMode category not found');
  }

  function test_borrowWithoutEModeReverts() public {
    executePayload(vm, address(proposal), AaveV3InkWhitelabel.POOL);

    uint256 supplyAmount = 100e6;
    address syrupUSDT_addr = proposal.syrupUSDT();

    vm.startPrank(syrupUSDTHolder);

    // supply syrupUSDT without entering e-mode
    IERC20(syrupUSDT_addr).approve(address(AaveV3InkWhitelabel.POOL), supplyAmount);
    AaveV3InkWhitelabel.POOL.supply(syrupUSDT_addr, supplyAmount, syrupUSDTHolder, 0);

    // borrow USDT must revert since syrupUSDT has LTV=0 outside e-mode
    vm.expectRevert();
    AaveV3InkWhitelabel.POOL.borrow(
      AaveV3InkWhitelabelAssets.USDT_UNDERLYING,
      50e6,
      2,
      0,
      syrupUSDTHolder
    );
    vm.stopPrank();
  }

  function test_supplyAndBorrowAfterPayload() public {
    executePayload(vm, address(proposal), AaveV3InkWhitelabel.POOL);

    uint8 eModeId = _findEModeCategoryId('syrupUSDT__USDT0');

    uint256 supplyAmount = 100e6;
    address syrupUSDT_addr = proposal.syrupUSDT();

    vm.startPrank(syrupUSDTHolder);

    // enter e-mode first so syrupUSDT gets e-mode LTV
    AaveV3InkWhitelabel.POOL.setUserEMode(eModeId);

    // supply syrupUSDT
    IERC20(syrupUSDT_addr).approve(address(AaveV3InkWhitelabel.POOL), supplyAmount);
    AaveV3InkWhitelabel.POOL.supply(syrupUSDT_addr, supplyAmount, syrupUSDTHolder, 0);

    address aSyrupUSDT = AaveV3InkWhitelabel.POOL.getReserveAToken(syrupUSDT_addr);
    assertApproxEqAbs(IERC20(aSyrupUSDT).balanceOf(syrupUSDTHolder), supplyAmount, 1);

    // borrow USDT
    uint256 borrowAmount = 50e6;
    AaveV3InkWhitelabel.POOL.borrow(
      AaveV3InkWhitelabelAssets.USDT_UNDERLYING,
      borrowAmount,
      2,
      0,
      syrupUSDTHolder
    );

    assertApproxEqAbs(
      IERC20(AaveV3InkWhitelabelAssets.USDT_V_TOKEN).balanceOf(syrupUSDTHolder),
      borrowAmount,
      0.1e6
    );
    vm.stopPrank();
  }
}
