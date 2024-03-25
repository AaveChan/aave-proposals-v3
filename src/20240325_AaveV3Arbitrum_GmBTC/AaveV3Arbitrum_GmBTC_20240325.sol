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
 * @title gmBTC
 * @author Aave Chan Initiative
 * - Snapshot: https://snapshot.org/#/aave.eth/proposal/0x166051b26be60fa3a64d7815b848b9b670a284b3da01c2d440c7815c400d7950
 * - Discussion: https://governance.aave.com/t/arfc-add-gmbtc-on-arbitrum-v3/16767/3
 */
contract AaveV3Arbitrum_GmBTC_20240325 is AaveV3PayloadArbitrum {
  using SafeERC20 for IERC20;

  address public constant gmBTC = 0x47c031236e19d024b42f8AE6780E44A573170703;
  uint256 public constant gmBTC_SEED_AMOUNT = 1e18;

  function _postExecute() internal override {
    IERC20(gmBTC).forceApprove(address(AaveV3Arbitrum.POOL), gmBTC_SEED_AMOUNT);
    AaveV3Arbitrum.POOL.supply(gmBTC, gmBTC_SEED_AMOUNT, address(AaveV3Arbitrum.COLLECTOR), 0);
  }

  function newListings() public pure override returns (IAaveV3ConfigEngine.Listing[] memory) {
    IAaveV3ConfigEngine.Listing[] memory listings = new IAaveV3ConfigEngine.Listing[](1);

    listings[0] = IAaveV3ConfigEngine.Listing({
      asset: gmBTC,
      assetSymbol: 'gmBTC',
      priceFeed: 0x395D5c5D552Df670dc4B2B1cef0c4EABfFba492f,
      eModeCategory: AaveV3ArbitrumEModes.NONE,
      enabledToBorrow: EngineFlags.DISABLED,
      stableRateModeEnabled: EngineFlags.DISABLED,
      borrowableInIsolation: EngineFlags.DISABLED,
      withSiloedBorrowing: EngineFlags.DISABLED,
      flashloanable: EngineFlags.DISABLED,
      ltv: 55_00,
      liqThreshold: 60_00,
      liqBonus: 12_00,
      reserveFactor: 10_00,
      supplyCap: 4_300_000,
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
