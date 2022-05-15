#!/usr/bin/env bash

mkfifo /tmp/video.h264
mkfifo /tmp/video.ts

raspivid -t 0 -a 4 -a "%Y-%m-%d %X" -w 1280 -h 720 -fps 4 -b 500000 -o /tmp/video.h264 &
ffmpeg -y -framerate 4 -i /tmp/video.h264 -f alsa -channels 1 -sample_rate 44100 -i hw:2,0 -c:v copy -c:a aac -ac 1 -b:a 32k -f mpegts /tmp/video.ts &
cvlc stream:///tmp/video.ts --sout '#standard{access=http,mux=ts,dst=:8080}' --sout-http-user pi --sout-http-pwd cam
