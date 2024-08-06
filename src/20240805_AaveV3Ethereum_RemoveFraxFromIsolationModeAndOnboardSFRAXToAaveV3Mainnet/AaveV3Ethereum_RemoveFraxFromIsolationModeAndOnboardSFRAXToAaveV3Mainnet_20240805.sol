// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Ethereum, AaveV3EthereumAssets, AaveV3EthereumEModes} from 'aave-address-book/AaveV3Ethereum.sol';
import {AaveV3PayloadEthereum} from 'aave-helpers/v3-config-engine/AaveV3PayloadEthereum.sol';
import {EngineFlags} from 'aave-v3-periphery/contracts/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-v3-periphery/contracts/v3-config-engine/IAaveV3ConfigEngine.sol';
import {IERC20} from 'solidity-utils/contracts/oz-common/interfaces/IERC20.sol';
import {SafeERC20} from 'solidity-utils/contracts/oz-common/SafeERC20.sol';
/**
 * @title Remove Frax from Isolation Mode and onboard sFRAX to Aave v3 Mainnet
 * @author Aave Chan Initiative
 * - Snapshot: TODO
 * - Discussion: https://governance.aave.com/t/arfc-remove-frax-from-isolation-mode-and-onboard-sfrax-to-aave-v3-mainnet/18506
 */
contract AaveV3Ethereum_RemoveFraxFromIsolationModeAndOnboardSFRAXToAaveV3Mainnet_20240805 is
  AaveV3PayloadEthereum
{
  using SafeERC20 for IERC20;

  address public constant sFRAX = 0xA663B02CF0a4b149d2aD41910CB81e23e1c41c32;
  uint256 public constant sFRAX_SEED_AMOUNT = 10 * 10 ** 18;

  function _postExecute() internal override {
    IERC20(sFRAX).forceApprove(address(AaveV3Ethereum.POOL), sFRAX_SEED_AMOUNT);
    AaveV3Ethereum.POOL.supply(sFRAX, sFRAX_SEED_AMOUNT, address(AaveV3Ethereum.COLLECTOR), 0);
  }

  function rateStrategiesUpdates()
    public
    pure
    override
    returns (IAaveV3ConfigEngine.RateStrategyUpdate[] memory)
  {
    IAaveV3ConfigEngine.RateStrategyUpdate[]
      memory rateStrategies = new IAaveV3ConfigEngine.RateStrategyUpdate[](1);
    rateStrategies[0] = IAaveV3ConfigEngine.RateStrategyUpdate({
      asset: AaveV3EthereumAssets.FRAX_UNDERLYING,
      params: IAaveV3ConfigEngine.InterestRateInputData({
        optimalUsageRatio: 92_00,
        baseVariableBorrowRate: 0,
        variableRateSlope1: 6_50,
        variableRateSlope2: 75_00
      })
    });

    return rateStrategies;
  }
  function capsUpdates() public pure override returns (IAaveV3ConfigEngine.CapsUpdate[] memory) {
    IAaveV3ConfigEngine.CapsUpdate[] memory capsUpdate = new IAaveV3ConfigEngine.CapsUpdate[](1);

    capsUpdate[0] = IAaveV3ConfigEngine.CapsUpdate({
      asset: AaveV3EthereumAssets.FRAX_UNDERLYING,
      supplyCap: 338_000_000,
      borrowCap: 271_000_000
    });

    return capsUpdate;
  }
  function collateralsUpdates()
    public
    pure
    override
    returns (IAaveV3ConfigEngine.CollateralUpdate[] memory)
  {
    IAaveV3ConfigEngine.CollateralUpdate[]
      memory collateralUpdate = new IAaveV3ConfigEngine.CollateralUpdate[](1);

    collateralUpdate[0] = IAaveV3ConfigEngine.CollateralUpdate({
      asset: AaveV3EthereumAssets.FRAX_UNDERLYING,
      ltv: 63_00,
      liqThreshold: 77_00,
      liqBonus: 5_00,
      debtCeiling: 0,
      liqProtocolFee: 10_00
    });

    return collateralUpdate;
  }
  function borrowsUpdates()
    public
    pure
    override
    returns (IAaveV3ConfigEngine.BorrowUpdate[] memory)
  {
    IAaveV3ConfigEngine.BorrowUpdate[]
      memory borrowUpdates = new IAaveV3ConfigEngine.BorrowUpdate[](1);

    borrowUpdates[0] = IAaveV3ConfigEngine.BorrowUpdate({
      asset: AaveV3EthereumAssets.FRAX_UNDERLYING,
      enabledToBorrow: EngineFlags.KEEP_CURRENT,
      flashloanable: EngineFlags.KEEP_CURRENT,
      stableRateModeEnabled: EngineFlags.DISABLED,
      borrowableInIsolation: EngineFlags.DISABLED,
      withSiloedBorrowing: EngineFlags.DISABLED,
      reserveFactor: 15_00
    });

    return borrowUpdates;
  }
  function newListings() public pure override returns (IAaveV3ConfigEngine.Listing[] memory) {
    IAaveV3ConfigEngine.Listing[] memory listings = new IAaveV3ConfigEngine.Listing[](1);

    listings[0] = IAaveV3ConfigEngine.Listing({
      asset: sFRAX,
      assetSymbol: 'sFRAX',
      priceFeed: 0xB9E1E3A9feFf48998E45Fa90847ed4D467E8BcfD,
      eModeCategory: AaveV3EthereumEModes.NONE,
      enabledToBorrow: EngineFlags.DISABLED,
      stableRateModeEnabled: EngineFlags.DISABLED,
      borrowableInIsolation: EngineFlags.DISABLED,
      withSiloedBorrowing: EngineFlags.DISABLED,
      flashloanable: EngineFlags.DISABLED,
      ltv: 70_00,
      liqThreshold: 75_00,
      liqBonus: 6_00,
      reserveFactor: 20_00,
      supplyCap: 10_000_000,
      borrowCap: 0,
      debtCeiling: 0,
      liqProtocolFee: 20_00,
      rateStrategyParams: IAaveV3ConfigEngine.InterestRateInputData({
        optimalUsageRatio: 80_00,
        baseVariableBorrowRate: 0,
        variableRateSlope1: 0,
        variableRateSlope2: 0
      })
    });

    return listings;
  }
}
