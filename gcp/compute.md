# Compute Engine

## Supported images

`gcloud compute images list`

## Create VM

```shell
gcloud compute instances create foo \
    --project bar \
    --zone us-central1-a \
    --machine-type f1-micro \
    --image-family debian-10 \
    --image-project debian-cloud
```

## Internal DNS

```shell
curl "http://metadata.google.internal/computeMetadata/v1/instance/hostname" \
    -H "Metadata-Flavor: Google"
```
> NOTE: Run this inside VM