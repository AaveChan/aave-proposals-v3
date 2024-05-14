// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Ethereum} from 'aave-address-book/AaveV3Ethereum.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {AaveV3Ethereum_StablecoinIRUpdates_20240514} from './AaveV3Ethereum_StablecoinIRUpdates_20240514.sol';

/**
 * @dev Test for AaveV3Ethereum_StablecoinIRUpdates_20240514
 * command: FOUNDRY_PROFILE=mainnet forge test --match-path=src/20240514_Multi_StablecoinIRUpdates/AaveV3Ethereum_StablecoinIRUpdates_20240514.t.sol -vv
 */
contract AaveV3Ethereum_StablecoinIRUpdates_20240514_Test is ProtocolV3TestBase {
  AaveV3Ethereum_StablecoinIRUpdates_20240514 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 19870011);
    proposal = new AaveV3Ethereum_StablecoinIRUpdates_20240514();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Ethereum_StablecoinIRUpdates_20240514',
      AaveV3Ethereum.POOL,
      address(proposal)
    );
  }
}
