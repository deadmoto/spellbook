# Git

## Checkout

### Checkout ignoring local changes

`git checkout master --force`

### Checkout submodules

`git submodule update --init --recursive`

### Recursively update submodules

`git config --global submodule.recurse true`

## Remove files not in index

`git clean -fdx`

## Unstage file

`git reset HEAD file`

## Unstage all files

`git reset --hard HEAD`

## Export patch

```
git diff HEAD --output=diff.patch
```

## Apply patch

`git apply < diff.patch`

## Empty commit

`git commit --allow-empty -m "build"`

## Commit history

### Changed files

`git diff --name-only HEAD~1 HEAD`

### Merge base

`git merge-base master HEAD`

## Global Git config

### Prune remote branches when fetching

`git config --global fetch.prune true`

### Use SSH instead of HTTPS

```bash
git config --global url."git@github.com:".insteadOf "https://github.com"
```

## Local Git config

### Edit local Git config

`git config -e`

### Don't fetch tags

`git config remote.origin.tagopt --no-tags`

### Narrow down remote refs

Edit .git/config as following:
```
[remote "origin"]
  ...
  fetch = +refs/heads/master:refs/remotes/origin/master
  fetch = +refs/heads/release/*:refs/remotes/origin/release/*
  ...
```

### Checkout branch without refspec

```bash
git fetch origin branch:refs/remotes/origin/branch
git checkout -b branch origin/branch
git push --set-upstream origin branch
```

## Git cleanup

### Delete all tags

`git tag -l | sed "s/\(['\"]\)/\\\\\1/g" | xargs -n1 git tag -d`

### Delete all remote tracking branches

`git branch -r --no-color | grep -v HEAD | sed "s/\(['\"]\)/\\\\\1/g" | xargs -n1 git branch -rD`

### Gc and prune

```
git gc
git prune
```

## Git LFS

### Git LFS prune

Git LFS prune must be executed manually:
`git lfs prune`

# This doesn't work because we squash merge
`git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d`

# Checking out slim repos initially

TODO: I haven't quite perfected the technique for doing this for a fresh clone without having to grab the whole repo and trim it down afterwards. Here's some progress though:

`git clone --depth=1 --single-branch https://github.com/foo/bar.git`

### customize .git/config
git fetch origin --unshallow
git reset --hard origin/master

## Git add-ons

### bash-git-prompt
`brew install bash-git-prompt`

## References

### Show references

`git show-ref`

### Short reference

`git rev-parse --short HEAD`

### Delete reference

`git update-ref -d refs/remotes/origin/foo`

## Alias

```bash
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.cm 'commit -m'
git config --global alias.em 'commit --allow-empty -m "build"'
git config --global alias.rs 'reset HEAD --'
git config --global alias.sm '!f(){ git pull --ff-only "$@" && git submodule update --init --recursive; }; f'
git config --global alias.st status
```
