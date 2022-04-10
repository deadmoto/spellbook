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

## Camera

### Image

`raspistill -o image.jpg -w 640 -h 480`

### Video

`raspivid -t 0 -l -o tcp://0.0.0.0:3333`

## V4L2

### Devices

`v4l2-ctl --list-devices`

## UV4L

### Install

`sudo apt-get install uv4l uv4l-raspicam uv4l-raspicam-extras uv4l-server uv4l-webrtc`

### Create device

`uv4l --driver raspicam`

### qv4l2

`qv4l2`
> NOTE: to load kernel module run `modprobe bcm2835-qv4l2` 
