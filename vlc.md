# VLC

## V4L2 stream

### HTTP stream

`cvlc v4l2:///dev/video0 --sout '#transcode{vcodec=copy,acodec=none}:http{mux=ts,dst=:8080}'`

### RTSP stream

`cvlc v4l2:///dev/video0 --sout '#transcode{vcodec=mjpg,vb=800,acodec=none}:rtp{sdp=rtsp://:8554/}'`
