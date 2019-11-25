# Google Cloud Platform

## Configure

### Init
`gcloud init`

### Authenticate
`gcloud auth application-default login`

### Select project
`gcloud config set project sc-amigo`

### Transfer SSH keys
`gcloud compute os-login ssh-keys add --key-file ~/.ssh/google_compute_engine.pub`

### Disable prompts
`gcloud config set disable_prompts true`  
or  
`export CLOUDSDK_CORE_DISABLE_PROMPTS=0`
