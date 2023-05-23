# TP-Link Cloud API

## Get API token

```shell
curl -X POST "https://wap.tplinkcloud.com" \
  -H "Content-Type: application/json" \
  -d "{
        'method': 'login',
        'params': {
            'appType': 'Kasa_Android',
            'cloudUserName': '$TPLINK_CLOUD_USERNAME',
            'cloudPassword': '$TPLINK_CLOUD_PASSWORD',
            'terminalUUID': '$TPLINK_CLOUD_UUID'
        }
      }" | python -m json.tool
```

## Get device list

```shell
curl -X POST "https://wap.tplinkcloud.com?token=$TPLINK_CLOUD_TOKEN" \
  -H 'Content-Type: application/json' \
  -d "{
        'method': 'getDeviceList'
      }" | python -m json.tool
```

## Get device info

```shell
curl -X POST "https://wap.tplinkcloud.com?token=$TPLINK_CLOUD_TOKEN" \
  -H 'Content-Type: application/json' \
  -d "{
        'method': 'getDeviceInfo',
        'params': {
            'deviceId': '8023DAAF2F6D4B26A7AB91E18AE429F41FF3406C'
        }
      }" | python -m json.tool
```
