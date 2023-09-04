# Debian, Ubuntu, Raspbian

## apt

### Installed packages

`apt list --installed`

### Manually installed packages 

`apt-mark showmanual`

### Update package

`sudo apt-get --only-upgrade install apt`

### Remove package and files

`apt-get purge foo`

## dpkg

### List files in package

`dpkg -L foo`

## systemctl

### Service status

`systemctl status | grep service`
