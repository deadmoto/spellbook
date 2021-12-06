 #!/usr/bin/env sh

TIMESTAMP=$(date +%Y%m%d%H%M%S)

docker build --tag deluge .
docker run -it \
           -v /Users/dberezhnoy/Downloads/:/root/Downloads/:cached \
           -p 0.0.0.0:6891:6891 \
           -p 127.0.0.1:8112:8112 \
           --name deluge-$TIMESTAMP \
           --restart always \
           deluge
