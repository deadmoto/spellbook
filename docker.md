# Docker

## Images

### Pull image
`docker pull jupyter/tensorflow-notebook`  
`docker pull ubuntu`

### List images

`docker images`

## Containers

### Run container
`docker run --name ubuntu ubuntu`

### Run container with cached volume (macOS only)
`docker run -v /opt:/opt:cached ubuntu`

### Run container with specific image version
`docker run --name jupyter jupyter/tensorflow-notebook:4d19a9839c05`

## Start container
`docker start -a jupyter`  
`docker start -a ubuntu`

## Stop container
`docker stop jupyter`  
`docker stop ubuntu`

## List available containers
`docker container ls`

### List running/stopped containers

`docker ps -a `

### Start container in background

`docker exec -d foo echo bar`

#### Start a new terminal in a container
`docker exec -it builder bash`  
or  
`docker exec -i f908f2037a91 /bin/bash`

## Save container state
`docker commit jupyter jupyter-v1`

## Remove unused containers
`docker container prune`

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

## Docker Compose

docker-compose build

### Run container
`docker-compose up --name debian`

docker-compose build && docker-compose up

## Popular images

### Debian
`docker run -it --entrypoint=/bin/bash -v ~/Snapchat/Dev:/home/jenkins/ --name builder builder`

### Ubuntu
`docker run -it --entrypoint=/bin/bash -v ~/Snapchat/Dev:/home --name ubuntu ubuntu`  

### Jupyter

`docker run -p 8888:8888 -v ~:/home/jovyan:cached --name jupyter jupyter/tensorflow-notebook`
or
`docker run -it -p 127.0.0.1:7007:7007 -p 127.0.0.1:8080:8080 --name coursera-aml-1 zimovnov/coursera-aml-docker`
or
`docker run -it -p 127.0.0.1:7007:7007 -p 127.0.0.1:8080:8080 --name coursera-aml-snap-1 coursera-aml-snap-1`
