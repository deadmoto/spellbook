# gsutil

## GCS

### Create bucket
`gsutil mb gs://sc-amigo-friend-stories-multiday-engagement`

### List files
`gsutil ls -l gs://amigo-engagement-data/hourly/2019/01/01/00/friend-*.avro`

### Count files
`gsutil ls -l gs://amigo-engagement-data/hourly/2019/01/01/00/friend-*.avro | wc`

### Disk usage summary
`gsutil du -s gs://example`

### Download files
`gsutil cp gs://amigo-engagement-data/hourly/2019/01/01/00/friend-00033-of-00345.avro .`

### Upload files
`gsutil cp *.jar gs://sc-amigo-dataflow-jars`
