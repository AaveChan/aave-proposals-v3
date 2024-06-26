// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'forge-std/Test.sol';
import {GovV3Helpers} from 'aave-helpers/GovV3Helpers.sol';
import {ProtocolV3TestBase, ReserveConfig} from 'aave-helpers/ProtocolV3TestBase.sol';
import {AaveV3Ethereum} from 'aave-address-book/AaveV3Ethereum.sol';
import {AaveV3Arbitrum} from 'aave-address-book/AaveV3Arbitrum.sol';
import {MiscEthereum} from 'aave-address-book/MiscEthereum.sol';
import {MiscArbitrum} from 'aave-address-book/MiscArbitrum.sol';
import {GovernanceV3Ethereum} from 'aave-address-book/GovernanceV3Ethereum.sol';
import {GovernanceV3Arbitrum} from 'aave-address-book/GovernanceV3Arbitrum.sol';
import {IERC20} from 'solidity-utils/contracts/oz-common/interfaces/IERC20.sol';
import {RateLimiter} from 'ccip/v0.8/ccip/libraries/RateLimiter.sol';
import {Internal} from 'ccip/v0.8/ccip/libraries/Internal.sol';
import {Client} from 'ccip/v0.8/ccip/libraries/Client.sol';
import {Router} from 'ccip/v0.8/ccip/Router.sol';
import {PriceRegistry} from 'ccip/v0.8/ccip/PriceRegistry.sol';
import {EVM2EVMOnRamp} from 'ccip/v0.8/ccip/onRamp/EVM2EVMOnRamp.sol';
import {EVM2EVMOffRamp} from 'ccip/v0.8/ccip/offRamp/EVM2EVMOffRamp.sol';
import {IPool} from 'ccip/v0.8/ccip/interfaces/pools/IPool.sol';

import {UpgradeableLockReleaseTokenPool} from 'ccip/v0.8/ccip/pools/GHO/UpgradeableLockReleaseTokenPool.sol';
import {UpgradeableBurnMintTokenPool} from 'ccip/v0.8/ccip/pools/GHO/UpgradeableBurnMintTokenPool.sol';

import {IGhoToken} from 'gho-core/gho/interfaces/IGhoToken.sol';

import {AaveV3Ethereum_GHOCrossChainLaunch_20240528} from './AaveV3Ethereum_GHOCrossChainLaunch_20240528.sol';
import {AaveV3Arbitrum_GHOCrossChainLaunch_20240528, Utils as ArbUtils} from './AaveV3Arbitrum_GHOCrossChainLaunch_20240528.sol';

/**
 * @dev Test for AaveV3E2E_GHOCrossChainLaunch_20240528
 * command: FOUNDRY_PROFILE=mainnet forge test --match-path=src/20240528_Multi_GHOCrossChainLaunch/AaveV3E2E_GHOCrossChainLaunch_20240528.t.sol -vv
 */
