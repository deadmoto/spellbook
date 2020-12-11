# date

## Timestamp in seconds since Unix epoch

`date +%s`

## Timestamp with delta

`date -v-1M +%s`

## Parse date

`date -jf '%Y-%m-%d %H:%M:%S' '2000-01-01 00:00:00'`

## Adjust date

`date -r 1234567890 -v+1S`
