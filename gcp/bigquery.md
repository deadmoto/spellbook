# BigQuery

## If

`SELECT CASE WHEN 'foo' = 'bar' THEN 1 ELSE 0`

## Percentile

```sql
#standardSQL
SELECT PERCENTILE_CONT(x, 0.5) OVER() AS median FROM UNNEST ([0, 1, 2, 3]) AS x;
```

## Logistic Regression

```sql
CREATE OR REPLACE MODEL `project.dataset.model`
OPTIONS(model_type='LOGISTIC_REG', auto_class_weights=TRUE, input_label_cols=['label']) AS
SELECT foo, bar FROM `project.dataset.train`
```

## Model Weights

```sql
#standardSQL
SELECT * FROM ML.WEIGHTS(MODEL `project.dataset.model`)
```
