#!/usr/bin/env bash

VIDEO_FIFO=$(mktemp)
rm -rf $VIDEO_FIFO
mkfifo $VIDEO_FIFO

echo "Starting streaming..." & \
ffmpeg -f v4l2 -framerate 30 -video_size 1280x720 -input_format h264 -i /dev/video0 \
       -f alsa -channels 1 -sample_rate 44100 -itsoffset 1 -thread_queue_size 1024 -i hw:2,0 \
       -c:v copy \
       -c:a aac -ac 1 -b:a 32k \
       -f mpegts -y $VIDEO_FIFO &
cvlc stream://$VIDEO_FIFO --sout '#standard{access=http,mux=ts,dst=:8080}' --sout-http-user pi --sout-http-pwd cam
