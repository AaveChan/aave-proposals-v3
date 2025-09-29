// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IProposalGenericExecutor} from 'aave-helpers/src/interfaces/IProposalGenericExecutor.sol';
import {AaveV2Ethereum} from 'aave-address-book/AaveV2Ethereum.sol';
import {AaveGovernanceV2} from 'aave-address-book/AaveGovernanceV2.sol';

interface IExecutor {
  function queueTransaction(
    address target,
    uint256 value,
    string memory signature,
    bytes memory data,
    uint256 executionTime,
    bool withDelegatecall
  ) external returns (bytes32);

  function executeTransaction(
    address target,
    uint256 value,
    string memory signature,
    bytes memory data,
    uint256 executionTime,
    bool withDelegatecall
  ) external payable returns (bytes memory);

  function getDelay() external view returns (uint256);
}

/**
 * @title yearn stuff
 * @author ACI
 * - Snapshot: TODO
 * - Discussion: TODO
 */

contract AaveV3Ethereum_YearnStuff_20250926 is IProposalGenericExecutor {
  address public YEARN_STRATEGY = 0x906f0a6f23e7160eB0927B0903ab80b5E3f3950D;
  address public YEARN_TEAM_SAFE = 0xFEB4acf3df3cDEA7399794D0869ef76A6EfAff52;

  uint256 public immutable EXECUTION_TIME;

  constructor(uint256 executionTime) {
    EXECUTION_TIME = executionTime;
  }

  function execute() external {
    IExecutor(AaveGovernanceV2.SHORT_EXECUTOR).queueTransaction(
      AaveV2Ethereum.DEFAULT_INCENTIVES_CONTROLLER,
      0,
      'setClaimer(address,address)',
      abi.encode(
        address(0x906f0a6f23e7160eB0927B0903ab80b5E3f3950D),
        address(0xFEB4acf3df3cDEA7399794D0869ef76A6EfAff52)
      ),
      EXECUTION_TIME,
      false
    );
  }
}

/**
 * @title yearn stuff part2
 * @author ACI
 * - Snapshot: TODO
 * - Discussion: TODO
 */

contract AaveV3Ethereum_YearnStuff_part2_20250926 is IProposalGenericExecutor {
  // referencing part1 as timing must be identical for the queue hash to match the executionHash
  AaveV3Ethereum_YearnStuff_20250926 immutable PART1;

  constructor(AaveV3Ethereum_YearnStuff_20250926 part1) {
    PART1 = part1;
  }

  function execute() external {
    // analog to first payload, but using executeTransaction
    IExecutor(AaveGovernanceV2.SHORT_EXECUTOR).executeTransaction(
      AaveV2Ethereum.DEFAULT_INCENTIVES_CONTROLLER,
      0,
      'setClaimer(address,address)',
      abi.encode(PART1.YEARN_STRATEGY(), PART1.YEARN_TEAM_SAFE()),
      PART1.EXECUTION_TIME(),
      false
    );
  }
}
