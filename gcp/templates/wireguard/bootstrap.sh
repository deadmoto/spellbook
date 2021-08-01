#! /bin/bash

gcloud compute firewall-rules create allow-wireguard \
  --direction ingress \
  --action allow \
  --target-tags wireguard \
  --source-ranges 0.0.0.0/0 \
  --rules UDP:51820
