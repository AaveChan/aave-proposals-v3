// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovV3Helpers} from 'aave-helpers/GovV3Helpers.sol';
import {AaveV3Arbitrum} from 'aave-address-book/AaveV3Arbitrum.sol';
import {IERC20} from 'solidity-utils/contracts/oz-common/interfaces/IERC20.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {AaveV3Arbitrum_GmETHListing_20240325} from './AaveV3Arbitrum_GmETHListing_20240325.sol';

/**
 * @dev Test for AaveV3Arbitrum_GmETHListing_20240325
 * command: make test-contract filter=AaveV3Arbitrum_GmETHListing_20240325
 */
contract AaveV3Arbitrum_GmETHListing_20240325_Test is ProtocolV3TestBase {
  AaveV3Arbitrum_GmETHListing_20240325 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('arbitrum'), 194161855);
    proposal = new AaveV3Arbitrum_GmETHListing_20240325();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest('AaveV3Arbitrum_GmETHListing_20240325', AaveV3Arbitrum.POOL, address(proposal));
  }

  function test_collectorHasgmETHFunds() public {
    GovV3Helpers.executePayload(vm, address(proposal));
    (address aTokenAddress, , ) = AaveV3Arbitrum
      .AAVE_PROTOCOL_DATA_PROVIDER
      .getReserveTokensAddresses(proposal.gmETH());
    assertGe(IERC20(aTokenAddress).balanceOf(address(AaveV3Arbitrum.COLLECTOR)), 10 ** 18);
  }
}
