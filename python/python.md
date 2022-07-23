# Python

## Modules

### Python path

`sys.path`

### Module path

`print(os.__file__)`

## pip

### Install package

`pip install tensorflow==1.1`

### Uninstall all

`pip freeze | xargs pip uninstall -y`

### pip config locations

`pip3 config list -v`

### add pip repository

`pip config --user set global.extra-index-url http://example.com/`

## Types

`isinstance('foo', str)`

## Numbers

### Power

`y = x**2`

## Strings

### Interpolation

`msg = f'Hello, {username}!'`

### Remove non-ASCII characters

```python
import unicodedata

sanitized = unicodedata.normalize('NFKD', nonsanitized)\
                       .encode('ascii', 'ignore')\
                       .decode('utf-8', 'ignore')
```

## Array

### Create fixed size array

`foo = [0] * bar`

### Enumerate

`for i, x in enumerate(foo):`

### Remove element

`foo = bar.pop()`

### Expand

`foo, bar = ['foo', 'bar'].squeeze()`

### Zip

`foobar = list(zip(foo, bar))`

## Set

### New set

`foo = set(['bar'])`

### Add element

`foo.add('bar')`

### Membership

`'foo' in bar`

## Dictionary

### Default value

`foo = my_dict.get('bar', None)`
or
`foo = my_dict.setdefault('bar', list())`
or
```python
from collections import defaultdict

my_dict = defaultdict(list)
```

### Iterate keys

`for k in foo.keys():`

### Iterate values

`for v in foo.values()`

### Iterate items

`for k, v in foo.items()`

### Update values

`foo.update(bar)`

### Delete value

`foo.pop('bar')` or `foo.del('bar')` or `del foo['bar']`

### Merge

```python
dict1 = { 'foo': 1 }
dict2 = { 'bar': 42 }
merged = { **dict1, **dict2 }
```

### Initialize dictionary with a function

`images = {x: mpimg.imread(dir_name + '/' + x) for x in files}`

>>> keys = ['a', 'b', 'c']
>>> values = [1, 2, 3]
>>> dictionary = dict(zip(keys, values))

```
import csv
with open('some.csv', 'wb') as f:
    writer = csv.writer(f)
    writer.writerows(someiterable)
```

## File system

### Current working directory

`os.getcwd()`

### Create path from directory name and file name

`path = os.path.join(dir_name, file_name)`

### List files in directory

`files = os.listdir(dir_name)`

### Newest file in directory

`newest_file = max(files, key=os.path.getctime)`

## Pickle

### Load object

`foo = pickle.load(open('path/to/foo'))`

## HTTP server

`python -m SimpleHTTPServer 8080`
or
`python3 -m http.server 8080`

## rich

### inspect

```python
from rich import inspect
inspect(inspect)
```
