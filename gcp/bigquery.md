# BigQuery

## bq

### List datasets

`bq --project_id foo ls`

### List tables

`bq --project_id foo ls --max_results=1000 bar`

### Update tables

`bq update --expiration 0 foo.bar.table`

### Delete tables

`bq --project_id foo rm -f -t bar.table`

## Schema

### List tables

```bigquery
SELECT *
FROM `foo.bar.INFORMATION_SCHEMA.TABLES`
WHERE table_name LIKE "%foo%";
```
or
```bigquery
SELECT *
FROM `foo.bar.INFORMATION_SCHEMA.TABLES`
WHERE table_name LIKE "%foo%"
ORDER BY creation_time DESC
```

## SELECT

### WITH

```bigquery
WITH foobar AS (
    SELECT 'foo' AS foo, 'bar' AS bar
)
SELECT foo, bar
FROM foobar
```

### UNNEST
```bigquery
SELECT *
FROM foo
CROSS JOIN UNNEST(bar) WITH OFFSET AS pos
```

### CASE

`SELECT (CASE WHEN 'foo' = 'bar' THEN 1 ELSE 0 END) as foo_bar`

### SPLIT

`SELECT SPLIT(foo, '#')[ORDINAL(2)] as foo_right`

### PERCENTILE_CONT

```bigquery
#standardSQL
SELECT PERCENTILE_CONT(x, 0.5) OVER() AS median
FROM UNNEST ([0, 1, 2, 3]) AS x
```

### ROW_NUMBER

```bigquery
SELECT foo, bar, ROW_NUMBER() OVER (
PARTITION BY foo
ORDER BY bar
) AS row_number
FROM foo_bar
```

## CREATE

```bigquery
CREATE OR REPLACE TABLE `foo.bar.new` AS
SELECT *
FROM `foo.bar.old`;
```

### With description

```bigquery
CREATE TABLE ...
OPTIONS(description="This could be your ad")
```

### With TTL

```bigquery
CREATE TABLE ...
OPTIONS (expiration_timestamp=TIMESTAMP(DATE_ADD(CURRENT_DATE(), INTERVAL 1 DAY)))
```

### With partition

```bigquery
CREATE TABLE ...
PARTITION BY DATE(date_yyyymmdd)
OPTIONS(require_partition_filter=true)
```

### Function

```bigquery
CREATE TEMPORARY FUNCTION FOO(bar INTEGER)
  RETURNS INTEGER
  AS (IF(bar == 42, 1, 0));
```

## Date and time

### Subtract interval

```bigquery
DECLARE min_table_suffix DEFAULT FORMAT_DATE("%Y%m%d", DATE_SUB(CURRENT_DATE(), INTERVAL 14 DAY));
```

### Timestamp to date and time

`EXTRACT(DATETIME FROM ts AT TIME ZONE America/Los_Angeles)`

### Round datetime to hours

`DATETIME_TRUNC(foo, HOUR)`

## ML

### Logistic Regression

```bigquery
CREATE OR REPLACE MODEL `project.dataset.model`
OPTIONS(model_type='LOGISTIC_REG', auto_class_weights=TRUE, input_label_cols=['label']) AS
SELECT foo, bar FROM `project.dataset.train`
```

### Model Weights

```bigquery
#standardSQL
SELECT * FROM ML.WEIGHTS(MODEL `project.dataset.model`)
```
