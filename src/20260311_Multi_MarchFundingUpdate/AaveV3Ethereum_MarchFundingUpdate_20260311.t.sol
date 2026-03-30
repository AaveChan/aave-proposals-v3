// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {AaveV3Ethereum, AaveV3EthereumAssets} from 'aave-address-book/AaveV3Ethereum.sol';
import {MiscEthereum} from 'aave-address-book/MiscEthereum.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Ethereum_MarchFundingUpdate_20260311} from './AaveV3Ethereum_MarchFundingUpdate_20260311.sol';

interface IMainnetSwapSteward {
  function tokenBudget(address token) external view returns (uint256);
  function swapApprovedToken(address from, address to) external view returns (bool);
  function priceOracle(address token) external view returns (address);
}

/**
 * @dev Test for AaveV3Ethereum_MarchFundingUpdate_20260311
 * command: FOUNDRY_PROFILE=test forge test --match-path=src/20260311_Multi_MarchFundingUpdate/AaveV3Ethereum_MarchFundingUpdate_20260311.t.sol -vv
 */
contract AaveV3Ethereum_MarchFundingUpdate_20260311_Test is ProtocolV3TestBase {
  AaveV3Ethereum_MarchFundingUpdate_20260311 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 24636212);
    proposal = new AaveV3Ethereum_MarchFundingUpdate_20260311();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Ethereum_MarchFundingUpdate_20260311',
      AaveV3Ethereum.POOL,
      address(proposal)
    );
  }

  function test_reimbursements() public {
    uint256 allowanceBefore = IERC20(AaveV3EthereumAssets.GHO_UNDERLYING).allowance(
      address(AaveV3Ethereum.COLLECTOR),
      proposal.TOKEN_LOGIC()
    );
    assertEq(allowanceBefore, 0);

    executePayload(vm, address(proposal));

    uint256 allowanceAfter = IERC20(AaveV3EthereumAssets.GHO_UNDERLYING).allowance(
      address(AaveV3Ethereum.COLLECTOR),
      proposal.TOKEN_LOGIC()
    );
    assertEq(allowanceAfter, allowanceBefore + proposal.REIMBURSEMENTS_GHO_AMOUNT());
  }

  function test_swapPaths() public {
    IMainnetSwapSteward steward = IMainnetSwapSteward(AaveV3Ethereum.COLLECTOR_SWAP_STEWARD);

    assertFalse(
      steward.swapApprovedToken(
        AaveV3EthereumAssets.WETH_UNDERLYING,
        AaveV3EthereumAssets.GHO_UNDERLYING
      )
    );

    assertFalse(
      steward.swapApprovedToken(
        AaveV3EthereumAssets.WETH_UNDERLYING,
        AaveV3EthereumAssets.AAVE_UNDERLYING
      )
    );

    assertFalse(
      steward.swapApprovedToken(
        AaveV3EthereumAssets.WETH_UNDERLYING,
        AaveV3EthereumAssets.USDC_UNDERLYING
      )
    );

    assertFalse(
      steward.swapApprovedToken(
        AaveV3EthereumAssets.WETH_UNDERLYING,
        AaveV3EthereumAssets.USDT_UNDERLYING
      )
    );

    executePayload(vm, address(proposal));

    assertTrue(
      steward.swapApprovedToken(
        AaveV3EthereumAssets.WETH_UNDERLYING,
        AaveV3EthereumAssets.GHO_UNDERLYING
      )
    );

    assertTrue(
      steward.swapApprovedToken(
        AaveV3EthereumAssets.WETH_UNDERLYING,
        AaveV3EthereumAssets.AAVE_UNDERLYING
      )
    );

    assertTrue(
      steward.swapApprovedToken(
        AaveV3EthereumAssets.WETH_UNDERLYING,
        AaveV3EthereumAssets.USDC_UNDERLYING
      )
    );

    assertTrue(
      steward.swapApprovedToken(
        AaveV3EthereumAssets.WETH_UNDERLYING,
        AaveV3EthereumAssets.USDT_UNDERLYING
      )
    );
  }

  function test_replenishSwapTokenBudget() public {
    assertEq(
      IMainnetSwapSteward(AaveV3Ethereum.COLLECTOR_SWAP_STEWARD).priceOracle(
        AaveV3EthereumAssets.WETH_UNDERLYING
      ),
      address(0)
    );

    uint256 budgetUsdtBefore = IMainnetSwapSteward(AaveV3Ethereum.COLLECTOR_SWAP_STEWARD)
      .tokenBudget(AaveV3EthereumAssets.USDT_UNDERLYING);

    uint256 budgetWethBefore = IMainnetSwapSteward(AaveV3Ethereum.COLLECTOR_SWAP_STEWARD)
      .tokenBudget(AaveV3EthereumAssets.WETH_UNDERLYING);

    executePayload(vm, address(proposal));

    assertEq(
      IMainnetSwapSteward(AaveV3Ethereum.COLLECTOR_SWAP_STEWARD).priceOracle(
        AaveV3EthereumAssets.WETH_UNDERLYING
      ),
      AaveV3EthereumAssets.WETH_ORACLE
    );

    uint256 budgetUsdtAfter = IMainnetSwapSteward(AaveV3Ethereum.COLLECTOR_SWAP_STEWARD)
      .tokenBudget(AaveV3EthereumAssets.USDT_UNDERLYING);

    uint256 budgetWethAfter = IMainnetSwapSteward(AaveV3Ethereum.COLLECTOR_SWAP_STEWARD)
      .tokenBudget(AaveV3EthereumAssets.WETH_UNDERLYING);

    assertEq(budgetUsdtAfter, budgetUsdtBefore + proposal.USDT_SWAP_BUDGET_AMOUNT());
    assertEq(budgetWethAfter, budgetWethBefore + proposal.WETH_SWAP_BUDGET_AMOUNT());
  }
}
