# Google Cloud Platform

## Configure

### Init

`gcloud init`

### Install components

`gcloud components install docker-credential-gcr`

### Authenticate

```
gcloud auth login
gcloud auth application-default login
gcloud auth configure-docker
```

### Show config

`gcloud config list`

### Select project

`gcloud config set project foo`

### Get default project

`export PROJECT_ID=$(gcloud config get-value project)`

### Get default project number

`export PROJECT_NUMBER=$(gcloud projects list --filter="$PROJECT_ID" --format="value(PROJECT_NUMBER)")`

### Transfer SSH keys

`gcloud compute os-login ssh-keys add --key-file ~/.ssh/google_compute_engine.pub`

### Disable prompts

`gcloud config set disable_prompts true`  
or  
`export CLOUDSDK_CORE_DISABLE_PROMPTS=0`

## Service accounts

### Create

```bash
gcloud iam service-accounts create jenkins-master \
    --description="Jenkins master" \
    --display-name="Jenkins master"
```

### Create key

```bash
gcloud iam service-accounts keys create $GOOGLE_APPLICATION_CREDENTIALS \
  --iam-account foo@bar.iam.gserviceaccount.com
```

### Authenticate

`gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS`

## App Engine

### List versions

`gcloud app versions list --project bar`

### Delete version

`gcloud app versions delete foo --project bar`

## Compute Engine

### Supported images

`gcloud compute images list`

### Create VM

```shell
gcloud compute instances create foo \
    --project bar \
    --zone us-central1-a \
    --machine-type f1-micro \
    --image-family debian-10 \
    --image-project debian-cloud
```

## Kubernetes

### List clusters

`gcloud container clusters list --project foo --zone us-central1-c`

## Containers

### List images

`gcloud container images list --repository=gcr.io/foo --filter="bar"`

### List tags

`gcloud container images list-tags gcr.io/foo/bar`

## DataFlow

### List

`gcloud dataflow jobs list --filter foo --limit 42`
