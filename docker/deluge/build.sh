#!/usr/bin/env sh

docker build --tag deluge .
docker stop deluge
docker rm deluge
docker run -it \
           -v /Users/dberezhnoy/Downloads/:/root/Downloads/:cached \
           -p 127.0.0.1:6881:6881 \
           -p 127.0.0.1:8112:8112 \
           --name deluge \
           --restart always \
           deluge
