# gsutil

## GCS

### Create bucket

`gsutil mb gs://foo`

### List files

`gsutil ls -l gs://foo/*.txt`

### Count files

`gsutil ls -l gs://foo/*.txt | wc`

### Disk usage summary

`gsutil du -s gs://example`

### Download files

`gsutil cp -q gs://foo/bar.txt .`

### Upload files

`gsutil cp -q foo.jar gs://bar`
