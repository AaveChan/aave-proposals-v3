// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Ethereum, AaveV3EthereumAssets} from 'aave-address-book/AaveV3Ethereum.sol';
import {AaveV3PayloadEthereum} from 'aave-helpers/src/v3-config-engine/AaveV3PayloadEthereum.sol';
import {EngineFlags} from 'aave-v3-origin/contracts/extensions/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-v3-origin/contracts/extensions/v3-config-engine/IAaveV3ConfigEngine.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {SafeERC20} from 'openzeppelin-contracts/contracts/token/ERC20/utils/SafeERC20.sol';
import {IEmissionManager} from 'aave-v3-origin/contracts/rewards/interfaces/IEmissionManager.sol';
/**
 * @title Onboard eUSDe to Aave v3 Core Instance
 * @author Aave-Chan Initiative
 * - Snapshot: https://snapshot.box/#/s:aavedao.eth/proposal/0xc1e93b8d3c8bd2530ba13ef01a6d83b9eed4f9fbff22e5aeb3bf92641baa0d0a
 * - Discussion: https://governance.aave.com/t/arfc-onboard-eusde-to-aave-v3-core-instance/21766
 */
contract AaveV3Ethereum_OnboardEUSDeToAaveV3CoreInstance_20250501 is AaveV3PayloadEthereum {
  using SafeERC20 for IERC20;

  address public constant eUSDe = 0x90D2af7d622ca3141efA4d8f1F24d86E5974Cc8F;
  uint256 public constant eUSDe_SEED_AMOUNT = 100e18;
  address public constant eUSDe_LM_ADMIN = 0xac140648435d03f784879cd789130F22Ef588Fcd;

  function _postExecute() internal override {
    IERC20(eUSDe).forceApprove(address(AaveV3Ethereum.POOL), eUSDe_SEED_AMOUNT);
    AaveV3Ethereum.POOL.supply(eUSDe, eUSDe_SEED_AMOUNT, AaveV3Ethereum.DUST_BIN, 0);

    address aeUSDe = AaveV3Ethereum.POOL.getReserveAToken(eUSDe);
    IEmissionManager(AaveV3Ethereum.EMISSION_MANAGER).setEmissionAdmin(eUSDe, eUSDe_LM_ADMIN);
    IEmissionManager(AaveV3Ethereum.EMISSION_MANAGER).setEmissionAdmin(aeUSDe, eUSDe_LM_ADMIN);
  }

  function eModeCategoriesUpdates()
    public
    pure
    override
    returns (IAaveV3ConfigEngine.EModeCategoryUpdate[] memory)
  {
    IAaveV3ConfigEngine.EModeCategoryUpdate[]
      memory eModeUpdates = new IAaveV3ConfigEngine.EModeCategoryUpdate[](1);

    eModeUpdates[0] = IAaveV3ConfigEngine.EModeCategoryUpdate({
      eModeCategory: 10,
      ltv: 90_00,
      liqThreshold: 93_00,
      liqBonus: 2_00,
      label: 'eUSDe_Stablecoin'
    });

    return eModeUpdates;
  }
  function assetsEModeUpdates()
    public
    pure
    override
    returns (IAaveV3ConfigEngine.AssetEModeUpdate[] memory)
  {
    IAaveV3ConfigEngine.AssetEModeUpdate[]
      memory assetEModeUpdates = new IAaveV3ConfigEngine.AssetEModeUpdate[](4);

    assetEModeUpdates[0] = IAaveV3ConfigEngine.AssetEModeUpdate({
      asset: AaveV3EthereumAssets.USDC_UNDERLYING,
      eModeCategory: 10,
      borrowable: EngineFlags.ENABLED,
      collateral: EngineFlags.DISABLED
    });
    assetEModeUpdates[1] = IAaveV3ConfigEngine.AssetEModeUpdate({
      asset: eUSDe,
      eModeCategory: 10,
      borrowable: EngineFlags.DISABLED,
      collateral: EngineFlags.ENABLED
    });
    assetEModeUpdates[2] = IAaveV3ConfigEngine.AssetEModeUpdate({
      asset: AaveV3EthereumAssets.USDT_UNDERLYING,
      eModeCategory: 10,
      borrowable: EngineFlags.ENABLED,
      collateral: EngineFlags.DISABLED
    });
    assetEModeUpdates[3] = IAaveV3ConfigEngine.AssetEModeUpdate({
      asset: AaveV3EthereumAssets.USDS_UNDERLYING,
      eModeCategory: 10,
      borrowable: EngineFlags.ENABLED,
      collateral: EngineFlags.DISABLED
    });

    return assetEModeUpdates;
  }
  function newListings() public pure override returns (IAaveV3ConfigEngine.Listing[] memory) {
    IAaveV3ConfigEngine.Listing[] memory listings = new IAaveV3ConfigEngine.Listing[](1);

    listings[0] = IAaveV3ConfigEngine.Listing({
      asset: eUSDe,
      assetSymbol: 'eUSDe',
      priceFeed: 0xc7Ad695ac0ae38Ae308640897E51468977A862a2,
      enabledToBorrow: EngineFlags.DISABLED,
      borrowableInIsolation: EngineFlags.DISABLED,
      withSiloedBorrowing: EngineFlags.DISABLED,
      flashloanable: EngineFlags.ENABLED,
      ltv: 5,
      liqThreshold: 10,
      liqBonus: 7_50,
      reserveFactor: 45_00,
      supplyCap: 150_000_000,
      borrowCap: 1,
      debtCeiling: 0,
      liqProtocolFee: 10_00,
      rateStrategyParams: IAaveV3ConfigEngine.InterestRateInputData({
        optimalUsageRatio: 45_00,
        baseVariableBorrowRate: 0,
        variableRateSlope1: 10_00,
        variableRateSlope2: 300_00
      })
    });

    return listings;
  }
}
