// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3BNB, AaveV3BNBEModes} from 'aave-address-book/AaveV3BNB.sol';
import {AaveV3PayloadBNB} from 'aave-helpers/v3-config-engine/AaveV3PayloadBNB.sol';
import {EngineFlags} from 'aave-helpers/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-helpers/v3-config-engine/IAaveV3ConfigEngine.sol';
import {IV3RateStrategyFactory} from 'aave-helpers/v3-config-engine/IV3RateStrategyFactory.sol';
import {IERC20} from 'solidity-utils/contracts/oz-common/interfaces/IERC20.sol';
import {SafeERC20} from 'solidity-utils/contracts/oz-common/SafeERC20.sol';
/**
 * @title Onboarding wBETH
 * @author Aave Chan Initiative
 * - Snapshot: https://snapshot.org/#/aave.eth/proposal/0x0ad8168a1b388b0e9771cae6d317619ad5428dd6788a457fea7d533d2fcd88d2
 * - Discussion: https://governance.aave.com/t/arfc-onboard-wbeth-to-aave-v3-bnb-chain/17210
 */
contract AaveV3BNB_OnboardingWBETH_20240409 is AaveV3PayloadBNB {
  using SafeERC20 for IERC20;

  address public constant wBETH = 0xa2E3356610840701BDf5611a53974510Ae27E2e1;
  uint256 public constant wBETH_SEED_AMOUNT = 1e15;

  function _postExecute() internal override {
    IERC20(wBETH).forceApprove(address(AaveV3BNB.POOL), wBETH_SEED_AMOUNT);
    AaveV3BNB.POOL.supply(wBETH, wBETH_SEED_AMOUNT, address(AaveV3BNB.COLLECTOR), 0);
  }

  function newListings() public pure override returns (IAaveV3ConfigEngine.Listing[] memory) {
    IAaveV3ConfigEngine.Listing[] memory listings = new IAaveV3ConfigEngine.Listing[](1);

    listings[0] = IAaveV3ConfigEngine.Listing({
      asset: wBETH,
      assetSymbol: 'wBETH',
      priceFeed: 0x0000000000000000000000000000000000000000,
      eModeCategory: AaveV3BNBEModes.NONE,
      enabledToBorrow: EngineFlags.ENABLED,
      stableRateModeEnabled: EngineFlags.DISABLED,
      borrowableInIsolation: EngineFlags.DISABLED,
      withSiloedBorrowing: EngineFlags.DISABLED,
      flashloanable: EngineFlags.DISABLED,
      ltv: 67_00,
      liqThreshold: 74_00,
      liqBonus: 7_00,
      reserveFactor: 15_00,
      supplyCap: 3_000,
      borrowCap: 300,
      debtCeiling: 0,
      liqProtocolFee: 10_00,
      rateStrategyParams: IV3RateStrategyFactory.RateStrategyParams({
        optimalUsageRatio: _bpsToRay(45_00),
        baseVariableBorrowRate: _bpsToRay(0),
        variableRateSlope1: _bpsToRay(7_00),
        variableRateSlope2: _bpsToRay(300_00),
        stableRateSlope1: _bpsToRay(13_00),
        stableRateSlope2: _bpsToRay(300_00),
        baseStableRateOffset: _bpsToRay(3_00),
        stableRateExcessOffset: _bpsToRay(5_00),
        optimalStableToTotalDebtRatio: _bpsToRay(20_00)
      })
    });

    return listings;
  }
}
