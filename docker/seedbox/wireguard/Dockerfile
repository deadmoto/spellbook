FROM alpine:edge

RUN \
  apk update && \
  apk add --upgrade apk-tools && \
  apk add bash wireguard-tools ulogd && \
  rm -rf /var/cache/apk/*

ADD etc/ /etc/

RUN chmod 400 /etc/wireguard/wg0.conf
RUN chmod 700 /etc/wireguard/wireguard.sh

CMD /etc/wireguard/wireguard.sh
