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

CMD raspivid -t 0 -a 4 -a "%Y-%m-%d %X" -w 1280 -h 720 -fps 30 -b 2000000 -o - | ffmpeg -i pipe:0 -f alsa -channels 1 -sample_rate 44100 -i hw:2,0 -c:v copy -c:a aac -ac 1 -b:a 32k -f mpegts pipe:1 | cvlc stream:///dev/stdin --sout '#standard{access=http,mux=ts,dst=:8080}' --sout-http-user pi --sout-http-pwd cam
