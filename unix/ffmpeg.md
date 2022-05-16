# ffmpeg

## Record ALSA audio

`ffmpeg -f alsa -channels 1 -sample_rate 44100 -i hw:0,0 audio.wav`

## Package raw video

`ffmpeg -i video.h264 -c:v copy -f mpegts video.ts`
