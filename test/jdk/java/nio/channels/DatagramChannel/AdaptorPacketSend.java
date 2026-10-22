/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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
 * @summary Datagram socket packet sends preserve destinations across reuse and channel operations
 * @library /test/lib
 * @run main/othervm AdaptorPacketSend
 * @run main/othervm -Djava.net.preferIPv4Stack=true AdaptorPacketSend
 * @run main/othervm -Djava.net.preferIPv6Addresses=true AdaptorPacketSend
 */

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ProtocolFamily;
import java.net.SocketException;
import java.nio.ByteBuffer;
import java.nio.channels.DatagramChannel;
import java.nio.channels.IllegalBlockingModeException;
import java.nio.channels.UnsupportedAddressTypeException;
import java.util.Arrays;

import jdk.test.lib.Utils;
import jdk.test.lib.net.IPSupport;

import static java.net.StandardProtocolFamily.INET;
import static java.net.StandardProtocolFamily.INET6;
import static jdk.test.lib.Asserts.*;

public class AdaptorPacketSend {
    private static final int TIMEOUT = (int) Utils.adjustTimeout(5_000);
    private static final byte GUARD = 0x5a;

    public static void main(String[] args) throws Exception {
        IPSupport.throwSkippedExceptionIfNonOperational();
        if (IPSupport.hasIPv4()) {
            test(INET, InetAddress.getByName("127.0.0.1"));
            testPreflight();
        }
        if (IPSupport.hasIPv6()) test(INET6, InetAddress.getByName("::1"));
        if (IPSupport.hasIPv4() && IPSupport.hasIPv6()) testDefaultChannel();
    }

    private static void test(ProtocolFamily family, InetAddress loopback) throws Exception {
        System.out.println("Testing " + family);
        try (var sender = DatagramChannel.open(family);
             var first = DatagramChannel.open(family);
             var second = DatagramChannel.open(family)) {
            sender.bind(new InetSocketAddress(loopback, 0));
            first.bind(new InetSocketAddress(loopback, 0));
            second.bind(new InetSocketAddress(loopback, 0));
            first.socket().setSoTimeout(TIMEOUT);
            second.socket().setSoTimeout(TIMEOUT);
            var socket = sender.socket();
            var a = (InetSocketAddress) first.getLocalAddress();
            var b = (InetSocketAddress) second.getLocalAddress();
            byte[] data = new byte[32];
            Arrays.fill(data, GUARD);
            for (int i = 5; i < 16; i++) data[i] = (byte) i;
            var packet = new DatagramPacket(data, 5, 11);

            expect(IllegalArgumentException.class, () -> socket.send(packet));
            packet.setSocketAddress(a);
            repeat(socket, first.socket(), packet);

            packet.setPort(b.getPort());
            repeat(socket, second.socket(), packet);
            packet.setAddress(InetAddress.getByAddress(loopback.getAddress()));
            repeat(socket, second.socket(), packet);
            packet.setSocketAddress(a);
            repeat(socket, first.socket(), packet);

            // A direct channel send replaces the target used by the adaptor.
            sender.send(ByteBuffer.wrap(data, 5, 11), b);
            receive(second.socket(), packet);
            repeat(socket, first.socket(), packet);

            packet.setPort(0);
            expect(SocketException.class, () -> socket.send(packet));
            packet.setSocketAddress(a);
            repeat(socket, first.socket(), packet);

            if (family == INET) {
                packet.setAddress(InetAddress.getByName("::1"));
                expect(UnsupportedAddressTypeException.class, () -> socket.send(packet));
                packet.setSocketAddress(a);
                repeat(socket, first.socket(), packet);
            }

            sender.connect(a);
            var implicit = new DatagramPacket(data, 5, 11);
            exchange(socket, first.socket(), implicit);
            assertEquals(implicit.getSocketAddress(), a);
            repeat(socket, first.socket(), implicit);
            packet.setSocketAddress(b);
            expect(IllegalArgumentException.class, () -> socket.send(packet));
            packet.setSocketAddress(a);
            repeat(socket, first.socket(), packet);
            sender.disconnect();
            packet.setSocketAddress(b);
            repeat(socket, second.socket(), packet);

            packet.setLength(0);
            exchange(socket, second.socket(), packet);
            packet.setData(new byte[] {1, 2, 3, 4, 5}, 1, 3);
            repeat(socket, second.socket(), packet);

            sender.configureBlocking(false);
            expect(IllegalBlockingModeException.class, () -> socket.send(packet));
            sender.configureBlocking(true);
            repeat(socket, second.socket(), packet);
            sender.close();
            expect(SocketException.class, () -> socket.send(packet));
        }
    }

