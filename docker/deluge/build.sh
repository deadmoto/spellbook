#!/usr/bin/env sh

docker build --tag deluge .
docker run -it \
           -v /Users/dberezhnoy/Downloads/:/root/Downloads/:cached \
           --expose=6881-6891 \
           -p 127.0.0.1:8112:8112 \
           --name deluge-$(date +%Y%m%d%H%M%S) \
           --restart always \
           deluge
