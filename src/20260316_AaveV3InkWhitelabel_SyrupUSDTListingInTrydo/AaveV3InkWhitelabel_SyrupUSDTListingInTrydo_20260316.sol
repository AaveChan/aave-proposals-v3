// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3InkWhitelabel} from 'aave-address-book/AaveV3InkWhitelabel.sol';
import {AaveV3PayloadInkWhitelabel} from 'aave-helpers/src/v3-config-engine/AaveV3PayloadInkWhitelabel.sol';
import {EngineFlags} from 'aave-v3-origin/contracts/extensions/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-v3-origin/contracts/extensions/v3-config-engine/IAaveV3ConfigEngine.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {SafeERC20} from 'openzeppelin-contracts/contracts/token/ERC20/utils/SafeERC20.sol';
import {IEmissionManager} from 'aave-v3-origin/contracts/rewards/interfaces/IEmissionManager.sol';

/**
 * @title SyrupUSDT listing in Trydo
 * @author Trydo (implemented by Aavechan Initiative @aci via Skyward)
 */
contract AaveV3InkWhitelabel_SyrupUSDTListingInTrydo_20260316 is AaveV3PayloadInkWhitelabel {
  using SafeERC20 for IERC20;

  address public constant syrupUSDT = 0x8A76fe7fA6da27f85a626c5C53730B38D13603d7;
  uint256 public constant syrupUSDT_SEED_AMOUNT = 100e6;
  address public constant syrupUSDT_LM_ADMIN = 0xac140648435d03f784879cd789130F22Ef588Fcd;

  function _postExecute() internal override {
    _supplyAndConfigureLMAdmin(syrupUSDT, syrupUSDT_SEED_AMOUNT, syrupUSDT_LM_ADMIN);
  }

  function newListings() public pure override returns (IAaveV3ConfigEngine.Listing[] memory) {
    IAaveV3ConfigEngine.Listing[] memory listings = new IAaveV3ConfigEngine.Listing[](1);

    listings[0] = IAaveV3ConfigEngine.Listing({
      asset: syrupUSDT,
      assetSymbol: 'syrupUSDT',
      priceFeed: 0x7791e46f5588aCd48EE31494877dD9F182f7f566,
      enabledToBorrow: EngineFlags.DISABLED,
      borrowableInIsolation: EngineFlags.DISABLED,
      withSiloedBorrowing: EngineFlags.DISABLED,
      flashloanable: EngineFlags.ENABLED,
      ltv: 0,
      liqThreshold: 0,
      liqBonus: 10_00,
      reserveFactor: 45_00,
      supplyCap: 50_000_000,
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
  function _supplyAndConfigureLMAdmin(address asset, uint256 seedAmount, address lmAdmin) internal {
    IERC20(asset).forceApprove(address(AaveV3InkWhitelabel.POOL), seedAmount);
    AaveV3InkWhitelabel.POOL.supply(asset, seedAmount, address(AaveV3InkWhitelabel.DUST_BIN), 0);

    if (lmAdmin != address(0)) {
      address aToken = AaveV3InkWhitelabel.POOL.getReserveAToken(asset);
      address vToken = AaveV3InkWhitelabel.POOL.getReserveVariableDebtToken(asset);
      IEmissionManager(AaveV3InkWhitelabel.EMISSION_MANAGER).setEmissionAdmin(asset, lmAdmin);
      IEmissionManager(AaveV3InkWhitelabel.EMISSION_MANAGER).setEmissionAdmin(aToken, lmAdmin);
      IEmissionManager(AaveV3InkWhitelabel.EMISSION_MANAGER).setEmissionAdmin(vToken, lmAdmin);
    }
  }

  function eModeCategoryCreations()
    public
    pure
    override
    returns (IAaveV3ConfigEngine.EModeCategoryCreation[] memory)
  {
    IAaveV3ConfigEngine.EModeCategoryCreation[]
      memory eModeCreations = new IAaveV3ConfigEngine.EModeCategoryCreation[](1);

    address[] memory collateralAssets_SyrupUSDT__USDT0 = new address[](1);
    address[] memory borrowableAssets_SyrupUSDT__USDT0 = new address[](1);

    collateralAssets_SyrupUSDT__USDT0[0] = syrupUSDT;
    borrowableAssets_SyrupUSDT__USDT0[0] = AaveV3InkWhitelabelAssets.USDT_UNDERLYING;

    eModeCreations[0] = IAaveV3ConfigEngine.EModeCategoryCreation({
      ltv: 90_00,
      liqThreshold: 92_00,
      liqBonus: 4_00,
      label: 'syrupUSDT__USDT0',
      collaterals: collateralAssets_SyrupUSDT__USDT0,
      borrowables: borrowableAssets_SyrupUSDT__USDT0
    });

    return eModeCreations;
  }
}
