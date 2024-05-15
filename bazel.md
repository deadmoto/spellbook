# Bazel

## Use Bazelisk
```bash
brew install bazelisk
cat latest > .bazelversion
bazelisk build //...
```

## Install exact version

### Bazel 0.19.2
```bash
brew install https://raw.githubusercontent.com/bazelbuild/homebrew-tap/8e0ab3dd0a2570492277c0f91552da4e82f57073/Formula/bazel.rb
brew pin bazel
```

## Sync
`bazel sync`

## Clean

### Clean outputs
`bazel clean`

### Clean workspace
`bazel clean --expunge`

## Shutdown
`bazel shutdown`

## Dependencies

### Text

`bazel query 'deps(//foo:bar)' --nohost_deps --noimplicit_deps`

### Graph

`bazel query 'deps(//foo:bar)' --nohost_deps --noimplicit_deps --output=graph | dot -Tpng > graph.png`

### Path

`bazel query "allpaths(//:foo, //:bar)"`

## Logging

`bazel build --subcommands --verbose_failures ...`

## Debug

Add `--@io_bazel_rules_go//go/config:debug` to your command or `build:debug --@io_bazel_rules_go//go/config:debug` to your `bazel.rc`

## Explain rebuild

`bazel build --explain=/tmp/explanation.txt --verbose_explanations`
