# gRPC

## Threading Model

Interceptors execute on the application's threads. That is the calling thread for sends and the `withExecutor()` thread for receives.
Only I/O happens on the event loop. Call `NettyChannelBuilder.eventLoopGroup()` to specify event loop for channels and `.{worker/boss}EventLoopGroup()` for servers.

## Idle Timeout

By default channels never shut down underlying connections.
To shut down unused connections, specify `idleTimeout()`.

```Java
Channel channel = NettyChannelBuilder.forAddress("localhost", 9000)
    .idleTimeout(500, TimeUnit.MILLISECONDS)
    .build();
```

## Gotchas

Unary RPCs don’t have flow control.
If unary RPCs are generated at a higher rate than they can be processed, these RPCs will buffer and result result in increased memory usage.

Override the default executor for both channels and servers using .executor().
By default a static shared executor (CachedThreadPool) is used.
It will create new threads instead of queueing up requests.
The same shared executor is used for DNS and load balancing.

Interceptors are great for testing distributed systems.
Specifying the interceptor as you build the channel is better than using ClientInterceptors.intercept() as the latter creates another channel.

You can specify Netty-channel options at creation time using NettyChannelBuilder.withOption().
This allows you to set properties of the underlying channel like SO_REUSEADDR, SO_SNDBUF and SO_RCVBUF.
