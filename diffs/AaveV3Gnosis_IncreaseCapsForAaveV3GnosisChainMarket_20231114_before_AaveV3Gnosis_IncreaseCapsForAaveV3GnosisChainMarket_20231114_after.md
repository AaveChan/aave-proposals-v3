## Reserve changes

### Reserve altered

#### WETH ([0x6A023CCd1ff6F2045C3309768eAd9E68F978f6e1](https://blockscout.com/xdai/mainnet/address/0x6A023CCd1ff6F2045C3309768eAd9E68F978f6e1))

| description | value before | value after |
| --- | --- | --- |
| supplyCap | 4,000 WETH | 6,000 WETH |
| borrowCap | 3,500 WETH | 5,000 WETH |


#### GNO ([0x9C58BAcC331c9aa871AFD802DB6379a98e80CEdb](https://blockscout.com/xdai/mainnet/address/0x9C58BAcC331c9aa871AFD802DB6379a98e80CEdb))

| description | value before | value after |
| --- | --- | --- |
| supplyCap | 30,000 GNO | 40,000 GNO |


## Raw diff

```json
{
  "reserves": {
    "0x6A023CCd1ff6F2045C3309768eAd9E68F978f6e1": {
      "borrowCap": {
        "from": 3500,
        "to": 5000
      },
      "supplyCap": {
        "from": 4000,
        "to": 6000
      }
    },
    "0x9C58BAcC331c9aa871AFD802DB6379a98e80CEdb": {
      "supplyCap": {
        "from": 30000,
        "to": 40000
      }
    }
  }
}
```