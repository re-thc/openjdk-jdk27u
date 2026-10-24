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
 * @summary Scattering and gathering I/O retain at most IOV_MAX vector slots
 * @modules java.base/sun.nio.ch:open
 * @run main/othervm IOVecCapacity
 */

import java.lang.reflect.Field;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicReference;

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

    private static void checkCache() throws ReflectiveOperationException {
        ThreadLocal<?> cache = (ThreadLocal<?>) field(WRAPPER, "IOV_CACHE").get(null);
        Object wrapper = ((Object[]) cache.get())[0];
        int size = field(WRAPPER, "size").getInt(wrapper);
        if (size != IOV_MAX) {
            throw new AssertionError("capacity=" + size + ", IOV_MAX=" + IOV_MAX);
        }
        for (String name : new String[] {"buf", "shadow"}) {
            Object[] refs = (Object[]) field(WRAPPER, name).get(wrapper);
            if (refs.length != IOV_MAX || Arrays.stream(refs).anyMatch(x -> x != null)) {
                throw new AssertionError("Retained references in " + name);
            }
        }
    }

    private static void test(boolean read) throws Exception {
        Path path = Files.createTempFile("iovec-capacity", ".bin");
        try (FileChannel channel = FileChannel.open(path, READ, WRITE)) {
            int length = Math.max(100_000, 2 * IOV_MAX + 1);
            ByteBuffer[] buffers = new ByteBuffer[length + 2];
            Arrays.fill(buffers, 1, length + 1, ByteBuffer.allocate(0));
            long n = read ? channel.read(buffers, 1, length)
                          : channel.write(buffers, 1, length);
            if (n != 0 || channel.position() != 0) {
                throw new AssertionError("Empty vector performed I/O");
            }
            checkCache();
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
            checkCache();
        } finally {
            Files.delete(path);
        }
    }

    public static void main(String[] args) throws Exception {
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
