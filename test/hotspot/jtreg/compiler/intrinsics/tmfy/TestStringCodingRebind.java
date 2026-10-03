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
 * @summary Late native rebinding of StringCoding invalidates Unicode leaf and Java-origin admission
 * @requires os.family == "linux" & os.arch == "amd64" & vm.compiler1.enabled & vm.compiler2.enabled & vm.gc.G1 & vm.gc.Serial
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @run main/othervm/native -Xint -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED compiler.intrinsics.tmfy.TestStringCodingRebind leaf
 * @run main/othervm/native -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED compiler.intrinsics.tmfy.TestStringCodingRebind leaf
 * @run main/othervm/native -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED compiler.intrinsics.tmfy.TestStringCodingRebind leaf
 * @run main/othervm/native -Xbatch -XX:TieredStopAtLevel=1 -XX:-UseTmfyStringCoding -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED compiler.intrinsics.tmfy.TestStringCodingRebind java
 * @run main/othervm/native -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseSerialGC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED compiler.intrinsics.tmfy.TestStringCodingRebind java
 * @run main/othervm/native -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:+UseSerialGC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED compiler.intrinsics.tmfy.TestStringCodingRebind java
 */
package compiler.intrinsics.tmfy;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;

public class TestStringCodingRebind {
    static { System.loadLibrary("StringCodingRebind"); }
    private static final String INPUT = "\u20ac".repeat(128);
    private static final byte[] ENCODED = INPUT.getBytes(StandardCharsets.UTF_8);
    private static native int rebind(Class<?> holder);
    private static native long calls();

    public static byte[] encode() { return INPUT.getBytes(StandardCharsets.UTF_8); }
    public static String decode() { return new String(ENCODED, StandardCharsets.UTF_8); }

    public static void main(String[] args) {
        // Publish readiness before compilation. Supported origins install leaf
        // callers; unsupported origins omit the calls but must still depend
        // on the native bindings and observe a subsequent replacement.
        if (args.length != 1 || !(args[0].equals("leaf") || args[0].equals("java"))) {
            throw new AssertionError("expected leaf or compiled Java route");
        }
        if (!StringCodingAccess.ready()) throw new AssertionError("initial registration incomplete");
        for (int i = 0; i < 20_000; i++) {
            if (!Arrays.equals(ENCODED, encode()) || !INPUT.equals(decode())) {
                throw new AssertionError("initial converter output");
            }
        }
        long[] route = StringCodingAccess.counters0();
        for (int i = 0; i < 1000; i++) {
            if (!Arrays.equals(ENCODED, encode()) || !INPUT.equals(decode())) {
                throw new AssertionError("pre-rebind conversion");
            }
        }
        long[] routed = StringCodingAccess.counters0();
        long leaves = routed[0] - route[0];
        long jni = routed[1] - route[1];
        if (leaves != (args[0].equals("leaf") ? 2000 : 0) || jni != 0 || routed[2] != route[2]) {
            throw new AssertionError("pre-rebind route: " + leaves + "/" + jni);
        }
        if (!StringCodingAccess.ready()) throw new AssertionError("registration incomplete");
        if (rebind(StringCodingAccess.type()) != 0) throw new AssertionError("RegisterNatives failed");
        byte[] marked = new byte[INPUT.length()];
        Arrays.fill(marked, (byte) '#');
        String decoded = "\u2603".repeat(ENCODED.length);
        long[] before = StringCodingAccess.counters0();
        long rebound = calls();
        for (int i = 0; i < 2000; i++) {
            if (!Arrays.equals(marked, encode()) || !decoded.equals(decode())) {
                throw new AssertionError("compiled origin ignored a new native binding");
            }
        }
        if (calls() - rebound != 4000) throw new AssertionError("replacement native was bypassed");
        if (StringCodingAccess.counters0()[0] != before[0]) {
            throw new AssertionError("leaf conversion survived native rebinding");
        }
        if (!StringCodingAccess.ready()) throw new AssertionError("monotonic readiness was reset");
        System.out.println("STRING_CODING_REBIND_OK");
    }
}
