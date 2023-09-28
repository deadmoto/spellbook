# kubectl

## Authentication
`gcloud container clusters get-credentials foo --zone us-central1-c --project bar`

## Deployment

### Status
`kubectl rollout status deployment/foo`

### History
`kubectl rollout history deployment/foo`

### Get config
`kubectl get deploy foo -o yaml`

### Apply config
`kubectl apply -f /tmp/ansible/k8s/foo.yml`

`kubectl get pods`

`kubectl describe pod foo`

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
