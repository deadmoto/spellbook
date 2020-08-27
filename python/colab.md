# Colab

## Authenticate

```python
from google.colab import auth
auth.authenticate_user()
print('Authenticated')
```

## Run BigQuery query

```jupyterpython
%%bigquery --project foo df
SELECT * from UNNEST(['bar']) as bar
```
