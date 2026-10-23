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
 * @summary Datagram receive semantics with empty, small and oversized buffers
 * @library /test/lib
 * @run main/othervm ReceiveBufferSize platform
 * @run main/othervm -Djdk.virtualThreadScheduler.parallelism=2 ReceiveBufferSize virtual
 * @run main/othervm -Djava.net.preferIPv4Stack=true ReceiveBufferSize virtual
 */

import java.lang.foreign.Arena;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ProtocolFamily;
import java.net.SocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.AsynchronousCloseException;
import java.nio.channels.ClosedByInterruptException;
import java.nio.channels.ClosedChannelException;
import java.nio.channels.DatagramChannel;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import jdk.test.lib.net.IPSupport;
import jdk.test.lib.Utils;

import static java.net.StandardProtocolFamily.INET;
import static java.net.StandardProtocolFamily.INET6;
import static java.net.StandardSocketOptions.SO_RCVBUF;
import static java.net.StandardSocketOptions.SO_SNDBUF;

public class ReceiveBufferSize {
    private static final int[] SIZES = { 0, 1, 1024, 65535, 65536, 65537, 4 * 1024 * 1024 };
    private static final byte GUARD = 99;
    private static final long TIMEOUT = Utils.adjustTimeout(10_000);
    private static boolean virtual;

    public static void main(String[] args) throws Exception {
        virtual = args[0].equals("virtual");
        var task = new FutureTask<Void>(() -> {
            if (IPSupport.hasIPv4()) {
                test(INET, InetAddress.getByName("127.0.0.1"),
                        IPSupport.getMaxUDPSendBufSizeIPv4());
            }
            if (IPSupport.hasIPv6()) {
                test(INET6, InetAddress.getByName("::1"),
                        IPSupport.getMaxUDPSendBufSizeIPv6());
            }
            return null;
        });
        Thread worker = start(task);
        try {
            task.get(9 * TIMEOUT, TimeUnit.MILLISECONDS);
        } finally {
            worker.interrupt();
            worker.join(TIMEOUT);
        }
    }

    private static Thread start(Runnable action) {
        return (virtual ? Thread.ofVirtual() : Thread.ofPlatform()).start(action);
    }

    private static DatagramChannel open(ProtocolFamily family, InetAddress host) throws Exception {
        return DatagramChannel.open(family).bind(new InetSocketAddress(host, 0));
    }

    private static void test(ProtocolFamily family, InetAddress host, int maxPacket) throws Exception {
        System.out.println("Testing " + family + " virtual=" + virtual);
        for (boolean blocking : new boolean[] { false, true }) {
            for (boolean connected : new boolean[] { false, true }) {
                try (var receiver = open(family, host);
                     var sender = open(family, host);
                     var other = open(family, host)) {
                    receiver.setOption(SO_RCVBUF, 256 * 1024);
                    sender.setOption(SO_SNDBUF, 256 * 1024);
                    other.setOption(SO_SNDBUF, 256 * 1024);
                    receiver.configureBlocking(blocking);
                    if (connected) receiver.connect(sender.getLocalAddress());
                    SocketAddress previous = null;
                    for (int size : SIZES) {
                        for (boolean direct : new boolean[] { false, true }) {
                            // Alternate exact-capacity buffers and sliced buffers with
                            // nonzero position, a reduced limit, and surrounding guards.
                            for (int offset : new int[] { 0, 7 }) {
                                var backing = direct ? ByteBuffer.allocateDirect(size + 3 * offset)
                                                     : ByteBuffer.allocate(size + 3 * offset);
                                var dst = offset == 0 ? backing : backing.position(offset).slice();
                                for (int length : new int[] { 0, 1, 1024, maxPacket }) {
                                    for (int i = 0; i < dst.capacity(); i++) dst.put(i, GUARD);
                                    dst.position(offset).limit(offset + size);
                                    dst.mark();
                                    var source = !connected && length == 1024 ? other : sender;
                                    var packet = ByteBuffer.allocateDirect(length);
                                    for (int i = 0; i < length; i++) packet.put(i, value(i));
                                    check(source.send(packet, receiver.getLocalAddress()) == length,
                                            "send length");
                                    SocketAddress address = receive(receiver, dst);
                                    check(address.equals(source.getLocalAddress()), "sender: " + address);
                                    if (address.equals(previous)) check(address == previous, "cached sender");
                                    previous = address;
                                    int copied = Math.min(size, length);
                                    check(dst.position() == offset + copied, "position");
                                    check(dst.limit() == offset + size, "limit");
                                    dst.reset();
                                    check(dst.position() == offset, "mark");
                                    dst.clear();
                                    for (int i = 0; i < dst.capacity(); i++) {
                                        byte expected = i >= offset && i < offset + copied
                                                ? value(i - offset) : GUARD;
                                        if (dst.get(i) != expected)
                                            throw new AssertionError("content/guard at " + i);
                                    }
                                    // Truncated and zero-capacity receives must consume
                                    // the whole datagram, including an empty datagram.
                                    receiver.configureBlocking(false);
                                    check(receiver.receive(ByteBuffer.allocate(1)) == null, "packet tail");
                                    receiver.configureBlocking(blocking);
                                }
                            }
                        }
                    }
                }
            }
        }
        implicitBind(family);
        exceptions(family, host);
        for (int size : new int[] { 0, 4 * 1024 * 1024 }) {
            for (int length : new int[] { 0, 1 }) waitingReceive(family, host, size, length);
            cancelReceive(family, host, size, false);
            cancelReceive(family, host, size, true);
        }
    }

