/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

/*
 * @test
 * @summary NativeMethodBind may convert Unicode on the same and another thread while String's UTF-8 converter is still registering
 * @requires vm.jvmti
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @run main/othervm/native -Xint --enable-native-access=ALL-UNNAMED -agentlib:StringCodingReentry -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingReentry
 * @run main/othervm/native --enable-native-access=ALL-UNNAMED -agentlib:StringCodingReentry -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingReentry
 * @run main/othervm/native -Xcomp -XX:-TieredCompilation --enable-native-access=ALL-UNNAMED -agentlib:StringCodingReentry -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingReentry
 */
package compiler.intrinsics.tmfy;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;

public class TestStringCodingReentry {
    static { System.loadLibrary("StringCodingReentry"); }
    // Stay above String's 16-byte native suffix threshold in every callback.
    private static final String INPUT = "\u00e9A\u00ff\u0000".repeat(8);
    private static final byte[] EXPECTED = expected();
    private static native void arm(Class<?> fixture);
    private static native int[] result();

    private static final String UNICODE = "\u4e2d".repeat(128);
    private static final byte[] UNICODE_BYTES = unicodeBytes();
    private static byte[] unicodeBytes() {
        byte[] b = new byte[384];
        for (int i = 0; i < b.length; i += 3) {
            b[i] = (byte) 0xe4; b[i + 1] = (byte) 0xb8; b[i + 2] = (byte) 0xad;
        }
        return b;
    }
    private static byte[] convert() {
        byte[] result = INPUT.getBytes(StandardCharsets.UTF_8);
        if (!Arrays.equals(EXPECTED, result)
                || !Arrays.equals(UNICODE_BYTES, UNICODE.getBytes(StandardCharsets.UTF_8))
                || !UNICODE.equals(new String(UNICODE_BYTES, StandardCharsets.UTF_8))) {
            throw new AssertionError("reentrant public conversion");
        }
        return result;
    }
    // Each bind callback tests same-thread conversion and waits for a separate
    // thread. Holding the StringCoding monitor across registration would hang.
    public static byte[] reenter() throws Exception {
        byte[] result = convert();
        java.util.concurrent.atomic.AtomicReference<Throwable> failure = new java.util.concurrent.atomic.AtomicReference<>();
        Thread worker = new Thread(() -> {
            try { convert(); } catch (Throwable t) { failure.set(t); }
        });
        worker.setDaemon(true);
        worker.start();
        worker.join(10_000);
        if (worker.isAlive()) throw new AssertionError("registration callback deadlocked another thread");
        if (failure.get() != null) throw new AssertionError("cross-thread conversion", failure.get());
        return result;
    }

    private static byte[] expected() {
        byte[] unit = {(byte) 0xc3, (byte) 0xa9, 0x41, (byte) 0xc3, (byte) 0xbf, 0};
        byte[] bytes = new byte[unit.length * 8];
        for (int i = 0; i < bytes.length; i++) bytes[i] = unit[i % unit.length];
        return bytes;
    }

    public static void main(String[] args) {
        arm(TestStringCodingReentry.class);
        if (!StringCodingAccess.ready()) throw new AssertionError("initial registration failed");
        int[] status = result();
        if (status[0] < 1 || status[1] < 1 || status[2] < 1 || status[3] < 1 || status[4] != 0) {
            throw new AssertionError("bootstrap callback counts/failures: " + Arrays.toString(status));
        }
        long[] before = StringCodingAccess.counters0();
        for (int i = 0; i < 100; i++) {
            if (!Arrays.equals(EXPECTED, convert())) throw new AssertionError("post-init encoding");
        }
        long[] after = StringCodingAccess.counters0();
        // The bind capability disables leaves, but readiness must not stay folded false.
        if (after[0] != before[0] || after[1] - before[1] != 200 || after[2] != before[2]) {
            throw new AssertionError("post-init JNI path: " + Arrays.toString(before)
                    + " -> " + Arrays.toString(after));
        }
        System.out.println("STRING_CODING_REENTRY_OK " + Arrays.toString(status));
    }
}
