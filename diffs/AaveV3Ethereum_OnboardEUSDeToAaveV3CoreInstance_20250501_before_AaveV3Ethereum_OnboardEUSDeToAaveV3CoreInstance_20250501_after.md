## Reserve changes

### Reserves added

#### eUSDe ([0x90D2af7d622ca3141efA4d8f1F24d86E5974Cc8F](https://etherscan.io/address/0x90D2af7d622ca3141efA4d8f1F24d86E5974Cc8F))

| description | value |
| --- | --- |
| decimals | 18 |
| isActive | true |
| isFrozen | false |
| supplyCap | 150,000,000 eUSDe |
| borrowCap | 1 eUSDe |
| debtCeiling | 0 $ [0] |
| isSiloed | false |
| isFlashloanable | true |
| oracle | [0xc7Ad695ac0ae38Ae308640897E51468977A862a2](https://etherscan.io/address/0xc7Ad695ac0ae38Ae308640897E51468977A862a2) |
| oracleDecimals | 8 |
| oracleDescription | Capped eUSDe / USDe / USD |
| oracleLatestAnswer | 1.00010001 |
| usageAsCollateralEnabled | true |
| ltv | 0.05 % [5] |
| liquidationThreshold | 0.1 % [10] |
| liquidationBonus | 7.5 % |
| liquidationProtocolFee | 10 % [1000] |
| reserveFactor | 45 % [4500] |
| aToken | [0xDE6eF6CB4aBd3A473ffC2942eEf5D84536F8E864](https://etherscan.io/address/0xDE6eF6CB4aBd3A473ffC2942eEf5D84536F8E864) |
| variableDebtToken | [0x8C6FeaF5d58BA1A6541F9c4aF685f62bFCBaC3b1](https://etherscan.io/address/0x8C6FeaF5d58BA1A6541F9c4aF685f62bFCBaC3b1) |
| borrowingEnabled | false |
| isBorrowableInIsolation | false |
| interestRateStrategy | [0x9ec6F08190DeA04A54f8Afc53Db96134e5E3FdFB](https://etherscan.io/address/0x9ec6F08190DeA04A54f8Afc53Db96134e5E3FdFB) |
| aTokenName | Aave Ethereum eUSDe |
| aTokenSymbol | aEtheUSDe |
| aTokenUnderlyingBalance | 0 eUSDe [0] |
| id | 41 |
| isPaused | false |
| variableDebtTokenName | Aave Ethereum Variable Debt eUSDe |
| variableDebtTokenSymbol | variableDebtEtheUSDe |
| virtualAccountingActive | true |
| virtualBalance | 0 eUSDe [0] |
| optimalUsageRatio | 45 % |
| maxVariableBorrowRate | 310 % |
| baseVariableBorrowRate | 0 % |
| variableRateSlope1 | 10 % |
| variableRateSlope2 | 300 % |
| interestRate | ![ir](https://dash.onaave.com/api/static?variableRateSlope1=100000000000000000000000000&variableRateSlope2=3000000000000000000000000000&optimalUsageRatio=450000000000000000000000000&baseVariableBorrowRate=0&maxVariableBorrowRate=3100000000000000000000000000) |


## Emodes changed

### EMode: ETH correlated(id: 1)



### EMode: sUSDe Stablecoins(id: 2)



### EMode: rsETH LST main(id: 3)



### EMode: LBTC_WBTC(id: 4)



### EMode: LBTC_cbBTC(id: 5)



### EMode: LBTC_tBTC(id: 6)



### EMode: eBTC/WBTC(id: 7)



### EMode: PT-eUSDe Stablecoins May 2025(id: 9)



### EMode: eUSDe_Stablecoin(id: 10)

| description | value before | value after |
| --- | --- | --- |
| eMode.label | - | eUSDe_Stablecoin |
| eMode.ltv | - | 90 % |
| eMode.liquidationThreshold | - | 93 % |
| eMode.liquidationBonus | - | 2 % |
| eMode.borrowableBitmap | - | USDC, USDT, USDS |
| eMode.collateralBitmap | - | eUSDe |


## Raw diff

```json
{
  "eModes": {
    "10": {
      "from": null,
      "to": {
        "borrowableBitmap": "34359738632",
        "collateralBitmap": "2199023255552",
        "eModeCategory": 10,
        "label": "eUSDe_Stablecoin",
        "liquidationBonus": 10200,
        "liquidationThreshold": 9300,
        "ltv": 9000
      }
    }
  },
  "reserves": {
    "0x90D2af7d622ca3141efA4d8f1F24d86E5974Cc8F": {
      "from": null,
      "to": {
        "aToken": "0xDE6eF6CB4aBd3A473ffC2942eEf5D84536F8E864",
        "aTokenName": "Aave Ethereum eUSDe",
        "aTokenSymbol": "aEtheUSDe",
        "aTokenUnderlyingBalance": "0",
        "borrowCap": 1,
        "borrowingEnabled": false,
        "debtCeiling": 0,
        "decimals": 18,
        "id": 41,
        "interestRateStrategy": "0x9ec6F08190DeA04A54f8Afc53Db96134e5E3FdFB",
        "isActive": true,
        "isBorrowableInIsolation": false,
        "isFlashloanable": true,
        "isFrozen": false,
        "isPaused": false,
        "isSiloed": false,
        "liquidationBonus": 10750,
        "liquidationProtocolFee": 1000,
        "liquidationThreshold": 10,
        "ltv": 5,
        "oracle": "0xc7Ad695ac0ae38Ae308640897E51468977A862a2",
        "oracleDecimals": 8,
        "oracleDescription": "Capped eUSDe / USDe / USD",
        "oracleLatestAnswer": "100010001",
        "reserveFactor": 4500,
        "supplyCap": 150000000,
        "symbol": "eUSDe",
        "underlying": "0x90D2af7d622ca3141efA4d8f1F24d86E5974Cc8F",
        "usageAsCollateralEnabled": true,
        "variableDebtToken": "0x8C6FeaF5d58BA1A6541F9c4aF685f62bFCBaC3b1",
        "variableDebtTokenName": "Aave Ethereum Variable Debt eUSDe",
        "variableDebtTokenSymbol": "variableDebtEtheUSDe",
        "virtualAccountingActive": true,
        "virtualBalance": "0"
      }
    }
  },
  "strategies": {
    "0x90D2af7d622ca3141efA4d8f1F24d86E5974Cc8F": {
      "from": null,
      "to": {
        "address": "0x9ec6F08190DeA04A54f8Afc53Db96134e5E3FdFB",
        "baseVariableBorrowRate": "0",
        "maxVariableBorrowRate": "3100000000000000000000000000",
        "optimalUsageRatio": "450000000000000000000000000",
        "variableRateSlope1": "100000000000000000000000000",
        "variableRateSlope2": "3000000000000000000000000000"
      }
    }
  },
  "raw": {
    "0x0d5f4aadf3fde31bbb55db5f42c080f18ad54df5": {
      "label": null,
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x223d844fc4b006d67c0cdbd39371a9f73f69d974": {
      "label": "AaveV3Ethereum.EMISSION_MANAGER, AaveV3EthereumEtherFi.EMISSION_MANAGER, AaveV3EthereumLido.EMISSION_MANAGER",
      "balanceDiff": null,
      "stateDiff": {
        "0xa35865bcf0bb262efa1ae8278e28b4d540cef01cf9d29d3eb9d7efb9601c0721": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x000000000000000000000000ac140648435d03f784879cd789130f22ef588fcd"
        },
        "0xe7be4a1761d7b9b0490b40e359e48383c80943c3d37ef00985225170ffb7e801": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x000000000000000000000000ac140648435d03f784879cd789130f22ef588fcd"
        }
      }
    },
    "0x2f39d218133afab8f2b819b1066c7e434ad94e9e": {
      "label": "AaveV3Ethereum.POOL_ADDRESSES_PROVIDER",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x3e7d1eab13ad0104d2750b8863b489d65364e32d": {
      "label": null,
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x4c9edd5852cd905f086c759e8383e09bff1e68b3": {
      "label": "AaveV3Ethereum.ASSETS.USDe.UNDERLYING",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x5300a1a15135ea4dc7ad5a167152c01efc9b192a": {
      "label": "AaveV2Ethereum.POOL_ADMIN, AaveV2EthereumAMM.POOL_ADMIN, AaveV3Ethereum.ACL_ADMIN, AaveV3EthereumEtherFi.ACL_ADMIN, AaveV3EthereumLido.ACL_ADMIN, GovernanceV3Ethereum.EXECUTOR_LVL_1",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x54586be62e3c3580375ae3723c145253060ca0c2": {
      "label": "AaveV3Ethereum.ORACLE",
      "balanceDiff": null,
      "stateDiff": {
        "0xecee2f406a624dc924fdf8ca3794a399e850d4646f4ef9644d660a7813be2ef9": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x000000000000000000000000c7ad695ac0ae38ae308640897e51468977a862a2"
        }
      }
    },
    "0x64b761d848206f447fe2dd461b0c635ec39ebb27": {
      "label": "AaveV3Ethereum.POOL_CONFIGURATOR",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x7222182cb9c5320587b5148bf03eee107ad64578": {
      "label": null,
      "balanceDiff": null,
      "stateDiff": {
        "0x57c0d0964870c24387de1cb96a1c0d1e031544394130654a48994b8a35b62a81": {
          "previousValue": "0x0068132c6e000000000002000000000000000000000000000000000000000000",
          "newValue": "0x0068132c6e000000000003000000000000000000000000000000000000000000"
        },
        "0x57c0d0964870c24387de1cb96a1c0d1e031544394130654a48994b8a35b62a82": {
          "previousValue": "0x000000000000000000093a80000000000000684150ef00000000000000000000",
          "newValue": "0x000000000000000000093a80000000000000684150ef00000000000068132c6f"
        }
      }
    },
    "0x7effd7b47bfd17e52fb7559d3f924201b9dbff3d": {
      "label": "AaveV3Ethereum.DEFAULT_A_TOKEN_IMPL_REV_1",
      "balanceDiff": null,
      "stateDiff": {
        "0x0000000000000000000000000000000000000000000000000000000000000000": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000000000000000000000000000000000000000000001"
        },
        "0x0000000000000000000000000000000000000000000000000000000000000001": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000000000000000000000000000000000000000000000"
        },
        "0x0000000000000000000000000000000000000000000000000000000000000037": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x4161766520457468657265756d20655553446500000000000000000000000026"
        },
        "0x0000000000000000000000000000000000000000000000000000000000000038": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x6145746865555344650000000000000000000000000000000000000000000012"
        },
        "0x0000000000000000000000000000000000000000000000000000000000000039": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x00000000000000000000008164cc65827dcfe994ab23944cbc90e0aa80bfcb12"
        },
        "0x000000000000000000000000000000000000000000000000000000000000003b": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x57a0685e77dd47f16fcd52e0d2600c8243742253111650d725aed5e962fc27c6"
        },
        "0x000000000000000000000000000000000000000000000000000000000000003c": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x000000000000000000000000464c71f6c2f760dda6093dcb91c24c39e5d6e18c"
        },
        "0x000000000000000000000000000000000000000000000000000000000000003d": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x00000000000000000000000090d2af7d622ca3141efa4d8f1f24d86e5974cc8f"
        }
      }
    },
    "0x87870bca3f3fd6335c3f4ce8392d69350b4fa4e2": {
      "label": "AaveV3Ethereum.POOL",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0x8c6feaf5d58ba1a6541f9c4af685f62bfcbac3b1": {
      "label": null,
      "balanceDiff": null,
      "stateDiff": {
        "0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x000000000000000000000000ac725cb59d16c81061bdea61041a8a5e73da9ec6",
          "label": "Implementation slot"
        }
      }
    },
    "0x90d2af7d622ca3141efa4d8f1f24d86e5974cc8f": {
      "label": null,
      "balanceDiff": null,
      "stateDiff": {
        "0xf28b05d7cb1c50f8ef449275074a75213b412b4964112d5fc8ca14bc4785d5eb": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000000000000000000000000000056bc75e2d63100000"
        }
      }
    },
    "0x9aeb8aaa1ca38634aa8c0c8933e7fb4d61091327": {
      "label": "AaveV3Ethereum.POOL_IMPL",
      "balanceDiff": null,
      "stateDiff": {
        "0x4e69b4a7023ff8bf853bdfb67fb787860231a2137f884e442346b6eeb7905fcf": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x100000000000000000000003e8008f0d1800000000011194811229fe000a0005"
        },
        "0x4e69b4a7023ff8bf853bdfb67fb787860231a2137f884e442346b6eeb7905fd0": {
          "previousValue": "0x0000000000000000000000000000000000000000033b2e3c9fd0803ce8000000",
          "newValue": "0x0000000000000000000000000000000000000000033b2e3c9fd0803ce8000000"
        },
        "0x4e69b4a7023ff8bf853bdfb67fb787860231a2137f884e442346b6eeb7905fd1": {
          "previousValue": "0x0000000000000000000000000000000000000000033b2e3c9fd0803ce8000000",
          "newValue": "0x0000000000000000000000000000000000000000033b2e3c9fd0803ce8000000"
        },
        "0x4e69b4a7023ff8bf853bdfb67fb787860231a2137f884e442346b6eeb7905fd2": {
          "previousValue": "0x0000000000000000000029000000000000000000000000000000000000000000",
          "newValue": "0x00000000000000000000290068132c6f00000000000000000000000000000000"
        },
        "0xb6395f9c432dd8cece69c29d0bafa901e98160153dacb5e1d5fb45e8d47ba1d6": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x000000000000000000000000000000000000000002000000000027d824542328"
        },
        "0xb6395f9c432dd8cece69c29d0bafa901e98160153dacb5e1d5fb45e8d47ba1d7": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x65555344655f537461626c65636f696e00000000000000000000000000000020"
        },
        "0xb6395f9c432dd8cece69c29d0bafa901e98160153dacb5e1d5fb45e8d47ba1d8": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000000000000000000000000000000000000800000108"
        }
      }
    },
    "0x9ec6f08190dea04a54f8afc53db96134e5e3fdfb": {
      "label": "AaveV3Ethereum.ASSETS.WETH.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.wstETH.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.WBTC.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.USDC.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.DAI.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.LINK.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.AAVE.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.cbETH.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.USDT.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.rETH.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.LUSD.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.CRV.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.MKR.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.SNX.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.BAL.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.UNI.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.LDO.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.ENS.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.ONE_INCH.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.FRAX.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.GHO.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.RPL.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.sDAI.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.STG.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.KNC.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.FXS.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.crvUSD.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.PYUSD.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.weETH.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.osETH.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.USDe.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.ETHx.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.sUSDe.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.tBTC.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.cbBTC.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.USDS.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.rsETH.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.LBTC.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.eBTC.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.RLUSD.INTEREST_RATE_STRATEGY, AaveV3Ethereum.ASSETS.PT_eUSDE_29MAY2025.INTEREST_RATE_STRATEGY",
      "balanceDiff": null,
      "stateDiff": {
        "0xecee2f406a624dc924fdf8ca3794a399e850d4646f4ef9644d660a7813be2ef9": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x00000000000000000000000000000000000000007530000003e8000000001194"
        }
      }
    },
    "0xac725cb59d16c81061bdea61041a8a5e73da9ec6": {
      "label": "AaveV3Ethereum.DEFAULT_VARIABLE_DEBT_TOKEN_IMPL_REV_1",
      "balanceDiff": null,
      "stateDiff": {
        "0x0000000000000000000000000000000000000000000000000000000000000000": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000000000000000000000000000000000000000000001"
        },
        "0x0000000000000000000000000000000000000000000000000000000000000001": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000000000000000000000000000000000000000000000"
        },
        "0x0000000000000000000000000000000000000000000000000000000000000035": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x8e3ae0ff90f8db0df71faf9244b3b2262c38ce53d1ef6db5f7d5d2c8f8311562"
        },
        "0x0000000000000000000000000000000000000000000000000000000000000037": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x00000000000000000000000090d2af7d622ca3141efa4d8f1f24d86e5974cc8f"
        },
        "0x000000000000000000000000000000000000000000000000000000000000003b": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000000000000000000000000000000000000000000043"
        },
        "0x000000000000000000000000000000000000000000000000000000000000003c": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x7661726961626c65446562744574686555534465000000000000000000000028"
        },
        "0x000000000000000000000000000000000000000000000000000000000000003d": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x00000000000000000000008164cc65827dcfe994ab23944cbc90e0aa80bfcb12"
        },
        "0xbbe3212124853f8b0084a66a2d057c2966e251e132af3691db153ab65f0d1a4d": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x4161766520457468657265756d205661726961626c6520446562742065555344"
        },
        "0xbbe3212124853f8b0084a66a2d057c2966e251e132af3691db153ab65f0d1a4e": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x6500000000000000000000000000000000000000000000000000000000000000"
        }
      }
    },
    "0xc2aacf6553d20d1e9d78e365aaba8032af9c85b0": {
      "label": "AaveV3Ethereum.ACL_MANAGER",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xc7ad695ac0ae38ae308640897e51468977a862a2": {
      "label": null,
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xdabad81af85554e9ae636395611c58f7ec1aaec5": {
      "label": "GovernanceV3Ethereum.PAYLOADS_CONTROLLER",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xde6ef6cb4abd3a473ffc2942eef5d84536f8e864": {
      "label": null,
      "balanceDiff": null,
      "stateDiff": {
        "0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000007effd7b47bfd17e52fb7559d3f924201b9dbff3d",
          "label": "Implementation slot"
        }
      }
    },
    "0xe5e48ad1f9d1a894188b483dcf91f4fad6aba43b": {
      "label": "AaveV3Ethereum.POOL_CONFIGURATOR_IMPL, AaveV3EthereumEtherFi.POOL_CONFIGURATOR_IMPL, AaveV3EthereumLido.POOL_CONFIGURATOR_IMPL",
      "balanceDiff": null,
      "stateDiff": {}
    },
    "0xf8c97539934ee66a67c26010e8e027d77e821b0c": {
      "label": null,
      "balanceDiff": null,
      "stateDiff": {
        "0x000000000000000000000000000000000000000000000000000000000000003b": {
          "previousValue": "0x00000000000000000000000000000000000000000000002900000000000009c4",
          "newValue": "0x00000000000000000000000000000000000000000000002a00000000000009c4"
        },
        "0x1e0cf9b1c2a1349419380539fae4effc21781e5673d593dca9a7400afb9ce924": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x00000000000000000000000090d2af7d622ca3141efa4d8f1f24d86e5974cc8f"
        },
        "0x4e69b4a7023ff8bf853bdfb67fb787860231a2137f884e442346b6eeb7905fd0": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000000000000000000000033b2e3c9fd0803ce8000000"
        },
        "0x4e69b4a7023ff8bf853bdfb67fb787860231a2137f884e442346b6eeb7905fd1": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000000000000000000000033b2e3c9fd0803ce8000000"
        },
        "0x4e69b4a7023ff8bf853bdfb67fb787860231a2137f884e442346b6eeb7905fd2": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000029000000000000000000000000000000000000000000"
        },
        "0x4e69b4a7023ff8bf853bdfb67fb787860231a2137f884e442346b6eeb7905fd3": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x000000000000000000000000de6ef6cb4abd3a473ffc2942eef5d84536f8e864"
        },
        "0x4e69b4a7023ff8bf853bdfb67fb787860231a2137f884e442346b6eeb7905fd5": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000008c6feaf5d58ba1a6541f9c4af685f62bfcbac3b1"
        },
        "0x4e69b4a7023ff8bf853bdfb67fb787860231a2137f884e442346b6eeb7905fd6": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000009ec6f08190dea04a54f8afc53db96134e5e3fdfb"
        },
        "0x4e69b4a7023ff8bf853bdfb67fb787860231a2137f884e442346b6eeb7905fd8": {
          "previousValue": "0x0000000000000000000000000000000000000000000000000000000000000000",
          "newValue": "0x0000000000000000000000000000000000000000000000000000000000000000"
        }
      }
    }
  }
}
```