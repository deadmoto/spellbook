# bash

## Redirect `stderr` to `stdout`
`ls 2>&1`

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

## ls

### Follow symlinks
`ls -lH`

## zip

#### Delete file from archive
`zip -d archive.zip file.txt`

#### List zip file contents
`unzip -l archive.zip`

#### Unpack archive silently
`unzip -q archive.zip`

#### Unpack archive overwriting existing files
`unzip -o archive.zip`

wget -i downloads.txt


egrep -o 'https?:.*mp3' | xargs -L 1 wget

## sort

### Reversed order
sort -k1r
