// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovV3Helpers} from 'aave-helpers/src/GovV3Helpers.sol';
import {AaveV3Ethereum} from 'aave-address-book/AaveV3Ethereum.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {IEmissionManager} from 'aave-v3-origin/contracts/rewards/interfaces/IEmissionManager.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Ethereum_ListingPTSrUsde25JUN2026_20260324} from './AaveV3Ethereum_ListingPTSrUsde25JUN2026_20260324.sol';

/**
 * @dev Test for AaveV3Ethereum_ListingPTSrUsde25JUN2026_20260324
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20260324_AaveV3Ethereum_ListingPTSrUsde25JUN2026/AaveV3Ethereum_ListingPTSrUsde25JUN2026_20260324.t.sol -vv
 */
contract AaveV3Ethereum_ListingPTSrUsde25JUN2026_20260324_Test is ProtocolV3TestBase {
  AaveV3Ethereum_ListingPTSrUsde25JUN2026_20260324 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 24727462);
    proposal = new AaveV3Ethereum_ListingPTSrUsde25JUN2026_20260324();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Ethereum_ListingPTSrUsde25JUN2026_20260324',
      AaveV3Ethereum.POOL,
      address(proposal)
    );
  }

  function test_dustBinHasPT_srUSDe_25JUN2026Funds() public {
    GovV3Helpers.executePayload(vm, address(proposal));
    address aTokenAddress = AaveV3Ethereum.POOL.getReserveAToken(proposal.PT_srUSDe_25JUN2026());
    assertGe(IERC20(aTokenAddress).balanceOf(address(AaveV3Ethereum.DUST_BIN)), 10 ** 18);
  }

  function test_PT_srUSDe_25JUN2026Admin() public {
    GovV3Helpers.executePayload(vm, address(proposal));
    address aPT_srUSDe_25JUN2026 = AaveV3Ethereum.POOL.getReserveAToken(
      proposal.PT_srUSDe_25JUN2026()
    );
    assertEq(
      IEmissionManager(AaveV3Ethereum.EMISSION_MANAGER).getEmissionAdmin(
        proposal.PT_srUSDe_25JUN2026()
      ),
      proposal.PT_srUSDe_25JUN2026_LM_ADMIN()
    );
    assertEq(
      IEmissionManager(AaveV3Ethereum.EMISSION_MANAGER).getEmissionAdmin(aPT_srUSDe_25JUN2026),
      proposal.PT_srUSDe_25JUN2026_LM_ADMIN()
    );
  }
}
