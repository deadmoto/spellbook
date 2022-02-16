# macOS

## Files

### Disk devices

`diskutil list`

### Unmount disk

`diskutil unmountDisk /dev/disk1`

### Eject disk

`diskutil eject /dev/disk1`

### Disk copy

`dd if=/dev/disk1 of=/foo.bin bs=1m`

## Power

### Prevent sleep

`pmset noidle`

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

## Homebrew

### Search

`brew search protobuf@`

### Install exact version

#### Protobuf 3.5.1

`brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/a4cd6cac4fb65f447e3b47e63a8d58b9508d2cd4/Formula/protobuf.rb`

### Pin version

`brew pin protobuf`

### Uninstall

`brew uninstall protobuf`

### Update

`brew outdated` and `brew upgrade`

### Untap

`brew untap bazelbuild/tap`

## Useful utilities

`k9s`
`lazydocker`
`mc`
`ncdu`


dd if=/Users/deadmoto/Downloads/spellbook/pi.img of=/dev/disk2
