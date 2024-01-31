// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovV3Helpers} from 'aave-helpers/GovV3Helpers.sol';
import {AaveV3Ethereum} from 'aave-address-book/AaveV3Ethereum.sol';
import {IERC20} from 'solidity-utils/contracts/oz-common/interfaces/IERC20.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {AaveV3Ethereum_AddPYUSDToAaveV3EthereumPool_20240131} from './AaveV3Ethereum_AddPYUSDToAaveV3EthereumPool_20240131.sol';

/**
 * @dev Test for AaveV3Ethereum_AddPYUSDToAaveV3EthereumPool_20240131
 * command: make test-contract filter=AaveV3Ethereum_AddPYUSDToAaveV3EthereumPool_20240131
 */
contract AaveV3Ethereum_AddPYUSDToAaveV3EthereumPool_20240131_Test is ProtocolV3TestBase {
  AaveV3Ethereum_AddPYUSDToAaveV3EthereumPool_20240131 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 19128871);
    proposal = new AaveV3Ethereum_AddPYUSDToAaveV3EthereumPool_20240131();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Ethereum_AddPYUSDToAaveV3EthereumPool_20240131',
      AaveV3Ethereum.POOL,
      address(proposal)
    );
  }

  function test_collectorHasPYUSDFunds() public {
    GovV3Helpers.executePayload(vm, address(proposal));
    (address aTokenAddress, , ) = AaveV3Ethereum
      .AAVE_PROTOCOL_DATA_PROVIDER
      .getReserveTokensAddresses(proposal.PYUSD());
    assertGe(IERC20(aTokenAddress).balanceOf(address(AaveV3Ethereum.COLLECTOR)), 10 ** 6);
  }
}
