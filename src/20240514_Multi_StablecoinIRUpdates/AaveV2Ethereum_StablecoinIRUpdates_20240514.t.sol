// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV2Ethereum} from 'aave-address-book/AaveV2Ethereum.sol';

import 'forge-std/Test.sol';
import {ProtocolV2TestBase, ReserveConfig} from 'aave-helpers/ProtocolV2TestBase.sol';
import {AaveV2Ethereum_StablecoinIRUpdates_20240514} from './AaveV2Ethereum_StablecoinIRUpdates_20240514.sol';

/**
 * @dev Test for AaveV2Ethereum_StablecoinIRUpdates_20240514
 * command: FOUNDRY_PROFILE=mainnet forge test --match-path=src/20240514_Multi_StablecoinIRUpdates/AaveV2Ethereum_StablecoinIRUpdates_20240514.t.sol -vv
 */
contract AaveV2Ethereum_StablecoinIRUpdates_20240514_Test is ProtocolV2TestBase {
  AaveV2Ethereum_StablecoinIRUpdates_20240514 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 19870011);
    proposal = new AaveV2Ethereum_StablecoinIRUpdates_20240514();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV2Ethereum_StablecoinIRUpdates_20240514',
      AaveV2Ethereum.POOL,
      address(proposal)
    );
  }
}
