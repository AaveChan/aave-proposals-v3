// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Ethereum} from 'aave-address-book/AaveV3Ethereum.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Ethereum_Fyfyfy_20260205} from './AaveV3Ethereum_Fyfyfy_20260205.sol';
import {AaveV3Ethereum_OnboardStrataSrUSDePTTokensToV3CoreInstance_20260120} from '../20260120_AaveV3Ethereum_OnboardStrataSrUSDePTTokensToV3CoreInstance/AaveV3Ethereum_OnboardStrataSrUSDePTTokensToV3CoreInstance_20260120.sol';

/**
 * @dev Test for AaveV3Ethereum_Fyfyfy_20260205
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20260205_AaveV3Ethereum_Fyfyfy/AaveV3Ethereum_Fyfyfy_20260205.t.sol -vv
 */
contract AaveV3Ethereum_Fyfyfy_20260205_Test is ProtocolV3TestBase {
  AaveV3Ethereum_Fyfyfy_20260205 internal proposal;
  AaveV3Ethereum_OnboardStrataSrUSDePTTokensToV3CoreInstance_20260120 internal previousProposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 24386780);
    previousProposal = new AaveV3Ethereum_OnboardStrataSrUSDePTTokensToV3CoreInstance_20260120();
    proposal = new AaveV3Ethereum_Fyfyfy_20260205();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest('AaveV3Ethereum_Fyfyfy_20260205', AaveV3Ethereum.POOL, address(proposal));
  }
}
