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
 * @test id=basic
 * @summary Socket-to-file staging owns and releases exact direct-memory reservations
 * @library /test/lib
 * @modules java.management jdk.unsupported java.base/sun.nio.ch java.base/jdk.internal.access java.base/jdk.internal.misc
 * @run main/othervm -XX:MaxDirectMemorySize=8192 TransferFromSocketBuffer basic platform
 * @run main/othervm -XX:MaxDirectMemorySize=8192 TransferFromSocketBuffer basic virtual
 */
/*
 * @test id=denied
 * @summary Socket transfers fall back to heap staging when the direct-memory budget is unavailable
 * @library /test/lib
 * @modules java.management jdk.unsupported java.base/sun.nio.ch java.base/jdk.internal.access java.base/jdk.internal.misc
 * @run main/othervm -XX:MaxDirectMemorySize=0 TransferFromSocketBuffer denied
 */
/*
 * @test id=parked
 * @summary Parked virtual socket transfers retain only their budgeted exact-size buffers
 * @library /test/lib
 * @modules java.management jdk.unsupported java.base/sun.nio.ch java.base/jdk.internal.access java.base/jdk.internal.misc
 * @run main/othervm -XX:MaxDirectMemorySize=1048576 -Djdk.virtualThreadScheduler.parallelism=1 -Djdk.virtualThreadScheduler.maxPoolSize=1 TransferFromSocketBuffer parked 128
 */
/*
 * @test id=tight
 * @summary Concurrent parked transfers use heap fallback when exact native reservations exhaust a tight budget
 * @library /test/lib
 * @modules java.management jdk.unsupported java.base/sun.nio.ch java.base/jdk.internal.access java.base/jdk.internal.misc
 * @run main/othervm -XX:MaxDirectMemorySize=65536 -Djdk.virtualThreadScheduler.parallelism=4 -Djdk.virtualThreadScheduler.maxPoolSize=4 TransferFromSocketBuffer parked 8
 */
/*
 * @test id=reservations
 * @summary Opportunistic native reservations honor configured limits and balance concurrent ownership
 * @library /test/lib
 * @modules java.management jdk.unsupported java.base/sun.nio.ch java.base/jdk.internal.access java.base/jdk.internal.misc
 * @run main/othervm -XX:MaxDirectMemorySize=65536 TransferFromSocketBuffer reservations
 */

import java.io.IOException;
import java.lang.management.BufferPoolMXBean;
import java.lang.management.ManagementFactory;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.*;
import java.nio.file.*;
import java.util.*;
import java.util.concurrent.*;

import com.sun.nio.file.ExtendedOpenOption;
import jdk.internal.access.SharedSecrets;
import jdk.test.lib.Platform;
import jdk.test.lib.Utils;
import sun.nio.ch.Util;

import static java.nio.file.StandardOpenOption.*;

