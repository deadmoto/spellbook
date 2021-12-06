# Docker

## Cleanup

`docker system prune`

## Images

### Pull image

`docker pull jupyter/tensorflow-notebook`
or
`docker pull ubuntu`

### Extract image

`docker save ubuntu:latest | tar zxf -`

### List images

`docker images`

## Build

### Build from Dockerfile

`docker build --tag foo .` or `docker build -t foo .`

### Build from custom Dockerfile

`docker build --file Dockerfile.foo --tag foo .` or `docker build -f Dockerfile.foo -t foo .`

## Release

### Tag image

`docker tag foo:latest bar.dkr.ecr.us-west-2.amasonaws.com/foo:latest`

### Push image

`docker push bar.dkr.ecr.us-west-2.amasonaws.com/foo:latest`

## Containers

### Run

#### Specific image version

`docker run alpine:edge`

#### Named container

`docker run --name ubuntu ubuntu`

#### Cached volume (macOS only)

`docker run -v /opt:/opt:cached ubuntu`

#### Expose ports

`docker run --expose=6881-6891 ubuntu`

#### Publish ports

`docker run -p 127.0.0.1:8112:8112 ubuntu`

### Start container

`docker start -a jupyter`
or
`docker start -a ubuntu`

### Start container in background

`docker exec -d foo echo bar`

### Start container on daemon start

`docker update --restart unless-stopped deluge`

### Stop container

`docker stop jupyter`
or
`docker stop ubuntu`

### List available containers
`docker container ls`

### List running/stopped containers

`docker ps -a `

### Start a new terminal in a container

`docker exec -it builder bash`
or
`docker exec -i f908f2037a91 /bin/bash`

### Save container state

`docker commit jupyter jupyter-v1`

### Remove unused containers

`docker container prune` or `docker container prune -a`

## Docker Compose

docker-compose build

### Run container
`docker-compose up --name debian`

docker-compose build && docker-compose up

## Popular images

### Debian
`docker run -it --entrypoint=/bin/bash -v ~/Snapchat/Dev:/home/jenkins/ --name builder builder`

### Ubuntu

`docker run -it --entrypoint=/bin/bash -v $HOME:/root:cached --name ubuntu ubuntu`  

### Jupyter

`docker run -p 8888:8888 -v ~:/home/jovyan:cached --name jupyter jupyter/tensorflow-notebook`
or
`docker run -it -p 127.0.0.1:7007:7007 -p 127.0.0.1:8080:8080 --name coursera-aml-1 zimovnov/coursera-aml-docker`
or
`docker run -it -p 127.0.0.1:7007:7007 -p 127.0.0.1:8080:8080 --name coursera-aml-snap-1 coursera-aml-snap-1`

## Dockerfile

### apt-get

```shell script
RUN apt-get update \
 && apt-get install -y \
            apt-get \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
```
