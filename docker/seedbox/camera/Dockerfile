FROM balenalib/raspberry-pi-debian:bookworm

RUN apt-get update \
    && apt-get install -y alsa-utils ffmpeg vlc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN addgroup --gid 1000 vlc \
    && useradd --uid 1000 --gid vlc --no-create-home vlc \
    && adduser vlc audio \
    && adduser vlc video

USER vlc

ENV TZ="America/Los_Angeles"

ADD cmd.sh /cmd.sh

CMD /bin/bash -e /cmd.sh
