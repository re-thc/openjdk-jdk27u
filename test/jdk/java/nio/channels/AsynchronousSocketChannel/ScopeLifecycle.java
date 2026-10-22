/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

/*
 * @test
 * @summary Terminal Unix asynchronous socket operations release buffers and sessions
 * @requires (os.family != "windows")
 * @modules java.base/sun.nio.ch:open
 * @run main/othervm -Dsun.nio.ch.disableSynchronousRead=true ScopeLifecycle
 */

import java.io.IOException;
import java.lang.foreign.Arena;
import java.lang.reflect.Field;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.StandardSocketOptions;
import java.nio.ByteBuffer;
import java.nio.channels.AsynchronousSocketChannel;
import java.nio.channels.AsynchronousChannelGroup;
import java.nio.channels.CompletionHandler;
import java.nio.channels.InterruptedByTimeoutException;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicInteger;

public class ScopeLifecycle {
    private static final long WAIT_SECONDS = 30;

    private static class Handler<V extends Number>
            implements CompletionHandler<V, Object> {
        final CompletableFuture<V> result = new CompletableFuture<>();
        final AtomicInteger calls = new AtomicInteger();
        final Object attachment = new Object();

        public void completed(V value, Object attachment) {
            checkAttachment(attachment);
            calls.incrementAndGet();
            result.complete(value);
        }

        public void failed(Throwable failure, Object attachment) {
            checkAttachment(attachment);
            calls.incrementAndGet();
            result.completeExceptionally(failure);
        }

        private void checkAttachment(Object actual) {
            if (actual != attachment) {
                result.completeExceptionally(new AssertionError("Wrong attachment"));
            }
        }

        <N extends V> CompletionHandler<N, Object> callback() {
            return new CompletionHandler<>() {
                public void completed(N value, Object attachment) {
                    Handler.this.completed(value, attachment);
                }
                public void failed(Throwable failure, Object attachment) {
                    Handler.this.failed(failure, attachment);
                }
            };
        }

        Throwable await() throws Exception {
            try {
                result.get(WAIT_SECONDS, TimeUnit.SECONDS);
                return null;
            } catch (ExecutionException e) {
                return e.getCause();
            }
        }
    }

    private static class Connection implements AutoCloseable {
        final AsynchronousChannelGroup group = AsynchronousChannelGroup.withFixedThreadPool(
                2, Thread.ofPlatform().daemon().factory());
        final AsynchronousSocketChannel channel;
        final Socket peer;

        Connection() throws Exception {
            try (var server = new ServerSocket()) {
                server.setReceiveBufferSize(1024);
                server.bind(new InetSocketAddress(InetAddress.getLoopbackAddress(), 0));
                server.setSoTimeout((int) TimeUnit.SECONDS.toMillis(WAIT_SECONDS));
                channel = AsynchronousSocketChannel.open(group);
                channel.setOption(StandardSocketOptions.SO_SNDBUF, 1024);
                channel.connect(server.getLocalSocketAddress())
                        .get(WAIT_SECONDS, TimeUnit.SECONDS);
                peer = server.accept();
            }
        }

        public void close() throws IOException {
            CompletableFuture<Void> closed = new CompletableFuture<>();
            Thread.ofPlatform().daemon().start(() -> {
                try {
                    closeResources();
                    closed.complete(null);
                } catch (Throwable e) {
                    closed.completeExceptionally(e);
                }
            });
            try {
                closed.get(WAIT_SECONDS, TimeUnit.SECONDS);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                throw new IOException(e);
            } catch (ExecutionException | TimeoutException e) {
                throw new IOException("Channel/group close failed", e);
            }
        }

        private void closeResources() throws IOException {
            try {
                channel.close();
            } finally {
                try {
                    peer.close();
                } finally {
                    group.shutdownNow();
                    try {
                        if (!group.awaitTermination(WAIT_SECONDS, TimeUnit.SECONDS))
                            throw new IOException("Group did not terminate");
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                        throw new IOException(e);
                    }
                }
            }
        }
    }

