# Docker

## Images

### Pull image
`docker pull jupyter/tensorflow-notebook`  
`docker pull ubuntu`

### List images
`docker image ls`

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

## List running containers
`docker ps`

#### Start a new terminal in a container
`docker exec -it builder bash`  
or  
`docker exec -i f908f2037a91 /bin/bash`

## Save container state
`docker commit jupyter jupyter-v1`

## Remove unused containers
`docker container prune`

## Build

### Build from custom Dockerfile
`docker build -f builder.dockerfile -t builder .`

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

`docker run -it -p 127.0.0.1:7007:7007 -p 127.0.0.1:8080:8080 --name coursera-aml-1 zimovnov/coursera-aml-docker`

`docker run -it -p 127.0.0.1:7007:7007 -p 127.0.0.1:8080:8080 --name coursera-aml-snap-1 coursera-aml-snap-1`
