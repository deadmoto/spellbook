# kubectl

## Authentication
`gcloud container clusters get-credentials userprofile-mesh-dev --zone us-central1-c --project context-pii`

## Deployment

### Get config
`kubectl get deploy userprofile-indexer -o yaml`

### Apply config
`kubectl apply -f /tmp/ansible/k8s/userprofile.yml`

`kubectl get pods`

`kubectl describe pod userprofile-indexer-7cbddd9fd8-9xfpb`

### Get nodes

`kubectl get nodes`

### Get pods

`kubectl get pods`

### Get pods for namespace
`kubectl get pods -n default`

## Forward port
`kubectl port-forward pod 8080:8080`

## Cronjob

### List cronjobs

`kubectl get cronjobs -A`

### Patch cronjob

`kubectl patch cronjobs <job-name> -p '{ "spec": { "suspend": true } }'`
