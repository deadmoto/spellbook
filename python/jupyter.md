# Jupyter

## Magic commands

### Show all magic commands

`%lsmagic`

### Write script

`%%writefile foo.py`

### Display script

`%pycat foo.py`

### Run script

`%run foo.py`

### Benchmark script

`%%time`

### Show variable

`%who str`

### Show all variables

`%whos`

### Show variable info

`%pinfo foo`

### Store variable

`%store foo`

### Load variable

`%store -r foo`

### Render HTML

`%%html`

### Run JavaScript

`%%js`

### Set environment variable

`%env foo bar`

## Retina resolution

`%config InlineBackend.figure_format ='retina'`

## Files

### Link file

```jupyterpython
from IPython.display import FileLink

display(FileLink('foo.csv'))
```

### List directory

```jupyterpython
from IPython.display import FileLinks

FileLinks('.')
```
