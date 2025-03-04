// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IProposalGenericExecutor} from 'aave-helpers/src/interfaces/IProposalGenericExecutor.sol';
import {IUpgradeableBurnMintTokenPool_1_5_1} from 'src/interfaces/ccip/tokenPool/IUpgradeableBurnMintTokenPool.sol';
import {ITokenAdminRegistry} from 'src/interfaces/ccip/ITokenAdminRegistry.sol';
import {IRateLimiter} from 'src/interfaces/ccip/IRateLimiter.sol';
import {IGhoBucketSteward} from 'src/interfaces/IGhoBucketSteward.sol';
import {IGhoToken} from 'src/interfaces/IGhoToken.sol';

import {AaveV3Base} from 'aave-address-book/AaveV3Base.sol';
import {GovernanceV3Base} from 'aave-address-book/GovernanceV3Base.sol';
import {AaveV3ArbitrumAssets} from 'aave-address-book/AaveV3Arbitrum.sol';
import {GhoArbitrum} from 'aave-address-book/GhoArbitrum.sol';
import {GhoEthereum} from 'aave-address-book/GhoEthereum.sol';
import {AaveV3EthereumAssets} from 'aave-address-book/AaveV3Ethereum.sol';

/**
 * @title GHO Base Launch
 * @author Aave Labs
 * - Discussion: https://governance.aave.com/t/arfc-launch-gho-on-base-set-aci-as-emissions-manager-for-rewards/19338
 * - Snapshot: https://snapshot.box/#/s:aave.eth/proposal/0x03dc21e0423c60082dc23317af6ebaf997610cbc2cbb0f5a385653bd99a524fe
 */
