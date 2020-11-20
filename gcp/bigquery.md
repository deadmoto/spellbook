# BigQuery

## List datasets

`bq --project_id foo ls`

## List tables

`bq --project_id foo ls bar`

## Delete tables

`bq --project_id foo rm -f -t bar.table`

## If

`SELECT CASE WHEN 'foo' = 'bar' THEN 1 ELSE 0 END`

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

## Date and time

### Timestamp to date and time

`EXTRACT(DATETIME FROM ts AT TIME ZONE America/Los_Angeles)`

### Round datetime to hours

`DATETIME_TRUNC(foo, HOUR)`