contract AaveV3E2E_GHOCrossChainLaunch_20240528_Test is ProtocolV3TestBase {
  using Internal for Internal.EVM2EVMMessage;

  AaveV3Ethereum_GHOCrossChainLaunch_20240528 internal ethProposal;
  AaveV3Arbitrum_GHOCrossChainLaunch_20240528 internal arbProposal;

  UpgradeableLockReleaseTokenPool internal ETH_TOKEN_POOL;
  UpgradeableBurnMintTokenPool internal ARB_TOKEN_POOL;
  IGhoToken internal ETH_GHO;
  IGhoToken internal ARB_GHO;

  Router internal ETH_ROUTER;
  Router internal ARB_ROUTER;

  uint64 internal ETH_ARB_CHAIN_SELECTOR;
  uint64 internal ARB_ETH_CHAIN_SELECTOR;

  address internal constant CCIP_ETH_ON_RAMP = 0x925228D7B82d883Dde340A55Fe8e6dA56244A22C;
  address internal constant CCIP_ETH_OFF_RAMP = 0xeFC4a18af59398FF23bfe7325F2401aD44286F4d;
  address internal constant CCIP_ARB_ON_RAMP = 0xCe11020D56e5FDbfE46D9FC3021641FfbBB5AdEE;
  address internal constant CCIP_ARB_OFF_RAMP = 0x542ba1902044069330e8c5b36A84EC503863722f;

  event Released(address indexed sender, address indexed recipient, uint256 amount);
  event Locked(address indexed sender, uint256 amount);
  event Minted(address indexed sender, address indexed recipient, uint256 amount);
  event Burned(address indexed sender, uint256 amount);
  event CCIPSendRequested(Internal.EVM2EVMMessage message);
  event Transfer(address indexed from, address indexed to, uint256 value);
  event Initialized(uint8 version);

  uint256 internal ethereumFork;
  uint256 internal arbitrumFork;

  function setUp() public {
    ethereumFork = vm.createFork(vm.rpcUrl('mainnet'), 20067000);
    arbitrumFork = vm.createFork(vm.rpcUrl('arbitrum'), 220652440);

    // Proposal creation
    vm.selectFork(ethereumFork);
    ethProposal = new AaveV3Ethereum_GHOCrossChainLaunch_20240528();
    ETH_GHO = IGhoToken(MiscEthereum.GHO_TOKEN);
    ETH_ROUTER = Router(ethProposal.CCIP_ROUTER());
    ETH_ARB_CHAIN_SELECTOR = ethProposal.CCIP_ARB_CHAIN_SELECTOR();

    vm.selectFork(arbitrumFork);
    arbProposal = new AaveV3Arbitrum_GHOCrossChainLaunch_20240528();
    ARB_ROUTER = Router(ArbUtils.CCIP_ROUTER);
    ARB_ETH_CHAIN_SELECTOR = ArbUtils.CCIP_ETH_CHAIN_SELECTOR;

    // AIP execution
    vm.selectFork(ethereumFork);
    vm.recordLogs();

    GovV3Helpers.executePayload(vm, address(ethProposal));

    // Fetch addresses
    Vm.Log[] memory entries = vm.getRecordedLogs();
    for (uint256 i = 0; i < entries.length; i++) {
      if (entries[i].topics[0] == Initialized.selector) {
        uint8 version = abi.decode(entries[i].data, (uint8));
        if (version == 1) {
          ETH_TOKEN_POOL = UpgradeableLockReleaseTokenPool(entries[i].emitter);
          break;
        }
      }
    }

    vm.selectFork(arbitrumFork);
    vm.recordLogs();

    GovV3Helpers.executePayload(vm, address(arbProposal));

    // Fetch addresses
    entries = vm.getRecordedLogs();
    for (uint256 i = 0; i < entries.length; i++) {
      if (entries[i].topics[0] == Initialized.selector) {
        uint8 version = abi.decode(entries[i].data, (uint8));
        if (version == 1) {
          if (address(ARB_GHO) == address(0)) {
            // ghoAddress is the first one
            ARB_GHO = IGhoToken(entries[i].emitter);
          } else {
            // ccip is the second one
            ARB_TOKEN_POOL = UpgradeableBurnMintTokenPool(entries[i].emitter);
            break;
          }
        }
      }
    }

    // Chainlink execution
    vm.selectFork(ethereumFork);
    {
      // OnRamp and OffRamp
      Router.OnRamp[] memory onRampUpdates = new Router.OnRamp[](1);
      Router.OffRamp[] memory offRampUpdates = new Router.OffRamp[](1);
      // ARB -> ETH
      onRampUpdates[0] = Router.OnRamp({
        destChainSelector: ETH_ARB_CHAIN_SELECTOR,
        onRamp: CCIP_ETH_ON_RAMP
      });
      // ETH -> ARB
      offRampUpdates[0] = Router.OffRamp({
        sourceChainSelector: ETH_ARB_CHAIN_SELECTOR,
        offRamp: CCIP_ETH_OFF_RAMP
      });
      address routerOwner = ETH_ROUTER.owner();
      vm.startPrank(routerOwner);
      ETH_ROUTER.applyRampUpdates(onRampUpdates, new Router.OffRamp[](0), offRampUpdates);
    }

    {
      // Add TokenPool to OnRamp
      address[] memory tokens = new address[](1);
      IPool[] memory pools = new IPool[](1);
      tokens[0] = address(ETH_GHO);
      pools[0] = IPool(address(ETH_TOKEN_POOL));
      address onRampOwner = EVM2EVMOnRamp(CCIP_ETH_ON_RAMP).owner();
      vm.startPrank(onRampOwner);
      EVM2EVMOnRamp(CCIP_ETH_ON_RAMP).applyPoolUpdates(
        new Internal.PoolUpdate[](0),
        _getTokensAndPools(tokens, pools)
      );

      // Match Arbitrum GHO token with Ethereum TokenPool
      tokens[0] = address(ARB_GHO);
      EVM2EVMOffRamp(CCIP_ETH_OFF_RAMP).applyPoolUpdates(
        new Internal.PoolUpdate[](0),
        _getTokensAndPools(tokens, pools)
      );
    }

    {
      // OnRamp Price Registry
      EVM2EVMOnRamp.DynamicConfig memory onRampDynamicConfig = EVM2EVMOnRamp(CCIP_ETH_ON_RAMP)
        .getDynamicConfig();
      Internal.PriceUpdates memory priceUpdate = _getSingleTokenPriceUpdateStruct(
        address(ETH_GHO),
        1e18
      );

      PriceRegistry(onRampDynamicConfig.priceRegistry).updatePrices(priceUpdate);
      // OffRamp Price Registry
      EVM2EVMOffRamp.DynamicConfig memory offRampDynamicConfig = EVM2EVMOffRamp(CCIP_ETH_OFF_RAMP)
        .getDynamicConfig();
      PriceRegistry(offRampDynamicConfig.priceRegistry).updatePrices(priceUpdate);
    }

    vm.selectFork(arbitrumFork);
    {
      Router.OnRamp[] memory onRampUpdates = new Router.OnRamp[](1);
      Router.OffRamp[] memory offRampUpdates = new Router.OffRamp[](1);
      // ETH -> ARB
      onRampUpdates[0] = Router.OnRamp({
        destChainSelector: ARB_ETH_CHAIN_SELECTOR,
        onRamp: CCIP_ARB_ON_RAMP
      });
      // ARB -> ETH
      offRampUpdates[0] = Router.OffRamp({
        sourceChainSelector: ARB_ETH_CHAIN_SELECTOR,
        offRamp: CCIP_ARB_OFF_RAMP
      });
      address routerOwner = ARB_ROUTER.owner();
      vm.startPrank(routerOwner);
      ARB_ROUTER.applyRampUpdates(onRampUpdates, new Router.OffRamp[](0), offRampUpdates);
    }

    {
      // Add TokenPool to OnRamp
      address[] memory tokens = new address[](1);
      IPool[] memory pools = new IPool[](1);
      tokens[0] = address(ARB_GHO);
      pools[0] = IPool(address(ARB_TOKEN_POOL));
      address onRampOwner = EVM2EVMOnRamp(CCIP_ARB_ON_RAMP).owner();
      vm.startPrank(onRampOwner);
      EVM2EVMOnRamp(CCIP_ARB_ON_RAMP).applyPoolUpdates(
        new Internal.PoolUpdate[](0),
        _getTokensAndPools(tokens, pools)
      );

      // Match Ethereum GHO token with Arbitrum TokenPool
      tokens[0] = address(ETH_GHO);
      EVM2EVMOffRamp(CCIP_ARB_OFF_RAMP).applyPoolUpdates(
        new Internal.PoolUpdate[](0),
        _getTokensAndPools(tokens, pools)
      );
    }

    {
      // OnRamp Price Registry
      EVM2EVMOnRamp.DynamicConfig memory onRampDynamicConfig = EVM2EVMOnRamp(CCIP_ARB_ON_RAMP)
        .getDynamicConfig();
      Internal.PriceUpdates memory priceUpdate = _getSingleTokenPriceUpdateStruct(
        address(ARB_GHO),
        1e18
      );

      PriceRegistry(onRampDynamicConfig.priceRegistry).updatePrices(priceUpdate);
      // OffRamp Price Registry
      EVM2EVMOffRamp.DynamicConfig memory offRampDynamicConfig = EVM2EVMOffRamp(CCIP_ARB_OFF_RAMP)
        .getDynamicConfig();
      PriceRegistry(offRampDynamicConfig.priceRegistry).updatePrices(priceUpdate);
    }
  }

  /// @dev Full E2E Test: transfer from Ethereum to Arbitrum and way back
  function test_ccipFullE22() public {
    // CCIP Transfer from Ethereum to Arbitrum
    // Ethereum execution (origin)
    vm.selectFork(ethereumFork);
    address user = makeAddr('user');
    uint256 amount = 500_000e18; // 500K ETH_GHO
    deal(user, 1e18); // 1 ETH
    deal(address(ETH_GHO), user, amount);

    assertEq(ETH_GHO.balanceOf(address(ETH_TOKEN_POOL)), 0);
    assertEq(ETH_TOKEN_POOL.getBridgeLimit(), ethProposal.CCIP_BRIDGE_LIMIT());
    assertEq(ETH_TOKEN_POOL.getCurrentBridgedAmount(), 0);

    vm.startPrank(user);
    // Use address(0) to use native token as fee token
    Internal.EVM2EVMMessage memory message = _sendCcip(
      SendCcipParams({
        expectedSeqNum: 1,
        router: ETH_ROUTER,
        onRamp: CCIP_ETH_ON_RAMP,
        token: address(ETH_GHO),
        amount: amount,
        feeToken: address(0),
        sourceChainSelector: ARB_ETH_CHAIN_SELECTOR,
        destChainSelector: ETH_ARB_CHAIN_SELECTOR,
        sender: user,
        receiver: user
      })
    );

    assertEq(ETH_GHO.balanceOf(user), 0);
    assertEq(ETH_GHO.balanceOf(address(ETH_TOKEN_POOL)), amount);
    assertEq(ETH_TOKEN_POOL.getBridgeLimit(), ethProposal.CCIP_BRIDGE_LIMIT());
    assertEq(ETH_TOKEN_POOL.getCurrentBridgedAmount(), amount);

    // Arbitrum execution (destination)
    vm.selectFork(arbitrumFork);

    assertEq(ARB_GHO.balanceOf(address(ARB_TOKEN_POOL)), 0);
    (uint256 capacity, uint256 level) = ARB_GHO.getFacilitatorBucket(address(ARB_TOKEN_POOL));
    assertEq(capacity, ArbUtils.CCIP_BUCKET_CAPACITY);
    assertEq(level, 0);

    // Mock off ramp
    vm.startPrank(CCIP_ARB_OFF_RAMP);
    bytes[] memory emptyData = new bytes[](1);
    EVM2EVMOffRamp(CCIP_ARB_OFF_RAMP).executeSingleMessage(message, emptyData);

    assertEq(ARB_GHO.balanceOf(address(ARB_TOKEN_POOL)), 0);
    (capacity, level) = ARB_GHO.getFacilitatorBucket(address(ARB_TOKEN_POOL));
    assertEq(capacity, ArbUtils.CCIP_BUCKET_CAPACITY);
    assertEq(level, amount);

    // CCIP Transfer from Arbitrum to Ethereum
    // Arbitrum execution (origin)
    vm.selectFork(arbitrumFork);
    deal(user, 1e18); // 1 ETH

    assertEq(ARB_GHO.balanceOf(address(ARB_TOKEN_POOL)), 0);
    (capacity, level) = ARB_GHO.getFacilitatorBucket(address(ARB_TOKEN_POOL));
    assertEq(capacity, ArbUtils.CCIP_BUCKET_CAPACITY);
    assertEq(level, amount);

    vm.startPrank(user);
    // Use address(0) to use native token as fee token
    message = _sendCcip(
      SendCcipParams({
        expectedSeqNum: 1,
        router: ARB_ROUTER,
        onRamp: CCIP_ARB_ON_RAMP,
        token: address(ARB_GHO),
        amount: amount,
        feeToken: address(0),
        sourceChainSelector: ETH_ARB_CHAIN_SELECTOR,
        destChainSelector: ARB_ETH_CHAIN_SELECTOR,
        sender: user,
        receiver: user
      })
    );

    assertEq(ARB_GHO.balanceOf(user), 0);
    assertEq(ARB_GHO.balanceOf(address(ARB_TOKEN_POOL)), 0);
    (capacity, level) = ARB_GHO.getFacilitatorBucket(address(ARB_TOKEN_POOL));
    assertEq(capacity, ArbUtils.CCIP_BUCKET_CAPACITY);
    assertEq(level, 0);

    // Ethereum execution (destination)
    vm.selectFork(ethereumFork);

    assertEq(ETH_GHO.balanceOf(user), 0);
    assertEq(ETH_GHO.balanceOf(address(ETH_TOKEN_POOL)), amount);
    assertEq(ETH_TOKEN_POOL.getBridgeLimit(), ethProposal.CCIP_BRIDGE_LIMIT());
    assertEq(ETH_TOKEN_POOL.getCurrentBridgedAmount(), amount);

    // Mock off ramp
    vm.startPrank(CCIP_ETH_OFF_RAMP);
    EVM2EVMOffRamp(CCIP_ETH_OFF_RAMP).executeSingleMessage(message, emptyData);

    assertEq(ETH_GHO.balanceOf(user), amount);
    assertEq(ETH_GHO.balanceOf(address(ETH_TOKEN_POOL)), 0);
    assertEq(ETH_TOKEN_POOL.getBridgeLimit(), ethProposal.CCIP_BRIDGE_LIMIT());
    assertEq(ETH_TOKEN_POOL.getCurrentBridgedAmount(), 0);
  }

  // ---
  // Utils
  // --

  struct SendCcipParams {
    uint64 expectedSeqNum;
    Router router;
    address onRamp;
    address token;
    uint256 amount;
    address feeToken;
    uint64 sourceChainSelector;
    uint64 destChainSelector;
    address sender;
    address receiver;
  }

  function _sendCcip(
    SendCcipParams memory params
  ) internal returns (Internal.EVM2EVMMessage memory) {
    Client.EVM2AnyMessage memory message = _generateSingleTokenMessage(
      params.receiver,
      params.token,
      params.amount,
      params.feeToken
    );
    uint256 expectedFee = params.router.getFee(params.destChainSelector, message);

    bytes32 metadataHash = keccak256(
      abi.encode(
        Internal.EVM_2_EVM_MESSAGE_HASH,
        params.sourceChainSelector,
        params.destChainSelector,
        params.onRamp
      )
    );

    Internal.EVM2EVMMessage memory geEvent = _messageToEvent(
      message,
      params.expectedSeqNum,
      params.expectedSeqNum,
      expectedFee,
      params.sender,
      params.sourceChainSelector,
      metadataHash
    );

    IERC20(params.token).approve(address(params.router), params.amount);
    params.router.ccipSend{value: expectedFee}(params.destChainSelector, message);

    return geEvent;
  }

  function _generateSingleTokenMessage(
    address receiver,
    address token,
    uint256 amount,
    address feeToken
  ) public pure returns (Client.EVM2AnyMessage memory) {
    Client.EVMTokenAmount[] memory tokenAmounts = new Client.EVMTokenAmount[](1);
    tokenAmounts[0] = Client.EVMTokenAmount({token: token, amount: amount});
    return
      Client.EVM2AnyMessage({
        receiver: abi.encode(receiver),
        data: '',
        tokenAmounts: tokenAmounts,
        feeToken: feeToken,
        extraArgs: Client._argsToBytes(Client.EVMExtraArgsV1({gasLimit: 200_000}))
      });
  }

  function _messageToEvent(
    Client.EVM2AnyMessage memory message,
    uint64 seqNum,
    uint64 nonce,
    uint256 feeTokenAmount,
    address originalSender,
    uint64 sourceChainSelector,
    bytes32 metadataHash
  ) public pure returns (Internal.EVM2EVMMessage memory) {
    // Slicing is only available for calldata. So we have to build a new bytes array.
    bytes memory args = new bytes(message.extraArgs.length - 4);
    for (uint256 i = 4; i < message.extraArgs.length; ++i) {
      args[i - 4] = message.extraArgs[i];
    }
    Client.EVMExtraArgsV1 memory extraArgs = abi.decode(args, (Client.EVMExtraArgsV1));
    Internal.EVM2EVMMessage memory messageEvent = Internal.EVM2EVMMessage({
      sequenceNumber: seqNum,
      feeTokenAmount: feeTokenAmount,
      sender: originalSender,
      nonce: nonce,
      gasLimit: extraArgs.gasLimit,
      strict: false,
      sourceChainSelector: sourceChainSelector,
      receiver: abi.decode(message.receiver, (address)),
      data: message.data,
      tokenAmounts: message.tokenAmounts,
      sourceTokenData: new bytes[](message.tokenAmounts.length),
      feeToken: message.feeToken,
      messageId: ''
    });

    messageEvent.messageId = Internal._hash(messageEvent, metadataHash);
    return messageEvent;
  }

  function _getTokensAndPools(
    address[] memory tokens,
    IPool[] memory pools
  ) internal pure returns (Internal.PoolUpdate[] memory) {
    Internal.PoolUpdate[] memory tokensAndPools = new Internal.PoolUpdate[](tokens.length);
    for (uint256 i = 0; i < tokens.length; ++i) {
      tokensAndPools[i] = Internal.PoolUpdate({token: tokens[i], pool: address(pools[i])});
    }
    return tokensAndPools;
  }

  function _getSingleTokenPriceUpdateStruct(
    address token,
    uint224 price
  ) internal pure returns (Internal.PriceUpdates memory) {
    Internal.TokenPriceUpdate[] memory tokenPriceUpdates = new Internal.TokenPriceUpdate[](1);
    tokenPriceUpdates[0] = Internal.TokenPriceUpdate({sourceToken: token, usdPerToken: price});

    Internal.PriceUpdates memory priceUpdates = Internal.PriceUpdates({
      tokenPriceUpdates: tokenPriceUpdates,
      gasPriceUpdates: new Internal.GasPriceUpdate[](0)
    });

    return priceUpdates;
  }

  function _getFacilitatorLevel(address f) internal view returns (uint256) {
    (, uint256 level) = ARB_GHO.getFacilitatorBucket(f);
    return level;
  }
}
