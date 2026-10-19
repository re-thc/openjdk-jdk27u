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
 * @summary Check C1 direct Adler32 calls with literal and volatile lengths, including the former Apple cutoff
 * @requires vm.compiler1.enabled
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @library /test/lib
 * @modules java.base/java.util.zip:open java.base/sun.nio.ch
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:TieredStopAtLevel=1 -Xbatch -XX:+UseAdler32Intrinsics TestC1DirectAdler32
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:TieredStopAtLevel=1 -Xbatch -XX:+UseAdler32Intrinsics -Xcheck:jni TestC1DirectAdler32
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:TieredStopAtLevel=1 -Xbatch -XX:-UseAdler32Intrinsics -Xcheck:jni TestC1DirectAdler32
 */

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.ref.Reference;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.Adler32;
import jdk.test.whitebox.WhiteBox;
import sun.nio.ch.DirectBuffer;

public class TestC1DirectAdler32 {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static final int[] LENGTHS = {0, 1, 15, 16, 31, 32, 63, 64, 65, 255, 256, 257,
                                          1023, 1024, 1025, 4095, 4096, 4097};
    private static final int[] OFFSETS = {0, 1, 7, 31};
    // Both are valid Adler states; the second also exercises signed jint values.
    private static final int[] SEEDS = {1, 0xfff00001};
    private static final byte[] DATA = new byte[4097 + 31];
    // Keep the native allocation strongly reachable throughout every raw call.
    private static final ByteBuffer BUFFER = ByteBuffer.allocateDirect(DATA.length);
    private static final MethodHandle UPDATE;
    private static final double[] FP = {0.25, 1.5, 2.75, 4.0, 5.25, 6.5, 7.75, 9.0,
                                        10.25, 11.5, 12.75, 14.0};
    private static volatile int length;

    static {
        for (int i = 0; i < DATA.length; i++) {
            DATA[i] = (byte) (i * 37 + 11);
        }
        BUFFER.put(DATA);
        try {
            UPDATE = MethodHandles.privateLookupIn(Adler32.class, MethodHandles.lookup())
                    .findStatic(Adler32.class, "updateByteBuffer",
                                MethodType.methodType(int.class, int.class, long.class,
                                                      int.class, int.class));
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    // A literal public ByteBuffer limit does not guarantee a literal remaining
    // length in C1. Invoke the exact intrinsic target through a constant handle
    // instead, with a literal argument at each distinct call site. Code captures
    // are still needed to confirm handle inlining and the final emitted route.
    private static int constant0(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 0);
    }

    private static int constant1(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 1);
    }

