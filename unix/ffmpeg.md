# ffmpeg

## Limit frame rate

`ffmpeg -y -framerate 4 -i video.h264 -c:v copy -f mpegts video.ts`

## Record ALSA audio

`ffmpeg -f alsa -channels 1 -sample_rate 44100 -i hw:0,0 -c:a aac -ac 1 -b:a 32k audio.wav`

## Package raw video

`ffmpeg -i video.h264 -c:v copy -f mpegts video.ts`

## List V4L2 supported formats

`ffmpeg -f v4l2 -list_formats all -i /dev/video0`
