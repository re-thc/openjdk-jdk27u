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
 * @summary Native scoped, segment and NIO mismatches profiled below the stub's 128-byte
 *          minimum compile to the Java loop alone, without the stub path
 * @requires vm.compiler2.enabled & vm.opt.final.UseVectorizedMismatchIntrinsic == true
 * @library /test/lib /
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @run driver compiler.intrinsics.ShortNativeMismatchTest
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
import java.lang.foreign.ValueLayout;
import java.nio.ByteBuffer;
import java.nio.IntBuffer;
import jdk.internal.misc.ScopedMemoryAccess;
import jdk.internal.util.ArraysSupport;

// Each scan has its own JVM here: profiles that also saw longer ranges keep the
// stub path for those, which NativeVectorizedMismatchTest covers.
public class ShortNativeMismatchTest {
    private static final int MINIMUM = 128;
    private static final MemorySegment A = Arena.ofAuto().allocate(MINIMUM + 16);
    private static final MemorySegment B = Arena.ofAuto().allocate(MINIMUM + 16);
    // Misaligned native inputs. Only B is modified; A stays zero.
    private static final long NA = A.address() + 1;
    private static final long NB = B.address() + 3;
    private static final ByteBuffer DA = ByteBuffer.allocateDirect(MINIMUM);
    private static final ByteBuffer DB = ByteBuffer.allocateDirect(MINIMUM);
    private static final int[] LENGTHS = {8, 31, 64, 100, MINIMUM - 1};
    private static final int[] INT_LENGTHS = {2, 7, 16, (MINIMUM >> 2) - 1};

    private static final String LEAF = "CallLeaf.*vectorizedMismatch";

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int scopedShort(long a, long b, int length) {
        return ScopedMemoryAccess.getScopedMemoryAccess().vectorizedMismatch(
                null, null, null, a, null, b, length, 0);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int scopedIntsShort(long a, long b, int length) {
        return ScopedMemoryAccess.getScopedMemoryAccess().vectorizedMismatch(
                null, null, null, a, null, b, length, 2);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static long segmentShort(long length) {
        return MemorySegment.mismatch(A, 1, 1 + length, B, 3, 3 + length);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nioShort(ByteBuffer a, ByteBuffer b) {
        return a.mismatch(b);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nioIntsShort(IntBuffer a, IntBuffer b) {
        return a.mismatch(b);
    }

    // AArch64 compares the minimum in its scalar prefix; x86 calls the stub.
    // This direct call keeps its profile separate from the scoped scans above.
    @Test
    @IR(applyIfPlatform = {"aarch64", "false"}, counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    @IR(applyIfPlatform = {"aarch64", "true"}, failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeAtMinimum(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, MINIMUM, 0);
    }

    @Run(test = {"scopedShort", "scopedIntsShort", "segmentShort", "nioShort", "nioIntsShort",
                 "nativeAtMinimum"})
    @Warmup(10000)
    public static void run(RunInfo info) {
        if (info.isWarmUp()) {
            int length = LENGTHS[warmups % LENGTHS.length];
            int ints = INT_LENGTHS[warmups % INT_LENGTHS.length];
            warmups++;
            scopedShort(NA, NB, length);
            scopedIntsShort(NA, NB, ints);
            segmentShort(length);
            nioShort(DA.slice(0, length), DB.slice(0, length));
            nioIntsShort(DA.slice(0, ints << 2).asIntBuffer(), DB.slice(0, ints << 2).asIntBuffer());
            nativeAtMinimum(NA, NB);
        } else {
            verify();
        }
    }

    private static int warmups;

    private static void verify() {
        for (int length : LENGTHS) {
            checkScoped(scopedShort(NA, NB, length), length, 0, -1);
            check(segmentShort(length), -1, "segment", length);
            check(nioShort(DA.slice(0, length), DB.slice(0, length)), -1, "NIO", length);
            for (int position : positions(length)) {
                setB(position, 1);
                checkScoped(scopedShort(NA, NB, length), length, 0, position);
                check(segmentShort(length), position, "segment", length);
                setB(position, 0);
                DB.put(position, (byte) 1);
                check(nioShort(DA.slice(0, length), DB.slice(0, length)), position, "NIO", length);
                DB.put(position, (byte) 0);
            }
        }
        for (int ints : INT_LENGTHS) {
            checkScoped(scopedIntsShort(NA, NB, ints), ints, 2, -1);
            check(nioIntsShort(DA.slice(0, ints << 2).asIntBuffer(), DB.slice(0, ints << 2).asIntBuffer()),
                    -1, "NIO int", ints);
            for (int element : positions(ints)) {
                // The last byte of the element exercises the index scaling.
                setB((element << 2) + 3, 1);
                checkScoped(scopedIntsShort(NA, NB, ints), ints, 2, element);
                setB((element << 2) + 3, 0);
                DB.put((element << 2) + 3, (byte) 1);
                check(nioIntsShort(DA.slice(0, ints << 2).asIntBuffer(), DB.slice(0, ints << 2).asIntBuffer()),
                        element, "NIO int", ints);
                DB.put((element << 2) + 3, (byte) 0);
            }
        }
        checkScoped(nativeAtMinimum(NA, NB), MINIMUM, 0, -1);
        setB(MINIMUM / 2, 1);
        checkScoped(nativeAtMinimum(NA, NB), MINIMUM, 0, MINIMUM / 2);
        setB(MINIMUM / 2, 0);
    }

    // Every element of the first word, then the middle and the last element.
    private static int[] positions(int length) {
        return java.util.stream.IntStream.concat(java.util.stream.IntStream.range(0, Math.min(length, 8)),
                java.util.stream.IntStream.of(length / 2, length - 1)).distinct().toArray();
    }

    private static void setB(long offset, int value) {
        B.set(ValueLayout.JAVA_BYTE, offset + 3, (byte) value);
    }

    private static void check(long result, long expected, String what, int length) {
        if (result != expected) {
            throw new AssertionError(what + " length " + length + ": " + result + " != " + expected);
        }
    }

    // A complemented result reports a tail of less than one word, which must hold the
    // expected difference if there is one beyond the compared elements.
    private static void checkScoped(int result, int length, int scale, int expected) {
        if (result >= 0) {
            check(result, expected, "scoped scale " + scale, length);
            return;
        }
        int tail = ~result;
        if (tail > (7 >> scale) || tail > length || (expected >= 0 && expected < length - tail)) {
            throw new AssertionError("scoped scale " + scale + " length " + length + ": tail " + tail
                    + ", expected " + expected);
        }
    }

    public static void main(String[] args) {
        TestFramework.runWithFlags("--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                "--add-exports=java.base/jdk.internal.util=ALL-UNNAMED", "-XX:-TieredCompilation");
    }
}
