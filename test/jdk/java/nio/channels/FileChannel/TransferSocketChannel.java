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
 * @summary File-to-socket transfers preserve content, positions and nonblocking progress
 * @library /test/lib
 * @run main/othervm TransferSocketChannel platform
 * @run main/othervm -Djdk.virtualThreadScheduler.parallelism=2 TransferSocketChannel virtual
 */

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.ClosedChannelException;
import java.nio.channels.FileChannel;
import java.nio.channels.NonReadableChannelException;
import java.nio.channels.NonWritableChannelException;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.Random;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;

import jdk.test.lib.Utils;

import static java.nio.file.StandardOpenOption.*;
import static jdk.test.lib.Asserts.assertThrows;

public class TransferSocketChannel {
    private static final int[] SIZES = { 0, 1, 8191, 8192, 8193, 2 * 1024 * 1024 };
    private static final long TIMEOUT = Utils.adjustTimeout(30_000);
    private static boolean virtual;
    private static long sequence;

    public static void main(String[] args) throws Exception {
        virtual = args[0].equals("virtual");
        var task = new FutureTask<Void>(() -> {
            for (boolean blocking : new boolean[] { true, false }) {
                zeroCount(blocking);
                for (int size : SIZES) {
                    transferTo(size, blocking);
                }
            }
            backpressure();
            fileTarget();
            return null;
        });
        Thread worker = start(task);
        try {
            task.get(6 * TIMEOUT, TimeUnit.MILLISECONDS);
        } finally {
            worker.interrupt();
            worker.join(TIMEOUT);
        }
    }

    private static Thread start(Runnable task) {
        return (virtual ? Thread.ofVirtual() : Thread.ofPlatform()).start(task);
    }

    private record Connection(SocketChannel local, SocketChannel peer) implements AutoCloseable {
        static Connection open() throws IOException {
            try (var listener = ServerSocketChannel.open()) {
                listener.bind(new InetSocketAddress(InetAddress.getLoopbackAddress(), 0));
                var local = SocketChannel.open(listener.getLocalAddress());
                try {
                    return new Connection(local, listener.accept());
                } catch (Throwable t) {
                    local.close();
                    throw t;
                }
            }
        }

        public void close() throws IOException {
            try (local; peer) { }
        }
    }

