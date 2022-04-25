FROM balenalib/raspberry-pi-debian:bullseye

RUN curl https://www.linux-projects.org/listing/uv4l_repo/lpkey.asc | apt-key add - \
    && echo "deb https://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main" | tee /etc/apt/sources.list.d/uv4l.list

RUN apt-get update \
    && apt-get install -y vlc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN addgroup --gid 1000 vlc \
    && useradd --uid 1000 --gid vlc --no-create-home vlc \
    && adduser vlc video

USER vlc

CMD raspivid -t 0 -a 4 -a "%Y-%m-%d %X" -w 640 -h 480 -fps 30 -b 2000000 -o - | cvlc stream:///dev/stdin :demux=h264 --sout '#standard{access=http,mux=ts,dst=:8080}' --sout-http-user pi --sout-http-pwd cam
