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
 * @summary Check synchronous TCP and UDP vector contents, bounds and positions
 * @run main/othervm/timeout=120 SynchronousVectorIO
 */

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.DatagramChannel;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.concurrent.TimeUnit;

public class SynchronousVectorIO {
    private static final int GUARD = 5;
    private static final long DEADLINE = System.nanoTime()
            + TimeUnit.SECONDS.toNanos(90);

    public static void main(String[] args) throws Exception {
        for (int count : new int[] {1, 15, 16, 17, 33}) {
            for (boolean direct : new boolean[] {false, true}) {
                tcp(count, direct);
                udp(count, direct);
            }
        }
    }

    private static InetSocketAddress loopback() {
        return new InetSocketAddress(InetAddress.getLoopbackAddress(), 0);
    }

    private static void tcp(int count, boolean direct) throws Exception {
        try (ServerSocketChannel listener = ServerSocketChannel.open()) {
            listener.bind(loopback());
            try (SocketChannel source = SocketChannel.open(listener.getLocalAddress());
                 SocketChannel sink = listener.accept()) {
                source.configureBlocking(false);
                sink.configureBlocking(false);
                ByteBuffer[] src = buffers(count, 257, direct, true);
                ByteBuffer[] dst = buffers(count, 257, direct, false);
                check(sink.read(dst, 1, dst.length - 2) == 0, "empty TCP receive");
                positions(dst, 0);
                check(source.write(src, 1, 0) == 0, "empty TCP write range");
                positions(src, 0);
                long sent = 0, received = 0;
                long total = capacity(src);
                while (received < total) {
                    checkDeadline();
                    if (sent < total) {
                        sent += source.write(src, 1, src.length - 2);
                        positions(src, sent);
                    }
                    long n = sink.read(dst, 1, dst.length - 2);
                    check(n >= 0, "premature TCP EOF");
                    received += n;
                    positions(dst, received);
                    if (n == 0) Thread.sleep(1);
                }
                contents(dst, received);
                source.shutdownOutput();
                ByteBuffer[] eof = buffers(2, 8, direct, false);
                long n;
                do {
                    checkDeadline();
                    n = sink.read(eof, 1, eof.length - 2);
                    if (n == 0) Thread.sleep(1);
                } while (n == 0);
                check(n == -1, "missing TCP EOF");
                positions(eof, 0);
            }
        }
    }

    private static void udp(int count, boolean direct) throws Exception {
        try (DatagramChannel source = DatagramChannel.open();
             DatagramChannel sink = DatagramChannel.open()) {
            source.bind(loopback());
            sink.bind(loopback());
            source.connect(sink.getLocalAddress());
            sink.connect(source.getLocalAddress());
            source.configureBlocking(false);
            sink.configureBlocking(false);
            ByteBuffer[] src = buffers(count, 257, direct, true);
            ByteBuffer[] dst = buffers(count, 257, direct, false);
            check(sink.read(dst, 1, dst.length - 2) == 0, "empty UDP receive");
            positions(dst, 0);
            check(source.write(src, 1, 0) == 0, "empty UDP write range");
            positions(src, 0);
            long sent;
            do {
                checkDeadline();
                sent = source.write(src, 1, src.length - 2);
            } while (sent == 0);
            positions(src, sent);
            long received = receive(sink, dst);
            check(received == sent, "UDP datagram size");
            positions(dst, received);
            contents(dst, received);

            // A scattering receive truncates one datagram and discards its tail.
            ByteBuffer[] large = buffers(2, 257, direct, true);
            while (source.write(large, 1, large.length - 2) == 0) checkDeadline();
            ByteBuffer[] small = buffers(2, 13, direct, false);
            received = receive(sink, small);
            check(received == capacity(small), "UDP truncation size");
            positions(small, received);
            contents(small, received);
            ByteBuffer[] tail = buffers(2, 257, direct, false);
            check(sink.read(tail, 1, tail.length - 2) == 0, "UDP tail not discarded");
            positions(tail, 0);

            ByteBuffer[] oversize = buffers(16, 8192, direct, true);
            try {
                source.write(oversize, 1, oversize.length - 2);
                throw new RuntimeException("Oversized UDP write succeeded");
            } catch (IOException expected) {
                positions(oversize, 0);
            }
        }
    }

    private static long receive(DatagramChannel sink, ByteBuffer[] dst)
            throws Exception {
        long n;
        do {
            checkDeadline();
            n = sink.read(dst, 1, dst.length - 2);
            if (n == 0) Thread.sleep(1);
        } while (n == 0);
        return n;
    }

    private static ByteBuffer[] buffers(int count, int size, boolean direct,
                                        boolean fill) {
        // Empty entries surround each nonempty entry. Nonempty guards outside
        // the selected range also check offset/length handling.
        ByteBuffer[] bufs = new ByteBuffer[2 * count + 2];
        int offset = 0;
        for (int i = 0; i < bufs.length; i++) {
            int n = i == 0 || i == bufs.length - 1 || i % 2 == 1 ? 0 : size;
            if (i == 0 || i == bufs.length - 1) n = 3;
            ByteBuffer b = direct && i % 3 != 0
                    ? ByteBuffer.allocateDirect(n + 2 * GUARD)
                    : ByteBuffer.allocate(n + 2 * GUARD);
            for (int j = 0; j < b.capacity(); j++) b.put(j, (byte) 0x5a);
            b.position(GUARD).limit(GUARD + n);
            if (i > 0 && i < bufs.length - 1) {
                if (fill) {
                    for (int j = 0; j < n; j++) b.put(GUARD + j, value(offset + j));
                }
                offset += n;
            }
            bufs[i] = b;
        }
        return bufs;
    }

    private static long capacity(ByteBuffer[] bufs) {
        long n = 0;
        for (int i = 1; i < bufs.length - 1; i++) n += bufs[i].limit() - GUARD;
        return n;
    }

    private static void positions(ByteBuffer[] bufs, long transferred) {
        for (int i = 0; i < bufs.length; i++) {
            ByteBuffer b = bufs[i];
            int n = i == 0 || i == bufs.length - 1 ? 0
                    : (int) Math.min(transferred, b.limit() - GUARD);
            check(b.position() == GUARD + n, "vector position " + i);
            transferred -= n;
            ByteBuffer all = b.duplicate().clear();
            if (i == 0 || i == bufs.length - 1) {
                for (int j = GUARD; j < b.limit(); j++) {
                    check(b.get(j) == (byte) 0x5a, "unselected buffer");
                }
            }
            for (int j = 0; j < GUARD; j++) {
                check(all.get(j) == (byte) 0x5a
                        && all.get(b.limit() + j) == (byte) 0x5a, "buffer guard");
            }
        }
        check(transferred == 0, "excess transfer count");
    }

    private static void contents(ByteBuffer[] bufs, long received) {
        int offset = 0;
        for (int i = 1; i < bufs.length - 1; i++) {
            ByteBuffer b = bufs[i];
            for (int j = GUARD; j < b.position(); j++) {
                check(b.get(j) == value(offset++), "content at " + (offset - 1));
            }
        }
        check(offset == received, "content length");
    }

    private static byte value(int offset) {
        return (byte) (offset ^ (offset >>> 8) ^ (offset >>> 16));
    }

    private static void checkDeadline() {
        check(System.nanoTime() - DEADLINE < 0, "vector test timed out");
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new RuntimeException(message);
    }
}
