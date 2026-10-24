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
 */

/*
 * @test id=platform
 * @summary Exercise compact vectors, sparse traversal, partial I/O and scope cleanup
 * @modules java.base/sun.nio.ch:open
 * @run main/othervm LargeVectorIO platform
 */

/*
 * @test id=virtual
 * @summary Exercise compact vectors and scope cleanup from a virtual thread
 * @requires vm.continuations
 * @modules java.base/sun.nio.ch:open
 * @run main/othervm -Djdk.virtualThreadScheduler.parallelism=2 LargeVectorIO virtual
 */

import java.io.ByteArrayOutputStream;
import java.lang.foreign.Arena;
import java.lang.reflect.Field;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.AsynchronousServerSocketChannel;
import java.nio.channels.AsynchronousSocketChannel;
import java.nio.channels.CompletionHandler;
import java.nio.channels.FileChannel;
import java.nio.channels.Pipe;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;

import static java.nio.file.StandardOpenOption.READ;
import static java.nio.file.StandardOpenOption.WRITE;

public class LargeVectorIO {
    private static final int MAX;
    private static int cases;

    static {
        try {
            Field f = Class.forName("sun.nio.ch.IOUtil").getDeclaredField("IOV_MAX");
            f.setAccessible(true);
            MAX = f.getInt(null);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static void check(boolean ok, String message) {
        if (!ok) throw new AssertionError(message);
    }

    private static final class Buffers {
        final ByteBuffer[] array;
        final byte[][] before;
        final int[] positions;
        final int length;

        Buffers(int length, int kind, int pattern, int bytes) {
            this.length = length;
            array = new ByteBuffer[length + 4];
            before = new byte[array.length][];
            positions = new int[array.length];
            for (int i = 0; i < array.length; i++) {
                int index = i - 2;
                boolean selected = index >= 0 && index < length;
                boolean active = selected && switch (pattern) {
                    case 0 -> false;
                    case 1 -> true;
                    // The first active entry is beyond the allocation cap.
                    case 2 -> index >= MAX && (index == MAX || index == length - 1);
                    default -> throw new AssertionError();
                };
                int capacity = active ? bytes + 4 : 4;
                ByteBuffer b = (kind == 1 || kind == 2 && i % 2 == 0)
                        ? ByteBuffer.allocateDirect(capacity) : ByteBuffer.allocate(capacity);
                before[i] = new byte[capacity];
                for (int j = 0; j < capacity; j++) {
                    byte value = (byte) (i * 31 + j);
                    b.put(j, value);
                    before[i][j] = value;
                }
                positions[i] = 2;
                b.position(2).limit(active ? capacity - 2 : 2);
                array[i] = b;
            }
        }

        byte[] contents(int maxEntries) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            int entries = 0;
            for (int i = 2; i < length + 2; i++) {
                ByteBuffer b = array[i].duplicate();
                if (b.hasRemaining() && entries++ == maxEntries) break;
                while (b.hasRemaining()) out.write(b.get());
            }
            return out.toByteArray();
        }

        Buffers destination() {
            // Distinguish copied bytes from the initial contents, including short reads.
            for (int i = 2; i < length + 2; i++) {
                ByteBuffer b = array[i];
                for (int j = b.position(); j < b.limit(); j++) {
                    before[i][j] = (byte) ~before[i][j];
                    b.put(j, before[i][j]);
                }
            }
            return this;
        }

        void verify(long transferred, byte[] readBytes) {
            int left = (int) Math.max(0, transferred);
            int at = 0;
            for (int i = 0; i < array.length; i++) {
                ByteBuffer b = array[i];
                int limit = before[i].length == 4 ? 2 : before[i].length - 2;
                int n = (i >= 2 && i < length + 2) ? Math.min(left, limit - 2) : 0;
                check(b.position() == positions[i] + n && b.limit() == limit, "position/limit " + i);
                ByteBuffer all = b.duplicate().clear();
                for (int j = 0; j < all.capacity(); j++) {
                    byte expected = readBytes != null && j >= 2 && j < 2 + n
                            ? readBytes[at + j - 2] : before[i][j];
                    check(all.get(j) == expected, "content/guard " + i + ":" + j);
                }
                left -= n;
                at += n;
            }
            check(left == 0, "unaccounted transfer");
            cases++;
        }
    }

    private static void files() throws Exception {
        Path path = Files.createTempFile("large-vector", ".bin");
        try (FileChannel channel = FileChannel.open(path, READ, WRITE)) {
            for (int length : new int[] {0, 1, MAX - 1, MAX, MAX + 1, 2 * MAX + 17, 100_000}) {
                for (int kind = 0; kind < 3; kind++) {
                    for (int pattern = 0; pattern < 3; pattern++) {
                        Buffers src = new Buffers(length, kind, pattern, 4);
                        byte[] expected = src.contents(MAX);
                        channel.truncate(0).position(0);
                        long n = channel.write(src.array, 2, length);
                        check(n == expected.length && channel.position() == n, "file gather count");
                        src.verify(n, null);
                        check(Arrays.equals(Files.readAllBytes(path), expected), "file gather bytes");

                        // A short file ends part way through the last submitted entry.
                        int amount = Math.max(0, expected.length - 1);
                        channel.truncate(amount).position(0);
                        Buffers dst = new Buffers(length, kind, pattern, 4).destination();
                        n = channel.read(dst.array, 2, length);
                        check(n == (expected.length == 0 ? 0 : amount == 0 ? -1 : amount), "file scatter count");
                        check(channel.position() == amount, "file scatter offset");
                        dst.verify(n, expected);
                    }
                }
            }
        } finally {
            Files.delete(path);
        }
    }

    private static void nonblockingPipe() throws Exception {
        Pipe pipe = Pipe.open();
        try (var sink = pipe.sink(); var source = pipe.source()) {
            sink.configureBlocking(false);
            source.configureBlocking(false);
            ByteArrayOutputStream sent = new ByteArrayOutputStream();
            boolean partial = false;
            boolean unavailable = false;
            // Bound this check even on systems with unusually large pipe capacity.
            for (int attempt = 0; attempt < 64; attempt++) {
                Buffers src = new Buffers(MAX + 2, attempt % 3, 2, 512 * 1024);
                byte[] bytes = src.contents(MAX);
                long n = sink.write(src.array, 2, src.length);
                check(n >= 0 && n <= bytes.length, "pipe write count");
                src.verify(n, null);
                sent.write(bytes, 0, (int) n);
                partial |= n > 0 && n < bytes.length;
                if (n == 0) {
                    unavailable = true;
                    break;
                }
            }
            // Pipe capacity and atomic-write policy are platform dependent. Check
            // every result, without requiring a particular host capacity.
            ByteBuffer received = ByteBuffer.allocate(sent.size());
            source.configureBlocking(true);
            while (received.hasRemaining()) check(source.read(received) > 0, "pipe drain");
            source.configureBlocking(false);
            check(Arrays.equals(sent.toByteArray(), received.array()), "partial write contents");
            Buffers dst = new Buffers(2 * MAX + 17, 2, 2, 8).destination();
            long n = source.read(dst.array, 2, dst.length);
            check(n == 0, "nonblocking empty pipe read");
            dst.verify(n, new byte[0]);
            System.out.println("pipe partial=" + partial + " EAGAIN=" + unavailable + " bytes=" + sent.size());
        }
    }

    private static InetSocketAddress loopback() {
        return new InetSocketAddress(InetAddress.getLoopbackAddress(), 0);
    }

    private static void socket() throws Exception {
        try (ServerSocketChannel listener = ServerSocketChannel.open()) {
            listener.bind(loopback());
            try (SocketChannel client = SocketChannel.open(listener.getLocalAddress());
                 SocketChannel peer = listener.accept()) {
                Buffers src = new Buffers(2 * MAX + 17, 2, 2, 4);
                byte[] bytes = src.contents(MAX);
                // Delay the sender so a virtual-thread scatter can park before data arrives.
                CompletableFuture<Void> sender = new CompletableFuture<>();
                Thread worker = Thread.ofPlatform().start(() -> {
                    try {
                        Thread.sleep(50);
                        while (Arrays.stream(src.array).anyMatch(ByteBuffer::hasRemaining)) {
                            client.write(src.array, 2, src.length);
                        }
                        client.shutdownOutput();
                        sender.complete(null);
                    } catch (Throwable e) {
                        sender.completeExceptionally(e);
                    }
                });
                Buffers dst = new Buffers(src.length, 2, 2, 4).destination();
                long total = 0;
                long n;
                while ((n = peer.read(dst.array, 2, dst.length)) > 0) total += n;
                check(total == bytes.length, "socket byte count");
                dst.verify(total, bytes);
                sender.get(30, TimeUnit.SECONDS);
                worker.join();
                src.verify(bytes.length, null);
            }
        }
    }

    private static final CompletionHandler<Long, CompletableFuture<Long>> HANDLER = new CompletionHandler<>() {
        public void completed(Long n, CompletableFuture<Long> result) { result.complete(n); }
        public void failed(Throwable e, CompletableFuture<Long> result) { result.completeExceptionally(e); }
    };

    private static long async(AsynchronousSocketChannel ch, ByteBuffer[] a, boolean read) throws Exception {
        CompletableFuture<Long> result = new CompletableFuture<>();
        if (read) ch.read(a, 2, a.length - 4, 30, TimeUnit.SECONDS, result, HANDLER);
        else ch.write(a, 2, a.length - 4, 30, TimeUnit.SECONDS, result, HANDLER);
        return result.get(30, TimeUnit.SECONDS);
    }

    private static void asyncSocket() throws Exception {
        // Windows uses a separate implementation that truncates the caller array
        // before compaction and does not call these IOUtil vector methods.
        if (System.getProperty("os.name").startsWith("Windows")) return;
        try (AsynchronousServerSocketChannel listener = AsynchronousServerSocketChannel.open()) {
            listener.bind(loopback());
            var accepted = listener.accept();
            try (AsynchronousSocketChannel client = AsynchronousSocketChannel.open()) {
                client.connect(listener.getLocalAddress()).get(30, TimeUnit.SECONDS);
                try (AsynchronousSocketChannel peer = accepted.get(30, TimeUnit.SECONDS);
                     Arena arena = Arena.ofShared()) {
                    Buffers src = new Buffers(2 * MAX + 17, 2, 2, 4);
                    Buffers dst = new Buffers(src.length, 2, 2, 4).destination();
                    // Shared-session native buffers also exercise the asynchronous scope path.
                    ByteBuffer shared = arena.allocate(8).asByteBuffer();
                    shared.put(src.array[MAX + 2].duplicate().clear()).position(2).limit(6);
                    src.array[MAX + 2] = shared;
                    ByteBuffer sharedDst = arena.allocate(8).asByteBuffer();
                    sharedDst.put(dst.array[MAX + 2].duplicate().clear()).position(2).limit(6);
                    dst.array[MAX + 2] = sharedDst;
                    byte[] bytes = src.contents(MAX);
                    CompletableFuture<Long> read = new CompletableFuture<>();
                    peer.read(dst.array, 2, dst.length, 30, TimeUnit.SECONDS, read, HANDLER);
                    long written = 0;
                    while (written < bytes.length) {
                        long n = async(client, src.array, false);
                        check(n > 0, "async write made no progress");
                        written += n;
                    }
                    long received = read.get(30, TimeUnit.SECONDS);
                    while (received < bytes.length) {
                        long n = async(peer, dst.array, true);
                        check(n > 0, "async read made no progress");
                        received += n;
                    }
                    dst.verify(received, bytes);
                    src.verify(written, null);
                    Buffers empty = new Buffers(src.length, 0, 0, 4);
                    check(async(client, empty.array, false) == 0, "async empty gather");
                    check(async(peer, empty.array, true) == 0, "async empty scatter");
                    empty.verify(0, null);
                    try (Arena confined = Arena.ofConfined()) {
                        empty.array[MAX + 2] = confined.allocate(1).asByteBuffer();
                        for (boolean reading : new boolean[] {false, true}) {
                            try {
                                async(reading ? peer : client, empty.array, reading);
                                throw new AssertionError("async confined accepted");
                            } catch (IllegalArgumentException expected) { }
                        }
                    }
                }
            }
        }
    }

    private static void scopes() throws Exception {
        Path path = Files.createTempFile("vector-scopes", ".bin");
        try (FileChannel channel = FileChannel.open(path, READ, WRITE)) {
            for (boolean read : new boolean[] {false, true}) {
                for (int failure = 0; failure < 3; failure++) {
                    try (Arena shared = Arena.ofShared(); Arena confined = Arena.ofConfined()) {
                        Arena closed = Arena.ofShared();
                        ByteBuffer dead = closed.allocate(1).asByteBuffer();
                        closed.close();
                        Buffers b = new Buffers(2 * MAX + 17, 0, 0, 4);
                        b.array[2] = shared.allocate(1).asByteBuffer();
                        b.array[MAX + 2] = confined.allocate(1).asByteBuffer();
                        b.array[b.length + 1] = switch (failure) {
                            case 0 -> dead;
                            case 1 -> null;
                            default -> ByteBuffer.allocate(1).asReadOnlyBuffer();
                        };
                        boolean rejected = false;
                        try {
                            if (read) channel.read(b.array, 2, b.length);
                            else channel.write(b.array, 2, b.length);
                        } catch (IllegalStateException | NullPointerException | IllegalArgumentException expected) {
                            rejected = true;
                        }
                        check(rejected == (read || failure != 2), "scope/readonly rejection");
                        // Arena.close below checks that every acquired session was released.
                        cases++;
                    }
                }
            }
        } finally {
            Files.delete(path);
        }
    }

    public static void main(String[] args) throws Exception {
        Runnable action = () -> {
            try {
                files();
                nonblockingPipe();
                socket();
                asyncSocket();
                scopes();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        };
        CompletableFuture<Void> result = new CompletableFuture<>();
        Runnable checked = () -> {
            try { action.run(); result.complete(null); }
            catch (Throwable e) { result.completeExceptionally(e); }
        };
        Thread worker = args[0].equals("virtual")
                ? Thread.ofVirtual().start(checked) : Thread.ofPlatform().start(checked);
        result.get(120, TimeUnit.SECONDS);
        worker.join();
        System.out.println("PASS mode=" + args[0] + " IOV_MAX=" + MAX + " cases=" + cases);
    }
}
