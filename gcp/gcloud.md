# Google Cloud Platform

## Configure

### Init

`gcloud init`

### Install components
```
gcloud components install docker-credential-gcr
```

### Authenticate

```
gcloud auth login
gcloud auth application-default login
gcloud auth configure-docker
```

### Select project

`gcloud config set project foo`

### Transfer SSH keys

`gcloud compute os-login ssh-keys add --key-file ~/.ssh/google_compute_engine.pub`

### Disable prompts

`gcloud config set disable_prompts true`  
or  
`export CLOUDSDK_CORE_DISABLE_PROMPTS=0`

## Containers

### List images

`gcloud container images list --repository=gcr.io/foo --filter="bar"`

### List tags

`gcloud container images list-tags gcr.io/foo/bar`