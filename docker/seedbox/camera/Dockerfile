FROM balenalib/raspberry-pi-debian:bookworm

RUN apt-get update \
    && apt-get install -y alsa-utils pulseaudio vlc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN addgroup --gid 1000 vlc \
    && useradd --uid 1000 --gid vlc --no-create-home vlc \
    && adduser vlc audio \
    && adduser vlc video

USER vlc

ENV TZ="America/Los_Angeles"

CMD raspivid -t 0 -a 4 -a "%Y-%m-%d %X" -w 640 -h 480 -fps 30 -b 2000000 -o - | cvlc stream:///dev/stdin :demux=h264 --sout '#standard{access=http,mux=ts,dst=:8080}' --sout-http-user pi --sout-http-pwd cam