    private static void testPreflight() throws Exception {
        try (var sender = DatagramChannel.open(INET);
             var receiver = DatagramChannel.open(INET)) {
            receiver.bind(new InetSocketAddress(InetAddress.getByName("127.0.0.1"), 0));
            receiver.socket().setSoTimeout(TIMEOUT);
            var packet = new DatagramPacket(new byte[] {42}, 1,
                    InetAddress.getByName("::1"), receiver.socket().getLocalPort());

            // Address validation precedes binding and the interrupt hook.
            Thread.currentThread().interrupt();
            try {
                expect(UnsupportedAddressTypeException.class, () -> sender.socket().send(packet));
            } finally {
                assertTrue(Thread.interrupted(), "address check consumed interrupt status");
            }
            assertTrue(sender.isOpen());
            assertNull(sender.getLocalAddress());

            // A valid address with port zero is rejected after the implicit bind.
            packet.setAddress(InetAddress.getByName("127.0.0.1"));
            packet.setPort(0);
            expect(SocketException.class, () -> sender.socket().send(packet));
            assertNotNull(sender.getLocalAddress());
            packet.setSocketAddress(receiver.getLocalAddress());
            repeat(sender.socket(), receiver.socket(), packet);

            sender.connect(receiver.getLocalAddress());
            packet.setAddress(InetAddress.getByName("::1"));
            expect(UnsupportedAddressTypeException.class, () -> sender.socket().send(packet));
            packet.setAddress(InetAddress.getByName("127.0.0.1"));
            packet.setPort(0);
            expect(IllegalArgumentException.class, () -> sender.socket().send(packet));
            packet.setSocketAddress(receiver.getLocalAddress());
            repeat(sender.socket(), receiver.socket(), packet);
        }
    }

    private static void testDefaultChannel() throws Exception {
        try (var sender = DatagramChannel.open();
             var ipv4 = DatagramChannel.open(INET);
             var ipv6 = DatagramChannel.open(INET6)) {
            ipv4.bind(new InetSocketAddress(InetAddress.getByName("127.0.0.1"), 0));
            ipv6.bind(new InetSocketAddress(InetAddress.getByName("::1"), 0));
            ipv4.socket().setSoTimeout(TIMEOUT);
            ipv6.socket().setSoTimeout(TIMEOUT);
            var packet = new DatagramPacket(new byte[] {1, 2, 3}, 3, ipv4.getLocalAddress());
            repeat(sender.socket(), ipv4.socket(), packet);
            packet.setSocketAddress(ipv6.getLocalAddress());
            repeat(sender.socket(), ipv6.socket(), packet);
            packet.setSocketAddress(ipv4.getLocalAddress());
            repeat(sender.socket(), ipv4.socket(), packet);
        }
    }

    private static void repeat(DatagramSocket sender, DatagramSocket receiver,
                               DatagramPacket packet) throws Exception {
        for (int i = 0; i < 3; i++) exchange(sender, receiver, packet);
    }

    private static void exchange(DatagramSocket sender, DatagramSocket receiver,
                                 DatagramPacket packet) throws Exception {
        byte[] before = packet.getData().clone();
        int offset = packet.getOffset();
        int length = packet.getLength();
        sender.send(packet);
        receive(receiver, packet);
        assertTrue(Arrays.equals(packet.getData(), before), "send changed packet data");
        assertEquals(packet.getOffset(), offset);
        assertEquals(packet.getLength(), length);
    }

    private static void receive(DatagramSocket receiver, DatagramPacket sent) throws Exception {
        byte[] data = new byte[64];
        Arrays.fill(data, GUARD);
        var received = new DatagramPacket(data, 3, data.length - 6);
        receiver.receive(received);
        assertEquals(received.getLength(), sent.getLength());
        for (int i = 0; i < sent.getLength(); i++) {
            assertEquals(data[3 + i], sent.getData()[sent.getOffset() + i]);
        }
        for (int i = 0; i < data.length; i++) {
            if (i < 3 || i >= 3 + sent.getLength()) {
                assertEquals(data[i], GUARD, "receive changed guard byte " + i);
            }
        }
    }

    private static void expect(Class<? extends Exception> type, Action action) throws Exception {
        try {
            action.run();
            throw new AssertionError("Expected " + type.getName());
        } catch (Exception e) {
            if (e.getClass() != type) throw e;
        }
    }

    @FunctionalInterface
    private interface Action {
        void run() throws Exception;
    }
}
