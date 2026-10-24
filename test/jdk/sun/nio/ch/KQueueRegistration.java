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
 * @summary Kqueue registration receipts report each change without consuming ready events
 * @requires os.family == "mac"
 * @modules java.base/sun.nio.ch:open
 * @run main/othervm KQueueRegistration
 */

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.channels.Pipe;
import java.nio.channels.SelectableChannel;
import java.util.HashSet;
import java.util.Set;

public class KQueueRegistration {
    private static final int READ = -1, WRITE = -2;
    private static final int ADD = 1, DELETE = 2, ONESHOT = 0x10, ERROR = 0x4000;
    private static final Class<?> KQUEUE;
    private static final Method REGISTER_CHANGES;

    static {
        try {
            KQUEUE = Class.forName("sun.nio.ch.KQueue");
            REGISTER_CHANGES = method(KQUEUE, "registerChanges",
                    int.class, int[].class, int.class, int[].class);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static Method method(Class<?> type, String name, Class<?>... args)
            throws ReflectiveOperationException {
        Method method = type.getDeclaredMethod(name, args);
        method.setAccessible(true);
        return method;
    }

    private static int fd(SelectableChannel channel) throws Exception {
        return (int) method(channel.getClass(), "getFDVal").invoke(channel);
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static void reject(int kqfd, int[] changes, int count, int[] errors)
            throws Exception {
        try {
            REGISTER_CHANGES.invoke(null, kqfd, changes, count, errors);
            throw new AssertionError("Invalid batch accepted");
        } catch (InvocationTargetException e) {
            if (!(e.getCause() instanceof IllegalArgumentException)) throw e;
        }
    }

    public static void main(String[] args) throws Exception {
        int kqfd = (int) method(KQUEUE, "create").invoke(null);
        long events = (long) method(KQUEUE, "allocatePollArray", int.class).invoke(null, 16);
        Pipe data = Pipe.open();
        Pipe absent = Pipe.open();
        Pipe oneshot = Pipe.open();
        try (var source = data.source(); var sink = data.sink();
             var absentSource = absent.source(); var absentSink = absent.sink();
             var onceSource = oneshot.source(); var onceSink = oneshot.sink()) {
            int rfd = fd(source), wfd = fd(sink), afd = fd(absentSource), ofd = fd(onceSource);
            int error = (int) method(KQUEUE, "register", int.class, int.class,
                    int.class, int.class).invoke(null, kqfd, ofd, READ, ADD | ONESHOT);
            check(error == 0, "One-shot registration failed: " + error);
            sink.write(ByteBuffer.wrap(new byte[] { 1 }));
            onceSink.write(ByteBuffer.wrap(new byte[] { 2 }));

            int[] changes = { afd, READ, DELETE, rfd, READ, ADD, wfd, WRITE, ADD };
            int[] errors = new int[3];
            REGISTER_CHANGES.invoke(null, kqfd, changes, 3, errors);
            check(errors[0] != 0, "Deleting an absent filter succeeded");
            check(errors[1] == 0 && errors[2] == 0, "Error prevented valid changes");

            Method poll = method(KQUEUE, "poll", int.class, long.class, int.class, long.class);
            Method event = method(KQUEUE, "getEvent", long.class, int.class);
            Method descriptor = method(KQUEUE, "getDescriptor", long.class);
            Method flags = method(KQUEUE, "getFlags", long.class);
            Set<Integer> ready = new HashSet<>();
            int n = (int) poll.invoke(null, kqfd, events, 16, 0L);
            for (int i = 0; i < n; i++) {
                long address = (long) event.invoke(null, events, i);
                check(((short) flags.invoke(null, address) & ERROR) == 0, "Receipt escaped into poll");
                ready.add((int) descriptor.invoke(null, address));
            }
            check(ready.equals(Set.of(rfd, wfd, ofd)), "Missing readiness: " + ready);
            n = (int) poll.invoke(null, kqfd, events, 16, 0L);
            for (int i = 0; i < n; i++) {
                long address = (long) event.invoke(null, events, i);
                check((int) descriptor.invoke(null, address) != ofd, "One-shot event repeated");
            }

            reject(kqfd, new int[] { rfd, READ, ADD, rfd, READ, DELETE }, 2, errors);
            reject(kqfd, new int[] { rfd, READ, ADD | ONESHOT }, 1, errors);
            reject(kqfd, new int[] { rfd, READ, ADD }, 0, errors);
            reject(kqfd, new int[] { rfd, READ, ADD }, 65, new int[65]);
            reject(kqfd, new int[2], 1, errors);
            reject(kqfd, new int[] { rfd, READ, ADD }, 1, new int[0]);
        } finally {
            method(KQUEUE, "freePollArray", long.class).invoke(null, events);
            method(Class.forName("sun.nio.ch.UnixFileDispatcherImpl"), "closeIntFD", int.class)
                    .invoke(null, kqfd);
        }
    }
}
