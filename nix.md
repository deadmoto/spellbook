# Nix

## nix-shell

### Interactive shell

`nix-shell --pure -p python --command python`

### Interpreter 

```shell
#! /usr/bin/env nix-shell
#! nix-shell -i real-interpreter -p packages
```

```shell
#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p python3 python3Packages.jupyterlab
jupyter-lab
```
