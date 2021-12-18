#!/usr/bin/env sh

TIMESTAMP=$(date +%Y%m%d%H%M%S)

docker build --tag wireguard .
docker run -it \
  --privileged \
  --name "wireguard-$TIMESTAMP" \
  --restart always \
  wireguard
