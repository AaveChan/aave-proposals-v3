// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AaveV3EthereumLido} from 'aave-address-book/AaveV3EthereumLido.sol';
import {AaveV3PayloadEthereumLido} from 'aave-helpers/src/v3-config-engine/AaveV3PayloadEthereumLido.sol';
import {EngineFlags} from 'aave-v3-origin/contracts/extensions/v3-config-engine/EngineFlags.sol';
import {IAaveV3ConfigEngine} from 'aave-v3-origin/contracts/extensions/v3-config-engine/IAaveV3ConfigEngine.sol';
import {IERC20} from 'solidity-utils/contracts/oz-common/interfaces/IERC20.sol';
import {SafeERC20} from 'solidity-utils/contracts/oz-common/SafeERC20.sol';
import {IEmissionManager} from 'aave-v3-origin/contracts/rewards/interfaces/IEmissionManager.sol';
/**
 * @title Onboard FRAX to Aave V3 Lido Instance
 * @author Aave Chan Initiative
 * - Snapshot: https://snapshot.org/#/aave.eth/proposal/0x4ee3ae8c9046a2b50eb1fcaa5266b86786923635d143dd5ed9e4acb898ec5fe5
 * - Discussion: https://governance.aave.com/t/arfc-onboard-frax-to-aave-v3-lido-instance/19300
 */
contract AaveV3EthereumLido_OnboardFRAXToAaveV3LidoInstance_20241009 is AaveV3PayloadEthereumLido {
  using SafeERC20 for IERC20;

  address public constant FRAX = 0x853d955aCEf822Db058eb8505911ED77F175b99e;
  uint256 public constant FRAX_SEED_AMOUNT = 1e18;
  address public constant FRAX_LM_ADMIN = 0xac140648435d03f784879cd789130F22Ef588Fcd;
  event debug(uint256 here);
  function _postExecute() internal override {
    IERC20(FRAX).forceApprove(address(AaveV3EthereumLido.POOL), FRAX_SEED_AMOUNT);
    AaveV3EthereumLido.POOL.supply(
      FRAX,
      FRAX_SEED_AMOUNT,
      address(AaveV3EthereumLido.COLLECTOR),
      0
    );

    (address aFRAX, , ) = AaveV3EthereumLido.AAVE_PROTOCOL_DATA_PROVIDER.getReserveTokensAddresses(
      FRAX
    );
    IEmissionManager(AaveV3EthereumLido.EMISSION_MANAGER).setEmissionAdmin(FRAX, FRAX_LM_ADMIN);
    IEmissionManager(AaveV3EthereumLido.EMISSION_MANAGER).setEmissionAdmin(aFRAX, FRAX_LM_ADMIN);
  }

  function newListings() public pure override returns (IAaveV3ConfigEngine.Listing[] memory) {
    IAaveV3ConfigEngine.Listing[] memory listings = new IAaveV3ConfigEngine.Listing[](1);

    listings[0] = IAaveV3ConfigEngine.Listing({
      asset: FRAX,
      assetSymbol: 'FRAX',
      priceFeed: 0x45D270263BBee500CF8adcf2AbC0aC227097b036,
      enabledToBorrow: EngineFlags.ENABLED,
      borrowableInIsolation: EngineFlags.DISABLED,
      withSiloedBorrowing: EngineFlags.DISABLED,
      flashloanable: EngineFlags.ENABLED,
      ltv: 0,
      liqThreshold: 0,
      liqBonus: 0,
      reserveFactor: 20_00,
      supplyCap: 20_000_000,
      borrowCap: 18_000_000,
      debtCeiling: 0,
      liqProtocolFee: 0,
      rateStrategyParams: IAaveV3ConfigEngine.InterestRateInputData({
        optimalUsageRatio: 90_00,
        baseVariableBorrowRate: 0,
        variableRateSlope1: 5_50,
        variableRateSlope2: 75_00
      })
    });

    return listings;
  }
}
