FROM alpine:edge

# install packages
RUN \
  echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk update && \
  apk add --upgrade apk-tools && \
  apk add bash py-pip deluge@testing && \
  rm -rf /var/cache/apk/*

# create user
ENV DELUGE_HOME /home/deluge
RUN mkdir $DELUGE_HOME \
    && chown 1000:1000 $DELUGE_HOME \
    && addgroup --gid 1000 deluge \
    && adduser --home $DELUGE_HOME --uid 1000 --ingroup deluge --disabled-password deluge
USER deluge

# install plugins
RUN \
  deluged && \
  deluge-console plugin --enable Label AutoAdd && \
  deluge-console halt && \
  rm -rf $DELUGE_HOME/.config/deluge

ADD core.conf $DELUGE_HOME/.config/deluge/core.conf

CMD /usr/bin/deluged && /usr/bin/deluge-web --do-not-daemonize
