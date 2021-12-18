FROM alpine:edge

RUN \
  apk update && \
  apk add --upgrade apk-tools && \
  apk add bash wireguard-tools && \
  rm -rf /var/cache/apk/*

COPY etc/wireguard/wg0.conf /etc/wireguard/wg0.conf

CMD wg-quick up wg0 && tail -f /dev/null
