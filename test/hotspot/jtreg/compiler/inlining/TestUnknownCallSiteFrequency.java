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
 * @bug 8325681
 * @summary An unknown nested call-site count must not be treated as a low frequency
 * @requires vm.compiler2.enabled
 * @library /test/lib /
 * @run driver compiler.inlining.TestUnknownCallSiteFrequency
 */

package compiler.inlining;

import compiler.lib.ir_framework.*;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.VarHandle;
import java.lang.reflect.Method;
import java.nio.ByteOrder;
import jdk.test.lib.Asserts;
import jdk.test.whitebox.WhiteBox;

public class TestUnknownCallSiteFrequency {
    private static final VarHandle INTS =
            MethodHandles.byteArrayViewVarHandle(int[].class, ByteOrder.LITTLE_ENDIAN);
    private static final VarHandle LONGS =
            MethodHandles.byteArrayViewVarHandle(long[].class, ByteOrder.LITTLE_ENDIAN);
    private static final byte[][] ARRAYS = new byte[32][32];
    private static final Reader FIRST = new FirstReader();
    private static final Reader SECOND = new SecondReader();
    private static int rotation;

    public static void main(String[] args) {
        TestFramework.runWithFlags("-XX:-TieredCompilation", "-XX:CompileThreshold=10000",
                                  "-XX:MaxTrivialSize=6", "-XX:MaxInlineSize=35",
                                  "-XX:+UnlockDiagnosticVMOptions", "-XX:MinInlineFrequencyRatio=0.0085",
                                  // Keep the known-zero branch in the graph for its negative control.
                                  "-XX:PerMethodTrapLimit=0");
    }

    // Each word wrapper has 9 or 10 bytecodes, exceeding MaxTrivialSize=6.
    // The nested callers execute only once before compilation and have no MDO.
    private static int getInt(byte[] a, int i) { return (int) INTS.get(a, i); }
    private static void putInt(byte[] a, int i, int v) { INTS.set(a, i, v); }
    private static long getLong(byte[] a, int i) { return (long) LONGS.get(a, i); }
    private static void putLong(byte[] a, int i, long v) { LONGS.set(a, i, v); }
    private static int readInt(byte[] a, int i) { return getInt(a, i); }
    private static void writeInt(byte[] a, int i, int v) { putInt(a, i, v); }
    private static long readLong(byte[] a, int i) { return getLong(a, i); }
    private static void writeLong(byte[] a, int i, long v) { putLong(a, i, v); }

    @Test
    @IR(phase = CompilePhase.PRINT_IDEAL,
        failOn = {"\\d+\\s+CallStaticJava[^\\n]*# Static\\s+compiler[.]inlining[.]TestUnknownCallSiteFrequency::(getInt|putInt|getLong|putLong|readInt|writeInt|readLong|writeLong) "})
    public static long unknownNested(byte[] a, int i) {
        writeInt(a, i, readInt(a, i) + 1);
        writeLong(a, i + 8, readLong(a, i + 8) + 3);
        return readInt(a, i) + readLong(a, i + 8);
    }

