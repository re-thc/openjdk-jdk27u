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
 * @summary Eventfds are nonblocking at construction and support selector/poller wakeups
 * @requires os.family == "linux"
 * @modules java.base/sun.nio.ch:open
 * @run main/othervm EventFDTest
 */

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.channels.Selector;
import java.nio.file.Files;
import java.nio.file.Path;

public class EventFDTest {
    private static Method method(Class<?> type, String name, Class<?>... args)
            throws ReflectiveOperationException {
        Method method = type.getDeclaredMethod(name, args);
        method.setAccessible(true);
        return method;
    }

    private static void checkNonblocking(Object eventfd) throws Exception {
        int fd = (int) method(eventfd.getClass(), "efd").invoke(eventfd);
        String info = Files.readString(Path.of("/proc/self/fdinfo/" + fd));
        String flags = info.lines().filter(s -> s.startsWith("flags:")).findFirst().orElseThrow();
        if ((Integer.parseInt(flags.substring(6).trim(), 8) & 04000) == 0) {
            throw new AssertionError("Blocking eventfd: " + info);
        }
    }

    public static void main(String[] args) throws Exception {
        Class<?> eventfdClass = Class.forName("sun.nio.ch.EventFD");
        Constructor<?> eventfdConstructor = eventfdClass.getDeclaredConstructor();
        eventfdConstructor.setAccessible(true);
        Method set = method(eventfdClass, "set");
        Method reset = method(eventfdClass, "reset");
        Method closeEventfd = method(eventfdClass, "close");

        for (int i = 0; i < 100; i++) {
            Object eventfd = eventfdConstructor.newInstance();
            try {
                checkNonblocking(eventfd);
                reset.invoke(eventfd);
                set.invoke(eventfd);
                set.invoke(eventfd);
                reset.invoke(eventfd);
                reset.invoke(eventfd);
            } finally {
                closeEventfd.invoke(eventfd);
            }
            try (Selector selector = Selector.open()) {
                selector.wakeup().wakeup();
                selector.selectNow();
                if (selector.selectNow() != 0) {
                    throw new AssertionError("Unexpected readiness");
                }
            }
        }

        Class<?> modeClass = Class.forName("sun.nio.ch.Poller$Mode");
        Field modeField = modeClass.getDeclaredField("POLLER_PER_CARRIER");
        modeField.setAccessible(true);
        Object mode = modeField.get(null);
        Class<?> pollerClass = Class.forName("sun.nio.ch.EPollPoller");
        Constructor<?> constructor = pollerClass.getDeclaredConstructor(modeClass,
                boolean.class, boolean.class);
        constructor.setAccessible(true);
        Field eventfdField = pollerClass.getDeclaredField("eventfd");
        eventfdField.setAccessible(true);
        Method wakeup = method(pollerClass, "wakeupPoller");
        Method poll = method(pollerClass, "poll", int.class);
        Method close = method(pollerClass, "close");
        for (boolean read : new boolean[] { true, false }) {
            for (int i = 0; i < 100; i++) {
                Object poller = constructor.newInstance(mode, true, read);
                try {
                    checkNonblocking(eventfdField.get(poller));
                    poll.invoke(poller, 0);
                    wakeup.invoke(poller);
                    poll.invoke(poller, 1000);
                } finally {
                    close.invoke(poller);
                    close.invoke(poller);
                }
            }
        }
    }
}