    private static Field field(AsynchronousSocketChannel channel, String name)
            throws Exception {
        Field field = channel.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    private static void checkCleared(AsynchronousSocketChannel channel, String op)
            throws Exception {
        for (String suffix : new String[] { "Buffer", "Buffers", "Attachment",
                "Handler", "Future", "Timer", "TimeoutTask", "ScopeHandleReleasers" }) {
            if (field(channel, op + suffix).get(channel) != null) {
                throw new AssertionError("Retained " + op + suffix);
            }
        }
    }

    private static <V extends Number> void checkCompletion(Connection connection,
            Handler<V> handler, String op) throws Exception {
        checkCleared(connection.channel, op);
        // Drain this group's tasks before checking for duplicate callbacks.
        connection.close();
        if (handler.calls.get() != 1) {
            throw new AssertionError("Callback count: " + handler.calls.get());
        }
    }

    private static void read(String kind, String mode, boolean scatter)
            throws Exception {
        System.out.println("read " + kind + " " + mode + " scatter=" + scatter);
        try (Arena arena = Arena.ofShared(); var connection = new Connection()) {
            ByteBuffer buffer = switch (kind) {
                case "heap" -> ByteBuffer.allocate(64);
                case "direct" -> ByteBuffer.allocateDirect(64);
                default -> arena.allocate(64).asByteBuffer();
            };
            Handler<Number> handler = new Handler<>();
            long timeout = mode.equals("timeout") ? 50 : mode.equals("race") ? 2 : 0;
            if (scatter) {
                connection.channel.read(new ByteBuffer[] { buffer }, 0, 1,
                        timeout, TimeUnit.MILLISECONDS, handler.attachment, handler.callback());
            } else {
                connection.channel.read(buffer, timeout, TimeUnit.MILLISECONDS,
                        handler.attachment, handler.callback());
            }
            switch (mode) {
                case "success", "race" -> connection.peer.getOutputStream().write(1);
                case "eof" -> connection.peer.shutdownOutput();
                case "close" -> connection.close();
                case "reset" -> {
                    connection.peer.setSoLinger(true, 0);
                    connection.peer.close();
                }
            }
            Throwable failure = handler.await();
            switch (mode) {
                case "success", "eof" -> {
                    if (failure != null) throw new AssertionError(failure);
                    long expected = mode.equals("eof") ? -1 : 1;
                    if (handler.result.get().longValue() != expected)
                        throw new AssertionError("Wrong read result");
                }
                case "timeout" -> {
                    if (!(failure instanceof InterruptedByTimeoutException))
                        throw new AssertionError("Wrong timeout result", failure);
                }
                case "close", "reset" -> {
                    if (!(failure instanceof IOException))
                        throw new AssertionError("Expected I/O failure", failure);
                }
                case "race" -> {
                    if (failure != null && !(failure instanceof InterruptedByTimeoutException))
                        throw new AssertionError("Wrong race result", failure);
                }
            }
            checkCompletion(connection, handler, "read");
        }
    }

    private static void write(boolean gather, boolean timeout) throws Exception {
        System.out.println("write gather=" + gather + " timeout=" + timeout);
        try (Arena arena = Arena.ofShared(); var connection = new Connection()) {
            ByteBuffer buffer = arena.allocate(1 << 20).asByteBuffer();
            for (int i = 0; i < 100; i++) {
                buffer.clear();
                Handler<Number> handler = new Handler<>();
                if (gather) {
                    connection.channel.write(new ByteBuffer[] { buffer }, 0, 1,
                            timeout ? 50 : 0, TimeUnit.MILLISECONDS,
                            handler.attachment, handler.callback());
                } else {
                    connection.channel.write(buffer, timeout ? 50 : 0,
                            TimeUnit.MILLISECONDS, handler.attachment, handler.callback());
                }
                boolean pending = false;
                try {
                    handler.result.get(timeout ? TimeUnit.SECONDS.toMillis(WAIT_SECONDS) : 100,
                            TimeUnit.MILLISECONDS);
                } catch (TimeoutException e) {
                    if (timeout) throw new AssertionError("Write did not complete", e);
                    pending = true;
                    connection.close();
                } catch (ExecutionException e) {
                    pending = true;
                }
                Throwable failure = handler.await();
                checkCleared(connection.channel, "write");
                if (handler.calls.get() != 1) throw new AssertionError("Callback count");
                if (pending) {
                    if (timeout && !(failure instanceof InterruptedByTimeoutException))
                        throw new AssertionError("Expected write timeout", failure);
                    // A delayed success callback can race with close. Both
                    // outcomes must release the operation's resources.
                    if (!timeout && failure != null && !(failure instanceof IOException))
                        throw new AssertionError("Unexpected write close failure", failure);
                    checkCompletion(connection, handler, "write");
                    return;
                }
            }
            throw new AssertionError("Could not fill socket send buffer");
        }
    }

    private static void future(boolean cancel, boolean interrupt) throws Exception {
        try (Arena arena = Arena.ofShared(); var connection = new Connection()) {
            Future<Integer> result = connection.channel.read(arena.allocate(64).asByteBuffer());
            if (cancel && !result.cancel(interrupt))
                throw new AssertionError("Read unexpectedly completed");
            connection.close();
            try {
                result.get(WAIT_SECONDS, TimeUnit.SECONDS);
                throw new AssertionError("Expected failure");
            } catch (CancellationException e) {
                if (!cancel) throw e;
            } catch (ExecutionException e) {
                if (cancel || !(e.getCause() instanceof IOException)) throw e;
            }
            checkCleared(connection.channel, "read");
        }
    }

    private static void cleanupFailure(boolean timeout, boolean close) throws Exception {
        try (Arena arena = Arena.ofShared(); var connection = new Connection()) {
            Handler<Number> handler = new Handler<>();
            // Trigger the timeout manually after installing the fault. No timing window.
            connection.channel.read(arena.allocate(64).asByteBuffer(), 1,
                    TimeUnit.DAYS, handler.attachment, handler.callback());
            Field releasers = field(connection.channel, "readScopeHandleReleasers");
            Runnable original = (Runnable) releasers.get(connection.channel);
            var injected = new IllegalStateException("Injected scope release failure");
            releasers.set(connection.channel, (Runnable) () -> {
                original.run();
                throw injected;
            });
            if (timeout) {
                ((Runnable) field(connection.channel, "readTimeoutTask")
                        .get(connection.channel)).run();
            } else if (close) {
                connection.close();
            } else {
                connection.peer.getOutputStream().write(1);
            }
            Throwable failure = handler.await();
            if (timeout || close) {
                if (!(failure instanceof IOException)
                        || failure.getSuppressed().length != 1
                        || failure.getSuppressed()[0] != injected) {
                    throw new AssertionError("Lost primary or cleanup failure", failure);
                }
            } else if (failure != injected) {
                throw new AssertionError("Lost cleanup failure", failure);
            }
            checkCompletion(connection, handler, "read");
        }
    }

    public static void main(String[] args) throws Exception {
        for (String kind : new String[] { "arena", "heap", "direct" }) {
            for (String mode : new String[] { "timeout", "close", "success", "eof", "reset" }) {
                for (boolean scatter : new boolean[] { false, true }) {
                    read(kind, mode, scatter);
                }
            }
        }
        for (int i = 0; i < 50; i++) read("arena", "race", (i & 1) == 0);
        for (boolean gather : new boolean[] { false, true }) {
            write(gather, false);
            write(gather, true);
        }
        future(false, false);
        future(true, false);
        future(true, true);
        cleanupFailure(false, false);
        cleanupFailure(false, true);
        cleanupFailure(true, false);
    }
}
