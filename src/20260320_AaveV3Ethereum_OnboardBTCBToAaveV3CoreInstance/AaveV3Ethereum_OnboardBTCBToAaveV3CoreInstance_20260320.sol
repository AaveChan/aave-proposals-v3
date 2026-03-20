// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Ethereum} from 'aave-address-book/AaveV3Ethereum.sol';
import {ChainlinkEthereum} from 'aave-address-book/ChainlinkEthereum.sol';
import {AaveV3PayloadEthereum} from 'aave-helpers/src/v3-config-engine/AaveV3PayloadEthereum.sol';
import {EngineFlags} from 'aave-v3-origin/contracts/extensions/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-v3-origin/contracts/extensions/v3-config-engine/IAaveV3ConfigEngine.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {SafeERC20} from 'openzeppelin-contracts/contracts/token/ERC20/utils/SafeERC20.sol';
import {IEmissionManager} from 'aave-v3-origin/contracts/rewards/interfaces/IEmissionManager.sol';

/**
 * @title Onboard BTC.b to Aave V3 Core Instance
 * @author Aavechan Initiative @aci
 * - Snapshot: direct-to-aip
 * - Discussion: https://governance.aave.com/t/direct-to-aip-onboard-btc-b-to-aave-v3-core-instance/23357
 */
contract AaveV3Ethereum_OnboardBTCBToAaveV3CoreInstance_20260320 is AaveV3PayloadEthereum {
  using SafeERC20 for IERC20;

  address public constant BTCb = 0xB0F70C0bD6FD87dbEb7C10dC692a2a6106817072;
  uint256 public constant BTCb_SEED_AMOUNT = 15e4;
  address public constant BTCb_LM_ADMIN = 0xac140648435d03f784879cd789130F22Ef588Fcd;

  function _postExecute() internal override {
    _supplyAndConfigureLMAdmin(BTCb, BTCb_SEED_AMOUNT, BTCb_LM_ADMIN);
  }

  function newListings() public pure override returns (IAaveV3ConfigEngine.Listing[] memory) {
    IAaveV3ConfigEngine.Listing[] memory listings = new IAaveV3ConfigEngine.Listing[](1);

    listings[0] = IAaveV3ConfigEngine.Listing({
      asset: BTCb,
      assetSymbol: 'BTCb',
      priceFeed: ChainlinkEthereum.BTC__USD,
      enabledToBorrow: EngineFlags.DISABLED,
      borrowableInIsolation: EngineFlags.DISABLED,
      withSiloedBorrowing: EngineFlags.DISABLED,
      flashloanable: EngineFlags.ENABLED,
      ltv: 73_00,
      liqThreshold: 78_00,
      liqBonus: 7_50,
      reserveFactor: 50_00,
      supplyCap: 600,
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
    IERC20(asset).forceApprove(address(AaveV3Ethereum.POOL), seedAmount);
    AaveV3Ethereum.POOL.supply(asset, seedAmount, address(AaveV3Ethereum.DUST_BIN), 0);

    if (lmAdmin != address(0)) {
      address aToken = AaveV3Ethereum.POOL.getReserveAToken(asset);
      address vToken = AaveV3Ethereum.POOL.getReserveVariableDebtToken(asset);
      IEmissionManager(AaveV3Ethereum.EMISSION_MANAGER).setEmissionAdmin(asset, lmAdmin);
      IEmissionManager(AaveV3Ethereum.EMISSION_MANAGER).setEmissionAdmin(aToken, lmAdmin);
      IEmissionManager(AaveV3Ethereum.EMISSION_MANAGER).setEmissionAdmin(vToken, lmAdmin);
    }
  }
}
