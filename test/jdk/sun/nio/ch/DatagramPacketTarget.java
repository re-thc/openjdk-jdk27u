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
 * @summary Reused DatagramPackets reuse only an identical successfully encoded destination
 * @modules java.base/sun.nio.ch:+open
 * @library /test/lib
 * @run main/othervm DatagramPacketTarget
 * @run main/othervm -Djava.net.preferIPv4Stack=true DatagramPacketTarget
 */

import java.lang.reflect.Field;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ProtocolFamily;
import java.nio.ByteBuffer;
import java.nio.channels.DatagramChannel;

import jdk.test.lib.NetworkConfiguration;
import jdk.test.lib.Utils;
import jdk.test.lib.net.IPSupport;

import static java.net.StandardProtocolFamily.INET;
import static java.net.StandardProtocolFamily.INET6;
import static jdk.test.lib.Asserts.*;

public class DatagramPacketTarget {
    private static final Field PREVIOUS_TARGET;
    static {
        try {
            PREVIOUS_TARGET = Class.forName("sun.nio.ch.DatagramChannelImpl")
                    .getDeclaredField("previousTarget");
            PREVIOUS_TARGET.setAccessible(true);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static void main(String[] args) throws Exception {
        IPSupport.throwSkippedExceptionIfNonOperational();
        if (IPSupport.hasIPv4()) test(INET, InetAddress.getByName("127.0.0.1"));
        if (IPSupport.hasIPv6()) {
            test(INET6, InetAddress.getByName("::1"));
            var addresses = NetworkConfiguration.probe().ip6Addresses()
                    .filter(InetAddress::isLinkLocalAddress).toList();
            if (addresses.isEmpty()) System.out.println("No IPv6 link-local address");
            for (var address : addresses) test(INET6, address);
        }
    }

    private static InetSocketAddress target(DatagramChannel channel) throws Exception {
        return (InetSocketAddress) PREVIOUS_TARGET.get(channel);
    }

    private static void test(ProtocolFamily family, InetAddress address) throws Exception {
        System.out.println("Testing " + family + " " + address);
        try (var sender = DatagramChannel.open(family);
             var receiver = DatagramChannel.open(family);
             var other = DatagramChannel.open(family)) {
            sender.bind(new InetSocketAddress(address, 0));
            receiver.bind(new InetSocketAddress(address, 0));
            other.bind(new InetSocketAddress(address, 0));
            receiver.socket().setSoTimeout((int) Utils.adjustTimeout(5_000));
            other.socket().setSoTimeout((int) Utils.adjustTimeout(5_000));
            var a = (InetSocketAddress) receiver.getLocalAddress();
            var b = (InetSocketAddress) other.getLocalAddress();
            var packet = new DatagramPacket(new byte[] {42}, 1, a);
            var socket = sender.socket();
            assertNull(target(sender));
            exchange(socket, receiver.socket(), packet);
            var first = target(sender);
            assertSame(first.getAddress(), packet.getAddress());
            assertEquals(first.getPort(), packet.getPort());
            exchange(socket, receiver.socket(), packet);
            assertSame(target(sender), first, "Repeated packet recreated target");

            // Equality is insufficient: Inet6Address.equals ignores scope.
            InetAddress copy = address instanceof Inet6Address ip6
                    ? Inet6Address.getByAddress(null, ip6.getAddress(), ip6.getScopeId())
                    : InetAddress.getByAddress(address.getAddress());
            assertEquals(copy, address);
            assertTrue(copy != address);
            packet.setAddress(copy);
            exchange(socket, receiver.socket(), packet);
            var second = target(sender);
            assertTrue(second != first);
            assertSame(second.getAddress(), copy);
            exchange(socket, receiver.socket(), packet);
            assertSame(target(sender), second);

            packet.setPort(b.getPort());
            exchange(socket, other.socket(), packet);
            var third = target(sender);
            assertTrue(third != second);
            assertEquals(third.getPort(), b.getPort());

            // The channel and its adaptor share the same native target buffer.
            sender.send(ByteBuffer.wrap(new byte[] {42}), a);
            receive(receiver.socket());
            assertSame(target(sender), a);
            packet.setSocketAddress(a);
            exchange(socket, receiver.socket(), packet);
            assertSame(target(sender), a);

            // Connected writes must not alter the last unconnected target.
            sender.connect(b);
            packet.setSocketAddress(b);
            exchange(socket, other.socket(), packet);
            assertSame(target(sender), a);
            sender.disconnect();
            packet.setSocketAddress(a);
            exchange(socket, receiver.socket(), packet);
            assertSame(target(sender), a);

        }

        try (var sender = DatagramChannel.open(family);
             var receiver = DatagramChannel.open(family)) {
            receiver.bind(new InetSocketAddress(address, 0));
            receiver.socket().setSoTimeout((int) Utils.adjustTimeout(5_000));
            sender.connect(receiver.getLocalAddress());
            var packet = new DatagramPacket(new byte[] {42}, 1);
            exchange(sender.socket(), receiver.socket(), packet);
            exchange(sender.socket(), receiver.socket(), packet);
            assertNull(target(sender), "Connected sends populated unconnected cache");
        }
    }

    private static void exchange(DatagramSocket sender, DatagramSocket receiver,
                                 DatagramPacket packet) throws Exception {
        sender.send(packet);
        receive(receiver);
    }

    private static void receive(DatagramSocket receiver) throws Exception {
        var packet = new DatagramPacket(new byte[2], 2);
        receiver.receive(packet);
        assertEquals(packet.getLength(), 1);
        assertEquals(packet.getData()[0], (byte) 42);
    }
}
