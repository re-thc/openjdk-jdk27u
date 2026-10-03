/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

/*
 * @test
 * @summary Check bounded Latin-1 conversion and prewrite rejection in each execution tier
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.gc.G1 & vm.gc.Serial
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters
 *      -Xint -XX:+UseG1GC compiler.intrinsics.tmfy.TestStringCodingBoundary 0 default
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters
 *      -Xint -XX:+UseG1GC -XX:-UseTmfyStringCoding compiler.intrinsics.tmfy.TestStringCodingBoundary 0 jni
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters
 *      -Xint -XX:+UseG1GC -XX:DisableIntrinsic=_tmfy_encodeLatin1Utf8 compiler.intrinsics.tmfy.TestStringCodingBoundary 0 jni
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters
 *      -Xint -XX:+UseSerialGC compiler.intrinsics.tmfy.TestStringCodingBoundary 0 jni
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters
 *      -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC compiler.intrinsics.tmfy.TestStringCodingBoundary 1 default
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters
 *      -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:-UseTmfyStringCoding compiler.intrinsics.tmfy.TestStringCodingBoundary 1 jni
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters
 *      -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:DisableIntrinsic=_tmfy_encodeLatin1Utf8 compiler.intrinsics.tmfy.TestStringCodingBoundary 1 jni
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters
 *      -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseSerialGC compiler.intrinsics.tmfy.TestStringCodingBoundary 1 jni
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters
 *      -Xbatch -XX:-TieredCompilation -XX:+UseG1GC compiler.intrinsics.tmfy.TestStringCodingBoundary 4 default
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters
 *      -Xbatch -XX:-TieredCompilation -XX:+UseG1GC -XX:-UseTmfyStringCoding compiler.intrinsics.tmfy.TestStringCodingBoundary 4 jni
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters
 *      -Xbatch -XX:-TieredCompilation -XX:+UseG1GC -XX:DisableIntrinsic=_tmfy_encodeLatin1Utf8 compiler.intrinsics.tmfy.TestStringCodingBoundary 4 jni
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters
 *      -Xbatch -XX:-TieredCompilation -XX:+UseSerialGC compiler.intrinsics.tmfy.TestStringCodingBoundary 4 jni
 */

package compiler.intrinsics.tmfy;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.Method;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;
import jdk.test.whitebox.WhiteBox;

public class TestStringCodingBoundary {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static final MethodType SIGNATURE = MethodType.methodType(int.class,
            byte[].class, int.class, int.class, byte[].class, int.class, int.class);
    private static final MethodHandle NATIVE;
    private static final int MAX = 4096, BAD_ARGUMENT = -2, NEEDS_GENERAL = -1;
    private static final byte SENTINEL = 0x5a;

