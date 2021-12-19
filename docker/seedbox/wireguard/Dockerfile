FROM alpine:edge

RUN \
  apk update && \
  apk add --upgrade apk-tools && \
  apk add bash wireguard-tools && \
  rm -rf /var/cache/apk/*

ADD etc/ /etc/

RUN chmod +x /etc/wireguard/wireguard.sh

CMD /etc/wireguard/wireguard.sh
