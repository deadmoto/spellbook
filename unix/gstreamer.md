# GStreamer

## Encoders

### Test x264enc

`gst-launch-1.0 videotestsrc ! x264enc ! fakesink`

### Test v4l2h264enc

`gst-launch-1.0 videotestsrc ! v4l2h264enc ! 'video/x-h264,level=(string)4.2' ! fakesink`