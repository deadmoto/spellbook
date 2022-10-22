# gRPC

## Idle Timeout

By default channels do not shutdown underlying connections.
To shut down unused connections, specify `idleTimeout()`.

```Java
Channel channel = NettyChannelBuilder.forAddress("localhost", 9000)
    .idleTimeout(500, TimeUnit.MILLISECONDS)
    .build();
```

## Threading Model

Interceptors execute on the application's threads. That is the calling thread for sends and the `withExecutor()` thread for receives.

Only I/O happens on the event loop. Call `NettyChannelBuilder.eventLoopGroup()` to specify Netty event loop.
