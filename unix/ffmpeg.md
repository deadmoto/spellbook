# ffmpeg

## Convert
> NOTE: -y overwrites output file if exists

### Copy MP4 to MKV

`ffmpeg -y -i input.mp4 -c:a copy -c:v copy -c:s srt -map 0 -map_metadata 0 output.mkv`

### Export frames

`ffmpeg -i input.mp4 -r 10 frame%04d.png`

## Limit frame rate

`ffmpeg -y -framerate 4 -i video.h264 -c:v copy -f mpegts video.ts`

## Record ALSA audio

`ffmpeg -y -f alsa -channels 1 -sample_rate 44100 -i hw:0,0 -c:a aac -ac 1 -b:a 32k audio.wav`

## Package raw video

`ffmpeg -y -i video.h264 -c:v copy -f mpegts video.ts`

## V4L2

### List V4L2 devices

`ffmpeg -f v4l2 -i list`

### List V4L2 supported formats

`ffmpeg -f v4l2 -list_formats all -i /dev/video0`

## Info

### List supported encoders

`ffmpeg -h encoder=h264`

## Pixel formats

`ffmpeg -pix_fmts`
