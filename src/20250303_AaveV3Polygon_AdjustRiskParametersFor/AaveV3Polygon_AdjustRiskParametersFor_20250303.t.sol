// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Polygon} from 'aave-address-book/AaveV3Polygon.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Polygon_AdjustRiskParametersFor_20250303} from './AaveV3Polygon_AdjustRiskParametersFor_20250303.sol';

/**
 * @dev Test for AaveV3Polygon_AdjustRiskParametersFor_20250303
 * command: FOUNDRY_PROFILE=polygon forge test --match-path=src/20250303_AaveV3Polygon_AdjustRiskParametersFor/AaveV3Polygon_AdjustRiskParametersFor_20250303.t.sol -vv
 */
contract AaveV3Polygon_AdjustRiskParametersFor_20250303_Test is ProtocolV3TestBase {
  AaveV3Polygon_AdjustRiskParametersFor_20250303 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('polygon'), 68608670);
    proposal = new AaveV3Polygon_AdjustRiskParametersFor_20250303();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Polygon_AdjustRiskParametersFor_20250303',
      AaveV3Polygon.POOL,
      address(proposal)
    );
  }
}
