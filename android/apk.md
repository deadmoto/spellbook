# apkanalyzer

## Print package, code version, and version name

`apkanalyzer apk summary example.apk`

# apksigner

## Sign APK

```apksigner sign \
--min-sdk-version 26 \
--ks example.ks \
--ks-pass pass:secret \
--ks-key-alias example \
--key-pass pass:secret \
example.apk
```

# jarsigner

## Sign APK

`jarsigner -keystore example.ks -storepass secret "example.apk" example_key`
