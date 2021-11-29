# ADB

## Devices

### List devices

`adb devices -l`

### Run command on USB device

`adb -d shell`

## Files

### Disk space

`adb shell df`

### Upload file

`adb push foo.bar /sdcard/Downloads/foo.bar`

## Package Manager

### List packages

`adb shell pm list packages | sort`

### Clear data

`adb shell pm clear com.examplpe.app`

### Uninstall protected package

`adb shell pm uninstall -k --user 0 com.example.app`
