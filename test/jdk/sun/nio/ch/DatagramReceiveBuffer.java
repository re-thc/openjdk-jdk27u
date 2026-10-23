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
 * @summary Heap datagram receives only grow temporary buffers to the native read limit
 * @library /test/lib
 * @modules java.base/sun.nio.ch:open
 * @run main/othervm -Djdk.nio.maxCachedBufferSize=4194304 DatagramReceiveBuffer
 */

import java.lang.reflect.Field;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.DatagramChannel;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;

import jdk.test.lib.Platform;
import jdk.test.lib.Utils;

public class DatagramReceiveBuffer {
    private static final int[] SIZES = { 0, 1, 1024, 65535, 65536, 65537, 4 * 1024 * 1024 };
    private static final long TIMEOUT = Utils.adjustTimeout(10_000);
    private static final ThreadLocal<?> CACHE;
    private static final Field BUFFERS;

    static {
        try {
            Class<?> util = Class.forName("sun.nio.ch.Util");
            Field cache = util.getDeclaredField("bufferCache");
            cache.setAccessible(true);
            CACHE = (ThreadLocal<?>) cache.get(null);
            BUFFERS = Class.forName("sun.nio.ch.Util$BufferCache").getDeclaredField("buffers");
            BUFFERS.setAccessible(true);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static void main(String[] args) throws Exception {
        // Complete provider/address initialization before observing fresh
        // worker caches: class initialization itself can perform file I/O.
        Platform.isWindows();
        InetAddress.getLoopbackAddress();
        try (var channel = DatagramChannel.open()) { }
        int failures = 0;
        for (boolean direct : new boolean[] { false, true }) {
            for (boolean queued : new boolean[] { false, true }) {
                for (int size : SIZES) {
                    // A fresh platform thread has a fresh carrier cache. Sending
                    // from a direct buffer cannot seed it with a heap send buffer.
                    var task = new FutureTask<Void>(() -> {
                        test(size, direct, queued);
                        return null;
                    });
                    Thread worker = Thread.ofPlatform().start(task);
                    try {
                        task.get(TIMEOUT, TimeUnit.MILLISECONDS);
                    } catch (ExecutionException e) {
                        failures++;
                        e.getCause().printStackTrace();
                    } finally {
                        worker.interrupt();
                        worker.join(TIMEOUT);
                    }
                }
            }
        }
        check(failures == 0, "failed cases: " + failures);
    }

    private static void test(int size, boolean direct, boolean queued) throws Exception {
        var host = InetAddress.getLoopbackAddress();
        try (var receiver = DatagramChannel.open(); var sender = DatagramChannel.open()) {
            receiver.bind(new InetSocketAddress(host, 0)).configureBlocking(false);
            sender.bind(new InetSocketAddress(host, 0));
            var dst = direct ? ByteBuffer.allocateDirect(size) : ByteBuffer.allocate(size);
            Object cache = CACHE.get();
            check(capacity(cache) == 0, "cache was not initially empty");
            if (queued) sender.send(ByteBuffer.allocateDirect(1), receiver.getLocalAddress());
            var address = receiver.receive(dst);
            long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(TIMEOUT);
            while (queued && address == null && System.nanoTime() < deadline) {
                Thread.sleep(1);
                address = receiver.receive(dst);
            }
            check(queued ? sender.getLocalAddress().equals(address) : address == null, "sender");
            check(dst.position() == (queued && size > 0 ? 1 : 0) && dst.limit() == size, "buffer state");

            int expected = direct && size > 0 ? 0
                    : Math.max(1, Platform.isWindows() ? size : Math.min(size, 65536));
            long actual = capacity(cache);
            if (actual != expected) {
                throw new AssertionError("size=" + size + " direct=" + direct + " queued=" + queued
                        + " retained=" + actual + " expected=" + expected);
            }
            // Reusing the same heap destination must not grow the retained buffer.
            dst.clear();
            check(receiver.receive(dst) == null, "unexpected datagram");
            check(capacity(cache) == expected, "cache grew on repeated receive");
            System.out.printf("size=%d direct=%s queued=%s retained=%d expected=%d%n",
                    size, direct, queued, actual, expected);
        }
    }

    private static long capacity(Object cache) throws IllegalAccessException {
        long capacity = 0;
        for (ByteBuffer buffer : (ByteBuffer[]) BUFFERS.get(cache)) {
            if (buffer != null) capacity += buffer.capacity();
        }
        return capacity;
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
