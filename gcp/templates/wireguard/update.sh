#!/usr/bin/env sh

PROJECT=foo
ZONE=us-east1-d
VM_NAME=bar
FILE_PATH=startup-script=wireguard.sh

gcloud compute instances add-metadata ${VM_NAME} \
  --metadata-from-file $FILE_PATH \
  --zone ${ZONE} \
  --project ${PROJECT}

gcloud compute instances reset ${VM_NAME} \
  --zone ${ZONE} \
  --project ${PROJECT}
