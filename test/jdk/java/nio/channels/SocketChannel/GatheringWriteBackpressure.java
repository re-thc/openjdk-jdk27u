/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Gathering writes under backpressure preserve contents and positions
 * @run main/othervm/timeout=120 GatheringWriteBackpressure
 */

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.StandardSocketOptions;
import java.nio.ByteBuffer;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

public class GatheringWriteBackpressure {
    private static final int BATCH_SIZE = 128 * 1024 - 1;
    private static final int GUARD = 7;

    public static void main(String[] args) throws Exception {
        boolean shortBatch = test(false) | test(true);
        // For a focused Windows qualification run, require evidence of a
        // positive write that ended inside a native batch. Ordinary regression
        // runs still check data and positions when a provider only completes
        // whole batches or reports would-block.
        if (Boolean.getBoolean("test.requireShortBatch") && !shortBatch) {
            throw new RuntimeException("No short native batch observed; "
                    + "backpressure qualification is inconclusive");
        }
    }

    private static boolean test(boolean direct) throws Exception {
        ByteBuffer[] buffers = new ByteBuffer[20];
        int total = 0;
        for (int i = 0; i < buffers.length; i++) {
            int size = (i == 0 || i == 19 || i % 5 == 0)
                    ? 0 : BATCH_SIZE + (i % 3 - 1);
            ByteBuffer b = direct ? ByteBuffer.allocateDirect(size + 2 * GUARD)
                                  : ByteBuffer.allocate(size + 2 * GUARD);
            for (int j = 0; j < b.capacity(); j++) {
                b.put(j, (byte) 0x5a);
            }
            b.position(GUARD).limit(GUARD + size);
            for (int j = 0; j < size; j++) {
                b.put(GUARD + j, value(total + j));
            }
            total += size;
            buffers[i] = b;
        }
        final int expected = total;
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(40);
        CountDownLatch drain = new CountDownLatch(1);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        try (ServerSocketChannel listener = ServerSocketChannel.open()) {
            listener.bind(new InetSocketAddress(InetAddress.getLoopbackAddress(), 0));
            try (SocketChannel source = SocketChannel.open(listener.getLocalAddress());
                 SocketChannel sink = listener.accept()) {
                source.setOption(StandardSocketOptions.SO_SNDBUF, 1024);
                source.configureBlocking(false);
                sink.configureBlocking(false);
                Thread reader = new Thread(() -> {
                    try {
                        if (!drain.await(40, TimeUnit.SECONDS)) {
                            throw new RuntimeException("Writer did not start receiver");
                        }
                        ByteBuffer b = ByteBuffer.allocate(8192);
                        int received = 0;
                        for (;;) {
                            checkDeadline(deadline);
                            int n = sink.read(b);
                            if (n < 0) {
                                if (received != expected) {
                                    throw new RuntimeException("EOF at " + received
                                            + ", expected " + expected);
                                }
                                return;
                            }
                            b.flip();
                            while (b.hasRemaining()) {
                                byte actual = b.get();
                                if (received >= expected || actual != value(received)) {
                                    throw new RuntimeException("Content mismatch at "
                                            + received);
                                }
                                received++;
                            }
                            b.clear();
                            // Keep pressure on the writer after initially
                            // filling the transport without any receiver.
                            Thread.sleep(1);
                        }
                    } catch (Throwable t) {
                        failure.set(t);
                    }
                }, "gathering-write-reader");
                reader.start();
                boolean shortBatch = false;
                int zeros = 0;
                long sent = 0;
                try {
                    // Empty selected ranges must leave every position alone.
                    if (source.write(buffers, 1, 0) != 0) {
                        throw new RuntimeException("Nonzero empty write");
                    }
                    while (sent < total) {
                        checkDeadline(deadline);
                        if (failure.get() != null) {
                            throw new RuntimeException("Receiver failed", failure.get());
                        }
                        long before = total - sent;
                        long n = source.write(buffers, 1, buffers.length - 2);
                        if (n < 0 || n > before) {
                            throw new RuntimeException("Invalid count " + n);
                        }
                        if (n > 0 && n < before && n % BATCH_SIZE != 0) {
                            shortBatch = true;
                        }
                        sent += n;
                        checkPositions(buffers, sent);
                        if (n == 0) {
                            zeros++;
                            drain.countDown();
                            Thread.sleep(1);
                        }
                    }
                    drain.countDown();
                    source.shutdownOutput();
                    reader.join(45000);
                    if (reader.isAlive()) {
                        throw new RuntimeException("Receiver did not finish");
                    }
                    if (failure.get() != null) {
                        throw new RuntimeException("Receiver failed", failure.get());
                    }
                    System.out.printf("direct=%s sent=%d zeroWrites=%d shortBatch=%s%n",
                            direct, sent, zeros, shortBatch);
                    return shortBatch;
                } finally {
                    drain.countDown();
                    sink.close();
                    reader.interrupt();
                    reader.join(5000);
                    if (reader.isAlive()) {
                        throw new RuntimeException("Receiver cleanup timed out");
                    }
                }
            }
        }
    }

    private static byte value(int offset) {
        int x = offset * 0x9e3779b9;
        return (byte) (x ^ (x >>> 11) ^ (x >>> 23));
    }

    private static void checkPositions(ByteBuffer[] buffers, long sent) {
        for (ByteBuffer b : buffers) {
            int size = b.limit() - GUARD;
            int consumed = (int) Math.min(sent, size);
            if (b.position() != GUARD + consumed) {
                throw new RuntimeException("Position " + b.position()
                        + ", expected " + (GUARD + consumed));
            }
            sent -= consumed;
            ByteBuffer all = b.duplicate().clear();
            for (int i = 0; i < GUARD; i++) {
                if (all.get(i) != (byte) 0x5a
                        || all.get(b.limit() + i) != (byte) 0x5a) {
                    throw new RuntimeException("Buffer guard changed");
                }
            }
        }
    }

    private static void checkDeadline(long deadline) {
        if (System.nanoTime() - deadline >= 0) {
            throw new RuntimeException("Backpressure test timed out");
        }
    }
}
