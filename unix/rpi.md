# Raspberry Pi

## System Info

### CPU temperature

`vcgencmd measure_temp`

### CPU throttling

`vcgencmd get_throttled`

### Camera

`vcgencmd get_camera`

## GPIO

`raspi-gpio get`

## raspistill

### Capture image

`raspistill -o image.jpg -w 640 -h 480`

## raspivid

> NOTE: add `--verbose` for more details

### Save timestamped local video

`raspivid --timeout 30000 --annotate 4 --annotate "%Y-%m-%d %X" -o video.h264`

### Stream to standard output

`raspivid -w 640 -h 480 -fps 30 -b 2000000 -o -`

### Stream to HTTP

`raspivid -t 0 -w 1280 -h 720 -fps 30 -a 12 -l -ih -o tcp://0.0.0.0:3333`

## V4L2

### All info

`v4l2-ctl --all`

### Driver info

`v4l2-ctl -D` or `v4l2-ctl --info`

### Devices

`v4l2-ctl --list-devices`

### Device settings

`v4l2-ctl --list-ctrls --device /dev/video0`

## UV4L

### Install

`sudo apt-get install uv4l uv4l-raspicam uv4l-raspicam-extras uv4l-server uv4l-webrtc`

### Create device

`uv4l --driver raspicam` or `uv4l --external-driver --device-name=video0`

### qv4l2

`qv4l2`
> NOTE: to load kernel module run `modprobe bcm2835-qv4l2` 

## VLC

> NOTE: add `-vvv` for verbosity

### HTTP stream

`raspivid -t 3600000 -w 640 -h 480 -fps 30 -b 2000000 -o - | cvlc stream:///dev/stdin :demux=h264 --sout '#standard{access=http,mux=ts,dst=:8080}'`