    private static byte[] data(int size) {
        byte[] bytes = new byte[size];
        new Random(0x123456789abcdefL + sequence++).nextBytes(bytes);
        return bytes;
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static void transferTo(int size, boolean blocking) throws Exception {
        Path path = Files.createTempFile(Path.of("."), "socket-to", ".dat");
        byte[] source = data(17 + size);
        Files.write(path, source);
        try (var connection = Connection.open(); var file = FileChannel.open(path, READ)) {
            connection.local.configureBlocking(blocking);
            var receiver = new FutureTask<byte[]>(() -> {
                var buffer = ByteBuffer.allocateDirect(size);
                while (buffer.hasRemaining()) {
                    check(connection.peer.read(buffer) >= 0, "unexpected EOF");
                }
                buffer.flip();
                byte[] received = new byte[size];
                buffer.get(received);
                return received;
            });
            Thread thread = start(receiver);
            try {
                file.position(7);
                check(file.transferTo(17, 0, connection.local) == 0, "zero count");
                long total = 0;
                long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(TIMEOUT);
                while (total < size) {
                    long n = file.transferTo(17 + total, size + 11 - total, connection.local);
                    check(n >= 0 && n <= size - total, "transferTo count");
                    total += n;
                    check(System.nanoTime() < deadline, "transferTo timeout");
                    if (n == 0) Thread.sleep(1);
                }
                check(file.transferTo(17 + size, 11, connection.local) == 0, "file EOF count");
                check(file.position() == 7, "transferTo file position");
                byte[] expected = Arrays.copyOfRange(source, 17, source.length);
                check(Arrays.equals(receiver.get(TIMEOUT, TimeUnit.MILLISECONDS), expected),
                        "transferTo content");
            } finally {
                connection.peer.close();
                thread.join(TIMEOUT);
            }
        } finally {
            Files.delete(path);
        }
        System.out.printf("to size=%d blocking=%s virtual=%s%n", size, blocking, virtual);
    }

    private static void zeroCount(boolean blocking) throws Exception {
        Path path = Files.createTempFile(Path.of("."), "socket-zero", ".dat");
        byte[] payload = data(128);
        Files.write(path, payload);
        try (var connection = Connection.open();
             var file = FileChannel.open(path, READ);
             var unreadable = FileChannel.open(path, WRITE);
             var readOnly = FileChannel.open(path, READ);
             var closedSource = FileChannel.open(path, READ);
             var closedTarget = SocketChannel.open()) {
            connection.local.configureBlocking(blocking);
            file.position(7);
            closedSource.close();
            closedTarget.close();
            // A zero length must not bypass argument or channel validation.
            assertThrows(IllegalArgumentException.class,
                    () -> file.transferTo(-1, 0, connection.local));
            assertThrows(IllegalArgumentException.class,
                    () -> file.transferTo(17, -1, connection.local));
            assertThrows(NullPointerException.class, () -> file.transferTo(17, 0, null));
            assertThrows(ClosedChannelException.class,
                    () -> closedSource.transferTo(17, 0, connection.local));
            assertThrows(ClosedChannelException.class,
                    () -> file.transferTo(17, 0, closedTarget));
            assertThrows(NonReadableChannelException.class,
                    () -> unreadable.transferTo(17, 0, connection.local));
            assertThrows(NonWritableChannelException.class,
                    () -> file.transferTo(17, 0, readOnly));

            // Drain through EOF so even a zero-count call that incorrectly sends
            // data but returns zero cannot hide extra or duplicated bytes.
            var receiver = new FutureTask<byte[]>(() ->
                    Channels.newInputStream(connection.peer).readAllBytes());
            Thread thread = start(receiver);
            try {
                check(file.transferTo(17, 0, connection.local) == 0, "zero count");
                check(file.position() == 7, "zero count changed source position");
                int offset = 41, length = 23;
                long total = 0;
                long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(TIMEOUT);
                while (total < length) {
                    long n = file.transferTo(offset + total, length - total, connection.local);
                    check(n >= 0 && n <= length - total, "zero-count recovery count");
                    total += n;
                    check(System.nanoTime() < deadline, "zero-count recovery timeout");
                    if (n == 0) Thread.sleep(1);
                }
                connection.local.shutdownOutput();
                check(Arrays.equals(receiver.get(TIMEOUT, TimeUnit.MILLISECONDS),
                        Arrays.copyOfRange(payload, offset, offset + length)),
                        "zero count sent extra bytes or changed recovery content");
                check(file.position() == 7, "zero-count recovery changed source position");
            } finally {
                connection.peer.close();
                thread.join(TIMEOUT);
            }
        } finally {
            Files.delete(path);
        }
    }

    private static void backpressure() throws Exception {
        Path path = Files.createTempFile(Path.of("."), "socket-backpressure", ".dat");
        byte[] payload = data(256 * 1024);
        Files.write(path, payload);
        try (var connection = Connection.open(); var file = FileChannel.open(path, READ)) {
            connection.local.setOption(java.net.StandardSocketOptions.SO_SNDBUF, 4096);
            connection.peer.setOption(java.net.StandardSocketOptions.SO_RCVBUF, 4096);
            connection.local.configureBlocking(false);
            file.position(7);
            long queued = 0;
            long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(TIMEOUT);
            for (;;) {
                long n = file.transferTo(0, payload.length, connection.local);
                check(n >= 0 && n <= payload.length, "backpressure count");
                queued += n;
                check(System.nanoTime() < deadline && queued < 32 * 1024 * 1024,
                        "socket did not become backpressured");
                if (n == 0) break;
            }
            final long discard = queued;
            var receiver = new FutureTask<byte[]>(() -> {
                var buffer = ByteBuffer.allocateDirect(8192);
                long left = discard;
                while (left > 0) {
                    buffer.clear().limit((int) Math.min(left, buffer.capacity()));
                    int n = connection.peer.read(buffer);
                    check(n > 0, "EOF while draining queued bytes");
                    left -= n;
                }
                byte[] bytes = new byte[payload.length];
                var dst = ByteBuffer.wrap(bytes);
                while (dst.hasRemaining()) check(connection.peer.read(dst) > 0, "recovery EOF");
                return bytes;
            });
            Thread thread = start(receiver);
            try {
                long total = 0;
                while (total < payload.length) {
                    long n = file.transferTo(total, payload.length - total, connection.local);
                    check(n >= 0 && n <= payload.length - total, "recovery count");
                    total += n;
                    check(System.nanoTime() < deadline, "backpressure recovery timeout");
                    if (n == 0) Thread.sleep(1);
                }
                check(Arrays.equals(receiver.get(TIMEOUT, TimeUnit.MILLISECONDS), payload),
                        "backpressure recovery content");
                check(file.position() == 7, "backpressure source position");
            } finally {
                connection.peer.close();
                thread.join(TIMEOUT);
            }
        } finally {
            Files.delete(path);
        }
    }

    private static void fileTarget() throws Exception {
        Path source = Files.createTempFile(Path.of("."), "file-source", ".dat");
        Path target = Files.createTempFile(Path.of("."), "file-target", ".dat");
        byte[] payload = data(8193);
        Files.write(source, payload);
        try (var file = FileChannel.open(source, READ);
             var dst = FileChannel.open(target, WRITE)) {
            file.position(7);
            dst.position(13);
            long total = 0;
            while (total < payload.length) {
                long n = file.transferTo(total, payload.length - total, dst);
                check(n > 0, "file target made no progress");
                total += n;
            }
            check(file.position() == 7, "file target source position");
            check(dst.position() == 13 + payload.length, "file target position");
            byte[] bytes = Files.readAllBytes(target);
            check(Arrays.equals(Arrays.copyOfRange(bytes, 13, bytes.length), payload),
                    "file target content");
        } finally {
            Files.delete(source);
            Files.delete(target);
        }
    }
}
