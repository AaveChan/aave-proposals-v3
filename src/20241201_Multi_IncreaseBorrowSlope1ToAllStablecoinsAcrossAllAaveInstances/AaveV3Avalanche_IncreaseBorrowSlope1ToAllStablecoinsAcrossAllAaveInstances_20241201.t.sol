// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Avalanche} from 'aave-address-book/AaveV3Avalanche.sol';

import 'forge-std/Test.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/src/ProtocolV3TestBase.sol';
import {AaveV3Avalanche_IncreaseBorrowSlope1ToAllStablecoinsAcrossAllAaveInstances_20241201} from './AaveV3Avalanche_IncreaseBorrowSlope1ToAllStablecoinsAcrossAllAaveInstances_20241201.sol';

/**
 * @dev Test for AaveV3Avalanche_IncreaseBorrowSlope1ToAllStablecoinsAcrossAllAaveInstances_20241201
 * command: FOUNDRY_PROFILE=avalanche forge test --match-path=src/20241201_Multi_IncreaseBorrowSlope1ToAllStablecoinsAcrossAllAaveInstances/AaveV3Avalanche_IncreaseBorrowSlope1ToAllStablecoinsAcrossAllAaveInstances_20241201.t.sol -vv
 */
contract AaveV3Avalanche_IncreaseBorrowSlope1ToAllStablecoinsAcrossAllAaveInstances_20241201_Test is
  ProtocolV3TestBase
{
  AaveV3Avalanche_IncreaseBorrowSlope1ToAllStablecoinsAcrossAllAaveInstances_20241201
    internal proposal;

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('avalanche'), 53799626);
    proposal = new AaveV3Avalanche_IncreaseBorrowSlope1ToAllStablecoinsAcrossAllAaveInstances_20241201();
  }

  /**
   * @dev executes the generic test suite including e2e and config snapshots
   */
  function test_defaultProposalExecution() public {
    defaultTest(
      'AaveV3Avalanche_IncreaseBorrowSlope1ToAllStablecoinsAcrossAllAaveInstances_20241201',
      AaveV3Avalanche.POOL,
      address(proposal)
    );
  }
}