FROM balenalib/raspberry-pi-debian:bullseye

RUN curl https://www.linux-projects.org/listing/uv4l_repo/lpkey.asc | apt-key add - \
    && echo "deb https://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main" | tee /etc/apt/sources.list.d/uv4l.list

RUN apt-get update \
    && apt-get install -y libasound2 \
                          uv4l \
                          uv4l-server \
                          uv4l-webrtc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD /usr/bin/uv4l --external-driver --device-name=video0