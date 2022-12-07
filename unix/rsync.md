# rsync

> WARNING: test settings with `-–dry-run` option

## Resume transfer

`rsync --verbose --progress --partial root@server:/foo /bar`

## Synchronize local directories

`rsync --verbose --recursive --inplace /from/ /to`

> NOTE: without `/` at the end of the source path a directory `from` will be created inside `to`

## Merge directories

`rsync --verbose --stats --itemize-changes --recursive --remove-source-files /from/ /to`

> Use `--checksum` option to ignore timestamps

## lftp

### Sync local files to remote server

`lftp -c "open -u user,pass ftp://example.com/ ; mirror --ignore-time --no-perms -n -e -R ./local ./remote"`
