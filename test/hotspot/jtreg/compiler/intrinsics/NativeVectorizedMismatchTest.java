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
 * @summary Native mismatch uses a bounded C2 leaf and retains the Java path above the bound
 * @requires vm.compiler2.enabled & vm.opt.final.UseVectorizedMismatchIntrinsic == true
 * @library /test/lib /
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @run driver compiler.intrinsics.NativeVectorizedMismatchTest
 * @run driver compiler.intrinsics.NativeVectorizedMismatchTest disable-partial
 */

package compiler.intrinsics;

import compiler.lib.ir_framework.CompilePhase;
import compiler.lib.ir_framework.IR;
import compiler.lib.ir_framework.IRNode;
import compiler.lib.ir_framework.Run;
import compiler.lib.ir_framework.Test;
import compiler.lib.ir_framework.TestFramework;
import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;
import jdk.internal.misc.ScopedMemoryAccess;
import jdk.internal.misc.Unsafe;
import jdk.internal.util.ArraysSupport;

public class NativeVectorizedMismatchTest {
    private static final int LIMIT = 65536;
    private static final MemorySegment A = Arena.ofAuto().allocate(2 * LIMIT + 16);
    private static final MemorySegment B = Arena.ofAuto().allocate(2 * LIMIT + 16);
    private static final byte[] HEAP = new byte[2 * LIMIT + 16];
    private static final byte[] OTHER_HEAP = new byte[2 * LIMIT + 16];

