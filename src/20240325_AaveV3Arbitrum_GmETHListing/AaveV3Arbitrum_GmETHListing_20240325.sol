// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Arbitrum, AaveV3ArbitrumEModes} from 'aave-address-book/AaveV3Arbitrum.sol';
import {AaveV3PayloadArbitrum} from 'aave-helpers/v3-config-engine/AaveV3PayloadArbitrum.sol';
import {EngineFlags} from 'aave-helpers/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-helpers/v3-config-engine/IAaveV3ConfigEngine.sol';
import {IV3RateStrategyFactory} from 'aave-helpers/v3-config-engine/IV3RateStrategyFactory.sol';
import {IERC20} from 'solidity-utils/contracts/oz-common/interfaces/IERC20.sol';
import {SafeERC20} from 'solidity-utils/contracts/oz-common/SafeERC20.sol';

/**
 * @title gmETH Listing
 * @author Aave Chan Initiative
 * - Snapshot: https://snapshot.org/#/aave.eth/proposal/0xc0b723e76fa6682a58983695b7a015c3a5b928c89c2f400375c6a971ef1aba99
 * - Discussion: https://governance.aave.com/t/arfc-add-gmeth-on-arbitrum-v3/16849
 */
contract AaveV3Arbitrum_GmETHListing_20240325 is AaveV3PayloadArbitrum {
  using SafeERC20 for IERC20;

  address public constant gmETH = 0x70d95587d40A2caf56bd97485aB3Eec10Bee6336;
  uint256 public constant gmETH_SEED_AMOUNT = 1e18;

  function _postExecute() internal override {
    IERC20(gmETH).forceApprove(address(AaveV3Arbitrum.POOL), gmETH_SEED_AMOUNT);
    AaveV3Arbitrum.POOL.supply(gmETH, gmETH_SEED_AMOUNT, address(AaveV3Arbitrum.COLLECTOR), 0);
  }

  function newListings() public pure override returns (IAaveV3ConfigEngine.Listing[] memory) {
    IAaveV3ConfigEngine.Listing[] memory listings = new IAaveV3ConfigEngine.Listing[](1);

    listings[0] = IAaveV3ConfigEngine.Listing({
      asset: gmETH,
      assetSymbol: 'gmETH',
      priceFeed: 0xfB3264D1129824933a52374c2C1696F4470D041e,
      eModeCategory: AaveV3ArbitrumEModes.NONE,
      enabledToBorrow: EngineFlags.DISABLED,
      stableRateModeEnabled: EngineFlags.DISABLED,
      borrowableInIsolation: EngineFlags.DISABLED,
      withSiloedBorrowing: EngineFlags.DISABLED,
      flashloanable: EngineFlags.DISABLED,
      ltv: 60_00,
      liqThreshold: 65_00,
      liqBonus: 12_00,
      reserveFactor: 20_00,
      supplyCap: 3_500_000,
      borrowCap: 0,
      debtCeiling: 1,
      liqProtocolFee: 10_00,
      rateStrategyParams: IV3RateStrategyFactory.RateStrategyParams({
        optimalUsageRatio: _bpsToRay(10_00),
        baseVariableBorrowRate: _bpsToRay(0),
        variableRateSlope1: _bpsToRay(10_00),
        variableRateSlope2: _bpsToRay(300_00),
        stableRateSlope1: _bpsToRay(0),
        stableRateSlope2: _bpsToRay(0),
        baseStableRateOffset: _bpsToRay(0),
        stableRateExcessOffset: _bpsToRay(0),
        optimalStableToTotalDebtRatio: _bpsToRay(0)
      })
    });

    return listings;
  }
}