    @Run(test = "unknownNested")
    @Warmup(1)
    public static void runUnknown(RunInfo info) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        byte[] a = ARRAYS[rotation++ & 31];
        Asserts.assertEQ(unknownNested(a, 1), 4L);
        Asserts.assertEQ(a[1], (byte) 1);
        Asserts.assertEQ(a[9], (byte) 3);
        Asserts.assertEQ(a[0], (byte) 0);
        Asserts.assertEQ(a[17], (byte) 0);
        if (info.isWarmUp()) {
            // Assert the precondition rather than relying on a timing-dependent
            // compilation threshold to leave the nested profile immature.
            Asserts.assertEQ(wb.getMethodData(method("readInt", byte[].class, int.class)), 0L);
            Asserts.assertEQ(wb.getMethodData(method("writeInt", byte[].class, int.class, int.class)), 0L);
            Asserts.assertEQ(wb.getMethodData(method("readLong", byte[].class, int.class)), 0L);
            Asserts.assertEQ(wb.getMethodData(method("writeLong", byte[].class, int.class, long.class)), 0L);
        }
    }

    private static int knownRead(byte[] a, int i) { return (int) INTS.get(a, i); }
    private static int zeroRead(byte[] a, int i) { return (int) INTS.get(a, i); }

    @Test
    @IR(counts = {IRNode.STATIC_CALL_OF_METHOD, "compiler[.]inlining[.]TestUnknownCallSiteFrequency::knownRead", "1"})
    public static int knownLow(byte[] a, boolean rare) {
        return rare ? knownRead(a, 1) : a[0];
    }

    @Run(test = "knownLow")
    @Warmup(1)
    public static void runKnownLow(RunInfo info) throws Exception {
        byte[] a = new byte[32];
        a[1] = 7;
        if (info.isWarmUp()) {
            WhiteBox.getWhiteBox().markMethodProfiled(method("knownLow", byte[].class, boolean.class));
            // The root MDO is mature, with a positive call count below 0.85%.
            for (int i = 0; i < 2000; i++) {
                Asserts.assertEQ(knownLow(a, i % 1000 == 0), i % 1000 == 0 ? 7 : 0);
            }
        } else {
            Asserts.assertEQ(knownLow(a, true), 7);
            Asserts.assertEQ(knownLow(a, false), 0);
        }
    }

    @Test
    @IR(counts = {IRNode.STATIC_CALL_OF_METHOD, "compiler[.]inlining[.]TestUnknownCallSiteFrequency::zeroRead", "1"})
    public static int knownZero(byte[] a, boolean rare) {
        return rare ? zeroRead(a, 1) : a[0];
    }

    @Run(test = "knownZero")
    @Warmup(1)
    public static void runKnownZero(RunInfo info) throws Exception {
        byte[] a = new byte[32];
        a[1] = 11;
        if (info.isWarmUp()) {
            zeroRead(a, 1); // Callee executed and linked, but this call site remains zero.
            WhiteBox.getWhiteBox().markMethodProfiled(method("knownZero", byte[].class, boolean.class));
            for (int i = 0; i < 2000; i++) {
                Asserts.assertEQ(knownZero(a, false), 0);
            }
        } else {
            Asserts.assertEQ(knownZero(a, true), 11);
        }
    }

    // Exceeds the ordinary, non-hot MaxInlineSize. Unknown must not mean hot.
    private static int tooLarge(byte[] a, int i) {
        int v = a[i];
        v += a[i + 1]; v += a[i + 2]; v += a[i + 3];
        v += a[i + 4]; v += a[i + 5]; v += a[i + 6];
        return v;
    }

    @Test
    @IR(counts = {IRNode.STATIC_CALL_OF_METHOD, "compiler[.]inlining[.]TestUnknownCallSiteFrequency::tooLarge", "1"})
    public static int unknownTooLarge(byte[] a, int i) {
        return tooLarge(a, i);
    }

    @Run(test = "unknownTooLarge")
    @Warmup(1)
    public static void runTooLarge() {
        Asserts.assertEQ(unknownTooLarge(new byte[32], 1), 0);
    }

    private interface Reader { int read(byte[] a); }
    private static final class FirstReader implements Reader {
        public int read(byte[] a) { return a[0] + 1; }
    }
    private static final class SecondReader implements Reader {
        public int read(byte[] a) { return a[0] + 2; }
    }

    @Test
    @IR(counts = {IRNode.DYNAMIC_CALL_OF_METHOD, "read", "1"})
    public static int unknownType(Reader reader, byte[] a) {
        return reader.read(a);
    }

    @Run(test = "unknownType")
    @Warmup(1)
    public static void runUnknownType(RunInfo info) {
        byte[] a = new byte[32];
        // Both implementations are loaded. A single observed receiver in an
        // immature MDO must not become a trusted monomorphic type profile.
        Asserts.assertEQ(unknownType(FIRST, a), 1);
        if (!info.isWarmUp()) {
            Asserts.assertEQ(unknownType(SECOND, a), 2);
        }
    }

    private static Method method(String name, Class<?>... parameters) throws Exception {
        return TestUnknownCallSiteFrequency.class.getDeclaredMethod(name, parameters);
    }
}