    @Test
    @IR(counts = {"CallLeaf.*vectorizedMismatch", "1",
                  IRNode.STATIC_CALL_OF_METHOD, "vectorizedMismatch", "1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeRange(long a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, length, 0);
    }

    @Test
    @IR(counts = {"CallLeaf.*vectorizedMismatch", "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeAtLimit(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, LIMIT, 0);
    }

    @Test
    @IR(failOn = {"CallLeaf.*vectorizedMismatch"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeZero(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, 0, 0);
    }

    @Test
    @IR(failOn = {"CallLeaf.*vectorizedMismatch"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeShort(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, 64, 0);
    }

    @Test
    @IR(counts = {"CallLeaf.*vectorizedMismatch", "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeAtMinimum(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, 128, 0);
    }

    @Test
    @IR(failOn = {"CallLeaf.*vectorizedMismatch"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeSmallInts(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, 2, 2);
    }

    @Test
    @IR(counts = {"CallLeaf.*vectorizedMismatch", ">= 1", IRNode.SAFEPOINT, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int scopedRange(long a, long b, int length) {
        return ScopedMemoryAccess.getScopedMemoryAccess().vectorizedMismatch(
                null, null, null, a, null, b, length, 0);
    }

    @Test
    @IR(counts = {"CallLeaf.*vectorizedMismatch", ">= 1", IRNode.SAFEPOINT, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static long heapSegmentRange(byte[] a, byte[] b, long length) {
        return MemorySegment.mismatch(MemorySegment.ofArray(a), 0, length,
                MemorySegment.ofArray(b), 0, length);
    }

    @Test
    @IR(failOn = {"CallLeaf.*vectorizedMismatch"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeAboveLimit(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, LIMIT + 1, 0);
    }

    @Test
    @IR(counts = {"CallLeaf.*vectorizedMismatch", "1",
                  IRNode.STATIC_CALL_OF_METHOD, "vectorizedMismatch", "1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixedRange(byte[] a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(a, Unsafe.ARRAY_BYTE_BASE_OFFSET, null, b, length, 0);
    }

    @Run(test = {"nativeRange", "nativeAtLimit", "nativeAboveLimit", "mixedRange",
                 "nativeZero", "nativeShort", "nativeAtMinimum", "nativeSmallInts", "scopedRange", "heapSegmentRange"})
    public static void run() {
        long a = A.address() + 1, b = B.address() + 3;
        B.set(ValueLayout.JAVA_BYTE, 3, (byte) 1);
        check(nativeRange(a, b, 0), 0, -1);
        check(mixedRange(HEAP, b, 0), 0, -1);
        check(nativeZero(a, b), 0, -1);
        B.set(ValueLayout.JAVA_BYTE, 3, (byte) 0);
        // No native address is accessible here; an empty range must not read it.
        check(nativeRange(0, 0, 0), 0, -1);
        check(mixedRange(HEAP, 0, 0), 0, -1);
        check(nativeZero(0, 0), 0, -1);
        for (int length : new int[] {-1, -8, Integer.MIN_VALUE}) {
            int expected = ~length;
            if (nativeRange(0, 0, length) != expected || mixedRange(HEAP, 0, length) != expected) {
                throw new AssertionError("Negative length fallback: " + length);
            }
        }
        for (int length : new int[] {1, 7, 8, 15, 16, 31, 32, 33, 63, 64,
                127, 128, 129, LIMIT - 1, LIMIT, LIMIT + 1, 2 * LIMIT}) {
            check(nativeRange(a, b, length), length, -1);
            check(mixedRange(HEAP, b, length), length, -1);
            check(scopedRange(a, b, length), length, -1);
            int position = length / 2;
            B.set(ValueLayout.JAVA_BYTE, position + 3, (byte) 1);
            check(nativeRange(a, b, length), length, position);
            check(mixedRange(HEAP, b, length), length, position);
            check(scopedRange(a, b, length), length, position);
            B.set(ValueLayout.JAVA_BYTE, position + 3, (byte) 0);
            if (heapSegmentRange(HEAP, OTHER_HEAP, length) != -1) {
                throw new AssertionError("Equal heap segments: " + length);
            }
            OTHER_HEAP[position] = 1;
            if (heapSegmentRange(HEAP, OTHER_HEAP, length) != position) {
                throw new AssertionError("Heap segment difference: " + length);
            }
            OTHER_HEAP[position] = 0;
        }
        check(nativeAtLimit(a, b), LIMIT, -1);
        check(nativeShort(a, b), 64, -1);
        check(nativeAtMinimum(a, b), 128, -1);
        B.set(ValueLayout.JAVA_BYTE, 32 + 3, (byte) 1);
        check(nativeShort(a, b), 64, 32);
        B.set(ValueLayout.JAVA_BYTE, 32 + 3, (byte) 0);
        if (nativeSmallInts(a, b) != -1) {
            throw new AssertionError("Equal native int values");
        }
        B.set(ValueLayout.JAVA_BYTE, 4 + 3, (byte) 1);
        if (nativeSmallInts(a, b) != 1) {
            throw new AssertionError("Second native int differs");
        }
        B.set(ValueLayout.JAVA_BYTE, 4 + 3, (byte) 0);
        check(nativeAboveLimit(a, b), LIMIT + 1, -1);
        B.set(ValueLayout.JAVA_BYTE, LIMIT - 1 + 3, (byte) 1);
        check(nativeAtLimit(a, b), LIMIT, LIMIT - 1);
        check(nativeAboveLimit(a, b), LIMIT + 1, LIMIT - 1);
        B.set(ValueLayout.JAVA_BYTE, LIMIT - 1 + 3, (byte) 0);
    }

    private static void check(int result, int length, int expected) {
        if (result < 0) {
            int tail = ~result;
            if (tail < 0 || tail > 7 || tail > length) {
                throw new AssertionError("Invalid mismatch tail: " + tail);
            }
            result = -1;
            for (int i = length - tail; i < length; i++) {
                if (B.get(ValueLayout.JAVA_BYTE, i + 3) != 0) {
                    result = i;
                    break;
                }
            }
        }
        if (result != expected) {
            throw new AssertionError("length=" + length + ": " + result + " != " + expected);
        }
    }

    public static void main(String[] args) {
        String misc = "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED";
        String util = "--add-exports=java.base/jdk.internal.util=ALL-UNNAMED";
        if (args.length != 0 && args[0].equals("disable-partial")) {
            TestFramework.runWithFlags(misc, util, "-XX:-TieredCompilation", "-XX:+UnlockDiagnosticVMOptions",
                    "-XX:ArrayOperationPartialInlineSize=0");
        } else {
            TestFramework.runWithFlags(misc, util, "-XX:-TieredCompilation");
        }
    }
}
