# ADB

## Package Manager

### List packages

`adb shell pm list packages | sort`

### Clear data

`adb shell pm clear com.examplpe.app`

### Uninstall protected package

`adb shell pm uninstall -k --user 0 com.example.app`