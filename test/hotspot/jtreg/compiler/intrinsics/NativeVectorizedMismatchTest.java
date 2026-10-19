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
 * @test id=ir
 * @summary Native mismatch uses a bounded C2 leaf and retains the Java path outside the bound
 * @requires vm.compiler2.enabled & vm.opt.final.UseVectorizedMismatchIntrinsic == true
 * @library /test/lib /
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @run driver compiler.intrinsics.NativeVectorizedMismatchTest
 * @run driver compiler.intrinsics.NativeVectorizedMismatchTest disable-partial
 */

/*
 * @test id=ir-serial
 * @summary Chunked native, scoped, segment and NIO scans keep their polls when counted loops
 *          have none, as with SerialGC's default loop settings
 * @requires vm.compiler2.enabled & vm.opt.final.UseVectorizedMismatchIntrinsic == true & vm.gc.Serial
 * @library /test/lib /
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @run driver compiler.intrinsics.NativeVectorizedMismatchTest serial
 */

/*
 * @test id=ideal
 * @summary The bounded native mismatch leaf is dominated by its length guard and first-word check,
 *          the Java fallback is either the named call or an inlined polling loop, and every
 *          iteration of a chunked scan polls under the default GC and under SerialGC
 * @requires vm.debug == true & vm.compiler2.enabled & vm.opt.final.UseVectorizedMismatchIntrinsic == true
 * @library /test/lib /
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.intrinsics.NativeVectorizedMismatchTest ideal
 */

package compiler.intrinsics;

