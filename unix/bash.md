# bash

`#!/usr/bin/env bash`

## stderr and stdout

### Print to stderr

`>&2 echo foo` 

### Redirect `stderr` to `stdout`

`ls 2>&1`

### Print to stdout and file

`echo foo | tee -a bar.log`

### Set color

`echo -e "\033[0;34mfoo\033[0m"`

## History expansion

### Script location

`echo $(dirname "$0")`

### Disable history

` echo Nobody will know`

### Last command substitution

`sudo !!` or `sudo !-1`

### Last argument substitution

`cat !$` or `cat !!:$`

### Exit code

`echo $?`

## Strings

### Left trim

```
STRING="foo:bar"
echo "${STRING##*:}"

```

### Right trim

```
STRING="foo:bar"
echo "${STRING%:bar}"
```

### Multi-line

```
cat > FOO.bar <<- EOF
line 1
line 2
EOF
```

## Loops

### For loop with range

`for foo in bar{1..3}; do echo "$foo"; done`

### For loop with seq

`for bar in $(seq -w 1 10); do echo "foo$bar"; done`

### while

```bash
while [[ -x "foo" ]]; do
    echo bar
done
```

### until

```bash
until ! [[ -x "foo" ]]; do
    echo bar
done
```

## Files

### Create temporary directory

`tmp=$(mktemp -d)`

### Files in use

`lsof /foo/bar`

### Find duplicates

`fdupes -r -S -t foo/ bar/`

### Delete empty directories

`find . -type d -empty -delete`

### Disk info (usage)

`df -h`

### Disk info (inodes)

`df -i`

### List partitions

`fdisk -l`

### Partition UUID

`blkid` or `blkid /dev/sda1`

### Monitor file contents 

`tail -f foo | xargs -I{} date +"%Y/%m/%d %H:%M:%S: {}"`

## Network

### List interfaces

`ip link`

### List wireless interfaces

`iwconfig`

### List ports

`netstat -punta`

### Local SSH tunnel

`ssh -L 8080:127.0.0.1:80 example.com`

> NOTE: schema is <local_port>:<target_host>:<target_port> <ssh_host>

### Copy remote file

`scp root@192.168.0.1:/foo/bar.log .`

### Interface throughput

Server: `iperf -s`
Client: `iperf -c 192.168.0.1`

## Sound

### List devices

`amixer scontrols` or `arecord -l`

### Set volume

`amixer sset 'Capture',0 100%`

### Record sound

`arecord -f cd -d 10 sound.wav`
>NOTE: add `-vv` to see the signal level in realtime

## Arithmetic expansion

### Evaluate expression

`total_count=$(($count * $items))`

## if

### Equality check

```bash
if [[ errors -ne 0 ]]; then
  exit 1
fi
```

### Inequality check

```bash
if [[ "foo" != "bar" ]]; then
    exit 1
fi
```

### Regex match

```bash
if [[ $(gcloud auth list 2>&1) =~ "No credentialed accounts." ]]; then
    echo "Google Cloud SDK is not authenticated"
fi
```

### File exists

```bash
if [[ ! -f /foo/bar ]]; then
    echo "File not found!"
fi
```

### Directory exists

```bash
if [[ ! -d /foo ]]; then
    echo "Directory not found"
fi
```

### Executable exists

```bash
if ! [[ -x "$(which brew)" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
```

## Arrays

### Declare

`declare -a foo=()`

### Append

`foo+=(bar)`

### Expand as one argument

`${foo[*]}`

### Expand as multiple arguments

`${foo[@]}`

### Print array

`printf '%s\n' ${foo[*]}`

### Print array length

`echo ${#foo[@]}`

## grep

### Match regular expression

`egrep -o 'https?:.*html'`

### Search recursively

`grep -r "ProtoCoder" .`

### Match line start

`grep ^output_base:`

### Include lines after

`grep -A 3`

### Include lines before

`grep -B 3`

### Exclude lines

`grep -v "foo"`

### Match filename

`grep -r --include=*.foo "bar" .`

## sed

### Inplace replace

`sed -e "s/foo/bar/"`

## curl

### Follow redirects

`curl -L http://example.com`

### Request with cookies

`curl --cookie "foo=bar" http://example.com`

## cut

### Cut n-th segment

`cut -d; -f2` or `cut -f 2 -w` or `cut --delimiter=; --fields=2`

## find

### Find files recursively

`find . -name "*.iml"` or `find . -name "*.iml" -print`

### Find and delete files recursively

`find . -name "*.iml" -delete`

### Delete files only

`find . -type f -delete`

## ls

### Follow symlinks

`ls -lH`

## nl

### Print line number

`nl file.txt`

## zip

### Compress current directory

`zip -r archive.zip .`

### Delete file from archive

`zip -d archive.zip file.txt`

### List zip file contents

`unzip -l archive.zip`

### Unpack archive silently

`unzip -q archive.zip`

### Unpack archive overwriting existing files

`unzip -o archive.zip`

## pgrep

`pgrep uv4l`

## ps

`ps aux`

## pstree

`pstree -p 42`

## sort

### Sort by first column only

`sort -k1,1`

### Sort by second column using delimiter

`sort -t: -k2,2`

### Reversed order

`sort -k1r`

## tail

`tail -n +1` to skip the first line

## tar

### Extract to directory

`tar -xf foo.tar -C /bar` or `tar --extract --file foo.tar --directory /bar`

## tree

`tree`

## wget

`wget -i downloads.txt`

## Other

### Alias with parameters

`alias foo='f(){ echo "$@"; unset -f f; };f'`

## Alerts

### Shell alert

`echo -e "\a"`

### Telegram alert

```shell
curl -X POST https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage \
  -H 'Content-Type: application/json' \
  -d '{"chat_id": "123456789", "text": "This is a alert from bash", "disable_notification": true}'
```
