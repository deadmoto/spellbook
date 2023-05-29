# ADB

## Devices

### List devices

`adb devices -l`

### Run command on USB device

`adb -d shell`

## Package Manager

### List packages

`adb shell pm list packages | sort`

### Clear data

`adb shell pm clear com.example.app`

### Disable application

`adb shell pm disable-user --user 0 com.oculus.updater`

### Enable application

`adb shell pm enable com.oculus.updater`

### Uninstall protected package

`adb shell pm uninstall -k --user 0 com.example.app`

### Grant system settings permission 

`adb shell pm grant net.dinglisch.android.taskerm android.permission.WRITE_SECURE_SETTINGS`

## Activity Manager

### Start service

`adb shell am startservice -a com.example.ACTION_EXAMPLE`

### Broadcast message

`adb shell am broadcast -a com.example.ACTION_EXAMPLE`

### Start process

`adb shell am start com.example/.MainActivity`

### Stop process

`adb shell am force-stop com.example`


### Open Oculus Quest 2 settings 

`adb shell am start -a android.intent.action.VIEW -d com.oculus.tv -e uri com.android.settings/.DevelopmentSettings com.oculus.vrshell/.MainActivity`

## Logs

### Clear LogCat buffer

`adb logcat -c`

### Suppress LogCat output

`adb logcat -s` or `adb logcat *:S`

### Filter LogCat output

`adb logcat *:S System.err:W CriticalPerfLog:I`

## Files

### Download file

`adb pull /data/data/com.example/files/example.log`
or
`adb -d shell "run-as com.example cat /data/data/com.example/files/example.log" > example.log`

### Upload file

`adb push example.apk /sdcard/Downloads/example.apk`

### Disk space

`adb shell df`

## Input

### Enter text

`adb shell input keyboard text foo`
