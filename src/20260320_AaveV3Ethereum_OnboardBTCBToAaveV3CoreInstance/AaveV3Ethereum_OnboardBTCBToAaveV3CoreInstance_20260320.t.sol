// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovV3Helpers} from 'aave-helpers/src/GovV3Helpers.sol';
import {AaveV3Ethereum} from 'aave-address-book/AaveV3Ethereum.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {IEmissionManager} from 'aave-v3-origin/contracts/rewards/interfaces/IEmissionManager.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Ethereum_OnboardBTCBToAaveV3CoreInstance_20260320} from './AaveV3Ethereum_OnboardBTCBToAaveV3CoreInstance_20260320.sol';

/**
 * @dev Test for AaveV3Ethereum_OnboardBTCBToAaveV3CoreInstance_20260320
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20260320_AaveV3Ethereum_OnboardBTCBToAaveV3CoreInstance/AaveV3Ethereum_OnboardBTCBToAaveV3CoreInstance_20260320.t.sol -vv
 */
contract AaveV3Ethereum_OnboardBTCBToAaveV3CoreInstance_20260320_Test is ProtocolV3TestBase {
  AaveV3Ethereum_OnboardBTCBToAaveV3CoreInstance_20260320 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 24699051);
    proposal = new AaveV3Ethereum_OnboardBTCBToAaveV3CoreInstance_20260320();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Ethereum_OnboardBTCBToAaveV3CoreInstance_20260320',
      AaveV3Ethereum.POOL,
      address(proposal)
    );
  }

  function test_dustBinHasBTCbFunds() public {
    GovV3Helpers.executePayload(vm, address(proposal));
    address aTokenAddress = AaveV3Ethereum.POOL.getReserveAToken(proposal.BTCb());
    assertGe(IERC20(aTokenAddress).balanceOf(address(AaveV3Ethereum.DUST_BIN)), 15 * 10 ** 4);
  }

  function test_BTCbAdmin() public {
    GovV3Helpers.executePayload(vm, address(proposal));
    address aBTCb = AaveV3Ethereum.POOL.getReserveAToken(proposal.BTCb());
    assertEq(
      IEmissionManager(AaveV3Ethereum.EMISSION_MANAGER).getEmissionAdmin(proposal.BTCb()),
      proposal.BTCb_LM_ADMIN()
    );
    assertEq(
      IEmissionManager(AaveV3Ethereum.EMISSION_MANAGER).getEmissionAdmin(aBTCb),
      proposal.BTCb_LM_ADMIN()
    );
  }
}
