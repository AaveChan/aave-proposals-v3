// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Ethereum, AaveV3EthereumAssets} from 'aave-address-book/AaveV3Ethereum.sol';

import {IERC20} from 'solidity-utils/contracts/oz-common/interfaces/IERC20.sol';
import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Ethereum_ChaosLabsAaveRiskManagementServiceRenewal_20241012} from './AaveV3Ethereum_ChaosLabsAaveRiskManagementServiceRenewal_20241012.sol';

/**
 * @dev Test for AaveV3Ethereum_ChaosLabsAaveRiskManagementServiceRenewal_20241012
 * command: FOUNDRY_PROFILE=mainnet forge test --match-path=src/20241012_AaveV3Ethereum_ChaosLabsAaveRiskManagementServiceRenewal/AaveV3Ethereum_ChaosLabsAaveRiskManagementServiceRenewal_20241012.t.sol -vv
 */
contract AaveV3Ethereum_ChaosLabsAaveRiskManagementServiceRenewal_20241012_Test is
  ProtocolV3TestBase
{
  AaveV3Ethereum_ChaosLabsAaveRiskManagementServiceRenewal_20241012 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 20952046);
    proposal = new AaveV3Ethereum_ChaosLabsAaveRiskManagementServiceRenewal_20241012();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    address receiverAddress = proposal.CHAOS_LABS_RECEIVER();
    uint256 ghoBalanceBefore = IERC20(AaveV3EthereumAssets.GHO_UNDERLYING).balanceOf(
      receiverAddress
    );
    uint256 aUsdcBalanceBefore = IERC20(AaveV3EthereumAssets.USDC_A_TOKEN).balanceOf(
      receiverAddress
    );

    uint256 nextStreamId = AaveV3Ethereum.COLLECTOR.getNextStreamId();
    vm.expectRevert();
    AaveV3Ethereum.COLLECTOR.getStream(nextStreamId);

    executePayload(vm, address(proposal));

    vm.warp(block.timestamp + 7 days);
    vm.startPrank(receiverAddress);

    AaveV3Ethereum.COLLECTOR.withdrawFromStream(nextStreamId, 1);
    assertEq(
      IERC20(AaveV3EthereumAssets.GHO_UNDERLYING).balanceOf(receiverAddress),
      ghoBalanceBefore + 1
    );

    AaveV3Ethereum.COLLECTOR.withdrawFromStream(nextStreamId + 1, 1);
    assertEq(
      IERC20(AaveV3EthereumAssets.USDC_A_TOKEN).balanceOf(receiverAddress),
      aUsdcBalanceBefore + 1
    );
  }
}