public class TransferFromSocketBuffer {
    private static final long TIMEOUT = Utils.adjustTimeout(30_000);
    private static final BufferPoolMXBean POOL = ManagementFactory.getPlatformMXBeans(BufferPoolMXBean.class)
            .stream().filter(p -> p.getName().equals("direct")).findFirst().orElseThrow();
    private static boolean virtual;
    private record Usage(long count, long capacity, long memory) {
        static Usage current() { return new Usage(POOL.getCount(), POOL.getTotalCapacity(), POOL.getMemoryUsed()); }
        void checkSame(String where) { check(equals(current()), where + ": " + this + " -> " + current()); }
    }
    private record Pair(SocketChannel local, SocketChannel peer) implements AutoCloseable {
        static Pair open() throws IOException {
            try (var server = ServerSocketChannel.open()) {
                server.bind(new InetSocketAddress(InetAddress.getLoopbackAddress(), 0));
                var local = SocketChannel.open(server.getLocalAddress());
                try { return new Pair(local, server.accept()); }
                catch (Throwable t) { local.close(); throw t; }
            }
        }
        public void close() throws IOException { try (local; peer) { } }
    }
    private static Thread start(Runnable action) {
        return (virtual ? Thread.ofVirtual() : Thread.ofPlatform()).start(action);
    }
    private static void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); }
    private static Path path() throws IOException { return Files.createTempFile(Path.of("."), "socket-budget", ".dat"); }
    private static void send(SocketChannel peer, byte[] bytes) throws IOException {
        var buffer = ByteBuffer.wrap(bytes);
        while (buffer.hasRemaining()) peer.write(buffer);
    }
    private static void awaitFrame(Thread worker, String type, String method) throws Exception {
        long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(TIMEOUT);
        while (Arrays.stream(worker.getStackTrace()).noneMatch(f ->
                f.getClassName().equals(type) && f.getMethodName().equals(method))) {
            check(worker.isAlive() && System.nanoTime() < deadline, "worker did not reach " + type + "." + method);
            Thread.sleep(1);
        }
    }
    private static void result(FutureTask<?> task, Class<? extends Throwable> type) throws Exception {
        try { task.get(TIMEOUT, TimeUnit.MILLISECONDS); throw new AssertionError("expected " + type); }
        catch (ExecutionException e) { check(type.isInstance(e.getCause()), "wrong failure: " + e.getCause()); }
    }
    private static void basic() throws Exception {
        Usage initial = Usage.current();
        for (int size : new int[] {0, 1, 7, 8191, 8192, 8193}) {
            Path path = path();
            byte[] bytes = new byte[size]; new Random(size).nextBytes(bytes);
            try (var pair = Pair.open(); var file = FileChannel.open(path, READ, WRITE)) {
                var sender = new FutureTask<Void>(() -> { send(pair.peer, bytes); pair.peer.shutdownOutput(); return null; });
                Thread peer = start(sender);
                try {
                    check(file.transferFrom(pair.local, 0, size) == size, "content count " + size);
                    sender.get(TIMEOUT, TimeUnit.MILLISECONDS);
                    check(Arrays.equals(Files.readAllBytes(path), bytes), "content " + size);
                    initial.checkSame("success " + size);
                    check(file.transferFrom(pair.local, size, 7) == 0, "EOF");
                    initial.checkSame("EOF");
                } finally { pair.peer.close(); peer.join(TIMEOUT); }
            } finally { Files.delete(path); }
        }
        Path path = path();
        try (var pair = Pair.open(); var file = FileChannel.open(path, WRITE)) {
            pair.local.configureBlocking(false);
            for (int i = 0; i < 16; i++) check(file.transferFrom(pair.local, 0, 8192) == 0, "EAGAIN");
            initial.checkSame("EAGAIN");
        } finally { Files.delete(path); }
        path = path();
        try (var source = SocketChannel.open(); var file = FileChannel.open(path, WRITE)) {
            try { file.transferFrom(source, 0, 1); throw new AssertionError("unconnected read"); }
            catch (NotYetConnectedException expected) { initial.checkSame("unconnected"); }
        } finally { Files.delete(path); }
        cancel(false); cancel(true);
        exhausted(false); exhausted(true);
        fallbackContent();
        if (Platform.isLinux()) {
            try (var pair = Pair.open(); var file = FileChannel.open(Path.of("/dev/full"), WRITE)) {
                send(pair.peer, new byte[] {7}); pair.peer.shutdownOutput();
                try { file.transferFrom(pair.local, 0, 8192); throw new AssertionError("/dev/full succeeded"); }
                catch (IOException expected) { initial.checkSame("write failure"); }
            }
        }
        arbitrary();
        initial.checkSame("basic end");
    }
    private static void cancel(boolean interrupt) throws Exception {
        Usage initial = Usage.current(); Path path = path();
        try (var pair = Pair.open(); var file = FileChannel.open(path, WRITE)) {
            var task = new FutureTask<Long>(() -> file.transferFrom(pair.local, 0, 8191));
            Thread worker = start(task);
            try {
                awaitFrame(worker, virtual ? "sun.nio.ch.SelChImpl" : "sun.nio.ch.SocketDispatcher",
                        virtual ? "park" : "read0");
                Usage active = Usage.current();
                check(active.count == initial.count + 1 && active.capacity == initial.capacity + 8191
                        && active.memory == initial.memory + 8192, "odd-size accounting: " + active);
                if (interrupt) worker.interrupt(); else pair.local.close();
                result(task, interrupt ? ClosedByInterruptException.class : AsynchronousCloseException.class);
                initial.checkSame("cancel");
            } finally { pair.local.close(); worker.join(TIMEOUT); }
        } finally { Files.delete(path); }
    }
    private static void awaitRead(Thread worker) throws Exception {
        awaitFrame(worker, virtual ? "sun.nio.ch.SelChImpl" : "sun.nio.ch.SocketDispatcher",
                virtual ? "park" : "read0");
    }
    private static void exhausted(boolean interrupt) throws Exception {
        Usage initial = Usage.current(); Path heldPath = path(), waitingPath = path();
        try (var held = Pair.open(); var waiting = Pair.open();
             var heldFile = FileChannel.open(heldPath, WRITE);
             var waitingFile = FileChannel.open(waitingPath, WRITE)) {
            var holder = new FutureTask<Long>(() -> heldFile.transferFrom(held.local, 0, 8192));
            Thread holderThread = start(holder);
            boolean[] interrupted = {false};
            var waiter = new FutureTask<Long>(() -> {
                try { return waitingFile.transferFrom(waiting.local, 0, 8191); }
                finally { interrupted[0] = Thread.currentThread().isInterrupted(); }
            });
            Thread waiterThread = null;
            try {
                awaitRead(holderThread);
                Usage reserved = Usage.current();
                check(reserved.capacity == initial.capacity + 8192, "holder reservation");
                waiterThread = start(waiter);
                awaitRead(waiterThread);
                reserved.checkSame("exhausted fallback reached read");
                if (interrupt) waiterThread.interrupt(); else waiting.local.close();
                result(waiter, interrupt ? ClosedByInterruptException.class : AsynchronousCloseException.class);
                if (interrupt) check(interrupted[0], "fallback lost interrupt");
                reserved.checkSame("fallback cancellation");
            } finally {
                held.local.close(); waiting.local.close();
                holderThread.join(TIMEOUT);
                if (waiterThread != null) waiterThread.join(TIMEOUT);
            }
        } finally { Files.delete(heldPath); Files.delete(waitingPath); }
        initial.checkSame("exhausted cancellation cleanup");
    }
    private static void fallbackContent() throws Exception {
        Usage initial = Usage.current(); Path heldPath = path(), target = path();
        byte[] original = new byte[16]; Arrays.fill(original, (byte) 3);
        Files.write(target, original);
        try (var held = Pair.open(); var source = Pair.open();
             var heldFile = FileChannel.open(heldPath, WRITE);
             var file = FileChannel.open(target, READ, WRITE)) {
            var holder = new FutureTask<Long>(() -> heldFile.transferFrom(held.local, 0, 8192));
            Thread holderThread = start(holder);
            Thread worker = null;
            try {
                awaitRead(holderThread);
                Usage reserved = Usage.current();
                file.position(2);
                var transfer = new FutureTask<Long>(() -> file.transferFrom(source.local, 4, 7));
                worker = start(transfer);
                awaitRead(worker);
                reserved.checkSame("fallback content reached read");
                send(source.peer, new byte[] {10, 11, 12, 13, 14, 15, 16, 17});
                check(transfer.get(TIMEOUT, TimeUnit.MILLISECONDS) == 7, "fallback content count");
                check(file.position() == 2, "fallback changed file position");
                byte[] expected = original.clone();
                for (int i = 0; i < 7; i++) expected[4 + i] = (byte) (10 + i);
                check(Arrays.equals(Files.readAllBytes(target), expected), "fallback changed file content");
                var tail = ByteBuffer.allocate(1);
                check(source.local.read(tail) == 1 && tail.get(0) == 17, "fallback overread");
                reserved.checkSame("fallback content cleanup");
                held.local.close(); result(holder, AsynchronousCloseException.class);
                initial.checkSame("released holder");
                // A subsequent transfer may reserve the newly available capacity.
                var recovered = new FutureTask<Long>(() -> file.transferFrom(source.local, 0, 8191));
                worker.join(TIMEOUT); worker = start(recovered);
                awaitRead(worker);
                Usage active = Usage.current();
                check(active.count == initial.count + 1 && active.capacity == initial.capacity + 8191
                        && active.memory == initial.memory + 8192, "native path did not recover: " + active);
                source.local.close(); result(recovered, AsynchronousCloseException.class);
            } finally {
                held.local.close(); source.local.close(); holderThread.join(TIMEOUT);
                if (worker != null) worker.join(TIMEOUT);
            }
        } finally { Files.delete(heldPath); Files.delete(target); }
        initial.checkSame("fallback and recovery end");
    }

    private static void arbitrary() throws Exception {
        Usage initial = Usage.current(); Path path = path(); ByteBuffer[] previous = {null};
        try (var file = FileChannel.open(path, WRITE)) {
            for (int i = 0; i < 2; i++) {
                var source = new ReadableByteChannel() {
                    public int read(ByteBuffer buffer) {
                        check(!buffer.isDirect() && buffer != previous[0], "arbitrary buffer isolation");
                        for (byte b : buffer.array()) check(b == 0, "arbitrary buffer not erased");
                        previous[0] = buffer; buffer.put((byte)7); return 1;
                    }
                    public boolean isOpen() { return true; }
                    public void close() { }
                };
                check(file.transferFrom(source, i, 1) == 1, "arbitrary count");
                initial.checkSame("arbitrary");
            }
            int[] reads = {0};
            var failing = new ReadableByteChannel() {
                public int read(ByteBuffer buffer) throws IOException {
                    if (reads[0]++ == 0) {
                        buffer.put((byte) 11).put((byte) 12);
                        return 2;
                    }
                    throw new IOException("failure after progress");
                }
                public boolean isOpen() { return true; }
                public void close() { }
            };
            file.position(1);
            check(file.transferFrom(failing, 2, 4) == 2, "IOException discarded completed prefix");
            check(reads[0] == 2 && file.position() == 1, "partial failure position/read count");
            check(Arrays.equals(Files.readAllBytes(path), new byte[] {7, 7, 11, 12}),
                    "partial failure content");
            initial.checkSame("partial IOException");
        } finally { Files.delete(path); }
    }
    private static void denied() throws Exception {
        Usage initial = Usage.current(); Path path = path();
        byte[] bytes = new byte[8193]; new Random(23).nextBytes(bytes);
        long start = System.nanoTime();
        try (var pair = Pair.open(); var file = FileChannel.open(path, READ, WRITE)) {
            send(pair.peer, bytes); pair.peer.shutdownOutput();
            check(file.transferFrom(pair.local, 0, 0) == 0, "zero count at zero budget");
            check(file.transferFrom(pair.local, 3, bytes.length) == bytes.length, "zero-budget content count");
            check(file.position() == 0, "zero-budget file position");
            byte[] expected = new byte[bytes.length + 3];
            System.arraycopy(bytes, 0, expected, 3, bytes.length);
            check(Arrays.equals(Files.readAllBytes(path), expected), "zero-budget content");
            check(file.transferFrom(pair.local, 0, 8192) == 0, "zero-budget EOF");
            initial.checkSame("zero-budget transfer");
        } finally { Files.delete(path); }
        path = path();
        try (var pair = Pair.open(); var file = FileChannel.open(path, WRITE)) {
            pair.local.configureBlocking(false);
            for (int i = 0; i < 16; i++)
                check(file.transferFrom(pair.local, 0, 8192) == 0, "zero-budget EAGAIN");
            initial.checkSame("zero-budget EAGAIN");
        } finally { Files.delete(path); }
        System.out.println("Zero-budget content/EOF/16 EAGAIN elapsed ns: " + (System.nanoTime() - start));
        // With no reservation, close/interrupt still cancel the original heap read.
        for (boolean useVirtual : new boolean[] {false, true}) {
            virtual = useVirtual;
            for (boolean interrupt : new boolean[] {false, true}) {
                path = path();
                try (var pair = Pair.open(); var file = FileChannel.open(path, WRITE)) {
                    var transfer = new FutureTask<Long>(() -> file.transferFrom(pair.local, 0, 8192));
                    Thread worker = start(transfer);
                    try {
                        awaitRead(worker); initial.checkSame("zero-budget parked read");
                        if (interrupt) worker.interrupt(); else pair.local.close();
                        result(transfer, interrupt ? ClosedByInterruptException.class : AsynchronousCloseException.class);
                    } finally { pair.local.close(); worker.join(TIMEOUT); }
                } finally { Files.delete(path); }
            }
        }
        // Ordinary user direct allocation must still honor its zero limit.
        try { ByteBuffer.allocateDirect(1); throw new AssertionError("ordinary direct limit ignored"); }
        catch (OutOfMemoryError expected) { initial.checkSame("ordinary direct quota"); }
        // Direct I/O stays on its existing aligned, unmetered staging path.
        // EOF avoids making assumptions about TCP packet/read alignment.
        if (Platform.isLinux() || Platform.isAix()) {
            path = path();
            try (var pair = Pair.open(); var file = openDirect(path)) {
                if (file != null) {
                    pair.peer.shutdownOutput();
                    check(file.transferFrom(pair.local, 0, 8192) == 0, "DIRECT EOF");
                    initial.checkSame("DIRECT exclusion");
                    System.out.println("DIRECT exclusion executed");
                }
            } finally { Files.delete(path); }
        }
        arbitrary();
    }
    private static FileChannel openDirect(Path path) throws IOException {
        try { return FileChannel.open(path, WRITE, ExtendedOpenOption.DIRECT); }
        catch (UnsupportedOperationException e) {
            System.out.println("DIRECT exclusion unexecuted: filesystem does not support DIRECT");
            return null;
        }
    }

    private static void parked(int nativeCount) throws Exception {
        virtual = true;
        var pairs = new ArrayList<Pair>(); var tasks = new ArrayList<FutureTask<Long>>();
        var workers = new ArrayList<Thread>(); Path path = path();
        Usage initial = Usage.current();
        try (var file = FileChannel.open(path, WRITE)) {
            for (int i = 0; i < 128; i++) {
                Pair pair = Pair.open(); pairs.add(pair);
                var task = new FutureTask<Long>(() -> {
                    // A large existing carrier cache entry must never be borrowed.
                    var seed = Util.getTemporaryDirectBuffer(4 * 1024 * 1024);
                    Util.releaseTemporaryDirectBuffer(seed);
                    return file.transferFrom(pair.local, 0, 8192);
                });
                tasks.add(task); workers.add(start(task));
            }
            for (var worker : workers) awaitFrame(worker, "sun.nio.ch.SelChImpl", "park");
            Usage held = Usage.current();
            long capacity = nativeCount * 8192L;
            check(held.count == initial.count + nativeCount && held.capacity == initial.capacity + capacity
                    && held.memory == initial.memory + capacity, "128 exact/fallback reservations: " + held);
            System.out.println("128 verified parked transfers, native=" + nativeCount + ": " + held);
            // Exhaustion must park in socket I/O using heap staging, without quota retry.
            Path waitingPath = path();
            try (var pair = Pair.open(); var waitingFile = FileChannel.open(waitingPath, WRITE)) {
                var waiting = new FutureTask<Long>(() -> waitingFile.transferFrom(pair.local, 0, 7));
                Thread worker = start(waiting);
                try {
                    awaitRead(worker); held.checkSame("129th transfer heap fallback");
                    send(pair.peer, new byte[] {1, 2, 3, 4, 5, 6, 7});
                    check(waiting.get(TIMEOUT, TimeUnit.MILLISECONDS) == 7, "129th fallback count");
                    check(Arrays.equals(Files.readAllBytes(waitingPath), new byte[] {1, 2, 3, 4, 5, 6, 7}),
                            "129th fallback content");
                    held.checkSame("129th fallback cleanup");
                } finally { pair.local.close(); worker.join(TIMEOUT); }
            } finally { Files.delete(waitingPath); }
        } finally {
            for (var pair : pairs) pair.close();
            for (var worker : workers) worker.join(TIMEOUT);
            Files.delete(path);
        }
        initial.checkSame("128 close cleanup");
    }
    private static void reservations() throws Exception {
        Usage initial = Usage.current();
        var access = SharedSecrets.getJavaNioAccess();
        var ready = new CountDownLatch(64); var begin = new CountDownLatch(1);
        var attempted = new CountDownLatch(64); var release = new CountDownLatch(1);
        var tasks = new ArrayList<FutureTask<Boolean>>(); var workers = new ArrayList<Thread>();
        try {
            for (int i = 0; i < 64; i++) {
                var task = new FutureTask<Boolean>(() -> {
                    ready.countDown(); begin.await();
                    boolean reserved = access.tryReserveMemory(8192, 8192);
                    attempted.countDown();
                    try { release.await(); return reserved; }
                    finally { if (reserved) access.unreserveMemory(8192, 8192); }
                });
                tasks.add(task); workers.add(Thread.ofPlatform().start(task));
            }
            check(ready.await(TIMEOUT, TimeUnit.MILLISECONDS), "reservation contenders not ready");
            begin.countDown();
            check(attempted.await(TIMEOUT, TimeUnit.MILLISECONDS), "reservation contenders timed out");
            Usage held = Usage.current();
            check(held.count == initial.count + 8 && held.capacity == initial.capacity + 65536
                    && held.memory == initial.memory + 65536, "concurrent capacity limit: " + held);
            check(!access.tryReserveMemory(1, 1), "exhausted reservation succeeded");
            held.checkSame("unsuccessful reservation accounting");
            try { ByteBuffer.allocateDirect(1); throw new AssertionError("ordinary direct limit ignored"); }
            catch (OutOfMemoryError expected) { held.checkSame("ordinary direct allocation accounting"); }
            release.countDown();
            int successes = 0;
            for (var task : tasks) if (task.get(TIMEOUT, TimeUnit.MILLISECONDS)) successes++;
            check(successes == 8, "wrong successful reservation count: " + successes);
        } finally {
            begin.countDown(); release.countDown();
            for (var worker : workers) worker.join(TIMEOUT);
        }
        initial.checkSame("concurrent reservation cleanup");
        check(access.tryReserveMemory(8192, 8192), "reservation did not recover");
        access.unreserveMemory(8192, 8192);
        initial.checkSame("reservation recovery cleanup");
        // Exercise ordinary direct allocation after the moved limit initialization.
        ByteBuffer buffer = ByteBuffer.allocateDirect(65536);
        check(!access.tryReserveMemory(1, 1), "ordinary allocation did not charge budget");
        jdk.internal.misc.Unsafe.getUnsafe().invokeCleaner(buffer);
        initial.checkSame("ordinary direct cleanup");
    }
    public static void main(String[] args) throws Exception {
        virtual = args.length > 1 && args[1].equals("virtual");
        switch (args[0]) {
            case "basic" -> {
                var task = new FutureTask<Void>(() -> { basic(); return null; });
                Thread worker = start(task);
                try { task.get(8 * TIMEOUT, TimeUnit.MILLISECONDS); }
                finally { worker.interrupt(); worker.join(TIMEOUT); }
            }
            case "denied" -> denied();
            case "parked" -> parked(Integer.parseInt(args[1]));
            case "reservations" -> reservations();
            default -> throw new AssertionError(args[0]);
        }
    }
}