    static {
        try {
            NATIVE = MethodHandles.privateLookupIn(StringCodingAccess.type(), MethodHandles.lookup())
                    .findStatic(StringCodingAccess.type(), "encodeLatin1Utf80", SIGNATURE);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static int nativeEncode(byte[] in, int off, int len, byte[] out, int pos, int cap)
            throws Throwable {
        return (int) NATIVE.invokeExact(in, off, len, out, pos, cap);
    }

    public static void main(String[] args) throws Throwable {
        int level = Integer.parseInt(args[0]);
        // The AArch64 leaf remains gated until its ABI/GC audit is complete.
        boolean leaf = args[1].equals("default") && System.getProperty("os.name").equals("Linux")
                && System.getProperty("os.arch").equals("amd64");
        Method direct = TestStringCodingBoundary.class.getDeclaredMethod("nativeEncode", SIGNATURE.parameterArray());
        Method facade = StringCodingAccess.class.getDeclaredMethod("encodeLatin1", SIGNATURE.parameterArray());
        WB.testSetDontInlineMethod(direct, true);
        WB.testSetDontInlineMethod(facade, true);
        byte[] in = new byte[MAX * 2 + 1], out = new byte[in.length * 2];
        Arrays.fill(in, (byte) 0xe9);
        for (int i = 0; i < 100; i++) {
            nativeEncode(in, 0, MAX, out, 0, MAX * 2);
            StringCodingAccess.encodeLatin1(in, 0, in.length, out, 0, out.length);
        }
        for (int n : new int[] {0, 1, MAX, MAX + 1, in.length}) {
            StringCodingAccess.encodeLatin1(in, 0, n, out, 0, out.length);
        }
        for (Method method : new Method[] { direct, facade }) {
            if (level != 0) {
                WB.deoptimizeMethod(method);
                check(WB.enqueueMethodForCompilation(method, level), "compilation rejected");
            }
            check(WB.getMethodCompilationLevel(method) == level, "incorrect compilation level");
        }

        long[] before = StringCodingAccess.counters0();
        for (int n : new int[] { 0, 1, 15, 16, 17, 31, 32, 33, MAX - 1, MAX }) {
            for (int pattern = 0; pattern < 3; pattern++) conversion(n, pattern, false);
        }
        check(nativeEncode(in, in.length, 0, out, out.length, 0) == 0, "empty end ranges");
        route(before, leaf, false);

        before = StringCodingAccess.counters0();
        rejections();
        route(before, leaf, true);

        before = StringCodingAccess.counters0();
        for (int n : new int[] { 0, 1, MAX, MAX + 1, MAX * 2, MAX * 2 + 1, MAX * 3 + 7 }) {
            for (int pattern = 0; pattern < 3; pattern++) conversion(n, pattern, true);
        }
        route(before, leaf, false);
        for (Method method : new Method[] { direct, facade }) {
            check(WB.getMethodCompilationLevel(method) == level, "tested method lost compilation");
        }
        System.out.println("STRING_CODING_BOUNDARY_OK level=" + level + " leaf=" + leaf);
    }

    private static void route(long[] before, boolean leaf, boolean rejected) {
        long[] after = StringCodingAccess.counters0();
        int counter = leaf ? (rejected ? 2 : 0) : 1;
        check(after[counter] > before[counter], "expected positive " + (leaf ? "leaf" : "JNI") + " delta");
        if (!leaf) check(after[0] == before[0], "unexpected leaf on fallback path");
        else check(after[1] == before[1], "unexpected JNI on supported leaf path");
        // JNI counts rejected calls as JNI calls; it does not increment counter 2.
    }

    private static void conversion(int n, int pattern, boolean facade) throws Throwable {
        byte[] in = new byte[n + 9], out = new byte[n * 2 + 19];
        for (int i = 0; i < in.length; i++) {
            in[i] = (byte) (pattern == 0 ? i & 0x7f : pattern == 1 ? 0x80 | (i & 0x7f) : i);
        }
        byte[] original = in.clone();
        Arrays.fill(out, SENTINEL);
        byte[] expected = out.clone();
        int end = 7;
        for (int i = 3; i < n + 3; i++) {
            int value = in[i] & 0xff;
            if (value < 128) expected[end++] = (byte) value;
            else {
                expected[end++] = (byte) (0xc0 | value >>> 6);
                expected[end++] = (byte) (0x80 | value & 63);
            }
        }
        // Alternate exact capacity and spare capacity; all unused bytes must survive.
        int capacity = n * 2 + (pattern == 2 ? 3 : 0);
        int result = facade ? StringCodingAccess.encodeLatin1(in, 3, n, out, 7, capacity)
                            : nativeEncode(in, 3, n, out, 7, capacity);
        check(result == end - 7, "wrong byte count for length " + n);
        check(Arrays.equals(out, expected), "wrong output or changed sentinel for length " + n);
        check(Arrays.equals(in, original), "modified input");
    }

    private static void rejections() throws Throwable {
        byte[] in = new byte[MAX + 17], out = new byte[(MAX + 17) * 2];
        Arrays.fill(in, (byte) 0x61);
        Arrays.fill(out, SENTINEL);
        bad(null, 0, 0, out, 0, 0, BAD_ARGUMENT);
        bad(in, 0, 0, null, 0, 0, BAD_ARGUMENT);
        bad(null, 0, 0, null, 0, 0, BAD_ARGUMENT);
        for (int value : new int[] { -1, Integer.MIN_VALUE, Integer.MAX_VALUE }) {
            bad(in, value, 1, out, 3, 2, BAD_ARGUMENT);
            bad(in, 1, value, out, 3, 2, BAD_ARGUMENT);
            bad(in, 1, 1, out, value, 2, BAD_ARGUMENT);
            bad(in, 1, 1, out, 3, value, BAD_ARGUMENT);
        }
        bad(in, in.length, 1, out, 0, 2, BAD_ARGUMENT);
        bad(in, in.length + 1, 0, out, 0, 0, BAD_ARGUMENT);
        bad(in, 0, 1, out, out.length - 1, 2, BAD_ARGUMENT);
        bad(in, 0, 0, out, out.length + 1, 0, BAD_ARGUMENT);
        bad(in, 0, 4, out, 3, 7, BAD_ARGUMENT); // ASCII still requires 2 * length.
        bad(in, 0, 2, in, 8, 4, BAD_ARGUMENT); // Even disjoint ranges may not alias.
        bad(in, 0, 0, in, in.length, 0, BAD_ARGUMENT);
        bad(in, 1, MAX + 1, out, 3, (MAX + 1) * 2, NEEDS_GENERAL);
        bad(in, 1, MAX + 1, out, 3, (MAX + 1) * 2 - 1, BAD_ARGUMENT);
    }

    private static void bad(byte[] in, int off, int len, byte[] out, int pos, int cap, int status)
            throws Throwable {
        byte[] originalIn = in == null ? null : in.clone();
        byte[] originalOut = out == null ? null : out.clone();
        check(nativeEncode(in, off, len, out, pos, cap) == status, "wrong rejection status");
        check(Arrays.equals(in, originalIn), "rejection modified input");
        check(Arrays.equals(out, originalOut), "rejection modified output");
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
