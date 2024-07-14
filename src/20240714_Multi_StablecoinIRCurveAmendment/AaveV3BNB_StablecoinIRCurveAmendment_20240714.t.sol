// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3BNB} from 'aave-address-book/AaveV3BNB.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {AaveV3BNB_StablecoinIRCurveAmendment_20240714} from './AaveV3BNB_StablecoinIRCurveAmendment_20240714.sol';

/**
 * @dev Test for AaveV3BNB_StablecoinIRCurveAmendment_20240714
 * command: FOUNDRY_PROFILE=bnb forge test --match-path=src/20240714_Multi_StablecoinIRCurveAmendment/AaveV3BNB_StablecoinIRCurveAmendment_20240714.t.sol -vv
 */
contract AaveV3BNB_StablecoinIRCurveAmendment_20240714_Test is ProtocolV3TestBase {
  AaveV3BNB_StablecoinIRCurveAmendment_20240714 internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('bnb'), 40474721);
    proposal = new AaveV3BNB_StablecoinIRCurveAmendment_20240714();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest('AaveV3BNB_StablecoinIRCurveAmendment_20240714', AaveV3BNB.POOL, address(proposal));
  }
}
