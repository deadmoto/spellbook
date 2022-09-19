FROM alpine:3.16.2

RUN \
  apk update && \
  apk add --upgrade apk-tools && \
  apk add procps && \
  rm -rf /var/cache/apk/*

ADD crontab /etc/crontabs/root
ADD scrape_proc.sh /usr/local/sbin/scrape_proc.sh
RUN \
  chmod 0644 /etc/crontabs/root && \
  chmod 0755 /usr/local/sbin/scrape_proc.sh

CMD /usr/sbin/crond -f
#CMD /usr/sbin/crond -f -l 8 -L /var/log/crond.log
