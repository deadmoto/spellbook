# macOS

## Power

### Prevent sleep

`pmset noidle`

### Power status

`pmset -g batt`

### Thermal throttling status

`pmset -g thermlog`

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
`brew outdated`
`brew upgrade`

### Untap
`brew untap bazelbuild/tap`
``
### NCDU
`brew install ncdu`
