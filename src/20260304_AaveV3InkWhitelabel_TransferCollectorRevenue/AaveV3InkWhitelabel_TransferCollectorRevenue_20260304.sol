// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IProposalGenericExecutor} from 'aave-helpers/src/interfaces/IProposalGenericExecutor.sol';
import {AaveV3InkWhitelabel, AaveV3InkWhitelabelAssets} from 'aave-address-book/AaveV3InkWhitelabel.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';

/**
 * @title Transfer Collector Revenue
 * @author ACI
 */
contract AaveV3InkWhitelabel_TransferCollectorRevenue_20260304 is IProposalGenericExecutor {
  address public constant INK_TYDRO_TEAM_SAFE = 0x82d7d57C22F56d5f7dE062CbcA9783001f885302;

  function getTokens() public pure returns (address[] memory) {
    address[] memory tokens = new address[](7);
    tokens[0] = AaveV3InkWhitelabelAssets.WETH_A_TOKEN;
    tokens[1] = AaveV3InkWhitelabelAssets.GHO_A_TOKEN;
    tokens[2] = AaveV3InkWhitelabelAssets.USDe_A_TOKEN;
    tokens[3] = AaveV3InkWhitelabelAssets.USDT_A_TOKEN;
    tokens[4] = AaveV3InkWhitelabelAssets.USDG_A_TOKEN;
    tokens[5] = AaveV3InkWhitelabelAssets.USDC_A_TOKEN;
    tokens[6] = AaveV3InkWhitelabelAssets.kBTC_A_TOKEN;
    return tokens;
  }

  function execute() external {
    address[] memory tokens = getTokens();

    for (uint256 i = 0; i < tokens.length; i++) {
      uint256 balance = IERC20(tokens[i]).balanceOf(address(AaveV3InkWhitelabel.COLLECTOR));
      if (balance > 0) {
        AaveV3InkWhitelabel.COLLECTOR.transfer(IERC20(tokens[i]), INK_TYDRO_TEAM_SAFE, balance);
      }
    }
  }
}
