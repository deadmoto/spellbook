# AVRO

`pip install avro`

```python
import avro.schema
from avro.datafile import DataFileReader, DataFileWriter
from avro.io import DatumReader, DatumWriter
```

## Schema

### From file

`schema = avro.schema.parse(open("user.avsc", "rb").read())`

### From string

```python
schema = avro.schema.parse('''
{
  "namespace": "example.avro",
  "type": "record",
  "name": "Example",
  "fields": [
    {"name": "foo", "type": "string"},
    {"name": "bar", "type": ["int", "null"]}
  ]
}
''')
```

## Data

### Write

```python
writer = DataFileWriter(open("example.avro", "wb"), DatumWriter(), schema)
writer.append({"foo": "Foo", "bar": 42})
writer.close()
```

### Read

```python
reader = DataFileReader(open("example.avro", "rb"), DatumReader())
for record in reader:
    print(record)
reader.close()
```