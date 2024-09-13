// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovV3Helpers} from 'aave-helpers/src/GovV3Helpers.sol';
import {AaveV3EthereumLido} from 'aave-address-book/AaveV3EthereumLido.sol';
import {IERC20} from 'solidity-utils/contracts/oz-common/interfaces/IERC20.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3EthereumLido_OnboardUSDSAndSUSDSToAaveV3_20240913} from './AaveV3EthereumLido_OnboardUSDSAndSUSDSToAaveV3_20240913.sol';

/**
 * @dev Test for AaveV3EthereumLido_OnboardUSDSAndSUSDSToAaveV3_20240913
 * command: FOUNDRY_PROFILE=mainnet forge test --match-path=src/20240913_Multi_OnboardUSDSAndSUSDSToAaveV3/AaveV3EthereumLido_OnboardUSDSAndSUSDSToAaveV3_20240913.t.sol -vv
 */
contract AaveV3EthereumLido_OnboardUSDSAndSUSDSToAaveV3_20240913_Test is ProtocolV3TestBase {
  AaveV3EthereumLido_OnboardUSDSAndSUSDSToAaveV3_20240913 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 20744030);
    proposal = new AaveV3EthereumLido_OnboardUSDSAndSUSDSToAaveV3_20240913();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3EthereumLido_OnboardUSDSAndSUSDSToAaveV3_20240913',
      AaveV3EthereumLido.POOL,
      address(proposal)
    );
  }

  function test_collectorHasUSDSFunds() public {
    GovV3Helpers.executePayload(vm, address(proposal));
    (address aTokenAddress, , ) = AaveV3EthereumLido
      .AAVE_PROTOCOL_DATA_PROVIDER
      .getReserveTokensAddresses(proposal.USDS());
    assertGe(IERC20(aTokenAddress).balanceOf(address(AaveV3EthereumLido.COLLECTOR)), 10 ** 18);
  }
}
