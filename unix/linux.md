# Linux

## Permissions

### Add user to a group

`usermod -a -G awesomegroup newuser`

* `adm` for read access in `/var/log/`

## Devices

### HDD

#### Remove

`echo 1 > /sys/block/sda/device/delete`

### USB

`lsusb`

## Network

### List DNS servers

`resolvconf -l`

### Resolve DNS record

`nslookup example.com`
or
`dig @127.0.0.1 example.com`

## Modules

### Loaded at boot

`cat /etc/modules`

### Running

`lsmod`

## Kernel

### Show log

`dmesg`

### Clear log

`dmesg -c`
