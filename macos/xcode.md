# Xcode

## Certificates

### List all certificates

`security find-identity`

### List valid code signing certificates

`security find-identity -v -p codesigning`

## Sign app

`codesign -s BAR -f /Applications/Foo.app`
