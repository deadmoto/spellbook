# argparse

```python
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument('--verbose', '-v', action='store_true')
args = parser.parse_args()
if args.verbose:
    print("Verbose")
```
