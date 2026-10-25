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
 * @summary Scattering and gathering I/O bound native vectors while preserving buffer bookkeeping
 * @modules java.base/sun.nio.ch:open
 *          java.management
 *          jdk.management
 * @run main/othervm -XX:NativeMemoryTracking=summary IOVecCapacity
 */

import java.lang.reflect.Field;
import java.lang.reflect.Array;
import java.lang.management.ManagementFactory;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.CountDownLatch;
import java.util.regex.Pattern;
import javax.management.ObjectName;

import static java.nio.file.StandardOpenOption.READ;
import static java.nio.file.StandardOpenOption.WRITE;

public class IOVecCapacity {
    private static final Class<?> WRAPPER;
    private static final int IOV_MAX;

    static {
        try {
            WRAPPER = Class.forName("sun.nio.ch.IOVecWrapper");
            IOV_MAX = (int) field(Class.forName("sun.nio.ch.IOUtil"), "IOV_MAX").get(null);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static Field field(Class<?> type, String name) throws ReflectiveOperationException {
        Field field = type.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    private static Object cachedWrapper() throws ReflectiveOperationException {
        ThreadLocal<?> cache = (ThreadLocal<?>) field(WRAPPER, "IOV_CACHE").get(null);
        return ((Object[]) cache.get())[0];
    }

    private static void checkRefs() throws ReflectiveOperationException {
        Object wrapper = cachedWrapper();
        for (String name : new String[] {"buf", "shadow"}) {
            Object[] refs = (Object[]) field(WRAPPER, name).get(wrapper);
            if (Arrays.stream(refs).anyMatch(x -> x != null)) {
                throw new AssertionError("Retained references in " + name);
            }
        }
    }

    private static void checkCache(int requested) throws ReflectiveOperationException {
        Object wrapper = cachedWrapper();
        int capacity = Math.min(requested, IOV_MAX);
        int expectedKey = capacity == IOV_MAX ? Integer.MAX_VALUE : capacity;
        int key = field(WRAPPER, "size").getInt(wrapper);
        if (key != expectedKey) {
            throw new AssertionError("cache key=" + key + ", expected=" + expectedKey);
        }
        for (String name : new String[] {"buf", "position", "remaining", "shadow"}) {
            if (Array.getLength(field(WRAPPER, name).get(wrapper)) != capacity) {
                throw new AssertionError("Wrong physical capacity in " + name);
            }
        }
        checkRefs();
    }

    private static void test(boolean read) throws Exception {
        Path path = Files.createTempFile("iovec-capacity", ".bin");
        try (FileChannel channel = FileChannel.open(path, READ, WRITE)) {
            int length = Math.max(100_000, 2 * IOV_MAX + 1);
            ByteBuffer[] buffers = new ByteBuffer[length + 2];
            Arrays.fill(buffers, 1, length + 1, ByteBuffer.allocate(0));
            long n = read ? channel.read(buffers, 1, 1) : channel.write(buffers, 1, 1);
            if (n != 0) throw new AssertionError("Empty small vector performed I/O");
            checkCache(1);
            Object small = cachedWrapper();
            int underCap = Math.min(2, IOV_MAX);
            n = read ? channel.read(buffers, 1, underCap) : channel.write(buffers, 1, underCap);
            if (n != 0 || (underCap > 1 && cachedWrapper() == small)) {
                throw new AssertionError("Growing small request did not replace wrapper");
            }
            checkCache(underCap);
            small = cachedWrapper();
            n = read ? channel.read(buffers, 1, length) : channel.write(buffers, 1, length);
            if (underCap < IOV_MAX && cachedWrapper() == small) {
                throw new AssertionError("Crossing cap did not replace small wrapper");
            }
            if (n != 0 || channel.position() != 0) {
                throw new AssertionError("Empty vector performed I/O");
            }
            checkCache(length);
            // An entry past the allocation cap must still be discovered.
            buffers[length] = ByteBuffer.allocateDirect(1);
            if (read) {
                channel.write(ByteBuffer.wrap(new byte[] {42}));
                channel.position(0);
            } else {
                buffers[length].put(0, (byte) 42);
            }
            n = read ? channel.read(buffers, 1, length)
                     : channel.write(buffers, 1, length);
            if (n != 1 || buffers[length].position() != 1
                    || Files.readAllBytes(path)[0] != 42 || buffers[length].get(0) != 42) {
                throw new AssertionError("Sparse vector content or position");
            }
            checkCache(length);
            Object large = cachedWrapper();
            n = read ? channel.read(buffers, 1, IOV_MAX / 2)
                     : channel.write(buffers, 1, IOV_MAX / 2);
            if (n != 0 || cachedWrapper() != large) {
                throw new AssertionError("Shorter empty request did not reuse wrapper");
            }
            checkCache(length);
            ByteBuffer[] grown = new ByteBuffer[length + 1];
            Arrays.fill(grown, ByteBuffer.allocate(0));
            n = read ? channel.read(grown) : channel.write(grown);
            if (n != 0 || cachedWrapper() != large) {
                throw new AssertionError("Growing oversized request did not reuse wrapper");
            }
            checkCache(grown.length);
            Object replacement = cachedWrapper();
            n = read ? channel.read(grown, 0, 0) : channel.write(grown, 0, 0);
            if (n != 0 || cachedWrapper() != replacement) {
                throw new AssertionError("Zero-length request did not reuse wrapper");
            }
            checkCache(grown.length);
        } finally {
            Files.delete(path);
        }
    }

    private static long otherBytes() throws Exception {
        String output = (String) ManagementFactory.getPlatformMBeanServer().invoke(
                new ObjectName("com.sun.management:type=DiagnosticCommand"),
                "vmNativeMemory", new Object[] {new String[] {"summary", "scale=1"}},
                new String[] {String[].class.getName()});
        var match = Pattern.compile("Other \\(reserved=(\\d+), committed=(\\d+)\\)").matcher(output);
        if (match.find()) return Long.parseLong(match.group(2));
        if (output.contains("Total:")) return 0;
        throw new AssertionError("NMT summary unavailable: " + output);
    }

    private static void nativeCapacity() throws Exception {
        int workers = 4;
        int length = Math.max(100_000, 2 * IOV_MAX + 1);
        int stride = field(WRAPPER, "SIZE_IOVEC").getInt(null);
        ByteBuffer[] empty = new ByteBuffer[length];
        Arrays.fill(empty, ByteBuffer.allocate(0));
        CountDownLatch initialized = new CountDownLatch(workers);
        CountDownLatch allocate = new CountDownLatch(1);
        CountDownLatch retained = new CountDownLatch(workers);
        CountDownLatch release = new CountDownLatch(1);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread[] threads = new Thread[workers];
        Path path = Files.createTempFile("native-iovec-capacity", ".bin");
        try (FileChannel channel = FileChannel.open(path, READ, WRITE)) {
            // Initialize the native path and diagnostic command outside the baseline.
            channel.write(empty, 0, 0);
            otherBytes();
            otherBytes();
            for (int i = 0; i < workers; i++) {
                boolean reading = i % 2 == 0;
                threads[i] = Thread.ofPlatform().start(() -> {
                    try {
                        if (reading) channel.read(empty, 0, 0);
                        else channel.write(empty, 0, 0);
                        initialized.countDown();
                        allocate.await();
                        long n = reading ? channel.read(empty) : channel.write(empty);
                        if (n != 0) throw new AssertionError("Empty vector transferred bytes");
                        checkRefs();
                        retained.countDown();
                        release.await();
                    } catch (Throwable e) {
                        failure.compareAndSet(null, e);
                    } finally {
                        initialized.countDown();
                        retained.countDown();
                    }
                });
            }
            initialized.await();
            if (failure.get() != null) throw new AssertionError(failure.get());
            long before = otherBytes();
            allocate.countDown();
            retained.await();
            if (failure.get() != null) throw new AssertionError(failure.get());
            long held = otherBytes();
            long expected = (long) workers * IOV_MAX * stride;
            long tolerance = Math.max(65_536, expected);
            System.out.println("native vector delta=" + (held - before) + ", expected=" + expected);
            if (held - before > expected + tolerance) {
                throw new AssertionError("Excess retained native vector memory: " + (held - before));
            }
            release.countDown();
            for (Thread thread : threads) thread.join();
            long after = otherBytes();
            System.out.println("native vector delta after release=" + (after - before));
            if (Math.abs(after - before) > tolerance) {
                throw new AssertionError("Native vector memory not released: " + (after - before));
            }
        } finally {
            allocate.countDown();
            release.countDown();
            for (Thread thread : threads) if (thread != null) thread.join();
            Files.delete(path);
        }
    }

    public static void main(String[] args) throws Exception {
        nativeCapacity();
        // A fresh platform thread gives each operation an empty carrier cache.
        for (boolean read : new boolean[] {false, true}) {
            AtomicReference<Throwable> failure = new AtomicReference<>();
            Thread worker = new Thread(() -> {
                try {
                    test(read);
                } catch (Throwable e) {
                    failure.set(e);
                }
            });
            worker.start();
            worker.join();
            if (failure.get() != null) {
                throw new AssertionError("read=" + read, failure.get());
            }
        }
        System.out.println("PASS capacity IOV_MAX=" + IOV_MAX);
    }
}
