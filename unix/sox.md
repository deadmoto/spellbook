# Install sox with LAME support

```bash
brew install lame
brew reinstall sox --with-lame
```

# Detect silence and export segments:

`sox -V3 in.mp3 out.mp3 silence -l 1 0.5 0.1% 1 0.5 0.1% : newfile : restart`
