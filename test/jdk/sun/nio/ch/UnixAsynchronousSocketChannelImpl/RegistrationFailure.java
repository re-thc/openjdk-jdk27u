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
 * @summary Failed asynchronous socket initiation and poll registration release ownership
 * @requires (os.family != "windows")
 * @modules java.base/sun.nio.ch
 * @compile --patch-module java.base=${test.src} RegistrationFailure.java
 * @run main/othervm --patch-module java.base=${test.classes} -Dsun.nio.ch.disableSynchronousRead=true sun.nio.ch.RegistrationFailure
 */

package sun.nio.ch;

import java.io.IOException;
import java.lang.foreign.Arena;
import java.lang.reflect.Field;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.channels.CompletionHandler;
import java.nio.channels.ShutdownChannelGroupException;
import java.nio.channels.spi.AsynchronousChannelProvider;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class RegistrationFailure {
    private static final long WAIT_SECONDS = 30;

    // Manual readiness delivery makes registration and EAGAIN failure deterministic.
    private static class TestPort extends Port {
        Throwable failure;
        boolean rejectCallbacks;
        TestPort() {
            super(AsynchronousChannelProvider.provider(),
                    ThreadPool.create(1, Thread.ofPlatform().daemon().factory()));
        }
        @Override void startPoll(int fd, int events) {
            if (failure instanceof Error error) throw error;
            if (failure instanceof RuntimeException exception) throw exception;
        }
        @Override void executeOnHandlerTask(Runnable task) {
            if (rejectCallbacks) throw new RejectedExecutionException("Injected dispatch failure");
            executor().execute(task);
        }
        @Override void shutdownHandlerTasks() { }
    }

    private static class Handler implements CompletionHandler<Integer, Object> {
        final CompletableFuture<Integer> result = new CompletableFuture<>();
        final AtomicInteger calls = new AtomicInteger();
        public void completed(Integer value, Object attachment) {
            calls.incrementAndGet();
            result.complete(value);
        }
        public void failed(Throwable failure, Object attachment) {
            calls.incrementAndGet();
            result.completeExceptionally(failure);
        }
    }

    private static void checkCleared(UnixAsynchronousSocketChannelImpl channel,
                                     String op) throws Exception {
        for (String suffix : new String[] { "Buffer", "Buffers", "Attachment",
                "Handler", "Future", "Timer", "TimeoutTask", "ScopeHandleReleasers" }) {
            Field field = channel.getClass().getDeclaredField(op + suffix);
            field.setAccessible(true);
            if (field.get(channel) != null) throw new AssertionError(field.getName());
        }
        Field pending = channel.getClass().getDeclaredField(op + "Pending");
        pending.setAccessible(true);
        if (pending.getBoolean(channel)) throw new AssertionError(op + " pending");
    }

    private static void awaitReadable(UnixAsynchronousSocketChannelImpl channel)
            throws IOException {
        int events = Net.poll(channel.fd, Net.POLLIN,
                TimeUnit.SECONDS.toMillis(WAIT_SECONDS));
        if ((events & Net.POLLIN) == 0) throw new AssertionError("Socket did not become readable");
    }

    private static void run(boolean write, String mode) throws Exception {
        System.out.println("write=" + write + " failure=" + mode);
        TestPort port = new TestPort();
        // Construct the Unix channel directly to deliver readiness manually.
        try (var server = new ServerSocket(0, 50, InetAddress.getLoopbackAddress())) {
            server.setSoTimeout((int) TimeUnit.SECONDS.toMillis(WAIT_SECONDS));
            var channel = new UnixAsynchronousSocketChannelImpl(port);
            try (channel; Arena arena = Arena.ofShared()) {
                var connect = channel.connect(server.getLocalSocketAddress());
                try (Socket accepted = server.accept()) {
                    channel.onEvent(Net.POLLOUT, false);
                    connect.get(WAIT_SECONDS, TimeUnit.SECONDS);
                    ByteBuffer buffer = arena.allocate(64).asByteBuffer();
                    Handler handler = new Handler();
                    var injected = new AssertionError("Injected registration failure");
                    if (mode.equals("initial")) port.failure = injected;
                    TimeUnit unit = mode.equals("schedule") ? null : TimeUnit.SECONDS;
                    long timeout = mode.equals("schedule") ? 1 : 0;
                    if (write) {
                        channel.write(buffer, timeout, unit, new Object(), handler);
                    } else {
                        channel.read(buffer, timeout, unit, new Object(), handler);
                    }
                    if (mode.equals("rearm") || mode.equals("unavailable")) {
                        // A pending opposite operation requires re-registration even
                        // when this operation successfully transfers data.
                        if (mode.equals("rearm")) {
                            if (write) {
                                channel.read(ByteBuffer.allocate(1));
                            } else {
                                Handler other = new Handler();
                                channel.write(ByteBuffer.allocate(1), new Object(), other);
                                accepted.getOutputStream().write(1);
                                awaitReadable(channel);
                            }
                        }
                        port.failure = injected;
                        channel.onEvent(write ? Net.POLLOUT : Net.POLLIN, false);
                    }
                    try {
                        handler.result.get(WAIT_SECONDS, TimeUnit.SECONDS);
                        throw new AssertionError("Expected failure");
                    } catch (ExecutionException e) {
                        Throwable expected = mode.equals("schedule")
                                ? NullPointerException.class.cast(e.getCause()) : injected;
                        if (e.getCause() != expected) throw e;
                    }
                    checkCleared(channel, write ? "write" : "read");
                    // Closing on a different thread detects a leaked begin/end lock.
                    CompletableFuture<Void> closed = new CompletableFuture<>();
                    Thread.ofPlatform().daemon().start(() -> {
                        try { channel.close(); closed.complete(null); }
                        catch (Throwable e) { closed.completeExceptionally(e); }
                    });
                    closed.get(WAIT_SECONDS, TimeUnit.SECONDS);
                    channel.onEvent(Net.POLLIN | Net.POLLOUT, false);
                    port.shutdownNow();
                    if (!port.awaitTermination(WAIT_SECONDS, TimeUnit.SECONDS))
                        throw new AssertionError("Port did not terminate");
                    if (handler.calls.get() != 1)
                        throw new AssertionError("Callback count: " + handler.calls.get());
                }
            }
        } finally {
            port.shutdownNow();
        }
    }

    private static void staleTimeout(boolean write, boolean timedSuccessor) throws Exception {
        System.out.println("stale timeout write=" + write + " timed=" + timedSuccessor);
        TestPort port = new TestPort();
        try (var server = new ServerSocket(0, 50, InetAddress.getLoopbackAddress())) {
            server.setSoTimeout((int) TimeUnit.SECONDS.toMillis(WAIT_SECONDS));
            var channel = new UnixAsynchronousSocketChannelImpl(port);
            try (channel; Arena arena = Arena.ofShared()) {
                var connect = channel.connect(server.getLocalSocketAddress());
                try (Socket peer = server.accept()) {
                    channel.onEvent(Net.POLLOUT, false);
                    connect.get(WAIT_SECONDS, TimeUnit.SECONDS);
                    String op = write ? "write" : "read";
                    Handler first = new Handler();
                    ByteBuffer buffer = arena.allocate(64).asByteBuffer();
                    if (write) channel.write(buffer, 1, TimeUnit.DAYS, null, first);
                    else channel.read(buffer, 1, TimeUnit.DAYS, null, first);
                    Field task = channel.getClass().getDeclaredField(op + "TimeoutTask");
                    task.setAccessible(true);
                    Runnable oldTimeout = (Runnable) task.get(channel);
                    if (!write) {
                        peer.getOutputStream().write(1);
                        awaitReadable(channel);
                    }
                    channel.onEvent(write ? Net.POLLOUT : Net.POLLIN, false);
                    first.result.get(WAIT_SECONDS, TimeUnit.SECONDS);

                    Handler second = new Handler();
                    buffer.clear();
                    if (write) channel.write(buffer, timedSuccessor ? 1 : 0,
                            TimeUnit.DAYS, null, second);
                    else channel.read(buffer, timedSuccessor ? 1 : 0,
                            TimeUnit.DAYS, null, second);
                    // Model an old timer that was already running when canceled.
                    oldTimeout.run();
                    Field lock = channel.getClass().getDeclaredField("updateLock");
                    lock.setAccessible(true);
                    synchronized (lock.get(channel)) {
                        Field pending = channel.getClass().getDeclaredField(op + "Pending");
                        pending.setAccessible(true);
                        if (!pending.getBoolean(channel) || second.result.isDone())
                            throw new AssertionError("Stale timer claimed the successor");
                    }
                    if (!write) {
                        peer.getOutputStream().write(1);
                        awaitReadable(channel);
                    }
                    channel.onEvent(write ? Net.POLLOUT : Net.POLLIN, false);
                    second.result.get(WAIT_SECONDS, TimeUnit.SECONDS);
                    checkCleared(channel, op);
                    channel.close();
                    port.shutdownNow();
                    if (!port.awaitTermination(WAIT_SECONDS, TimeUnit.SECONDS))
                        throw new AssertionError("Port did not terminate");
                    if (first.calls.get() != 1 || second.calls.get() != 1)
                        throw new AssertionError("Duplicate callback");
                }
            }
        } finally {
            port.shutdownNow();
        }
    }

    private static void dispatchFailure() throws Exception {
        TestPort port = new TestPort();
        try (var server = new ServerSocket(0, 50, InetAddress.getLoopbackAddress())) {
            server.setSoTimeout((int) TimeUnit.SECONDS.toMillis(WAIT_SECONDS));
            var channel = new UnixAsynchronousSocketChannelImpl(port);
            try (channel; Arena arena = Arena.ofShared()) {
                var connect = channel.connect(server.getLocalSocketAddress());
                try (Socket peer = server.accept()) {
                    channel.onEvent(Net.POLLOUT, false);
                    connect.get(WAIT_SECONDS, TimeUnit.SECONDS);
                    var read = channel.read(arena.allocate(64).asByteBuffer());
                    Handler handler = new Handler();
                    channel.write(arena.allocate(64).asByteBuffer(), null, handler);
                    // Closing claims both directions before dispatching write's
                    // completion. Failure to dispatch must still finish the read.
                    port.rejectCallbacks = true;
                    try {
                        channel.close();
                        throw new AssertionError("Expected dispatch failure");
                    } catch (ShutdownChannelGroupException expected) { }
                    try {
                        read.get(WAIT_SECONDS, TimeUnit.SECONDS);
                        throw new AssertionError("Expected close failure");
                    } catch (ExecutionException expected) {
                        if (!(expected.getCause() instanceof IOException)) throw expected;
                    }
                    checkCleared(channel, "read");
                    checkCleared(channel, "write");
                }
            }
        } finally {
            port.rejectCallbacks = false;
            port.shutdownNow();
        }
    }

    public static void main(String[] args) throws Exception {
        for (boolean write : new boolean[] { false, true }) {
            for (String mode : new String[] { "schedule", "initial", "rearm" }) {
                run(write, mode);
            }
        }
        run(false, "unavailable");
        dispatchFailure();
        for (boolean write : new boolean[] { false, true }) {
            staleTimeout(write, false);
            staleTimeout(write, true);
        }
    }
}
