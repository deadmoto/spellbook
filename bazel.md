# Bazel

## Use Bazelisk
```bash
brew install bazelisk
cat latest > .bazelversion
bazelisk build //...
```

## Install exact version

### Bazel 0.17.2
```bash
brew install https://raw.githubusercontent.com/bazelbuild/homebrew-tap/b335a3d023d09f37419e84234fa76a735ffb703f/bazel.rb
brew pin bazel
```

### Bazel 0.19.2
```bash
brew install https://raw.githubusercontent.com/bazelbuild/homebrew-tap/8e0ab3dd0a2570492277c0f91552da4e82f57073/Formula/bazel.rb
brew pin bazel
```

# Sync
`bazel sync`

## Clean

### Clean outputs
`bazel clean`

### Clean workspace
`bazel clean --expunge`

## Shutdown
`bazel shutdown`
