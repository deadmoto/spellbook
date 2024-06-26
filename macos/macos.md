# macOS

## Interface

### Hotkeys

| Shortcut | Feature           |
|----------|-------------------|
| fn + A   | Focus on Dock     |
| fn + C   | Control Center    |
| fn + E   | Emoji             |
| fn + F   | Toggle fullscreen |
| fn + H   | Show/Hide Desktop |
| fn + N   | Notifications     |

### Diacritical Marks

> macOS 14 Sonoma: Press the character button and select the character with a diacritical mark

### Recent Apps

```shell
defaults write com.apple.dock show-recents -bool true;
defaults write com.apple.dock show-recent-count -int 5;
killall Dock
```

## Files

### Disk devices

`diskutil list`

### Unmount disk

`diskutil unmountDisk /dev/disk1`

### Eject disk

`diskutil eject /dev/disk1`

### Disk copy

`dd if=/dev/disk1 of=/foo.bin bs=1m status=progress`

### Find file

`mdfind -name foo`

### Find app

`mdfind "kMDItemCFBundleIdentifier == com.googlecode.iterm2"`

### Disable quarantine

`xattr -r -d com.apple.quarantine /Applications/Foo.app`

## Power

### Prevent sleep

> `pmset noidle` is deprecated, use caffeinate

`caffeinate`
> To daemonize add `-d`\
> To set duration in seconds add `-t <seconds>`

### Power status

`pmset -g batt`

### Sleep log

`pmset -g log | grep -E 'Wake from|Entering Sleep'`

### Power Nap

`pmset -a powernap 0` or `pmset -b powernap 0` and `pmset -c powernap 0`

### Wake up for network 

`pmset -b tcpkeepalive 1` and `pmset -c tcpkeepalive 0`
> WARNING: this may disrupt Find My feature.

### Thermal throttling status

`pmset -g thermlog`

## Network

### Show Wi-Fi networks

`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s`

### Do not write .DS_Store on network shares

`defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE`
> NOTE: run `killall Finder` to apply settings immediately

## Bluetooth

### Audio codec

Launch Console app, search for `bluetoothd` (select PROCESS type instead of ANY), look for messages containing `codec`:
- kBTAudioMsgPropertyCodec

### Check defaults

`sudo defaults read bluetoothaudiod`

### Enable AptX

`sudo defaults write bluetoothaudiod "Enable AptX codec" -bool true`

### Enable AAC

`sudo defaults write bluetoothaudiod "Enable AAC codec" -bool true`

## Watch Spotlight indexing

`sudo fs_usage -w -f filesys mds`
