// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Ethereum, AaveV3EthereumAssets, AaveV3EthereumEModes} from 'aave-address-book/AaveV3Ethereum.sol';
import {AaveV3PayloadEthereum} from 'aave-helpers/src/v3-config-engine/AaveV3PayloadEthereum.sol';
import {EngineFlags} from 'aave-v3-periphery/contracts/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-v3-periphery/contracts/v3-config-engine/IAaveV3ConfigEngine.sol';
import {IERC20} from 'solidity-utils/contracts/oz-common/interfaces/IERC20.sol';
import {SafeERC20} from 'solidity-utils/contracts/oz-common/SafeERC20.sol';
/**
 * @title Onboard USDS and sUSDS to Aave v3
 * @author Aave Chan Initiative
 * - Snapshot: TODO
 * - Discussion: https://governance.aave.com/t/arfc-onboard-usds-and-susds-to-aave-v3/18987
 */
contract AaveV3Ethereum_OnboardUSDSAndSUSDSToAaveV3_20240913 is AaveV3PayloadEthereum {
  using SafeERC20 for IERC20;

  address public constant sUSDS = 0xa3931d71877C0E7a3148CB7Eb4463524FEc27fbD;
  uint256 public constant sUSDS_SEED_AMOUNT = 1e18;

  function _postExecute() internal override {
    IERC20(sUSDS).forceApprove(address(AaveV3Ethereum.POOL), sUSDS_SEED_AMOUNT);
    AaveV3Ethereum.POOL.supply(sUSDS, sUSDS_SEED_AMOUNT, address(AaveV3Ethereum.COLLECTOR), 0);
  }

  function capsUpdates() public pure override returns (IAaveV3ConfigEngine.CapsUpdate[] memory) {
    IAaveV3ConfigEngine.CapsUpdate[] memory capsUpdate = new IAaveV3ConfigEngine.CapsUpdate[](2);

    capsUpdate[0] = IAaveV3ConfigEngine.CapsUpdate({
      asset: AaveV3EthereumAssets.DAI_UNDERLYING,
      supplyCap: 150_000_000,
      borrowCap: 140_000_000
    });
    capsUpdate[1] = IAaveV3ConfigEngine.CapsUpdate({
      asset: AaveV3EthereumAssets.sDAI_UNDERLYING,
      supplyCap: 70_000_000,
      borrowCap: EngineFlags.KEEP_CURRENT
    });

    return capsUpdate;
  }
  function newListings() public pure override returns (IAaveV3ConfigEngine.Listing[] memory) {
    IAaveV3ConfigEngine.Listing[] memory listings = new IAaveV3ConfigEngine.Listing[](1);

    listings[0] = IAaveV3ConfigEngine.Listing({
      asset: sUSDS,
      assetSymbol: 'sUSDS',
      priceFeed: 0x4b764F16B18e4ED8deB7E74258B0f01BE93D3a38,
      eModeCategory: AaveV3EthereumEModes.NONE,
      enabledToBorrow: EngineFlags.DISABLED,
      stableRateModeEnabled: EngineFlags.DISABLED,
      borrowableInIsolation: EngineFlags.DISABLED,
      withSiloedBorrowing: EngineFlags.DISABLED,
      flashloanable: EngineFlags.ENABLED,
      ltv: 75_00,
      liqThreshold: 78_00,
      liqBonus: 7_50,
      reserveFactor: 10_00,
      supplyCap: 35_000_000,
      borrowCap: 0,
      debtCeiling: 0,
      liqProtocolFee: 10_00,
      rateStrategyParams: IAaveV3ConfigEngine.InterestRateInputData({
        optimalUsageRatio: 90_00,
        baseVariableBorrowRate: 0,
        variableRateSlope1: 0,
        variableRateSlope2: 0
      })
    });

    return listings;
  }
}
