// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovV3Helpers} from 'aave-helpers/GovV3Helpers.sol';
import {AaveV3Ethereum} from 'aave-address-book/AaveV3Ethereum.sol';
import {IERC20} from 'solidity-utils/contracts/oz-common/interfaces/IERC20.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {AaveV3Ethereum_RemoveFraxFromIsolationModeAndOnboardSFRAXToAaveV3Mainnet_20240805} from './AaveV3Ethereum_RemoveFraxFromIsolationModeAndOnboardSFRAXToAaveV3Mainnet_20240805.sol';

/**
 * @dev Test for AaveV3Ethereum_RemoveFraxFromIsolationModeAndOnboardSFRAXToAaveV3Mainnet_20240805
 * command: FOUNDRY_PROFILE=mainnet forge test --match-path=src/20240805_AaveV3Ethereum_RemoveFraxFromIsolationModeAndOnboardSFRAXToAaveV3Mainnet/AaveV3Ethereum_RemoveFraxFromIsolationModeAndOnboardSFRAXToAaveV3Mainnet_20240805.t.sol -vv
 */
contract AaveV3Ethereum_RemoveFraxFromIsolationModeAndOnboardSFRAXToAaveV3Mainnet_20240805_Test is
  ProtocolV3TestBase
{
  AaveV3Ethereum_RemoveFraxFromIsolationModeAndOnboardSFRAXToAaveV3Mainnet_20240805
    internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 20468040);
    proposal = new AaveV3Ethereum_RemoveFraxFromIsolationModeAndOnboardSFRAXToAaveV3Mainnet_20240805();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Ethereum_RemoveFraxFromIsolationModeAndOnboardSFRAXToAaveV3Mainnet_20240805',
      AaveV3Ethereum.POOL,
      address(proposal)
    );
  }

  function test_collectorHassFRAXFunds() public {
    GovV3Helpers.executePayload(vm, address(proposal));
    (address aTokenAddress, , ) = AaveV3Ethereum
      .AAVE_PROTOCOL_DATA_PROVIDER
      .getReserveTokensAddresses(proposal.sFRAX());
    assertGe(IERC20(aTokenAddress).balanceOf(address(AaveV3Ethereum.COLLECTOR)), 10 * 10 ** 18);
  }
}
