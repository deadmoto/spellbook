# bash
`#!/usr/bin/env bash`

## Redirect `stderr` to `stdout`
`ls 2>&1`

## Exit code
`echo $?`

## grep

### Search recursively
`grep -r "ProtoCoder" .`

### Match line start
`grep ^output_base:`

## curl

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

### Reversed order
`sort -k1r`

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

### Equality check
```bash
if [[ "$actual" != "$expected" ]];
fi
```
