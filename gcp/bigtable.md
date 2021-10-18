# BigTable

## Install cbt

`gcloud components install cbt`

## Instances

### List

`cbt -project foo listinstances`

### Create

```bash
gcloud bigtable instances create test-instance \
    --project=foo \
    --cluster=bar \
    --cluster-zone=us-central1-c \
    --display-name=test \
    --cluster-storage-type=hdd \
    --instance-type=DEVELOPMENT
```

### Delete instance

`cbt deleteinstance test-instance`

## Config

```bash
echo -e "project = [PROJECT_ID]" > ~/.cbtrc
echo -e "instance = [INSTANCE_ID]" >> ~/.cbtrc
```

## Tables

### List tables

`cbt -project foo -instance bar ls`

### Create table

`cbt -project foo -instance bar createtable my_table`

### Delete table

`cbt -project foo -instance bar deletetable my_table`

### Create family

`cbt -project foo -instance bar createfamily my_table my_family`

### Set GC policy

`cbt -project foo -instance bar setgcpolicy my_table my_family maxversions=100`

### Delete family

`cbt -project foo -instance bar deletefamily my_table my_family`

### Delete row

`cbt -project foo -instance bar deleterow my_table my_row`
