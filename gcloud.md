# Google Cloud Platform

## Configure

### Init
`gcloud init`

### Authenticate
`gcloud auth application-default login`

### Select project
`gcloud config set project sc-amigo`

### Disable prompts
`gcloud config set disable_prompts true`  
or  
`export CLOUDSDK_CORE_DISABLE_PROMPTS=0`

## GCS

### Create bucket
`gsutil mb gs://sc-amigo-friend-stories-multiday-engagement`

### List files
`gsutil ls -l gs://amigo-engagement-data/hourly/2019/01/01/00/friend-*.avro`

### Download files
`gsutil cp gs://amigo-engagement-data/hourly/2019/01/01/00/friend-00033-of-00345.avro .`

### Upload files
`gsutil cp *.jar gs://sc-amigo-dataflow-jars`
