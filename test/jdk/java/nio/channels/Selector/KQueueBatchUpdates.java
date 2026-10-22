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
 * @summary Exercise more than one kqueue registration batch and datagram socket reset ordering
 * @requires os.family == "mac"
 * @run main/othervm KQueueBatchUpdates
 */

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.DatagramChannel;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class KQueueBatchUpdates {
    private static final int COUNT = 137;
    private static final int BOTH = SelectionKey.OP_READ | SelectionKey.OP_WRITE;

    public static void main(String[] args) throws Exception {
        for (int round = 0; round < 3; round++) mixedFilters();
        datagramReset();
    }

    private static void mixedFilters() throws Exception {
        List<SocketChannel> channels = new ArrayList<>();
        List<SocketChannel> peers = new ArrayList<>();
        try (Selector selector = Selector.open();
             ServerSocketChannel server = ServerSocketChannel.open()) {
            server.bind(new InetSocketAddress(InetAddress.getLoopbackAddress(), 0));
            for (int i = 0; i < COUNT; i++) {
                SocketChannel channel = SocketChannel.open(server.getLocalAddress());
                channels.add(channel);
                peers.add(server.accept());
                channel.configureBlocking(false);
                channel.register(selector, 0, i);
            }
            selector.selectNow();
            for (int round = 0; round < 3; round++) {
                int[] ready = new int[COUNT];
                for (int i = 0; i < COUNT; i++) {
                    channels.get(i).keyFor(selector).interestOps(BOTH);
                    peers.get(i).write(ByteBuffer.wrap(new byte[] { 1 }));
                }
                int completed = 0;
                long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(20);
                while (completed != COUNT && System.nanoTime() < deadline) {
                    selector.select(100);
                    for (SelectionKey key : selector.selectedKeys()) {
                        int index = (int) key.attachment();
                        int previous = ready[index];
                        ready[index] |= key.readyOps();
                        if (key.isReadable()) {
                            channels.get(index).read(ByteBuffer.allocate(1));
                        }
                        if (previous != BOTH && ready[index] == BOTH) {
                            completed++;
                            key.interestOps(0);
                        }
                    }
                    selector.selectedKeys().clear();
                }
                if (completed != COUNT) throw new AssertionError("Missing mixed-filter readiness");
                selector.selectNow();
            }
            // Cancellation must follow all queued updates before descriptors can be reused.
            for (SocketChannel channel : channels) {
                SelectionKey key = channel.keyFor(selector);
                key.interestOps(BOTH);
                key.cancel();
                channel.close();
            }
            selector.selectNow();
            if (!selector.keys().isEmpty()) throw new AssertionError("Cancellation incomplete");
            selector.wakeup().wakeup();
            selector.select();
        } finally {
            for (SocketChannel channel : channels) channel.close();
            for (SocketChannel peer : peers) peer.close();
        }
    }

    private static void datagramReset() throws Exception {
        var loopback = InetAddress.getLoopbackAddress();
        try (Selector selector = Selector.open();
             DatagramChannel channel = DatagramChannel.open();
             DatagramChannel peer = DatagramChannel.open()) {
            channel.bind(new InetSocketAddress(loopback, 0));
            peer.bind(new InetSocketAddress(loopback, 0));
            var destination = channel.getLocalAddress();
            channel.connect(peer.getLocalAddress());
            channel.configureBlocking(false);
            SelectionKey key = channel.register(selector, SelectionKey.OP_READ);
            selector.selectNow();
            // Leave the zero-interest update pending while disconnect replaces the socket.
            key.interestOps(0);
            channel.disconnect();
            selector.selectNow();
            key.interestOps(SelectionKey.OP_READ);
            peer.send(ByteBuffer.wrap(new byte[] { 42 }), destination);
            long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(20);
            while (selector.select(100) == 0 && System.nanoTime() < deadline) { }
            if (!key.isReadable()) throw new AssertionError("Lost read interest after disconnect");
            ByteBuffer data = ByteBuffer.allocate(1);
            if (channel.receive(data) == null || data.get(0) != 42) {
                throw new AssertionError("Datagram not received");
            }
        }
    }
}
