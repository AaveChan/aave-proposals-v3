// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Avalanche, AaveV3AvalancheAssets} from 'aave-address-book/AaveV3Avalanche.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {AaveV3Avalanche_GeneralizedLTLTVReductionOnAave_20240324} from './AaveV3Avalanche_GeneralizedLTLTVReductionOnAave_20240324.sol';

/**
 * @dev Test for AaveV3Avalanche_GeneralizedLTLTVReductionOnAave_20240324
 * command: make test-contract filter=AaveV3Avalanche_GeneralizedLTLTVReductionOnAave_20240324
 */
contract AaveV3Avalanche_GeneralizedLTLTVReductionOnAave_20240324_Test is ProtocolV3TestBase {
  struct Change {
    address asset;
    uint256 lt;
    uint256 ltv;
  }

  AaveV3Avalanche_GeneralizedLTLTVReductionOnAave_20240324 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('avalanche'), 43314428);
    proposal = new AaveV3Avalanche_GeneralizedLTLTVReductionOnAave_20240324();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    (ReserveConfig[] memory allConfigsBefore, ReserveConfig[] memory allConfigsAfter) = defaultTest(
      'AaveV3Avalanche_GeneralizedLTLTVReductionOnAave_20240324',
      AaveV3Avalanche.POOL,
      address(proposal)
    );

    address[] memory assetsChanged = new address[](3);
    assetsChanged[0] = AaveV3AvalancheAssets.DAIe_UNDERLYING;
    assetsChanged[1] = AaveV3AvalancheAssets.USDC_UNDERLYING;
    assetsChanged[2] = AaveV3AvalancheAssets.USDt_UNDERLYING;

    Change[] memory assetChanges = new Change[](3);
    assetChanges[0] = Change({asset: AaveV3AvalancheAssets.DAIe_UNDERLYING, ltv: 75_00, lt: 80_00});
    assetChanges[1] = Change({asset: AaveV3AvalancheAssets.USDC_UNDERLYING, ltv: 80_00, lt: 85_00});
    assetChanges[2] = Change({asset: AaveV3AvalancheAssets.USDt_UNDERLYING, ltv: 75_00, lt: 78_00});

    _noReservesConfigsChangesApartFrom(allConfigsBefore, allConfigsAfter, assetsChanged);

    for (uint i = 0; i < assetChanges.length; i++) {
      ReserveConfig memory config = _findReserveConfig(allConfigsAfter, assetChanges[i].asset);
      assertEq(config.ltv, assetChanges[i].ltv);
      assertEq(config.liquidationThreshold, assetChanges[i].lt);
    }
  }
}