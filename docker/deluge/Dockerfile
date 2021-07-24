FROM alpine:edge

RUN \
  echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk update && \
  apk add --upgrade apk-tools && \
  apk add bash py-pip deluge@testing && \
  rm -rf /var/cache/apk/*

CMD /usr/bin/deluged & /usr/bin/deluge-web & /bin/bash
