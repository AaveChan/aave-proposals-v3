// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {AaveV3Ethereum, AaveV3EthereumAssets} from 'aave-address-book/AaveV3Ethereum.sol';
import {MiscEthereum} from 'aave-address-book/MiscEthereum.sol';
import {IWrappedTokenGatewayV3} from 'aave-v3-origin/contracts/helpers/interfaces/IWrappedTokenGatewayV3.sol';
import {IProposalGenericExecutor} from 'aave-helpers/src/interfaces/IProposalGenericExecutor.sol';

interface IMainnetSwapSteward {
  function setSwappablePair(address fromToken, address toToken, bool allowed) external;
  function setTokenOracle(address token, address oracle) external;
  function tokenBudget(address token) external view returns (uint256);
  function increaseTokenBudget(address token, uint256 budget) external;
}

/**
 * @title March Funding Update
 * @author TokenLogic
 * - Snapshot: Direct-to-AIP
 * - Discussion: https://governance.aave.com/t/direct-to-aip-march-2026-funding-update/24225
 */
contract AaveV3Ethereum_MarchFundingUpdate_20260311 is IProposalGenericExecutor {
  // https://etherscan.io/address/0xAA088dfF3dcF619664094945028d44E779F19894
  address public constant TOKEN_LOGIC = 0xAA088dfF3dcF619664094945028d44E779F19894;
  uint256 public constant REIMBURSEMENTS_GHO_AMOUNT = 24_900 ether;

  uint256 public constant WETH_SWAP_BUDGET_AMOUNT = 3_000 ether;
  uint256 public constant USDT_SWAP_BUDGET_AMOUNT = 2_000_000e6;

  function execute() external {
    _depositEth();
    _reimbursements();
    _swapPathsAndBudget();
    _replenishAllowances();
  }

  function _depositEth() internal {
    uint256 ethBalance = address(AaveV3Ethereum.COLLECTOR).balance;
    AaveV3Ethereum.COLLECTOR.transfer(
      IERC20(AaveV3Ethereum.COLLECTOR.ETH_MOCK_ADDRESS()),
      address(this),
      ethBalance
    );
    IWrappedTokenGatewayV3(AaveV3Ethereum.WETH_GATEWAY).depositETH{value: ethBalance}(
      address(AaveV3Ethereum.POOL),
      address(AaveV3Ethereum.COLLECTOR),
      0
    );
  }

  function _reimbursements() internal {
    AaveV3Ethereum.COLLECTOR.approve(
      IERC20(AaveV3EthereumAssets.GHO_UNDERLYING),
      TOKEN_LOGIC,
      REIMBURSEMENTS_GHO_AMOUNT
    );
  }

  function _swapPathsAndBudget() internal {
    IMainnetSwapSteward(AaveV3Ethereum.COLLECTOR_SWAP_STEWARD).setTokenOracle(
      AaveV3EthereumAssets.WETH_UNDERLYING,
      AaveV3EthereumAssets.WETH_ORACLE
    );

    IMainnetSwapSteward(AaveV3Ethereum.COLLECTOR_SWAP_STEWARD).setSwappablePair(
      AaveV3EthereumAssets.WETH_UNDERLYING,
      AaveV3EthereumAssets.GHO_UNDERLYING,
      true
    );

    IMainnetSwapSteward(AaveV3Ethereum.COLLECTOR_SWAP_STEWARD).setSwappablePair(
      AaveV3EthereumAssets.WETH_UNDERLYING,
      AaveV3EthereumAssets.AAVE_UNDERLYING,
      true
    );

    IMainnetSwapSteward(AaveV3Ethereum.COLLECTOR_SWAP_STEWARD).setSwappablePair(
      AaveV3EthereumAssets.WETH_UNDERLYING,
      AaveV3EthereumAssets.USDC_UNDERLYING,
      true
    );

    IMainnetSwapSteward(AaveV3Ethereum.COLLECTOR_SWAP_STEWARD).setSwappablePair(
      AaveV3EthereumAssets.WETH_UNDERLYING,
      AaveV3EthereumAssets.USDT_UNDERLYING,
      true
    );
  }

  function _replenishAllowances() internal {
    IMainnetSwapSteward(AaveV3Ethereum.COLLECTOR_SWAP_STEWARD).increaseTokenBudget(
      AaveV3EthereumAssets.WETH_UNDERLYING,
      WETH_SWAP_BUDGET_AMOUNT
    );

    IMainnetSwapSteward(AaveV3Ethereum.COLLECTOR_SWAP_STEWARD).increaseTokenBudget(
      AaveV3EthereumAssets.USDT_UNDERLYING,
      USDT_SWAP_BUDGET_AMOUNT
    );
  }
}
