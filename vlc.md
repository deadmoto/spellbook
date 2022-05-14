# VLC

## HTTP stream

`cvlc v4l2:///dev/video0 --sout '#transcode{vcodec=copy,acodec=none}:http{mux=ts,dst=:8080}'`

## RTSP stream

`cvlc v4l2:///dev/video0 --sout '#transcode{vcodec=mjpg,vb=800,acodec=none}:rtp{sdp=rtsp://:8554/}'`

## Resize video

`cvlc v4l2:///dev/video0 --sout "#transcode{vcodec=mp2v,vb=800,width=360,heigh=288}:http{mux=ts,dst=:8080}" --no-sout-audio`
