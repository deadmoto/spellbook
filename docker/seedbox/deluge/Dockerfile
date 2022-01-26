FROM alpine:edge

RUN \
  echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk update && \
  apk add --upgrade apk-tools && \
  apk add bash py-pip deluge@testing && \
  rm -rf /var/cache/apk/*

RUN \
  deluged && \
  deluge-console plugin --enable Label AutoAdd && \
  deluge-console halt && \
  rm -rf /root/.config/deluge

ADD root/.config/deluge/core.conf /root/.config/deluge/core.conf

CMD /usr/bin/deluged && /usr/bin/deluge-web --do-not-daemonize
