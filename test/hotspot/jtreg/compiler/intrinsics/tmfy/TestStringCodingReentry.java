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
 * @summary NativeMethodBind may encode Latin1 while String's UTF-8 converter is still registering
 * @requires vm.jvmti
 * @modules java.base/jdk.internal.tmfy
 * @run main/othervm/native -Xint --enable-native-access=ALL-UNNAMED -agentlib:StringCodingReentry -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingReentry
 * @run main/othervm/native --enable-native-access=ALL-UNNAMED -agentlib:StringCodingReentry -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingReentry
 * @run main/othervm/native -Xcomp -XX:-TieredCompilation --enable-native-access=ALL-UNNAMED -agentlib:StringCodingReentry -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingReentry
 */
package compiler.intrinsics.tmfy;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.internal.tmfy.Utf8Codec;

public class TestStringCodingReentry {
    static { System.loadLibrary("StringCodingReentry"); }
    // Stay above String's 16-byte native suffix threshold in every callback.
    private static final String INPUT = "\u00e9A\u00ff\u0000".repeat(8);
    private static final byte[] EXPECTED = expected();
    private static native void arm(Class<?> fixture);
    private static native int[] result();

    // Cached before Utf8Codec's first active use; the agent calls this at both binds.
    public static byte[] reenter() {
        return INPUT.getBytes(StandardCharsets.UTF_8);
    }

    private static byte[] expected() {
        byte[] unit = {(byte) 0xc3, (byte) 0xa9, 0x41, (byte) 0xc3, (byte) 0xbf, 0};
        byte[] bytes = new byte[unit.length * 8];
        for (int i = 0; i < bytes.length; i++) bytes[i] = unit[i % unit.length];
        return bytes;
    }

    public static void main(String[] args) {
        arm(TestStringCodingReentry.class);
        if (!Arrays.equals(EXPECTED, reenter())) throw new AssertionError("initial encoding");
        int[] status = result();
        if (status[0] < 1 || status[1] < 1 || status[2] != 0) {
            throw new AssertionError("bootstrap callback counts/failures: " + Arrays.toString(status));
        }
        long[] before = Utf8Codec.counters0();
        for (int i = 0; i < 100; i++) {
            if (!Arrays.equals(EXPECTED, reenter())) throw new AssertionError("post-init encoding");
        }
        long[] after = Utf8Codec.counters0();
        // The bind capability disables leaves, but readiness must not stay folded false.
        if (after[0] != before[0] || after[1] - before[1] != 100 || after[2] != before[2]) {
            throw new AssertionError("post-init JNI path: " + Arrays.toString(before)
                    + " -> " + Arrays.toString(after));
        }
        System.out.println("STRING_CODING_REENTRY_OK " + Arrays.toString(status));
    }
}