contract AaveV3Base_GHOBaseLaunch_20241223 is IProposalGenericExecutor {
  uint64 public constant ETH_CHAIN_SELECTOR = 5009297550715157269;
  uint64 public constant ARB_CHAIN_SELECTOR = 4949039107694359620;

  uint128 public constant CCIP_BUCKET_CAPACITY = 20_000_000e18; // 20M GHO

  // https://basescan.org/address/0x6f6C373d09C07425BaAE72317863d7F6bb731e37
  ITokenAdminRegistry public constant TOKEN_ADMIN_REGISTRY =
    ITokenAdminRegistry(0x6f6C373d09C07425BaAE72317863d7F6bb731e37);
  // https://basescan.org/address/0x98217A06721Ebf727f2C8d9aD7718ec28b7aAe34
  IUpgradeableBurnMintTokenPool_1_5_1 public constant TOKEN_POOL =
    IUpgradeableBurnMintTokenPool_1_5_1(0x98217A06721Ebf727f2C8d9aD7718ec28b7aAe34);

  // https://basescan.org/address/0x6Bb7a212910682DCFdbd5BCBb3e28FB4E8da10Ee
  IGhoToken public constant GHO_TOKEN = IGhoToken(0x6Bb7a212910682DCFdbd5BCBb3e28FB4E8da10Ee);

  // https://basescan.org/address/0xC5BcC58BE6172769ca1a78B8A45752E3C5059c39
  address public constant GHO_AAVE_STEWARD = 0xC5BcC58BE6172769ca1a78B8A45752E3C5059c39;
  // https://basescan.org/address/0x3c47237479e7569653eF9beC4a7Cd2ee3F78b396
  address public constant GHO_BUCKET_STEWARD = 0x3c47237479e7569653eF9beC4a7Cd2ee3F78b396;
  // https://basescan.org/address/0xB94Ab28c6869466a46a42abA834ca2B3cECCA5eB
  address public constant GHO_CCIP_STEWARD = 0xB94Ab28c6869466a46a42abA834ca2B3cECCA5eB;

  // https://etherscan.io/address/0x06179f7C1be40863405f374E7f5F8806c728660A
  address public constant REMOTE_TOKEN_POOL_ETH = GhoEthereum.GHO_CCIP_TOKEN_POOL;
  // https://arbiscan.io/address/0xB94Ab28c6869466a46a42abA834ca2B3cECCA5eB
  address public constant REMOTE_TOKEN_POOL_ARB = GhoArbitrum.GHO_CCIP_TOKEN_POOL;

  // Token Rate Limit Capacity: 300_000 GHO
  uint128 public constant CCIP_RATE_LIMIT_CAPACITY = 300_000e18;
  // Token Rate Limit Refill Rate: 60 GHO per second (=> 216_000 GHO per hour)
  uint128 public constant CCIP_RATE_LIMIT_REFILL_RATE = 60e18;

  function execute() external {
    _acceptOwnership();
    _setupStewardsAndTokenPoolOnGho();
    _setupRemoteAndRegisterTokenPool();
  }

  function _acceptOwnership() internal {
    TOKEN_ADMIN_REGISTRY.acceptAdminRole(address(GHO_TOKEN));
    TOKEN_POOL.acceptOwnership();
  }

  function _setupStewardsAndTokenPoolOnGho() internal {
    GHO_TOKEN.grantRole(GHO_TOKEN.FACILITATOR_MANAGER_ROLE(), GovernanceV3Base.EXECUTOR_LVL_1);
    GHO_TOKEN.grantRole(GHO_TOKEN.BUCKET_MANAGER_ROLE(), GovernanceV3Base.EXECUTOR_LVL_1);

    // Token Pool as facilitator with 20M GHO capacity
    GHO_TOKEN.addFacilitator(address(TOKEN_POOL), 'CCIP TokenPool v1.5.1', CCIP_BUCKET_CAPACITY);

    // Gho Aave Steward
    AaveV3Base.ACL_MANAGER.grantRole(AaveV3Base.ACL_MANAGER.RISK_ADMIN_ROLE(), GHO_AAVE_STEWARD);

    // Gho Bucket Steward
    GHO_TOKEN.grantRole(GHO_TOKEN.BUCKET_MANAGER_ROLE(), GHO_BUCKET_STEWARD);
    address[] memory facilitatorList = new address[](1);
    facilitatorList[0] = address(TOKEN_POOL);
    IGhoBucketSteward(GHO_BUCKET_STEWARD).setControlledFacilitator({
      facilitatorList: facilitatorList,
      approve: true
    });

    // Gho CCIP Steward
    TOKEN_POOL.setRateLimitAdmin(GHO_CCIP_STEWARD);
  }

  function _setupRemoteAndRegisterTokenPool() internal {
    IRateLimiter.Config memory rateLimiterConfig = IRateLimiter.Config({
      isEnabled: true,
      capacity: CCIP_RATE_LIMIT_CAPACITY,
      rate: CCIP_RATE_LIMIT_REFILL_RATE
    });

    IUpgradeableBurnMintTokenPool_1_5_1.ChainUpdate[]
      memory chainsToAdd = new IUpgradeableBurnMintTokenPool_1_5_1.ChainUpdate[](2);

    {
      bytes[] memory remotePoolAddresses = new bytes[](1);
      remotePoolAddresses[0] = abi.encode(REMOTE_TOKEN_POOL_ETH);
      chainsToAdd[0] = IUpgradeableBurnMintTokenPool_1_5_1.ChainUpdate({
        remoteChainSelector: ETH_CHAIN_SELECTOR,
        remotePoolAddresses: remotePoolAddresses,
        remoteTokenAddress: abi.encode(AaveV3EthereumAssets.GHO_UNDERLYING),
        outboundRateLimiterConfig: rateLimiterConfig,
        inboundRateLimiterConfig: rateLimiterConfig
      });
    }

    {
      bytes[] memory remotePoolAddresses = new bytes[](1);
      remotePoolAddresses[0] = abi.encode(REMOTE_TOKEN_POOL_ARB);
      chainsToAdd[1] = IUpgradeableBurnMintTokenPool_1_5_1.ChainUpdate({
        remoteChainSelector: ARB_CHAIN_SELECTOR,
        remotePoolAddresses: remotePoolAddresses,
        remoteTokenAddress: abi.encode(AaveV3ArbitrumAssets.GHO_UNDERLYING),
        outboundRateLimiterConfig: rateLimiterConfig,
        inboundRateLimiterConfig: rateLimiterConfig
      });
    }

    // setup remote token pools
    TOKEN_POOL.applyChainUpdates({
      remoteChainSelectorsToRemove: new uint64[](0),
      chainsToAdd: chainsToAdd
    });

    // register token pool
    TOKEN_ADMIN_REGISTRY.setPool(address(GHO_TOKEN), address(TOKEN_POOL));
  }
}
