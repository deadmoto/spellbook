# bash

`#!/usr/bin/env bash`

## stderr and stdout

### Print to stderr

`>&2 echo foo` 

### Redirect `stderr` to `stdout`

`ls 2>&1`

### Print to stdout and file

`echo foo | tee -a bar.log`

## History expansion

## Last command substitution

`sudo !!` or `sudo !-1`

## Last argument substitution

`cat !$` or `cat !!:$`

## Exit code

`echo $?`

## Left trim

```
STRING="foo:bar"
echo "${STRING##*:}"

```

## Right trim

```
STRING="foo:bar"
echo "${STRING%:bar}"
```

## Disable bash history

` echo Run history command`

## Alias with parameters

`alias foo='f(){ echo "$@"; unset -f f; };f'`

## For loop with range

`for foo in bar{1..3}; do echo "$foo"; done`

## For loop with seq

`for bar in $(seq -w 1 10); do echo "foo$bar"; done`

## Alert

`echo -e "\a"`

## grep

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

`cut -d; -f2`

## find

### Find files recursively

`find . -name "*.iml"` or `find . -name "*.iml" -print`

### Find and delete files recursively

`find . -name "*.iml" -delete`

### Find only files

`find . -type f`

## grep

### Find lines matching regular expression

`egrep -o 'https?:.*mp3'`

### Find files containing string

`grep -r --include=*.proto MultidayFeatureSet .`

## ls

### Follow symlinks

`ls -lH`

## nl

### Print line number

`nl file.txt`

## zip

#### Delete file from archive

`zip -d archive.zip file.txt`

#### List zip file contents

`unzip -l archive.zip`

#### Unpack archive silently

`unzip -q archive.zip`

#### Unpack archive overwriting existing files

`unzip -o archive.zip`

## sort

### Sort by first column only

`sort -k1,1`

### Sort by second column using delimiter 

`sort -t: -k2,2`

### Reversed order

`sort -k1r`


## tree

`tree`

## wget

`wget -i downloads.txt`

## Files

### Create temporary directory

`tmp=$(mktemp -d)`

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

## while

```bash
while [[ -x "foo" ]]; do
    echo bar
done
```

## until

```bash
until ! [[ -x "foo" ]]; do
    echo bar
done
```

## Arrays

### Declare array

`declare -a foo=()`

### Append to array

`foo+=(bar)`

### Print array

`printf '%s\n' ${foo[*]}`

### Print array length

`echo $#{foo[@]}`
