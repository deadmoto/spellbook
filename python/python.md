# Python

## PIP

`pip install tensorflow==1.1`

## Numbers

### Power

`y = x**2`

## Strings

### Interpolation

`msg = f'Hello, {username}!'`

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