import compiler.lib.ir_framework.CompilePhase;
import compiler.lib.ir_framework.IR;
import compiler.lib.ir_framework.IRNode;
import compiler.lib.ir_framework.Run;
import compiler.lib.ir_framework.RunInfo;
import compiler.lib.ir_framework.Test;
import compiler.lib.ir_framework.TestFramework;
import compiler.lib.ir_framework.Warmup;
import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.IntConsumer;
import java.util.stream.Collectors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.internal.misc.ScopedMemoryAccess;
import jdk.internal.misc.Unsafe;
import jdk.internal.util.ArraysSupport;
import jdk.test.lib.Platform;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class NativeVectorizedMismatchTest {
    private static final int LIMIT = 65536;
    private static final int MINIMUM = 128;
    private static final int BULK_MINIMUM = 512;
    private static final int AARCH64_HEAP_PREFIX = 2048;
    private static final MemorySegment A = Arena.ofAuto().allocate(2 * LIMIT + 16);
    private static final MemorySegment B = Arena.ofAuto().allocate(2 * LIMIT + 16);
    private static final byte[] HEAP = new byte[2 * LIMIT + 16];
    private static final byte[] OTHER_HEAP = new byte[2 * LIMIT + 16];
    private static final int[] INT_HEAP = new int[(2 * LIMIT + 16) / Integer.BYTES];
    // Misaligned native inputs. Only B (at NB) is modified; A and the heap arrays stay zero.
    private static final long NA = A.address() + 1;
    private static final long NB = B.address() + 3;
    // Ordinary direct buffers have no segment session, so NIO fences them itself.
    private static final ByteBuffer DA = ByteBuffer.allocateDirect(2 * LIMIT + 16);
    private static final ByteBuffer DB = ByteBuffer.allocateDirect(2 * LIMIT + 16);

    private static final String LEAF = "CallLeaf.*vectorizedMismatch";

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeRange(long a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, length, 0);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeCharsRange(long a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, length, 1);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeIntsRange(long a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, length, 2);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeLongsRange(long a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, length, 3);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int mixedRange(byte[] a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(a, Unsafe.ARRAY_BYTE_BASE_OFFSET, null, b, length, 0);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int mixedReverseRange(long a, byte[] b, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, b, Unsafe.ARRAY_BYTE_BASE_OFFSET, length, 0);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeAtLimit(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, LIMIT, 0);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeAboveLimit(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, LIMIT + 1, 0);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeZero(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, 0, 0);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeShort(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, 64, 0);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeBelowMinimum(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, MINIMUM - 1, 0);
    }

    // Guarded native ranges exceed the partial inlining size: no masked path is emitted.
    @Test
    @IR(applyIfPlatform = {"aarch64", "false"}, counts = {LEAF, "1", "CountTrailingZerosL", "1"}, failOn = {"VectorCmpMasked"},
        phase = CompilePhase.BEFORE_MATCHING)
    @IR(applyIfPlatform = {"aarch64", "true"},
        failOn = {LEAF, "VectorCmpMasked", IRNode.SAFEPOINT,
                  "CallStaticJava.*ArraysSupport::vectorizedMismatch"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeAtMinimum(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, MINIMUM, 0);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "false"}, counts = {LEAF, "1"}, failOn = {"VectorCmpMasked"}, phase = CompilePhase.BEFORE_MATCHING)
    @IR(applyIfPlatform = {"aarch64", "true"},
        failOn = {LEAF, "VectorCmpMasked", IRNode.SAFEPOINT,
                  "CallStaticJava.*ArraysSupport::vectorizedMismatch"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeChars(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, MINIMUM >> 1, 1);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "false"}, counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    @IR(applyIfPlatform = {"aarch64", "true"},
        failOn = {LEAF, "VectorCmpMasked", IRNode.SAFEPOINT,
                  "CallStaticJava.*ArraysSupport::vectorizedMismatch"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeInts(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, MINIMUM >> 2, 2);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "false"}, counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    @IR(applyIfPlatform = {"aarch64", "true"},
        failOn = {LEAF, "VectorCmpMasked", IRNode.SAFEPOINT,
                  "CallStaticJava.*ArraysSupport::vectorizedMismatch"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeLongs(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, MINIMUM >> 3, 3);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"}, failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    @IR(applyIfPlatform = {"aarch64", "false"}, counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeIntermediate(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, 256, 0);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"}, failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    @IR(applyIfPlatform = {"aarch64", "false"}, counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeCharsIntermediate(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, (256 >> 1), 1);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"}, failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    @IR(applyIfPlatform = {"aarch64", "false"}, counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeIntsIntermediate(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, (256 >> 2), 2);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"}, failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    @IR(applyIfPlatform = {"aarch64", "false"}, counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeLongsIntermediate(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, (256 >> 3), 3);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeAtBulkMinimum(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, BULK_MINIMUM, 0);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeCharsAtBulkMinimum(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, (BULK_MINIMUM >> 1), 1);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeIntsAtBulkMinimum(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, (BULK_MINIMUM >> 2), 2);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeLongsAtBulkMinimum(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, (BULK_MINIMUM >> 3), 3);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeCharsBelowMinimum(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, (MINIMUM >> 1) - 1, 1);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeIntsBelowMinimum(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, (MINIMUM >> 2) - 1, 2);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeLongsBelowMinimum(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, (MINIMUM >> 3) - 1, 3);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeSmallInts(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, 2, 2);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeCharsAtLimit(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, LIMIT >> 1, 1);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeIntsAtLimit(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, LIMIT >> 2, 2);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeLongsAtLimit(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, LIMIT >> 3, 3);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeCharsAboveLimit(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, (LIMIT >> 1) + 1, 1);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeIntsAboveLimit(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, (LIMIT >> 2) + 1, 2);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeLongsAboveLimit(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, (LIMIT >> 3) + 1, 3);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int mixedBelowMinimum(byte[] a, long b) {
        return ArraysSupport.vectorizedMismatch(a, Unsafe.ARRAY_BYTE_BASE_OFFSET, null, b, MINIMUM - 1, 0);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "false"}, counts = {LEAF, "1", "CountTrailingZerosL", "1"}, failOn = {"VectorCmpMasked"},
        phase = CompilePhase.BEFORE_MATCHING)
    @IR(applyIfPlatform = {"aarch64", "true"},
        failOn = {LEAF, "VectorCmpMasked", IRNode.SAFEPOINT,
                  "CallStaticJava.*ArraysSupport::vectorizedMismatch"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int mixedAtMinimum(byte[] a, long b) {
        return ArraysSupport.vectorizedMismatch(a, Unsafe.ARRAY_BYTE_BASE_OFFSET, null, b, MINIMUM, 0);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int mixedAtLimit(byte[] a, long b) {
        return ArraysSupport.vectorizedMismatch(a, Unsafe.ARRAY_BYTE_BASE_OFFSET, null, b, LIMIT, 0);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int mixedAboveLimit(byte[] a, long b) {
        return ArraysSupport.vectorizedMismatch(a, Unsafe.ARRAY_BYTE_BASE_OFFSET, null, b, LIMIT + 1, 0);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int mixedReverseAtLimit(long a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(null, a, b, Unsafe.ARRAY_BYTE_BASE_OFFSET, LIMIT, 0);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int mixedIntsAtLimit(int[] a, long b) {
        return ArraysSupport.vectorizedMismatch(a, Unsafe.ARRAY_INT_BASE_OFFSET, null, b, LIMIT >> 2, 2);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int mixedIntsAboveLimit(int[] a, long b) {
        return ArraysSupport.vectorizedMismatch(a, Unsafe.ARRAY_INT_BASE_OFFSET, null, b, (LIMIT >> 2) + 1, 2);
    }

    @Test
    @IR(counts = {LEAF, ">= 1", IRNode.SAFEPOINT, ">= 1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int scopedRange(long a, long b, int length) {
        return ScopedMemoryAccess.getScopedMemoryAccess().vectorizedMismatch(
                null, null, null, a, null, b, length, 0);
    }

    @Test
    @IR(counts = {LEAF, ">= 1", IRNode.SAFEPOINT, ">= 1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static long heapSegmentRange(byte[] a, byte[] b, long length) {
        return MemorySegment.mismatch(MemorySegment.ofArray(a), 0, length,
                MemorySegment.ofArray(b), 0, length);
    }

    @Test
    @IR(counts = {LEAF, ">= 1", IRNode.SAFEPOINT, ">= 1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nioRange(ByteBuffer a, ByteBuffer b) {
        return a.mismatch(b);
    }

    @Test
    @IR(counts = {LEAF, ">= 1", IRNode.SAFEPOINT, ">= 1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int nioMixedRange(ByteBuffer heap, ByteBuffer direct) {
        return heap.mismatch(direct);
    }

    // Views of the first length bytes; the direct ones share the static buffers' memory.
    private static ByteBuffer directA(int length) {
        return DA.slice(0, length);
    }

    private static ByteBuffer directB(int length) {
        return DB.slice(0, length);
    }

    private static ByteBuffer heapA(int length) {
        return ByteBuffer.wrap(HEAP, 0, length).slice();
    }

    @Run(test = {"nativeRange", "nativeCharsRange", "nativeIntsRange", "nativeLongsRange",
                 "mixedRange", "mixedReverseRange", "nativeAtLimit", "nativeAboveLimit",
                 "nativeZero", "nativeShort", "nativeBelowMinimum", "nativeAtMinimum",
                 "nativeChars", "nativeInts", "nativeLongs",
                 "nativeIntermediate", "nativeCharsIntermediate", "nativeIntsIntermediate", "nativeLongsIntermediate",
                 "nativeAtBulkMinimum", "nativeCharsAtBulkMinimum", "nativeIntsAtBulkMinimum", "nativeLongsAtBulkMinimum",
                 "nativeCharsBelowMinimum", "nativeIntsBelowMinimum", "nativeLongsBelowMinimum", "nativeSmallInts",
                 "nativeCharsAtLimit", "nativeIntsAtLimit", "nativeLongsAtLimit",
                 "nativeCharsAboveLimit", "nativeIntsAboveLimit", "nativeLongsAboveLimit",
                 "mixedBelowMinimum", "mixedAtMinimum", "mixedAtLimit", "mixedAboveLimit",
                 "mixedReverseAtLimit", "mixedIntsAtLimit", "mixedIntsAboveLimit",
                 "scopedRange", "heapSegmentRange", "nioRange", "nioMixedRange"})
    // Enough calls for interpreter profiles, so that the scoped and segment
    // call chains inline and expose their bounded leaf and chunk polls.
    @Warmup(10000)
    public static void run(RunInfo info) {
        if (info.isWarmUp()) {
            warm(warmups++);
        } else {
            verifyAll();
        }
    }

    private static int warmups;

    // Profiles each entry point with equal inputs; results are verified after compilation.
    private static void warm(int i) {
        long a = NA, b = NB;
        int length = WARM_LENGTHS[i % WARM_LENGTHS.length];
        nativeRange(a, b, length);
        nativeCharsRange(a, b, length >> 1);
        nativeIntsRange(a, b, length >> 2);
        nativeLongsRange(a, b, length >> 3);
        mixedRange(HEAP, b, length);
        mixedReverseRange(b, HEAP, length);
        // Chunked scans also see two-chunk ranges, so the profile keeps their loop.
        int chunked = i % 50 == 0 ? 2 * LIMIT : length;
        scopedRange(a, b, chunked);
        heapSegmentRange(HEAP, OTHER_HEAP, chunked);
        nioRange(directA(chunked), directB(chunked));
        nioMixedRange(heapA(chunked), directB(chunked));
        nativeAtLimit(a, b);
        nativeAboveLimit(a, b);
        nativeZero(a, b);
        nativeShort(a, b);
        nativeBelowMinimum(a, b);
        nativeAtMinimum(a, b);
        nativeChars(a, b);
        nativeInts(a, b);
        nativeLongs(a, b);
        nativeIntermediate(a, b);
        nativeCharsIntermediate(a, b);
        nativeIntsIntermediate(a, b);
        nativeLongsIntermediate(a, b);
        nativeAtBulkMinimum(a, b);
        nativeCharsAtBulkMinimum(a, b);
        nativeIntsAtBulkMinimum(a, b);
        nativeLongsAtBulkMinimum(a, b);
        nativeCharsBelowMinimum(a, b);
        nativeIntsBelowMinimum(a, b);
        nativeLongsBelowMinimum(a, b);
        nativeSmallInts(a, b);
        nativeCharsAtLimit(a, b);
        nativeIntsAtLimit(a, b);
        nativeLongsAtLimit(a, b);
        nativeCharsAboveLimit(a, b);
        nativeIntsAboveLimit(a, b);
        nativeLongsAboveLimit(a, b);
        mixedBelowMinimum(HEAP, b);
        mixedAtMinimum(HEAP, b);
        mixedAtLimit(HEAP, b);
        mixedAboveLimit(HEAP, b);
        mixedReverseAtLimit(b, HEAP);
        mixedIntsAtLimit(INT_HEAP, b);
        mixedIntsAboveLimit(INT_HEAP, b);
    }

    private static void verifyAll() {
        long a = NA, b = NB;
        // Data outside the compared range must not affect an empty comparison.
        setB(0, 1);
        check(nativeRange(a, b, 0), 0, 0, -1);
        check(mixedRange(HEAP, b, 0), 0, 0, -1);
        check(mixedReverseRange(b, HEAP, 0), 0, 0, -1);
        check(nativeZero(a, b), 0, 0, -1);
        setB(0, 0);
        // No native address is accessible here; an empty range must not read it.
        check(nativeRange(0, 0, 0), 0, 0, -1);
        check(nativeLongsRange(0, 0, 0), 0, 3, -1);
        check(mixedRange(HEAP, 0, 0), 0, 0, -1);
        check(nativeZero(0, 0), 0, 0, -1);
        for (int length : new int[] {-1, -8, Integer.MIN_VALUE}) {
            int expected = ~length;
            if (nativeRange(0, 0, length) != expected || mixedRange(HEAP, 0, length) != expected ||
                    nativeIntsRange(0, 0, length) != expected) {
                throw new AssertionError("Negative length fallback: " + length);
            }
        }

        for (int scale = 0; scale <= 3; scale++) {
            int minimum = MINIMUM >> scale, limit = LIMIT >> scale;
            for (int length : new int[] {1, 2, 3, 7, 8, 15, 16, 31, 32, 33, 63, 64, 65,
                    minimum - 1, minimum, minimum + 1, limit - 1, limit, limit + 1, 2 * limit}) {
                checkRange(scale, a, b, length);
            }
        }
        for (int length : new int[] {MINIMUM - 1, MINIMUM, LIMIT, LIMIT + 1}) {
            for (int position : new int[] {0, length / 2, length - 1}) {
                if (heapSegmentRange(HEAP, OTHER_HEAP, length) != -1) {
                    throw new AssertionError("Equal heap segments: " + length);
                }
                OTHER_HEAP[position] = 1;
                if (heapSegmentRange(HEAP, OTHER_HEAP, length) != position) {
                    throw new AssertionError("Heap segment difference: " + length + " at " + position);
                }
                OTHER_HEAP[position] = 0;
            }
        }

        // NIO comparisons above 64 KiB run in chunks; differences on either side of the boundary.
        for (int length : new int[] {MINIMUM - 1, MINIMUM, LIMIT, LIMIT + 1, 2 * LIMIT}) {
            for (int position : new int[] {0, 7, length / 2, LIMIT - 1, LIMIT, length - 1}) {
                if (position >= length) {
                    continue;
                }
                if (nioRange(directA(length), directB(length)) != -1 ||
                        nioMixedRange(heapA(length), directB(length)) != -1) {
                    throw new AssertionError("Equal NIO buffers: " + length);
                }
                DB.put(position, (byte) 1);
                if (nioRange(directA(length), directB(length)) != position ||
                        nioMixedRange(heapA(length), directB(length)) != position) {
                    throw new AssertionError("NIO difference: " + length + " at " + position);
                }
                DB.put(position, (byte) 0);
            }
        }

        // Every byte of a complete scalar prefix, including both mixed orders.
        for (int at = 0; at < MINIMUM; at++) {
            setB(at, 1);
            check(nativeAtMinimum(a, b), MINIMUM, 0, at);
            check(nativeChars(a, b), MINIMUM >> 1, 1, at >> 1);
            check(nativeInts(a, b), MINIMUM >> 2, 2, at >> 2);
            check(nativeLongs(a, b), MINIMUM >> 3, 3, at >> 3);
            check(mixedAtMinimum(HEAP, b), MINIMUM, 0, at);
            check(mixedReverseRange(b, HEAP, MINIMUM), MINIMUM, 0, at);
            setB(at, 0);
        }

        // Constant sizes at and around the bound, for each element scale.
        checkConstant(0, MINIMUM - 1, () -> nativeBelowMinimum(a, b));
        checkConstant(0, MINIMUM, () -> nativeAtMinimum(a, b));
        checkConstant(0, LIMIT, () -> nativeAtLimit(a, b));
        checkConstant(0, LIMIT + 1, () -> nativeAboveLimit(a, b));
        checkConstant(0, 64, () -> nativeShort(a, b));
        checkConstant(0, 0, () -> nativeZero(a, b));
        checkConstant(0, 256, () -> nativeIntermediate(a, b));
        checkConstant(1, (256 >> 1), () -> nativeCharsIntermediate(a, b));
        checkConstant(2, (256 >> 2), () -> nativeIntsIntermediate(a, b));
        checkConstant(3, (256 >> 3), () -> nativeLongsIntermediate(a, b));
        checkConstant(0, BULK_MINIMUM, () -> nativeAtBulkMinimum(a, b));
        checkConstant(1, (BULK_MINIMUM >> 1), () -> nativeCharsAtBulkMinimum(a, b));
        checkConstant(2, (BULK_MINIMUM >> 2), () -> nativeIntsAtBulkMinimum(a, b));
        checkConstant(3, (BULK_MINIMUM >> 3), () -> nativeLongsAtBulkMinimum(a, b));
        checkConstant(1, (MINIMUM >> 1) - 1, () -> nativeCharsBelowMinimum(a, b));
        checkConstant(1, MINIMUM >> 1, () -> nativeChars(a, b));
        checkConstant(1, LIMIT >> 1, () -> nativeCharsAtLimit(a, b));
        checkConstant(1, (LIMIT >> 1) + 1, () -> nativeCharsAboveLimit(a, b));
        checkConstant(2, 2, () -> nativeSmallInts(a, b));
        checkConstant(2, (MINIMUM >> 2) - 1, () -> nativeIntsBelowMinimum(a, b));
        checkConstant(2, MINIMUM >> 2, () -> nativeInts(a, b));
        checkConstant(2, LIMIT >> 2, () -> nativeIntsAtLimit(a, b));
        checkConstant(2, (LIMIT >> 2) + 1, () -> nativeIntsAboveLimit(a, b));
        checkConstant(3, (MINIMUM >> 3) - 1, () -> nativeLongsBelowMinimum(a, b));
        checkConstant(3, MINIMUM >> 3, () -> nativeLongs(a, b));
        checkConstant(3, LIMIT >> 3, () -> nativeLongsAtLimit(a, b));
        checkConstant(3, (LIMIT >> 3) + 1, () -> nativeLongsAboveLimit(a, b));
        // Mixed heap and native inputs in both argument orders.
        checkConstant(0, MINIMUM - 1, () -> mixedBelowMinimum(HEAP, b));
        checkConstant(0, MINIMUM, () -> mixedAtMinimum(HEAP, b));
        checkConstant(0, LIMIT, () -> mixedAtLimit(HEAP, b));
        checkConstant(0, LIMIT + 1, () -> mixedAboveLimit(HEAP, b));
        checkConstant(0, LIMIT, () -> mixedReverseAtLimit(b, HEAP));
        checkConstant(2, LIMIT >> 2, () -> mixedIntsAtLimit(INT_HEAP, b));
        checkConstant(2, (LIMIT >> 2) + 1, () -> mixedIntsAboveLimit(INT_HEAP, b));
    }

    // Compares every variable-size entry point of one scale at one length. A difference is
    // placed in the first word, the middle and the last element in turn.
    private static void checkRange(int scale, long a, long b, int length) {
        IntConsumer verify = expected -> {
            check(rangeOf(scale, a, b, length), length, scale, expected);
            if (scale == 0) {
                check(mixedRange(HEAP, b, length), length, 0, expected);
                check(mixedReverseRange(b, HEAP, length), length, 0, expected);
                check(scopedRange(a, b, length), length, 0, expected);
            }
        };
        verify.accept(-1);
        for (int element : differences(scale, length)) {
            setB((long) element << scale, 1);
            verify.accept(element);
            setB((long) element << scale, 0);
        }
    }

    private static int rangeOf(int scale, long a, long b, int length) {
        return switch (scale) {
            case 0 -> nativeRange(a, b, length);
            case 1 -> nativeCharsRange(a, b, length);
            case 2 -> nativeIntsRange(a, b, length);
            default -> nativeLongsRange(a, b, length);
        };
    }

    private interface Mismatch {
        int run();
    }

    private static void checkConstant(int scale, int length, Mismatch mismatch) {
        check(mismatch.run(), length, scale, -1);
        for (int element : differences(scale, length)) {
            // The most significant byte of the element exercises the index scaling.
            long offset = ((long) element << scale) + (1 << scale) - 1;
            setB(offset, 1);
            check(mismatch.run(), length, scale, element);
            setB(offset, 0);
        }
    }

    // Each element of the first word, then the middle, the last full word and the last element.
    private static int[] differences(int scale, int length) {
        Set<Integer> elements = new java.util.TreeSet<>();
        for (int i = 0; i < Math.min(length, Long.BYTES >> scale); i++) {
            elements.add(i);
        }
        if (length > 0) {
            elements.add(length / 2);
            elements.add(Math.max(0, length - (Long.BYTES >> scale) - 1));
            elements.add(length - 1);
        }
        return elements.stream().mapToInt(Integer::intValue).toArray();
    }

    private static void setB(long offset, int value) {
        B.set(ValueLayout.JAVA_BYTE, offset + 3, (byte) value);
    }

    // Verifies an element index for elements of 1 << scale bytes. A complemented result
    // reports a tail of less than one word, which is compared here.
    private static void check(int result, int length, int scale, int expected) {
        if (result < 0) {
            int tail = ~result;
            if (tail < 0 || tail > (7 >> scale) || tail > length) {
                throw new AssertionError("length=" + length + ", scale=" + scale + ": invalid tail " + tail);
            }
            result = -1;
            for (int i = length - tail; i < length && result < 0; i++) {
                for (int j = 0; j < 1 << scale; j++) {
                    if (B.get(ValueLayout.JAVA_BYTE, ((long) i << scale) + j + 3) != 0) {
                        result = i;
                        break;
                    }
                }
            }
        }
        if (result != expected) {
            throw new AssertionError("length=" + length + ", scale=" + scale + ": " + result + " != " + expected);
        }
    }

    // ---------------------------------------------------------------------------------------
    // Control-flow verification on the BEFORE_MATCHING graph printed by PrintIdealPhase.

    private enum Kind {
        VARIABLE,   // guarded leaf with a Java fallback
        IN_RANGE,   // complete scalar prefix on AArch64; leaf on x86
        BULK,       // constant at the bulk admission minimum
        INTERMEDIATE, // Java on AArch64; leaf on x86
        AT_LIMIT,   // constant at the native leaf bound
        ABOVE,      // constant above the bound: polling Java fallback only
        SHORT,      // constant below the minimum: bounded Java fallback only
        CHUNKED     // a Java loop over bounded leaves
    }

    private enum Fallback {
        EITHER, CALL, INLINED
    }

    private record IdealCase(String method, Kind kind, int scale, IntConsumer warm) {
        // Interpreted 64 KiB comparisons are slow; constant sizes need no length profile.
        // Chunked scans need enough calls for their call chains to inline, as in run().
        int warmups() {
            return switch (kind) {
                case VARIABLE -> 2000;
                case CHUNKED -> 8000;
                default -> 20;
            };
        }
    }

    private static final int[] WARM_LENGTHS = {0, 7, 64, 127, 128, 129, 200, 255, 256, 511, 512, 513, 1000, 4096};

    private static IntConsumer warmRange(int scale) {
        return i -> rangeOf(scale, NA, NB, i % 500 == 0 ? (LIMIT >> scale) + 1 : WARM_LENGTHS[i % WARM_LENGTHS.length]);
    }

    private static List<IdealCase> idealCases() {
        IntConsumer mixed = i -> mixedRange(HEAP, NB, WARM_LENGTHS[i % WARM_LENGTHS.length]);
        IntConsumer reverse = i -> mixedReverseRange(NB, HEAP, WARM_LENGTHS[i % WARM_LENGTHS.length]);
        return List.of(
                new IdealCase("nativeRange", Kind.VARIABLE, 0, warmRange(0)),
                new IdealCase("nativeCharsRange", Kind.VARIABLE, 1, warmRange(1)),
                new IdealCase("nativeIntsRange", Kind.VARIABLE, 2, warmRange(2)),
                new IdealCase("nativeLongsRange", Kind.VARIABLE, 3, warmRange(3)),
                new IdealCase("mixedRange", Kind.VARIABLE, 0, mixed),
                new IdealCase("mixedReverseRange", Kind.VARIABLE, 0, reverse),
                new IdealCase("nativeAtMinimum", Kind.IN_RANGE, 0, i -> nativeAtMinimum(NA, NB)),
                new IdealCase("nativeChars", Kind.IN_RANGE, 1, i -> nativeChars(NA, NB)),
                new IdealCase("nativeInts", Kind.IN_RANGE, 2, i -> nativeInts(NA, NB)),
                new IdealCase("nativeLongs", Kind.IN_RANGE, 3, i -> nativeLongs(NA, NB)),
                new IdealCase("nativeIntermediate", Kind.INTERMEDIATE, 0, i -> nativeIntermediate(NA, NB)),
                new IdealCase("nativeCharsIntermediate", Kind.INTERMEDIATE, 1, i -> nativeCharsIntermediate(NA, NB)),
                new IdealCase("nativeIntsIntermediate", Kind.INTERMEDIATE, 2, i -> nativeIntsIntermediate(NA, NB)),
                new IdealCase("nativeLongsIntermediate", Kind.INTERMEDIATE, 3, i -> nativeLongsIntermediate(NA, NB)),
                new IdealCase("nativeAtBulkMinimum", Kind.BULK, 0, i -> nativeAtBulkMinimum(NA, NB)),
                new IdealCase("nativeCharsAtBulkMinimum", Kind.BULK, 1, i -> nativeCharsAtBulkMinimum(NA, NB)),
                new IdealCase("nativeIntsAtBulkMinimum", Kind.BULK, 2, i -> nativeIntsAtBulkMinimum(NA, NB)),
                new IdealCase("nativeLongsAtBulkMinimum", Kind.BULK, 3, i -> nativeLongsAtBulkMinimum(NA, NB)),
                new IdealCase("nativeAtLimit", Kind.AT_LIMIT, 0, i -> nativeAtLimit(NA, NB)),
                new IdealCase("nativeCharsAtLimit", Kind.AT_LIMIT, 1, i -> nativeCharsAtLimit(NA, NB)),
                new IdealCase("nativeIntsAtLimit", Kind.AT_LIMIT, 2, i -> nativeIntsAtLimit(NA, NB)),
                new IdealCase("nativeLongsAtLimit", Kind.AT_LIMIT, 3, i -> nativeLongsAtLimit(NA, NB)),
                new IdealCase("mixedAtMinimum", Kind.IN_RANGE, 0, i -> mixedAtMinimum(HEAP, NB)),
                new IdealCase("mixedAtLimit", Kind.AT_LIMIT, 0, i -> mixedAtLimit(HEAP, NB)),
                new IdealCase("mixedReverseAtLimit", Kind.AT_LIMIT, 0, i -> mixedReverseAtLimit(NB, HEAP)),
                new IdealCase("mixedIntsAtLimit", Kind.AT_LIMIT, 2, i -> mixedIntsAtLimit(INT_HEAP, NB)),
                new IdealCase("nativeAboveLimit", Kind.ABOVE, 0, i -> nativeAboveLimit(NA, NB)),
                new IdealCase("nativeCharsAboveLimit", Kind.ABOVE, 1, i -> nativeCharsAboveLimit(NA, NB)),
                new IdealCase("nativeLongsAboveLimit", Kind.ABOVE, 3, i -> nativeLongsAboveLimit(NA, NB)),
                new IdealCase("mixedAboveLimit", Kind.ABOVE, 0, i -> mixedAboveLimit(HEAP, NB)),
                new IdealCase("mixedIntsAboveLimit", Kind.ABOVE, 2, i -> mixedIntsAboveLimit(INT_HEAP, NB)),
                new IdealCase("nativeBelowMinimum", Kind.SHORT, 0, i -> nativeBelowMinimum(NA, NB)),
                new IdealCase("nativeIntsBelowMinimum", Kind.SHORT, 2, i -> nativeIntsBelowMinimum(NA, NB)),
                new IdealCase("mixedBelowMinimum", Kind.SHORT, 0, i -> mixedBelowMinimum(HEAP, NB)));
    }

    // Scans longer than one leaf; every 50th warmup compares two chunks, so that the
    // profile keeps the loop.
    private static List<IdealCase> chunkCases() {
        IntConsumer scoped = i -> scopedRange(NA, NB, i % 50 == 0 ? 2 * LIMIT : 4096);
        IntConsumer segment = i -> heapSegmentRange(HEAP, OTHER_HEAP, i % 50 == 0 ? 2 * LIMIT : 4096);
        IntConsumer nio = i -> {
            int length = i % 50 == 0 ? 2 * LIMIT : 4096;
            nioRange(directA(length), directB(length));
        };
        IntConsumer mixed = i -> {
            int length = i % 50 == 0 ? 2 * LIMIT : 4096;
            nioMixedRange(heapA(length), directB(length));
        };
        return List.of(new IdealCase("scopedRange", Kind.CHUNKED, 0, scoped),
                       new IdealCase("heapSegmentRange", Kind.CHUNKED, 0, segment),
                       new IdealCase("nioRange", Kind.CHUNKED, 0, nio),
                       new IdealCase("nioMixedRange", Kind.CHUNKED, 0, mixed));
    }

    private static final String MARKER = "@@ideal-case ";

    // Child VM: profile each case in the interpreter, then compile it once with C2.
    private static void idealChild(List<IdealCase> cases) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        for (IdealCase c : cases) {
            Method m = Arrays.stream(NativeVectorizedMismatchTest.class.getDeclaredMethods())
                    .filter(x -> x.getName().equals(c.method())).findFirst().orElseThrow();
            for (int i = 0; i < c.warmups(); i++) {
                c.warm().accept(i);
            }
            System.out.println(MARKER + c.method());
            System.out.flush();
            if (!wb.enqueueMethodForCompilation(m, 4) || wb.getMethodCompilationLevel(m) != 4) {
                throw new AssertionError(c.method() + " was not compiled by C2");
            }
        }
        System.out.println(MARKER + "end");
    }

    private static void idealDriver() throws Exception {
        String test = NativeVectorizedMismatchTest.class.getName();
        String fallback = "jdk.internal.util.ArraysSupport::vectorizedMismatch";
        for (String partial : new String[] {null, "-XX:ArrayOperationPartialInlineSize=0"}) {
            for (Fallback expected : Fallback.values()) {
                List<String> flags = new ArrayList<>(List.of(
                        "-Xbootclasspath/a:.", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                        "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                        "--add-exports=java.base/jdk.internal.util=ALL-UNNAMED",
                        "-XX:-TieredCompilation", "-XX:-BackgroundCompilation",
                        // The fallback checks identify an inlined Java loop by its poll, so give
                        // counted loops polls whatever GC is selected. Chunked scans run below
                        // without these flags.
                        "-XX:+UseCountedLoopSafepoints", "-XX:LoopStripMiningIter=1000",
                        "-XX:CompileCommand=quiet"));
                for (IdealCase c : idealCases()) {
                    flags.add("-XX:CompileCommand=compileonly," + test + "::" + c.method());
                    flags.add("-XX:CompileCommand=PrintIdealPhase," + test + "::" + c.method() + ",BEFORE_MATCHING");
                }
                if (partial != null) {
                    flags.add(partial);
                }
                if (expected == Fallback.CALL) {
                    flags.add("-XX:CompileCommand=dontinline," + fallback);
                } else if (expected == Fallback.INLINED) {
                    flags.add("-XX:CompileCommand=inline," + fallback);
                }
                flags.add(test);
                flags.add("ideal-child");
                OutputAnalyzer output = ProcessTools.executeProcess(ProcessTools.createLimitedTestJavaProcessBuilder(flags));
                retainIdeal(output, (partial == null ? "default" : "no-partial") + "-" + expected);
                output.shouldHaveExitValue(0);
                String config = (partial == null ? "default partial inlining" : partial) + ", fallback " + expected;
                verifyIdeal(output.getStdout().lines().toList(), idealCases(), expected, config);
            }
        }
        // Chunked scans with the loop settings each GC selects: the default GC strip-mines
        // counted loops, SerialGC leaves them without polls.
        for (String gc : new String[] {null, "-XX:+UseSerialGC"}) {
            if (gc != null && ProcessTools.executeProcess(
                    ProcessTools.createLimitedTestJavaProcessBuilder(gc, "-version")).getExitValue() != 0) {
                System.out.println("Skipping " + gc + ": not available");
                continue;
            }
            List<String> flags = new ArrayList<>(List.of(
                    "-Xbootclasspath/a:.", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                    "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                    "--add-exports=java.base/jdk.internal.util=ALL-UNNAMED",
                    "-XX:-TieredCompilation", "-XX:-BackgroundCompilation", "-XX:CompileCommand=quiet",
                    // Keep the longer warmup below the compile threshold (10000 invocations
                    // with this scaling); the child compiles explicitly.
                    "-XX:CompileThresholdScaling=2"));
            if (gc != null) {
                flags.add(gc);
            }
            for (IdealCase c : chunkCases()) {
                flags.add("-XX:CompileCommand=compileonly," + test + "::" + c.method());
                flags.add("-XX:CompileCommand=PrintIdealPhase," + test + "::" + c.method() + ",BEFORE_MATCHING");
            }
            flags.add(test);
            flags.add("chunk-child");
            OutputAnalyzer output = ProcessTools.executeProcess(ProcessTools.createLimitedTestJavaProcessBuilder(flags));
            retainIdeal(output, gc == null ? "chunk-default" : "chunk-serial");
            output.shouldHaveExitValue(0);
            verifyIdeal(output.getStdout().lines().toList(), chunkCases(), Fallback.EITHER,
                        gc == null ? "default GC" : gc);
        }
    }

    private static void retainIdeal(OutputAnalyzer output, String name) throws Exception {
        Path capture = Path.of("NativeVectorizedMismatchTest-" + name + ".log").toAbsolutePath();
        Files.writeString(capture, output.getStdout() + "\n" + output.getStderr());
        System.out.println("Ideal graph capture: " + capture);
    }

    private static void verifyIdeal(List<String> lines, List<IdealCase> cases, Fallback expected, String config) {
        Map<String, List<String>> dumps = new HashMap<>();
        String current = null;
        List<String> dump = null;
        for (String line : lines) {
            if (line.startsWith(MARKER)) {
                current = line.substring(MARKER.length());
                dump = null;
            } else if (line.startsWith("AFTER: ")) {
                if (current == null || !line.equals("AFTER: BEFORE_MATCHING") || dumps.containsKey(current)) {
                    throw new AssertionError(config + ": unexpected compilation output for " + current + ": " + line);
                }
                dump = new ArrayList<>();
                dumps.put(current, dump);
            } else if (dump != null) {
                dump.add(line);
            }
        }
        for (IdealCase c : cases) {
            List<String> graph = dumps.get(c.method());
            if (graph == null) {
                throw new AssertionError(config + ": no BEFORE_MATCHING graph for " + c.method());
            }
            try {
                new IdealGraph(graph).verify(c.kind(), c.scale(), expected);
            } catch (AssertionError e) {
                System.out.println(String.join("\n", graph));
                throw new AssertionError(config + ", " + c.method() + ": " + e.getMessage(), e);
            }
        }
        System.out.println(config + ": verified " + dumps.size() + " graphs");
    }

    // Nodes of one PrintIdealPhase dump. Input 0 of a control node is its control
    // predecessor; regions and loops list theirs from input 1.
    private static final class IdealGraph {
        private record N(int idx, String name, int[] in, String spec) {}

        private static final Pattern NODE = Pattern.compile("^\\s*o?(\\d+)\\s+(\\w+)\\s+===(.*?)\\[\\[.*?\\]\\](.*)$");
        private static final Pattern INT_CON = Pattern.compile("#int:(-?\\d+)");
        private static final Pattern NAMED_FALLBACK =
                Pattern.compile("# Static\\s+jdk[./]internal[./]util[./]ArraysSupport::vectorizedMismatch\\b");
        private static final Set<String> REGIONS = Set.of("Region", "Loop", "CountedLoop", "LongCountedLoop",
                                                          "OuterStripMinedLoop");

        private final Map<Integer, N> nodes = new HashMap<>();

        IdealGraph(List<String> lines) {
            for (String line : lines) {
                Matcher m = NODE.matcher(line);
                if (!m.matches()) {
                    continue;
                }
                List<Integer> in = new ArrayList<>();
                // Call arguments follow the fixed inputs inside parentheses.
                for (String token : m.group(3).replace('(', ' ').replace(')', ' ').trim().split("\\s+")) {
                    if (token.equals("|")) {
                        break; // precedence edges follow
                    }
                    if (token.equals("_")) {
                        in.add(-1);
                    } else if (token.matches("o?\\d+")) {
                        in.add(Integer.parseInt(token.replace("o", "")));
                    } // else a label such as "returns" before a Return value
                }
                int idx = Integer.parseInt(m.group(1));
                nodes.put(idx, new N(idx, m.group(2), in.stream().mapToInt(Integer::intValue).toArray(), m.group(4)));
            }
            if (nodes.isEmpty()) {
                throw new AssertionError("empty graph");
            }
        }

        private N node(int idx) {
            N n = nodes.get(idx);
            if (n == null) {
                throw new AssertionError("missing node " + idx);
            }
            return n;
        }

        private N input(N n, int i) {
            return i < n.in().length && n.in()[i] >= 0 ? node(n.in()[i]) : null;
        }

        private List<N> named(String name) {
            return nodes.values().stream().filter(n -> n.name().equals(name)).toList();
        }

        private List<Integer> controlInputs(N n) {
            List<Integer> result = new ArrayList<>();
            if (REGIONS.contains(n.name())) {
                for (int i = 1; i < n.in().length; i++) {
                    if (n.in()[i] >= 0) {
                        result.add(n.in()[i]);
                    }
                }
            } else if (n.in().length > 0 && n.in()[0] >= 0) {
                result.add(n.in()[0]);
            } else {
                throw new AssertionError("control node without control input: " + n);
            }
            return result;
        }

        // True if every control path from Start to n passes through one of the given nodes.
        private boolean dominatedBy(N n, Set<Integer> dominators) {
            ArrayDeque<Integer> work = new ArrayDeque<>(List.of(n.idx()));
            Set<Integer> seen = new HashSet<>();
            while (!work.isEmpty()) {
                int idx = work.pop();
                if (dominators.contains(idx) || !seen.add(idx)) {
                    continue;
                }
                N c = node(idx);
                if (c.name().equals("Start")) {
                    return false;
                }
                work.addAll(controlInputs(c));
            }
            return true;
        }

        // True if n is reachable from itself along control edges.
        private boolean inLoop(N n) {
            return inLoopAvoiding(n, Set.of());
        }

        // True if n is reachable from itself along control edges that avoid the given nodes.
        private boolean inLoopAvoiding(N n, Set<Integer> avoid) {
            ArrayDeque<Integer> work = new ArrayDeque<>(controlInputs(n));
            Set<Integer> seen = new HashSet<>();
            while (!work.isEmpty()) {
                int idx = work.pop();
                if (idx == n.idx()) {
                    return true;
                }
                N c = node(idx);
                if (!avoid.contains(idx) && seen.add(idx) && !c.name().equals("Start")) {
                    work.addAll(controlInputs(c));
                }
            }
            return false;
        }

        // Each repetition must safepoint. C2 may remove the explicit poll when
        // every cycle calls the normal Java mismatch implementation instead;
        // CallStaticJava is a guaranteed safepoint and its compiled return polls.
        // Count only that exact callee, never an arbitrary call or a leaf. A
        // strip-mined inner loop that repeats a leaf without either still fails.
        void verifyChunked() {
            List<N> leaves = nodes.values().stream()
                    .filter(n -> n.name().equals("CallLeaf") && n.spec().contains("# vectorizedMismatch"))
                    .toList();
            Set<Integer> polls = named("SafePoint").stream().map(N::idx).collect(Collectors.toSet());
            Set<Integer> barriers = new HashSet<>(polls);
            if (Platform.isAArch64()) {
                named("CallStaticJava").stream().filter(n -> NAMED_FALLBACK.matcher(n.spec()).find())
                        .map(N::idx).forEach(barriers::add);
            }
            List<N> repeated = leaves.stream().filter(this::inLoop).toList();
            if (repeated.isEmpty()) {
                throw new AssertionError("no leaf in a chunk loop: leaves=" + leaves);
            }
            for (N leaf : repeated) {
                if (inLoopAvoiding(leaf, barriers)) {
                    throw new AssertionError("a chunk loop repeats " + leaf + " without a poll or normal Java mismatch call; " +
                                             "barriers=" + barriers);
                }
            }
            if (Platform.isAArch64()) {
                for (N leaf : leaves) {
                    Integer scale = intCon(input(leaf, 8));
                    if (scale == null || scale < 0 || scale > 3) {
                        throw new AssertionError("chunk leaf has an invalid scale: " + leaf);
                    }
                    if (!hasAArch64HeapBound(leaf, scale)) {
                        verifyAArch64NativeChunk(leaf, scale);
                    }
                }
            }
        }

        private Integer intCon(N n) {
            Matcher m = n == null ? null : INT_CON.matcher(n.spec());
            return n != null && n.name().equals("ConI") && m.find() ? Integer.valueOf(m.group(1)) : null;
        }

        private String test(N bool) {
            Matcher m = Pattern.compile("\\[(\\w+)\\]").matcher(bool.spec());
            if (!m.find()) {
                throw new AssertionError("Bool without test: " + bool);
            }
            return m.group(1);
        }

        private int projection(N iff, boolean taken) {
            String name = taken ? "IfTrue" : "IfFalse";
            return nodes.values().stream()
                    .filter(p -> p.name().equals(name) && p.in().length > 0 && p.in()[0] == iff.idx())
                    .findFirst().orElseThrow(() -> new AssertionError("no " + name + " for " + iff)).idx();
        }

        // Projections of If(Bool(CmpU(AddI(length, -minimum), span))) for the in-range and
        // out-of-range sides.
        private List<Set<Integer>> lengthGuards(int scale) {
            return lengthGuards(scale, null);
        }

        private record IntOffset(N base, int offset) {}

        // IGVN may combine (x + a) - minimum into x + (a - minimum).
        // Int addition wraps, as does the unsigned range guard being checked.
        private IntOffset intOffset(N n) {
            int offset = 0;
            n = uncast(n);
            while (n != null) {
                if (n.name().equals("AddI")) {
                    Integer a = intCon(input(n, 1)), b = intCon(input(n, 2));
                    if (b != null) {
                        offset += b;
                        n = uncast(input(n, 1));
                        continue;
                    } else if (a != null) {
                        offset += a;
                        n = uncast(input(n, 2));
                        continue;
                    }
                } else if (n.name().equals("SubI")) {
                    Integer b = intCon(input(n, 2));
                    if (b != null) {
                        offset -= b;
                        n = uncast(input(n, 1));
                        continue;
                    }
                }
                break;
            }
            return new IntOffset(n, offset);
        }

        private boolean adjustedLength(N adjusted, N length, int minimum) {
            if (length == null) {
                return adjusted != null && adjusted.name().equals("AddI") &&
                       Integer.valueOf(-minimum).equals(intCon(input(adjusted, 2)));
            }
            IntOffset a = intOffset(adjusted), b = intOffset(length);
            return a.base() != null && a.base() == b.base() && a.offset() - b.offset() == -minimum;
        }

        private List<Set<Integer>> lengthGuards(int scale, N length) {
            int minimum = MINIMUM >> scale;
            return rangeGuards(length, minimum, (LIMIT >> scale) - minimum);
        }

        private List<Set<Integer>> shortNativeGuards(int scale, N length) {
            int minimum = (MINIMUM >> scale) + 1;
            return rangeGuards(length, minimum, (BULK_MINIMUM >> scale) - minimum - 1);
        }

        private List<Set<Integer>> rangeGuards(N length, int minimum, int span) {
            Set<Integer> inside = new HashSet<>(), outside = new HashSet<>();
            for (N iff : named("If")) {
                N bool = input(iff, 1);
                N cmp = bool != null && bool.name().equals("Bool") ? input(bool, 1) : null;
                if (cmp == null || !cmp.name().equals("CmpU")) {
                    continue;
                }
                N adjusted = input(cmp, 1);
                Integer bound = intCon(input(cmp, 2));
                if (bound == null || !adjustedLength(adjusted, length, minimum)) {
                    continue;
                }
                Boolean takenIsInside = switch (test(bool)) {
                    case "gt" -> bound == span ? false : null;
                    case "le" -> bound == span ? true : null;
                    case "lt" -> bound == span + 1 ? true : null;
                    case "ge" -> bound == span + 1 ? false : null;
                    default -> null;
                };
                if (takenIsInside == null) {
                    throw new AssertionError("unexpected length guard " + bool + " " + cmp + " bound " + bound);
                }
                inside.add(projection(iff, takenIsInside));
                outside.add(projection(iff, !takenIsInside));
            }
            return List.of(inside, outside);
        }

        private boolean loadsBothWords(N n, int depth) {
            if (n == null || depth > 2) {
                return false;
            }
            if (n.name().equals("CmpL") || n.name().equals("XorL")) {
                N x = input(n, 1), y = input(n, 2);
                return isLoadL(x) && isLoadL(y) || (x != null && x.name().equals("XorL") && loadsBothWords(x, depth + 1));
            }
            return false;
        }

        private static boolean isLoadL(N n) {
            return n != null && n.name().equals("LoadL");
        }

        // The equal-word projections of first-word comparisons dominated by the in-range side,
        // whose loads are pinned below the guard.
        private Set<Integer> firstWordEqual(Set<Integer> inside) {
            Set<Integer> result = new HashSet<>();
            for (N iff : named("If")) {
                N bool = input(iff, 1);
                N cmp = bool != null && bool.name().equals("Bool") ? input(bool, 1) : null;
                if (cmp == null || !cmp.name().equals("CmpL") || !loadsBothWords(cmp, 0) || !dominatedBy(iff, inside)) {
                    continue;
                }
                N xor = input(cmp, 1).name().equals("XorL") ? input(cmp, 1) : cmp;
                for (int i = 1; i <= 2; i++) {
                    N load = input(xor, i);
                    if (!isLoadL(load) || input(load, 0) == null || !dominatedBy(input(load, 0), inside)) {
                        throw new AssertionError("first-word load is not pinned below the length guard: " + load);
                    }
                }
                String test = test(bool);
                if (!test.equals("ne") && !test.equals("eq")) {
                    throw new AssertionError("unexpected first-word test " + bool);
                }
                if (!input(cmp, 2).name().equals("ConL") && cmp != xor) {
                    throw new AssertionError("unexpected first-word comparison " + cmp);
                }
                result.add(projection(iff, test.equals("eq")));
            }
            return result;
        }

        private N uncast(N n) {
            while (n != null && n.name().equals("CastII")) {
                n = input(n, 1);
            }
            return n;
        }

        // A small constant is safe for either storage kind. Larger heap ranges
        // must pass a count capped by MinI; raw address types alone cannot identify
        // native storage because nullable heap bases may also use raw addresses.
        private boolean hasAArch64HeapBound(N leaf, int scale) {
            int cap = AARCH64_HEAP_PREFIX >> scale;
            N count = uncast(input(leaf, 7));
            Integer constant = intCon(count);
            if (constant != null) {
                return constant >= 0 && constant <= cap;
            }
            return count != null && count.name().equals("MinI") &&
                   (Integer.valueOf(cap).equals(intCon(input(count, 1))) ||
                    Integer.valueOf(cap).equals(intCon(input(count, 2))));
        }

        private void verifyAArch64NativeChunk(N leaf, int scale) {
            N count = uncast(input(leaf, 7));
            Integer constant = intCon(count);
            Set<Integer> inside;
            if (constant != null) {
                if (constant < (BULK_MINIMUM >> scale) || constant > (LIMIT >> scale)) {
                    throw new AssertionError("native chunk leaf is outside its byte bounds: " + count);
                }
                inside = named("Start").stream().map(N::idx).collect(Collectors.toSet());
            } else {
                inside = lengthGuards(scale, count).get(0);
                Set<Integer> admitted = shortNativeGuards(scale, count).get(1);
                if (admitted.isEmpty() || !dominatedBy(leaf, admitted) || firstWordEqual(admitted).size() != 16) {
                    throw new AssertionError("native chunk bypasses bulk admission or its pinned prefix: " + leaf);
                }
            }
            if (inside.isEmpty() || !dominatedBy(leaf, inside)) {
                throw new AssertionError("full chunk leaf bypasses its original-length guard: " + leaf);
            }
            long words = firstWordEqual(inside).stream().filter(n -> dominatedBy(leaf, Set.of(n))).count();
            if (words < 16) {
                throw new AssertionError("full chunk leaf lacks the native scalar prefix: " + leaf + "; words=" + words);
            }
        }

        private void verifyAArch64(Kind kind, int scale, Fallback expected,
                                   List<N> leaves, List<N> calls, List<N> safepoints, List<N> traps,
                                   boolean polls) {
            if (kind == Kind.IN_RANGE) {
                Set<Integer> start = named("Start").stream().map(N::idx).collect(Collectors.toSet());
                if (!leaves.isEmpty() || !calls.isEmpty() || !safepoints.isEmpty() || !traps.isEmpty() ||
                        firstWordEqual(start).size() != 16) {
                    throw new AssertionError("complete 128-byte prefix must have sixteen pinned comparisons, " +
                                             "no leaf, fallback, trap or poll");
                }
                return;
            }
            if (leaves.size() != 1) {
                throw new AssertionError("expected exactly one bounded leaf: " + leaves);
            }
            N leaf = leaves.getFirst();
            if (!Integer.valueOf(scale).equals(intCon(input(leaf, 8)))) {
                throw new AssertionError("wrong native leaf scale: " + leaf);
            }
            N originalLength = uncast(input(leaf, 7));
            boolean variable = kind == Kind.VARIABLE;
            if (variable) {
                List<N> lengths = named("Parm").stream()
                        .filter(n -> Pattern.compile("\\bParm\\d+: int\\b").matcher(n.spec()).find()).toList();
                if (lengths.size() != 1 || originalLength != lengths.getFirst()) {
                    throw new AssertionError("native leaf does not keep its original length parameter: " + originalLength);
                }
            }
            if (!variable && !Integer.valueOf((kind == Kind.BULK ? BULK_MINIMUM : LIMIT) >> scale)
                    .equals(intCon(originalLength))) {
                throw new AssertionError("native leaf does not keep its full constant length: " + originalLength);
            }
            List<Set<Integer>> guards = variable ? lengthGuards(scale, originalLength) : List.of(
                    named("Start").stream().map(N::idx).collect(Collectors.toSet()), Set.of());
            Set<Integer> inside = guards.get(0), outside = new HashSet<>(guards.get(1));
            if (variable) {
                List<Set<Integer>> shortGuards = shortNativeGuards(scale, originalLength);
                Set<Integer> admitted = shortGuards.get(1);
                if (admitted.isEmpty() || !dominatedBy(leaf, admitted) || firstWordEqual(admitted).size() != 16) {
                    throw new AssertionError("native leaf or prefix bypasses bulk admission: " + leaf);
                }
                outside.addAll(shortGuards.get(0));
            }
            if (inside.isEmpty() || !dominatedBy(leaf, inside)) {
                throw new AssertionError("native leaf bypasses its original-length guard: " + leaf);
            }
            Set<Integer> equal = firstWordEqual(inside);
            if (equal.size() != 16) {
                throw new AssertionError("expected sixteen pinned native prefix comparisons: " + equal);
            }
            for (int word : equal) {
                if (!dominatedBy(leaf, Set.of(word))) {
                    throw new AssertionError("leaf bypasses a scalar-prefix comparison: " + word);
                }
            }
            if (!variable) {
                if (!calls.isEmpty() || !safepoints.isEmpty() || !traps.isEmpty()) {
                    throw new AssertionError("constant native range must use only its full leaf: calls=" + calls +
                                             " safepoints=" + safepoints + " traps=" + traps);
                }
                return;
            }
            for (N call : calls) {
                if (dominatedBy(call, Set.of(leaf.idx()))) {
                    throw new AssertionError("native leaf must not be followed by a Java re-scan: " + call);
                }
            }
            List<N> outsideCalls = calls;
            boolean call = outsideCalls.size() == 1;
            boolean inlined = outsideCalls.isEmpty() && polls;
            if (outsideCalls.size() > 1 || call && polls || !call && !inlined ||
                    expected == Fallback.CALL && !call || expected == Fallback.INLINED && !inlined) {
                throw new AssertionError("expected outside fallback " + expected + ": calls=" + outsideCalls +
                                         " safepoints=" + safepoints);
            }
            for (N n : outsideCalls) {
                if (!dominatedBy(n, outside)) {
                    throw new AssertionError("outside fallback is reachable inside the bound: " + n);
                }
            }
            for (N n : safepoints) {
                if (!dominatedBy(n, outside)) {
                    throw new AssertionError("poll is reachable inside the bound: " + n);
                }
            }
            for (N n : traps) {
                if (!dominatedBy(n, outside)) {
                    throw new AssertionError("uncommon trap is reachable inside the bound: " + n);
                }
            }
        }

        void verify(Kind kind, int scale, Fallback expected) {
            if (kind == Kind.INTERMEDIATE) {
                kind = Platform.isAArch64() ? Kind.SHORT : Kind.IN_RANGE;
            }
            if (kind == Kind.CHUNKED) {
                verifyChunked();
                return;
            }
            List<N> leaves = new ArrayList<>(), namedCalls = new ArrayList<>(), traps = new ArrayList<>();
            for (N n : nodes.values()) {
                if (n.name().equals("CallLeaf") && n.spec().contains("# vectorizedMismatch")) {
                    leaves.add(n);
                } else if (n.name().equals("CallStaticJava") && n.spec().contains("uncommon_trap")) {
                    traps.add(n);
                } else if (n.name().equals("CallStaticJava") && NAMED_FALLBACK.matcher(n.spec()).find()) {
                    namedCalls.add(n);
                } else if (n.name().startsWith("Call") || n.name().startsWith("Allocate") ||
                           n.name().equals("Lock") || n.name().equals("Unlock") || n.name().equals("ArrayCopy")) {
                    throw new AssertionError("unrelated call " + n);
                }
            }
            List<N> safepoints = named("SafePoint");
            // A genuine inlined fallback polls in a loop of the Java implementation.
            boolean polls = safepoints.stream().anyMatch(n -> inLoop(n) &&
                    n.spec().contains("ArraysSupport::vectorizedMismatch @ bci:"));
            if (Platform.isAArch64() && (kind == Kind.VARIABLE || kind == Kind.IN_RANGE || kind == Kind.BULK || kind == Kind.AT_LIMIT)) {
                verifyAArch64(kind, scale, expected, leaves, namedCalls, safepoints, traps, polls);
                return;
            }
            if (kind == Kind.IN_RANGE || kind == Kind.BULK || kind == Kind.AT_LIMIT) {
                if (leaves.size() != 1 || !namedCalls.isEmpty() || !safepoints.isEmpty() || !traps.isEmpty()) {
                    throw new AssertionError("expected only the leaf: leaves=" + leaves + " calls=" + namedCalls +
                                             " safepoints=" + safepoints + " traps=" + traps);
                }
                return;
            }
            if (kind != Kind.VARIABLE && !leaves.isEmpty()) {
                throw new AssertionError("leaf outside the bound: " + leaves);
            }
            if (namedCalls.size() > 1 || (!namedCalls.isEmpty() && polls)) {
                throw new AssertionError("more than one fallback: calls=" + namedCalls + " safepoints=" + safepoints);
            }
            boolean call = namedCalls.size() == 1;
            boolean inlined = namedCalls.isEmpty() && (kind == Kind.SHORT || polls);
            if (!call && !inlined) {
                throw new AssertionError("no named fallback call or inlined polling fallback; safepoints=" + safepoints);
            }
            if ((expected == Fallback.CALL && !call) || (expected == Fallback.INLINED && !inlined)) {
                throw new AssertionError("expected fallback " + expected + ": calls=" + namedCalls +
                                         " safepoints=" + safepoints);
            }
            if (kind == Kind.SHORT && inlined && named("LoadL").isEmpty() && named("LoadI").isEmpty()) {
                throw new AssertionError("no inlined comparison on the short Java route");
            }
            if (kind != Kind.VARIABLE) {
                return;
            }

            if (leaves.size() != 1) {
                throw new AssertionError("expected exactly one leaf: " + leaves);
            }
            List<Set<Integer>> guards = lengthGuards(scale);
            Set<Integer> inside = guards.get(0), outside = guards.get(1);
            if (inside.isEmpty()) {
                throw new AssertionError("no unsigned length guard for scale " + scale);
            }
            N leaf = leaves.get(0);
            if (!dominatedBy(leaf, inside)) {
                throw new AssertionError("leaf is reachable without the in-range guard: " + leaf);
            }
            Set<Integer> equal = firstWordEqual(inside);
            if (equal.isEmpty() || !dominatedBy(leaf, equal)) {
                throw new AssertionError("leaf is reachable without an equal first word: " + leaf);
            }
            for (N n : namedCalls) {
                if (!dominatedBy(n, outside)) {
                    throw new AssertionError("fallback call is reachable inside the bound: " + n);
                }
            }
            for (N n : safepoints) {
                if (!dominatedBy(n, outside)) {
                    throw new AssertionError("poll is reachable inside the bound: " + n);
                }
            }
            for (N n : traps) {
                if (!dominatedBy(n, outside)) {
                    throw new AssertionError("uncommon trap is reachable inside the bound: " + n);
                }
            }
        }
    }

    public static void main(String[] args) throws Exception {
        String mode = args.length == 0 ? "" : args[0];
        switch (mode) {
            case "ideal" -> idealDriver();
            case "ideal-child" -> idealChild(idealCases());
            case "chunk-child" -> idealChild(chunkCases());
            default -> {
                // Default loop settings: chunked scans must poll without counted-loop safepoints.
                List<String> flags = new ArrayList<>(List.of(
                        "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                        "--add-exports=java.base/jdk.internal.util=ALL-UNNAMED",
                        "-XX:-TieredCompilation"));
                if (mode.equals("disable-partial")) {
                    flags.addAll(List.of("-XX:+UnlockDiagnosticVMOptions", "-XX:ArrayOperationPartialInlineSize=0"));
                } else if (mode.equals("serial")) {
                    flags.add("-XX:+UseSerialGC");
                }
                TestFramework.runWithFlags(flags.toArray(String[]::new));
            }
        }
    }
}
