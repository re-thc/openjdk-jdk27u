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
 * @bug 8392951
 * @summary Check scalar and scattering/gathering heap-buffer I/O across carrier yields and thread exit
 * @run main/othervm TemporaryBufferCarrier platform
 * @run main/othervm -Djdk.virtualThreadScheduler.parallelism=4
 *                   -Djdk.virtualThreadScheduler.maxPoolSize=4 TemporaryBufferCarrier virtual
 */

import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.concurrent.atomic.AtomicReference;

public final class TemporaryBufferCarrier {
    private static final int TASKS = 32;
    private static final int ROUNDS = 8;

    public static void main(String[] args) throws Exception {
        if (args.length != 1 || !(args[0].equals("platform") || args[0].equals("virtual"))) {
            throw new IllegalArgumentException("platform or virtual required");
        }
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread[] threads = new Thread[TASKS];
        long[] sums = new long[TASKS];
        for (int task = 0; task < TASKS; task++) {
            final int id = task;
            Runnable work = () -> {
                Path file = null;
                try {
                    file = Files.createTempFile("nio-carrier-", ".bin");
                    try (FileChannel channel = FileChannel.open(file,
                            StandardOpenOption.READ, StandardOpenOption.WRITE)) {
                        for (int round = 0; round < ROUNDS; round++) {
                            ByteBuffer a = ByteBuffer.allocate(32);
                            ByteBuffer b = ByteBuffer.allocate(64);
                            long expected = 0;
                            for (int i = 0; i < 96; i++) {
                                byte value = (byte) ((id + round + i) & 127);
                                (i < 32 ? a : b).put(value);
                                expected += value;
                            }
                            a.flip(); b.flip();
                            channel.position(0);
                            if ((round & 1) == 0) {
                                while (a.hasRemaining()) channel.write(a);
                                while (b.hasRemaining()) channel.write(b);
                            } else {
                                while (a.hasRemaining() || b.hasRemaining()) channel.write(new ByteBuffer[]{a, b});
                            }
                            Thread.yield();
                            if (Files.size(file) != 96) throw new AssertionError("Size");
                            a.clear(); b.clear(); channel.position(0);
                            if ((round & 1) == 0) {
                                while (a.hasRemaining()) if (channel.read(a) < 0) throw new AssertionError("EOF");
                                while (b.hasRemaining()) if (channel.read(b) < 0) throw new AssertionError("EOF");
                            } else {
                                while (a.hasRemaining() || b.hasRemaining()) {
                                    if (channel.read(new ByteBuffer[]{a, b}) < 0) throw new AssertionError("EOF");
                                }
                            }
                            a.flip(); b.flip();
                            long actual = 0;
                            for (int i = 0; i < 96; i++) {
                                byte value = (i < 32 ? a : b).get();
                                if (value != (byte) ((id + round + i) & 127)) throw new AssertionError("Byte content");
                                actual += value;
                            }
                            if (actual != expected) throw new AssertionError("Contents");
                            sums[id] += actual;
                            Thread.yield();
                        }
                    }
                } catch (Throwable problem) {
                    failure.compareAndSet(null, problem);
                } finally {
                    if (file != null) {
                        try { Files.delete(file); }
                        catch (Throwable problem) { failure.compareAndSet(null, problem); }
                    }
                }
            };
            threads[task] = args[0].equals("virtual")
                    ? Thread.ofVirtual().start(work) : Thread.ofPlatform().start(work);
        }
        for (Thread thread : threads) thread.join();
        if (failure.get() != null) throw new AssertionError("Worker failure", failure.get());
        long checksum = 0;
        for (long value : sums) checksum += value;
        if (checksum != 1627136) throw new AssertionError("Unexpected checksum: " + checksum);
        System.out.println("NIO CARRIER mode=" + args[0] + " tasks=32 rounds=8 checksum=" + checksum);
    }
}
