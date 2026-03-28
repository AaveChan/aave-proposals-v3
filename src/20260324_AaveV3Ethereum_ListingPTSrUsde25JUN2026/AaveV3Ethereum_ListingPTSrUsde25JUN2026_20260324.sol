// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3Ethereum, AaveV3EthereumAssets} from 'aave-address-book/AaveV3Ethereum.sol';
import {AaveV3PayloadEthereum} from 'aave-helpers/src/v3-config-engine/AaveV3PayloadEthereum.sol';
import {EngineFlags} from 'aave-v3-origin/contracts/extensions/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-v3-origin/contracts/extensions/v3-config-engine/IAaveV3ConfigEngine.sol';
import {IERC20} from 'openzeppelin-contracts/contracts/token/ERC20/IERC20.sol';
import {SafeERC20} from 'openzeppelin-contracts/contracts/token/ERC20/utils/SafeERC20.sol';
import {GovernanceV3Ethereum} from 'aave-address-book/GovernanceV3Ethereum.sol';
import {IEmissionManager} from 'aave-v3-origin/contracts/rewards/interfaces/IEmissionManager.sol';
import {MiscEthereum} from 'aave-address-book/MiscEthereum.sol';
import {IAgentHub} from '../interfaces/chaos-agents/IAgentHub.sol';
import {IPool} from 'aave-v3-origin/contracts/interfaces/IPool.sol';

/**
 * @title Listing PT Strata 25JUN2026
 * @author Aave Chan Initiative @aci
 * - Snapshot: direct-to-aip
 * - Discussion: https://governance.aave.com/t/direct-to-aip-onboard-strata-srusde-june-expiry-pt-tokens-to-v3-core-instance/24313
 */