    private static byte value(int index) {
        return (byte) (index * 31 + 7);
    }

    private static SocketAddress receive(DatagramChannel receiver, ByteBuffer dst) throws Exception {
        long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(TIMEOUT);
        SocketAddress address;
        while ((address = receiver.receive(dst)) == null) {
            check(System.nanoTime() < deadline, "receive timeout");
            Thread.sleep(1);
        }
        return address;
    }

    private static void implicitBind(ProtocolFamily family) throws Exception {
        try (var receiver = DatagramChannel.open(family)) {
            receiver.configureBlocking(false);
            check(receiver.getLocalAddress() == null, "initially unbound");
            check(receiver.receive(ByteBuffer.allocate(4 * 1024 * 1024)) == null, "unbound receive");
            check(receiver.getLocalAddress() != null, "implicit bind");
        }
    }

    private static void exceptions(ProtocolFamily family, InetAddress host) throws Exception {
        try (var receiver = open(family, host); var sender = open(family, host)) {
            receiver.configureBlocking(false);
            expect(NullPointerException.class, () -> receiver.receive(null));
            expect(IllegalArgumentException.class,
                    () -> receiver.receive(ByteBuffer.allocate(4 * 1024 * 1024).asReadOnlyBuffer()));
            ByteBuffer closed;
            try (var arena = Arena.ofConfined()) {
                closed = arena.allocate(128).asByteBuffer();
            }
            sender.send(ByteBuffer.allocateDirect(1), receiver.getLocalAddress());
            expect(IllegalStateException.class, () -> receiver.receive(closed));
            check(receive(receiver, ByteBuffer.allocate(1)).equals(sender.getLocalAddress()),
                    "scope exception consumed packet");
            receiver.close();
            expect(ClosedChannelException.class,
                    () -> receiver.receive(ByteBuffer.allocate(4 * 1024 * 1024)));
        }
    }

    private static void waitingReceive(ProtocolFamily family, InetAddress host, int size, int length)
            throws Exception {
        try (var receiver = open(family, host); var sender = open(family, host)) {
            var dst = ByteBuffer.allocate(size);
            var entered = new CountDownLatch(1);
            var task = new FutureTask<SocketAddress>(() -> {
                entered.countDown();
                return receiver.receive(dst);
            });
            Thread worker = start(task);
            try {
                check(entered.await(TIMEOUT, TimeUnit.MILLISECONDS), "worker start timeout");
                expectWaiting(task);
                sender.send(ByteBuffer.allocateDirect(length), receiver.getLocalAddress());
                check(task.get(TIMEOUT, TimeUnit.MILLISECONDS).equals(sender.getLocalAddress()), "waiting sender");
                check(dst.position() == Math.min(size, length) && dst.limit() == size, "waiting buffer");
            } finally {
                receiver.close();
                worker.join(TIMEOUT);
            }
        }
    }

    private static void cancelReceive(ProtocolFamily family, InetAddress host, int size, boolean interrupt)
            throws Exception {
        try (var receiver = open(family, host)) {
            var entered = new CountDownLatch(1);
            var task = new FutureTask<SocketAddress>(() -> {
                entered.countDown();
                return receiver.receive(ByteBuffer.allocate(size));
            });
            Thread worker = start(task);
            try {
                check(entered.await(TIMEOUT, TimeUnit.MILLISECONDS), "worker start timeout");
                expectWaiting(task);
                if (interrupt) worker.interrupt(); else receiver.close();
                try {
                    task.get(TIMEOUT, TimeUnit.MILLISECONDS);
                    throw new AssertionError("receive completed normally");
                } catch (ExecutionException e) {
                    Class<?> expected = interrupt ? ClosedByInterruptException.class
                                                  : AsynchronousCloseException.class;
                    check(expected.isInstance(e.getCause()), "cancel exception: " + e.getCause());
                }
            } finally {
                receiver.close();
                worker.join(TIMEOUT);
            }
        }
    }

    private static void expectWaiting(FutureTask<?> task) throws Exception {
        try {
            task.get(Utils.adjustTimeout(100), TimeUnit.MILLISECONDS);
            throw new AssertionError("receive did not wait for a datagram");
        } catch (TimeoutException expected) { }
    }

    private interface Action { void run() throws Exception; }

    private static void expect(Class<? extends Exception> type, Action action) throws Exception {
        try {
            action.run();
            throw new AssertionError("missing " + type.getName());
        } catch (Exception e) {
            if (!type.isInstance(e)) throw e;
        }
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
