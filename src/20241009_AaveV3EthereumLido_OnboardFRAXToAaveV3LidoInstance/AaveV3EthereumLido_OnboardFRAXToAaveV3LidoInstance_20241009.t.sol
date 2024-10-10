// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GovV3Helpers} from 'aave-helpers/src/GovV3Helpers.sol';
import {AaveV3EthereumLido} from 'aave-address-book/AaveV3EthereumLido.sol';
import {IERC20} from 'solidity-utils/contracts/oz-common/interfaces/IERC20.sol';
import {IEmissionManager} from 'aave-v3-origin/contracts/rewards/interfaces/IEmissionManager.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3EthereumLido_OnboardFRAXToAaveV3LidoInstance_20241009} from './AaveV3EthereumLido_OnboardFRAXToAaveV3LidoInstance_20241009.sol';

/**
 * @dev Test for AaveV3EthereumLido_OnboardFRAXToAaveV3LidoInstance_20241009
 * command: FOUNDRY_PROFILE=mainnet forge test --match-path=src/20241009_AaveV3EthereumLido_OnboardFRAXToAaveV3LidoInstance/AaveV3EthereumLido_OnboardFRAXToAaveV3LidoInstance_20241009.t.sol -vv
 */
contract AaveV3EthereumLido_OnboardFRAXToAaveV3LidoInstance_20241009_Test is ProtocolV3TestBase {
  AaveV3EthereumLido_OnboardFRAXToAaveV3LidoInstance_20241009 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('mainnet'), 20936937);
    proposal = new AaveV3EthereumLido_OnboardFRAXToAaveV3LidoInstance_20241009();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3EthereumLido_OnboardFRAXToAaveV3LidoInstance_20241009',
      AaveV3EthereumLido.POOL,
      address(proposal)
    );
  }

  function test_collectorHasFRAXFunds() public {
    GovV3Helpers.executePayload(vm, address(proposal));
    (address aTokenAddress, , ) = AaveV3EthereumLido
      .AAVE_PROTOCOL_DATA_PROVIDER
      .getReserveTokensAddresses(proposal.FRAX());
    assertGe(IERC20(aTokenAddress).balanceOf(address(AaveV3EthereumLido.COLLECTOR)), 10 ** 18);
  }

  function test_FRAXAdmin() public {
    GovV3Helpers.executePayload(vm, address(proposal));
    (address aFRAX, , ) = AaveV3EthereumLido.AAVE_PROTOCOL_DATA_PROVIDER.getReserveTokensAddresses(
      proposal.FRAX()
    );
    assertEq(
      IEmissionManager(AaveV3EthereumLido.EMISSION_MANAGER).getEmissionAdmin(proposal.FRAX()),
      proposal.FRAX_LM_ADMIN()
    );
    assertEq(
      IEmissionManager(AaveV3EthereumLido.EMISSION_MANAGER).getEmissionAdmin(aFRAX),
      proposal.FRAX_LM_ADMIN()
    );
  }
}
