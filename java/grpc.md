# gRPC

## Idle Timeout

By default channels do not shutdown underlying connections.
To shut down unused connections, specify `idleTimeout()`.

```Java
Channel channel = NettyChannelBuilder.forAddress("localhost", 9000)
    .idleTimeout(500, TimeUnit.MILLISECONDS)
    .build();
```
