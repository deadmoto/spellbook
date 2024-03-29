# Raspberry Pi

https://www.raspberrypi.com/documentation/accessories/camera.html#v4l2-drivers

## System Info

### CPU temperature

`vcgencmd measure_temp`

### CPU throttling

`vcgencmd get_throttled`

### Camera

`vcgencmd get_camera`

## libcamera

> NOTE: use LIBCAMERA_LOG_LEVELS=*:0 for verbose output

### Test camera

`libcamera-hello -v -n` or `libcamera-hello --verbose --nopreview`

### List cameras

`libcamera-hello --list-cameras`

### Record video

`libcamera-vid -o movie.h264`

### Stream video

`libcamera-vid --timeout 0 --width 640 --height 480 --framerate 3 --codec libav --libav-format mpegts --libav-audio --audio-samplerate 44100 --audio-bitrate 16384 --listen --output "tcp://0.0.0.0:1234?listen=1"`

## GPIO

`raspi-gpio get`

## raspistill

> NOTE: add `--verbose` for more details

### Capture image

`raspistill -o image.jpg -w 640 -h 480`

## raspivid

### Save timestamped local video

`raspivid --timeout 30000 --annotate 4 --annotate "%Y-%m-%d %X" -o video.h264`

### Stream to standard output

`raspivid -w 640 -h 480 -fps 30 -b 2000000 -o -`

### Stream to HTTP

`raspivid -t 0 -w 1280 -h 720 -fps 30 -a 12 -l -ih -o tcp://0.0.0.0:3333`

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
