# Windows

## Terminal

### Clipboard

`clip < ~/.ssh/id_rsa.pub`

### Symlink

`mklink target source`

## Activation

### Reset activation

Remove the old product key
```
slmgr -rearm
slmgr -upk
slmgr -cpky
```
Reboot and install the new product key
```
slmgr.vbs -ipk XXXXXX-XXXXX-XXXXX-XXXXX-XXXXX
slmgr.vbs -ato
```

## Performance

### Disk

`winsat disk -drive c`

### Score

`winsat formal`
or
`Get-CimInstance Win32_WinSat`

### Tweaksz
- Disable Web Search

# Run

## Startup

`shell:startup`

## Sleep

`rundll32.exe powrprof.dll,SetSuspendState 0,1,0`

## DxDiag

`dxdiag`
