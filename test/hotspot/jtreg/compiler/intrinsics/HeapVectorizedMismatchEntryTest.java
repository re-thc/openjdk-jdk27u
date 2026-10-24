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
 * @summary C2 uses the x86 heap mismatch entry only for proven non-null primitive heap accesses
 * @requires (os.arch == "amd64" | os.arch == "x86_64") & vm.compiler2.enabled & vm.opt.final.UseVectorizedMismatchIntrinsic == true
 * @library /test/lib /
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @run driver compiler.intrinsics.HeapVectorizedMismatchEntryTest
 */

package compiler.intrinsics;

import compiler.lib.ir_framework.CompilePhase;
import compiler.lib.ir_framework.IR;
import compiler.lib.ir_framework.Run;
import compiler.lib.ir_framework.RunInfo;
import compiler.lib.ir_framework.Test;
import compiler.lib.ir_framework.TestFramework;
import compiler.lib.ir_framework.Warmup;
import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.util.Arrays;
import java.util.Objects;
import jdk.internal.misc.Unsafe;
import jdk.internal.util.ArraysSupport;

public class HeapVectorizedMismatchEntryTest {
    private static final Unsafe U = Unsafe.getUnsafe();
    private static final int SIZE = 65536 + 32;
    private static final byte[] BA = new byte[SIZE], BB = new byte[SIZE];
    private static final boolean[] ZA = new boolean[SIZE], ZB = new boolean[SIZE];
    private static final char[] CA = new char[SIZE], CB = new char[SIZE];
    private static final short[] SA = new short[SIZE], SB = new short[SIZE];
    private static final int[] IA = new int[SIZE], IB = new int[SIZE];
    private static final long[] LA = new long[SIZE], LB = new long[SIZE];
    private static final float[] FA = new float[SIZE], FB = new float[SIZE];
    private static final double[] DA = new double[SIZE], DB = new double[SIZE];
    private static final MemorySegment NA = Arena.ofAuto().allocate(SIZE);
    private static final MemorySegment NB = Arena.ofAuto().allocate(SIZE);
    private static final int[] LENGTHS = {0, 1, 2, 3, 7, 8, 9, 15, 16, 17, 31, 32, 33,
            63, 64, 65, 127, 128, 129, 511, 512, 513, 4096, 65537};
    private static final String HEAP = "CallLeaf.*vectorizedMismatchHeap\\b";
    private static final String GENERIC = "CallLeaf.*vectorizedMismatch\\b";

    @Test
    @IR(counts = {HEAP, "1"}, failOn = {GENERIC}, phase = CompilePhase.BEFORE_MATCHING)
    public static int heapBytes(byte[] a, byte[] b, int from, int length) {
        Objects.requireNonNull(a);
        Objects.requireNonNull(b);
        return ArraysSupport.vectorizedMismatch(a, Unsafe.ARRAY_BYTE_BASE_OFFSET + from,
                b, Unsafe.ARRAY_BYTE_BASE_OFFSET + from, length, 0);
    }

    @Test
    @IR(counts = {HEAP, "1"}, failOn = {GENERIC}, phase = CompilePhase.BEFORE_MATCHING)
    public static int heapChars(char[] a, char[] b, int from, int length) {
        Objects.requireNonNull(a);
        Objects.requireNonNull(b);
        long offset = Unsafe.ARRAY_CHAR_BASE_OFFSET + ((long)from << 1);
        return ArraysSupport.vectorizedMismatch(a, offset, b, offset, length, 1);
    }

    @Test
    @IR(counts = {HEAP, "1"}, failOn = {GENERIC}, phase = CompilePhase.BEFORE_MATCHING)
    public static int heapBooleans(boolean[] a, boolean[] b, int from, int length) {
        return Arrays.mismatch(a, from, from + length, b, from, from + length);
    }

    @Test
    @IR(counts = {HEAP, "1"}, failOn = {GENERIC}, phase = CompilePhase.BEFORE_MATCHING)
    public static int heapShorts(short[] a, short[] b, int from, int length) {
        return Arrays.mismatch(a, from, from + length, b, from, from + length);
    }

    @Test
    @IR(counts = {HEAP, "1"}, failOn = {GENERIC}, phase = CompilePhase.BEFORE_MATCHING)
    public static int heapInts(int[] a, int[] b, int from, int length) {
        Objects.requireNonNull(a);
        Objects.requireNonNull(b);
        long offset = Unsafe.ARRAY_INT_BASE_OFFSET + ((long)from << 2);
        return ArraysSupport.vectorizedMismatch(a, offset, b, offset, length, 2);
    }