    private static int constant15(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 15);
    }

    private static int constant16(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 16);
    }

    private static int constant31(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 31);
    }

    private static int constant32(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 32);
    }

    private static int constant63(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 63);
    }

    private static int constant64(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 64);
    }

    private static int constant65(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 65);
    }

    private static int constant255(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 255);
    }

    private static int constant256(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 256);
    }

    private static int constant257(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 257);
    }

    private static int constant1023(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 1023);
    }

    private static int constant1024(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 1024);
    }

    private static int constant1025(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 1025);
    }

    private static int constant4095(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 4095);
    }

    private static int constant4096(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 4096);
    }

    private static int constant4097(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, 4097);
    }

    // All sizes revisit this one call site. A volatile read prevents a
    // constant-length specialization from substituting for the dynamic case.
    private static int variable(int adler, long address, int offset) throws Throwable {
        return (int) UPDATE.invokeExact(adler, address, offset, length);
    }

    // Keep the handle call here, not behind the deliberately non-inlined
    // variable() helper. These method-handle calls remain semantic coverage; C1
    // compilation does not prove target inlining or a direct native call.
    // TestC1DirectAdler32CallShape separately verifies the direct-call parse.
    private static long withFpPressure(int adler, long address, int offset) throws Throwable {
        double a = FP[0], b = FP[1], c = FP[2], d = FP[3];
        double e = FP[4], f = FP[5], g = FP[6], h = FP[7];
        double i = FP[8], j = FP[9], k = FP[10], l = FP[11];
        int value = (int) UPDATE.invokeExact(adler, address, offset, length);
        return Integer.toUnsignedLong(value) ^ Double.doubleToRawLongBits(
                a + b + c + d + e + f + g + h + i + j + k + l);
    }

    private static int constant(int len, int adler, long address, int offset) throws Throwable {
        return switch (len) {
            case 0 -> constant0(adler, address, offset);
            case 1 -> constant1(adler, address, offset);
            case 15 -> constant15(adler, address, offset);
            case 16 -> constant16(adler, address, offset);
            case 31 -> constant31(adler, address, offset);
            case 32 -> constant32(adler, address, offset);
            case 63 -> constant63(adler, address, offset);
            case 64 -> constant64(adler, address, offset);
            case 65 -> constant65(adler, address, offset);
            case 255 -> constant255(adler, address, offset);
            case 256 -> constant256(adler, address, offset);
            case 257 -> constant257(adler, address, offset);
            case 1023 -> constant1023(adler, address, offset);
            case 1024 -> constant1024(adler, address, offset);
            case 1025 -> constant1025(adler, address, offset);
            case 4095 -> constant4095(adler, address, offset);
            case 4096 -> constant4096(adler, address, offset);
            case 4097 -> constant4097(adler, address, offset);
            default -> throw new AssertionError("Unexpected length: " + len);
        };
    }

    private static int reference(int adler, int offset, int len) {
        int s1 = adler & 0xffff;
        int s2 = adler >>> 16;
        for (int i = offset; i < offset + len; i++) {
            s1 = (s1 + (DATA[i] & 0xff)) % 65521;
            s2 = (s2 + s1) % 65521;
        }
        return (s2 << 16) | s1;
    }

    private static void equal(long actual, long expected, String route, int len, int offset) {
        if (actual != expected) {
            throw new AssertionError(route + " length=" + len + " offset=" + offset +
                                     " expected=" + expected + " actual=" + actual);
        }
    }

    private static void checkAll(int repeats) throws Throwable {
        long address = ((DirectBuffer) BUFFER).address();
        double sum = 0;
        for (double value : FP) {
            sum += value;
        }
        long fpBits = Double.doubleToRawLongBits(sum);
        try {
            for (int repeat = 0; repeat < repeats; repeat++) {
                // Rotate the order, so this is not one compile/profile per size.
                for (int n = 0; n < LENGTHS.length; n++) {
                    int len = LENGTHS[(n + repeat) % LENGTHS.length];
                    length = len;
                    for (int offset : OFFSETS) {
                        for (int seed : SEEDS) {
                            long expected = Integer.toUnsignedLong(reference(seed, offset, len));
                            equal(Integer.toUnsignedLong(constant(len, seed, address, offset)),
                                  expected, "constant", len, offset);
                            equal(Integer.toUnsignedLong(variable(seed, address, offset)),
                                  expected, "variable", len, offset);
                            equal(withFpPressure(seed, address, offset), expected ^ fpBits,
                                  "FP live values", len, offset);
                            int first = len / 2;
                            length = first;
                            int partial = variable(seed, address, offset);
                            length = len - first;
                            equal(Integer.toUnsignedLong(variable(partial, address, offset + first)),
                                  expected, "incremental", len, offset);
                            length = len;
                        }
                    }
                }
            }
        } finally {
            Reference.reachabilityFence(BUFFER);
        }
    }

    private static List<Method> compileC1() throws Exception {
        List<Method> methods = new ArrayList<>();
        for (int len : LENGTHS) {
            methods.add(TestC1DirectAdler32.class.getDeclaredMethod(
                    "constant" + len, int.class, long.class, int.class));
        }
        methods.add(TestC1DirectAdler32.class.getDeclaredMethod(
                "variable", int.class, long.class, int.class));
        methods.add(TestC1DirectAdler32.class.getDeclaredMethod(
                "withFpPressure", int.class, long.class, int.class));
        for (Method method : methods) {
            WB.testSetDontInlineMethod(method, true);
            if (!WB.enqueueMethodForCompilation(method, 1) ||
                WB.getMethodCompilationLevel(method) != 1) {
                throw new AssertionError("C1 compilation missing: " + method);
            }
        }
        return methods;
    }

    public static void main(String[] args) throws Throwable {
        // Resolve the handle and native target before the forced compilations.
        checkAll(1);
        List<Method> methods = compileC1();
        checkAll(32);
        for (Method method : methods) {
            if (WB.getMethodCompilationLevel(method) != 1) {
                throw new AssertionError("C1 method no longer compiled: " + method);
            }
        }
    }
}
