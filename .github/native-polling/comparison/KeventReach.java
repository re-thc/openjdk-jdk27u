/* Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only
 */
import java.lang.reflect.Field;
import java.nio.channels.Selector;

final class KeventReach {
    static {
        System.load(System.getProperty("native.polling.trace"));
        if (abi() != 1) throw new AssertionError("Wrong reach helper ABI");
    }
    private static native int abi();
    private static native void start0(int fd);
    private static native long[] snapshot0();
    static void start(Selector selector) throws Exception {
        Field fd = selector.getClass().getDeclaredField("kqfd");
        fd.setAccessible(true);
        start0(fd.getInt(selector));
    }
    static void startAll() { start0(-1); }
    static long[] snapshot() { return snapshot0(); }
}
