FROM alpine:edge

RUN \
  apk update && \
  apk add --upgrade apk-tools && \
  apk add samba && \
  rm -rf /var/cache/apk/*

RUN addgroup --gid 1000 samba
RUN adduser --uid 1000 --ingroup samba --disabled-password samba

ADD etc/ /etc/

CMD smbd && tail -f /var/log/samba/log.smbd
