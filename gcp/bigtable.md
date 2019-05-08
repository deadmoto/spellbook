# BigTable

## Install cbt

`gcloud components install cbt`

## Instances

### Create instance

```bash
gcloud bigtable instances create friends-engagement-test \
    --project=devsnapchat \
    --cluster=friends-engagement-test \
    --cluster-zone=us-central1-c \
    --display-name=friends-engagement-test \
    --cluster-storage-type=hdd \
    --instance-type=DEVELOPMENT
```

### Delete instance

`cbt deleteinstance friends-engagement-test`

## Config
```bash
echo -e "project = [PROJECT_ID]" > ~/.cbtrc
echo -e "instance = [INSTANCE_ID]" >> ~/.cbtrc
```

## Tables

### List tables
`cbt ls`

### Create table
`cbt -project dev -instance test createtable example`

### Create family
`cbt -project dev -instance test createfamily example family`

### Delete table
`cbt -project dev -instance test deletetable example`

### Delete family
`cbt -project dev -instance test deletefamily example family`