contract AaveV3Ethereum_ListingPTSrUsde25JUN2026_20260324 is AaveV3PayloadEthereum {
  using SafeERC20 for IERC20;

  address public constant PT_srUSDe_25JUN2026 = 0x619D75E3b790eBC21c289f2805Bb7177A7D732E2;
  uint256 public constant PT_srUSDe_25JUN2026_SEED_AMOUNT = 100e18;
  address public constant PT_srUSDe_25JUN2026_LM_ADMIN = 0xac140648435d03f784879cd789130F22Ef588Fcd;
  address public constant STRATA_SEEDING_ADDRESS = 0x981EfbD4d3932FA750f0191F00535D7Cb586A558;

  error NoAvailableEmodeCategory();

  function _postExecute() internal override {
    _supplyAndConfigureLMAdmin(
      PT_srUSDe_25JUN2026,
      PT_srUSDe_25JUN2026_SEED_AMOUNT,
      PT_srUSDe_25JUN2026_LM_ADMIN
    );

    uint8 nextID = _findFirstUnusedEmodeCategory(AaveV3Ethereum.POOL);

    // whitelist the new eModes on automated chaos-agents [agentId 0: EModeCategoryUpdate]
    IAgentHub(MiscEthereum.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 1)));
    IAgentHub(MiscEthereum.AGENT_HUB).addAllowedMarket(0, address(uint160(nextID - 2)));

    // whitelist the new pt-assets on automated chaos-agents [agentId 1: PendleDiscountRateUpdate]
    IAgentHub(MiscEthereum.AGENT_HUB).addAllowedMarket(1, PT_srUSDe_25JUN2026);
  }

  function newListings() public pure override returns (IAaveV3ConfigEngine.Listing[] memory) {
    IAaveV3ConfigEngine.Listing[] memory listings = new IAaveV3ConfigEngine.Listing[](1);

    listings[0] = IAaveV3ConfigEngine.Listing({
      asset: PT_srUSDe_25JUN2026,
      assetSymbol: 'PT_srUSDe_25JUN2026',
      priceFeed: 0x9f336eB940730596548C342A8BF1fC530B10cc96,
      enabledToBorrow: EngineFlags.DISABLED,
      borrowableInIsolation: EngineFlags.DISABLED,
      withSiloedBorrowing: EngineFlags.DISABLED,
      flashloanable: EngineFlags.ENABLED,
      ltv: 0,
      liqThreshold: 0,
      liqBonus: 0,
      reserveFactor: 45_00,
      supplyCap: 30_000_000,
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
  function eModeCategoryCreations()
    public
    pure
    override
    returns (IAaveV3ConfigEngine.EModeCategoryCreation[] memory)
  {
    IAaveV3ConfigEngine.EModeCategoryCreation[]
      memory eModeCreations = new IAaveV3ConfigEngine.EModeCategoryCreation[](2);

    address[] memory collateralAssets_PT_srUSDe_25JUN2026__Stablecoins = new address[](3);
    address[] memory borrowableAssets_PT_srUSDe_25JUN2026__Stablecoins = new address[](3);

    collateralAssets_PT_srUSDe_25JUN2026__Stablecoins[0] = PT_srUSDe_25JUN2026;
    collateralAssets_PT_srUSDe_25JUN2026__Stablecoins[1] = AaveV3EthereumAssets.sUSDe_UNDERLYING;
    collateralAssets_PT_srUSDe_25JUN2026__Stablecoins[2] = AaveV3EthereumAssets
      .PT_srUSDe_2APR2026_UNDERLYING;
    borrowableAssets_PT_srUSDe_25JUN2026__Stablecoins[0] = AaveV3EthereumAssets.USDC_UNDERLYING;
    borrowableAssets_PT_srUSDe_25JUN2026__Stablecoins[1] = AaveV3EthereumAssets.USDT_UNDERLYING;
    borrowableAssets_PT_srUSDe_25JUN2026__Stablecoins[2] = AaveV3EthereumAssets.USDe_UNDERLYING;

    eModeCreations[0] = IAaveV3ConfigEngine.EModeCategoryCreation({
      ltv: 90_00,
      liqThreshold: 92_00,
      liqBonus: 4_30,
      label: 'PT_srUSDe_25JUN2026__Stablecoins',
      collaterals: collateralAssets_PT_srUSDe_25JUN2026__Stablecoins,
      borrowables: borrowableAssets_PT_srUSDe_25JUN2026__Stablecoins
    });

    address[] memory collateralAssets_PT_srUSDe_25JUN2026__USDe = new address[](3);
    address[] memory borrowableAssets_PT_srUSDe_25JUN2026__USDe = new address[](1);

    collateralAssets_PT_srUSDe_25JUN2026__USDe[0] = PT_srUSDe_25JUN2026;
    collateralAssets_PT_srUSDe_25JUN2026__USDe[1] = AaveV3EthereumAssets.sUSDe_UNDERLYING;
    collateralAssets_PT_srUSDe_25JUN2026__USDe[2] = AaveV3EthereumAssets
      .PT_srUSDe_2APR2026_UNDERLYING;
    borrowableAssets_PT_srUSDe_25JUN2026__USDe[0] = AaveV3EthereumAssets.USDe_UNDERLYING;

    eModeCreations[1] = IAaveV3ConfigEngine.EModeCategoryCreation({
      ltv: 91_20,
      liqThreshold: 93_20,
      liqBonus: 3_30,
      label: 'PT_srUSDe_25JUN2026__USDe',
      collaterals: collateralAssets_PT_srUSDe_25JUN2026__USDe,
      borrowables: borrowableAssets_PT_srUSDe_25JUN2026__USDe
    });

    return eModeCreations;
  }

  function _preExecute() internal override {
    IERC20(AaveV3EthereumAssets.PT_srUSDe_2APR2026_UNDERLYING).safeTransfer(
      STRATA_SEEDING_ADDRESS,
      100e18
    );
  }

  function _findFirstUnusedEmodeCategory(IPool pool) private view returns (uint8) {
    // eMode id 0 is skipped intentionally as it is the reserved default
    for (uint8 i = 1; i < 256; i++) {
      if (pool.getEModeCategoryCollateralConfig(i).liquidationThreshold == 0) return i;
    }
    revert NoAvailableEmodeCategory();
  }
}
