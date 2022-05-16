#!/usr/bin/env bash

mkfifo /tmp/video.ts

ffmpeg -f v4l2 -framerate 4 -video_size 1280x720 -input_format h264 -i /dev/video0 \
       -f alsa -channels 1 -sample_rate 44100 -itsoffset 1 -thread_queue_size 1024 -i hw:2,0 \
       -c:v copy \
       -c:a aac -ac 1 -b:a 32k \
       -f mpegts -y /tmp/video.ts &
cvlc stream:///tmp/video.ts --sout '#standard{access=http,mux=ts,dst=:8080}' --sout-http-user pi --sout-http-pwd cam
