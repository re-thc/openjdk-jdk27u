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

import java.io.IOException;
import java.lang.management.ManagementFactory;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.*;
import java.nio.file.*;
import java.util.Arrays;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicReference;
import jdk.internal.access.SharedSecrets;

// A local experiment, with setup and verification outside the timed loop.
// One invocation measures one case; the runner interleaves fresh A/B JVMs.
public class SocketFileBench {
    static final com.sun.management.ThreadMXBean THREADS =
            (com.sun.management.ThreadMXBean) ManagementFactory.getThreadMXBean();
    static final com.sun.management.OperatingSystemMXBean OS =
            (com.sun.management.OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();
    static volatile long sink;
    static java.io.PrintStream results = System.out;

    static class Source implements ReadableByteChannel {
        final byte[] data = new byte[8192];
        Source() { Arrays.fill(data, (byte) 90); }
        public int read(ByteBuffer dst) {
            int n = Math.min(dst.remaining(), data.length);
            dst.put(data, 0, n);
            return n;
        }
        public boolean isOpen() { return true; }
        public void close() { }
    }

    static long loop(FileChannel file, ReadableByteChannel src, int size, int ops,
                     boolean empty, boolean mixed) throws IOException {
        long sum = 0;
        for (int i = 0; i < ops; i++) {
            boolean hold = mixed && (i & 1) == 0;
            if (hold) SharedSecrets.getJavaNioAccess().reserveMemory(1 << 20, 1 << 20);
            long n;
            try { n = file.transferFrom(src, 0, size); }
            finally {
                if (hold) SharedSecrets.getJavaNioAccess().unreserveMemory(1 << 20, 1 << 20);
            }
            if (n != (empty ? 0 : size)) throw new AssertionError("short transfer: " + n);
            sum += n;
        }
        return sum;
    }

    static void measure(String kind, int size, String quota, int ops, int warmups,
                        int samples, boolean virtual) throws Exception {
        THREADS.setThreadAllocatedMemoryEnabled(true);
        // Quota is 1 MiB for every fork. Keep its entire capacity live to force
        // failure with a nonzero configured limit, instead of only testing zero.
        ByteBuffer held = quota.equals("exhausted") ? ByteBuffer.allocateDirect(1 << 20) : null;
        Path path = Files.createTempFile(Path.of("."), "transfer-", ".dat");
        AtomicReference<Throwable> senderError = new AtomicReference<>();
        Thread sender = null;
        SocketChannel peer = null;
        ReadableByteChannel src;
        boolean empty = kind.equals("empty");
        boolean mixed = quota.equals("mixed");
        if (kind.equals("arbitrary")) {
            src = new Source();
        } else {
            try (ServerSocketChannel server = ServerSocketChannel.open()) {
                server.bind(new InetSocketAddress(InetAddress.getLoopbackAddress(), 0));
                SocketChannel socket = SocketChannel.open(server.getLocalAddress());
                peer = server.accept();
                src = socket;
                if (empty) {
                    socket.configureBlocking(false);
                } else {
                    SocketChannel output = peer;
                    ByteBuffer bytes = ByteBuffer.allocate(65536);
                    while (bytes.hasRemaining()) bytes.put((byte) 90);
                    bytes.flip();
                    sender = Thread.ofPlatform().name("sender").start(() -> {
                        try {
                            while (true) {
                                bytes.clear();
                                while (bytes.hasRemaining()) output.write(bytes);
                            }
                        } catch (AsynchronousCloseException expected) {
                        } catch (Throwable t) {
                            if (socket.isOpen() && output.isOpen()) senderError.set(t);
                        }
                    });
                }
            }
        }
        try (src; FileChannel file = FileChannel.open(path, StandardOpenOption.READ, StandardOpenOption.WRITE)) {
            file.position(3);
            long warmed = System.nanoTime();
            for (int i = 0; i < warmups || System.nanoTime() - warmed < 1_000_000_000L; i++)
                sink = loop(file, src, size, ops, empty, mixed);
            // Initialize management paths before measurement.
            OS.getProcessCpuTime(); THREADS.getCurrentThreadAllocatedBytes();
            THREADS.getTotalThreadAllocatedBytes();
            for (int i = 0; i < samples; i++) {
                long alloc = THREADS.getCurrentThreadAllocatedBytes();
                long total = THREADS.getTotalThreadAllocatedBytes();
                long cpu = OS.getProcessCpuTime();
                long start = System.nanoTime();
                sink = loop(file, src, size, ops, empty, mixed);
                long elapsed = System.nanoTime() - start;
                cpu = OS.getProcessCpuTime() - cpu;
                total = THREADS.getTotalThreadAllocatedBytes() - total;
                long allocated = THREADS.getCurrentThreadAllocatedBytes() - alloc;
                results.printf(Locale.ROOT,
                        "{\"kind\":\"%s\",\"size\":%d,\"quota\":\"%s\",\"virtual\":%s,\"sample\":%d,\"ops\":%d,\"ns\":%.4f,\"cpu_ns\":%.4f,\"alloc_B\":%.4f,\"total_alloc_B\":%.4f}%n",
                        kind, size, quota, virtual, i, ops, elapsed / (double) ops,
                        cpu / (double) ops, allocated < 0 || virtual ? -1.0 : allocated / (double) ops,
                        total / (double) ops);
            }
            if (file.position() != 3) throw new AssertionError("file position changed");
            byte[] actual = Files.readAllBytes(path);
            if (actual.length != (empty ? 0 : size)) throw new AssertionError("file size");
            for (byte b : actual) if (b != 90) throw new AssertionError("file content");
            if (held != null && held.capacity() != 1 << 20) throw new AssertionError();
        } finally {
            if (peer != null) peer.close();
            if (sender != null) { sender.join(10000); if (sender.isAlive()) throw new AssertionError("sender hung"); }
            Files.delete(path);
            java.lang.ref.Reference.reachabilityFence(held);
        }
        if (senderError.get() != null) throw new AssertionError(senderError.get());
    }

    public static void main(String[] args) throws Exception {
        String resultFile = System.getProperty("bench.results");
        if (resultFile != null) results = new java.io.PrintStream(Files.newOutputStream(Path.of(resultFile)), true);
        String kind = args[0], quota = args[2];
        int size = Integer.parseInt(args[1]), ops = Integer.parseInt(args[3]);
        int warmups = Integer.parseInt(args[4]), samples = Integer.parseInt(args[5]);
        boolean virtual = args.length > 6 && args[6].equals("virtual");
        if (virtual) {
            AtomicReference<Throwable> failure = new AtomicReference<>();
            Thread worker = Thread.ofVirtual().start(() -> {
                try { measure(kind, size, quota, ops, warmups, samples, true); }
                catch (Throwable t) { failure.set(t); }
            });
            worker.join();
            if (failure.get() != null) throw new AssertionError(failure.get());
        } else {
            measure(kind, size, quota, ops, warmups, samples, false);
        }
    }
}