    @Test
    @IR(counts = {HEAP, "1"}, failOn = {GENERIC}, phase = CompilePhase.BEFORE_MATCHING)
    public static int heapLongs(long[] a, long[] b, int from, int length) {
        Objects.requireNonNull(a);
        Objects.requireNonNull(b);
        long offset = Unsafe.ARRAY_LONG_BASE_OFFSET + ((long)from << 3);
        return ArraysSupport.vectorizedMismatch(a, offset, b, offset, length, 3);
    }

    @Test
    @IR(counts = {HEAP, "1"}, failOn = {GENERIC}, phase = CompilePhase.BEFORE_MATCHING)
    public static int heapFloats(float[] a, float[] b, int from, int length) {
        return Arrays.mismatch(a, from, from + length, b, from, from + length);
    }

    @Test
    @IR(counts = {HEAP, "1"}, failOn = {GENERIC}, phase = CompilePhase.BEFORE_MATCHING)
    public static int heapDoubles(double[] a, double[] b, int from, int length) {
        return Arrays.mismatch(a, from, from + length, b, from, from + length);
    }

    @Test
    @IR(counts = {GENERIC, "1"}, failOn = {HEAP}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeBytes(long a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, length, 0);
    }

    @Test
    @IR(counts = {GENERIC, "1"}, failOn = {HEAP}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nullableBytes(byte[] a, long aOffset, byte[] b, long bOffset, int length) {
        return ArraysSupport.vectorizedMismatch(a, aOffset, b, bOffset, length, 0);
    }

    private static int warmups;

    @Run(test = {"heapBytes", "heapChars", "heapBooleans", "heapShorts", "heapInts", "heapLongs", "heapFloats", "heapDoubles",
                 "nativeBytes", "nullableBytes"})
    @Warmup(10000)
    public static void run(RunInfo info) {
        if (info.isWarmUp()) {
            int i = warmups++;
            // Large ranges are correctness cases, not interpreted warmup work.
            int length = LENGTHS[i % (LENGTHS.length - 2)];
            int from = i & 7;
            heapBytes(BA, BB, from, length);
            heapChars(CA, CB, from, length);
            heapInts(IA, IB, from, length);
            heapLongs(LA, LB, from, length);
            int at = from + Math.min(1, Math.max(0, length - 1));
            if (length > 0 && (i & 1) != 0) {
                ZB[at] = true;
                SB[at] = -1;
            }
            heapBooleans(ZA, ZB, from, length);
            heapShorts(SA, SB, from, length);
            ZB[at] = false;
            SB[at] = 0;
            if (length > 0) {
                switch (i & 3) {
                    case 1 -> { FB[at] = 1.0f; DB[at] = 1.0; }
                    case 2 -> {
                        FA[at] = Float.intBitsToFloat(0x7fc00001);
                        FB[at] = Float.intBitsToFloat(0xff800002);
                        DA[at] = Double.longBitsToDouble(0x7ff8000000000001L);
                        DB[at] = Double.longBitsToDouble(0xfff0000000000002L);
                    }
                    case 3 -> { FB[at] = -0.0f; DB[at] = -0.0; }
                }
            }
            heapFloats(FA, FB, from, length);
            heapDoubles(DA, DB, from, length);
            FA[at] = FB[at] = 0.0f;
            DA[at] = DB[at] = 0.0;
            nativeBytes(NA.address(), NB.address(), length);
            byte[] a = (i & 1) == 0 ? BA : null;
            byte[] b = (i & 2) == 0 ? BB : null;
            nullableBytes(a, a == null ? NA.address() : Unsafe.ARRAY_BYTE_BASE_OFFSET,
                    b, b == null ? NB.address() : Unsafe.ARRAY_BYTE_BASE_OFFSET, length);
        } else {
            verify();
        }
    }

    private static void check(int actual, int expected) {
        if (actual != expected) {
            throw new AssertionError(actual + " != " + expected);
        }
    }

    // A non-intrinsified call can leave fewer than eight bytes in its Java tail.
    private static void checkRaw(int actual, Object a, long aOffset, Object b, long bOffset,
                                 int length, int scale, int expected) {
        if (actual < 0) {
            int tail = ~actual;
            if (tail < 0 || tail > (7 >> scale) || tail > length) {
                throw new AssertionError("Invalid tail " + tail);
            }
            actual = -1;
            for (int i = length - tail; i < length && actual < 0; i++) {
                for (int j = 0; j < 1 << scale; j++) {
                    long offset = ((long)i << scale) + j;
                    if (U.getByte(a, aOffset + offset) != U.getByte(b, bOffset + offset)) {
                        actual = i;
                        break;
                    }
                }
            }
        }
        check(actual, expected);
    }

    private static void checkHeap(int from, int length, int expected) {
        checkRaw(heapBytes(BA, BB, from, length), BA, Unsafe.ARRAY_BYTE_BASE_OFFSET + from,
                BB, Unsafe.ARRAY_BYTE_BASE_OFFSET + from, length, 0, expected);
        long offset = Unsafe.ARRAY_CHAR_BASE_OFFSET + ((long)from << 1);
        checkRaw(heapChars(CA, CB, from, length), CA, offset, CB, offset, length, 1, expected);
        offset = Unsafe.ARRAY_INT_BASE_OFFSET + ((long)from << 2);
        checkRaw(heapInts(IA, IB, from, length), IA, offset, IB, offset, length, 2, expected);
        offset = Unsafe.ARRAY_LONG_BASE_OFFSET + ((long)from << 3);
        checkRaw(heapLongs(LA, LB, from, length), LA, offset, LB, offset, length, 3, expected);
    }

    private static void verify() {
        for (int from : new int[] {0, 1, 7}) {
            for (int length : LENGTHS) {
                checkHeap(from, length, -1);
                check(heapBooleans(ZA, ZB, from, length), -1);
                check(heapShorts(SA, SB, from, length), -1);
                for (int at : new int[] {0, 1, length / 2, length - 1}) {
                    if (at < 0 || at >= length) continue;
                    BB[from + at] = 1;
                    CB[from + at] = 1;
                    IB[from + at] = 1;
                    LB[from + at] = 1;
                    ZB[from + at] = true;
                    SB[from + at] = -1;
                    checkHeap(from, length, at);
                    check(heapBooleans(ZA, ZB, from, length), at);
                    check(heapShorts(SA, SB, from, length), at);
                    BB[from + at] = 0;
                    CB[from + at] = 0;
                    IB[from + at] = 0;
                    LB[from + at] = 0;
                    ZB[from + at] = false;
                    SB[from + at] = 0;
                }
                check(heapFloats(FA, FB, from, length), -1);
                check(heapDoubles(DA, DB, from, length), -1);
                if (length > 1) {
                    FB[from + 1] = 1.0f;
                    DB[from + 1] = 1.0;
                    check(heapFloats(FA, FB, from, length), 1);
                    check(heapDoubles(DA, DB, from, length), 1);
                    FB[from + 1] = 0.0f;
                    DB[from + 1] = 0.0;
                }
                if (length > 0) {
                    int at = from + length / 2;
                    FA[at] = Float.intBitsToFloat(0x7fc00001);
                    FB[at] = Float.intBitsToFloat(0xff800002);
                    DA[at] = Double.longBitsToDouble(0x7ff8000000000001L);
                    DB[at] = Double.longBitsToDouble(0xfff0000000000002L);
                    check(heapFloats(FA, FB, from, length), -1);
                    check(heapDoubles(DA, DB, from, length), -1);
                    if (length / 2 < length - 1) {
                        FB[from + length - 1] = 1.0f;
                        DB[from + length - 1] = 1.0;
                        check(heapFloats(FA, FB, from, length), length - 1);
                        check(heapDoubles(DA, DB, from, length), length - 1);
                        FB[from + length - 1] = 0.0f;
                        DB[from + length - 1] = 0.0;
                    }
                    FA[at] = 0.0f;
                    FB[at] = -0.0f;
                    DA[at] = 0.0;
                    DB[at] = -0.0;
                    check(heapFloats(FA, FB, from, length), length / 2);
                    check(heapDoubles(DA, DB, from, length), length / 2);
                    FB[at] = 0.0f;
                    DB[at] = 0.0;
                }
                checkRaw(nativeBytes(NA.address(), NB.address(), length), null, NA.address(),
                        null, NB.address(), length, 0, -1);
                // Scoped callers bound nullable/mixed native leaves to 64 KiB.
                for (int kind = 0; length <= 65536 && kind < 4; kind++) {
                    byte[] a = (kind & 1) == 0 ? BA : null;
                    byte[] b = (kind & 2) == 0 ? BB : null;
                    long ao = a == null ? NA.address() : Unsafe.ARRAY_BYTE_BASE_OFFSET;
                    long bo = b == null ? NB.address() : Unsafe.ARRAY_BYTE_BASE_OFFSET;
                    checkRaw(nullableBytes(a, ao, b, bo, length), a, ao, b, bo, length, 0, -1);
                    if (length > 0) {
                        U.putByte(b, bo + length - 1, (byte)1);
                        checkRaw(nullableBytes(a, ao, b, bo, length), a, ao, b, bo, length, 0, length - 1);
                        U.putByte(b, bo + length - 1, (byte)0);
                    }
                }
            }
        }
    }

    public static void main(String[] args) {
        TestFramework.runWithFlags("--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                "--add-exports=java.base/jdk.internal.util=ALL-UNNAMED",
                "-XX:-TieredCompilation", "-XX:+UnlockDiagnosticVMOptions",
                "-XX:ArrayOperationPartialInlineSize=0");
    }
}
