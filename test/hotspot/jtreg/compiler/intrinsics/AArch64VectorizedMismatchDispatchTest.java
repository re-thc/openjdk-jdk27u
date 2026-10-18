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
 * @summary AArch64 mismatch keeps short and large heap inputs in Java and bounds each vector leaf
 * @requires os.arch == "aarch64" & vm.compiler2.enabled & vm.opt.final.UseVectorizedMismatchIntrinsic == true
 * @library /test/lib /
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @run driver compiler.intrinsics.AArch64VectorizedMismatchDispatchTest
 */

/*
 * @test id=ideal
 * @summary Check bounded heap leaves, direct Java fallback, full native/mixed leaves and polling
 * @requires os.arch == "aarch64" & vm.debug == true & vm.compiler2.enabled & vm.opt.final.UseVectorizedMismatchIntrinsic == true
 * @library /test/lib /
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.intrinsics.AArch64VectorizedMismatchDispatchTest ideal
 */

/*
 * @test id=store-ordering
 * @summary Raw mismatch prefix loads stay between preceding and following aliasing heap stores
 * @requires vm.debug == true & vm.compiler2.enabled & vm.opt.final.UseVectorizedMismatchIntrinsic == true
 * @requires os.simpleArch == "x64" | os.arch == "aarch64"
 * @library /test/lib /
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.intrinsics.AArch64VectorizedMismatchDispatchTest store-ideal
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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.internal.misc.Unsafe;
import jdk.internal.util.ArraysSupport;
import jdk.test.lib.Platform;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class AArch64VectorizedMismatchDispatchTest {
    private static final int MINIMUM = 128;
    private static final int PREFIX = 2048;
    private static final int LARGE = 65536;
    private static final int CAPACITY = 2 * LARGE + 32;
    private static final long BASE = Unsafe.ARRAY_BYTE_BASE_OFFSET;
    private static final byte[] HA = new byte[CAPACITY];
    private static final byte[] HB = new byte[CAPACITY];
    private static final byte[] OTHER = new byte[CAPACITY];
    private static final MemorySegment NA = Arena.ofAuto().allocate(CAPACITY);
    private static final MemorySegment NB = Arena.ofAuto().allocate(CAPACITY);
    private static final String LEAF = "CallLeaf.*vectorizedMismatch";
    private static final String JAVA_CALL = "CallStaticJava.*ArraysSupport::vectorizedMismatch";

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heap0(byte[] a, long ao, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, length, 0);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heap1(byte[] a, long ao, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, length, 1);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heap2(byte[] a, long ao, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, length, 2);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heap3(byte[] a, long ao, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, length, 3);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int native0(long a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, length, 0);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int native1(long a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, length, 1);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int native2(long a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, length, 2);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int native3(long a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, length, 3);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixed0(byte[] a, long ao, long b, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, null, b, length, 0);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixed1(byte[] a, long ao, long b, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, null, b, length, 1);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixed2(byte[] a, long ao, long b, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, null, b, length, 2);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixed3(byte[] a, long ao, long b, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, null, b, length, 3);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverse0(long a, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, b, bo, length, 0);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverse1(long a, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, b, bo, length, 1);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverse2(long a, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, b, bo, length, 2);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverse3(long a, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, b, bo, length, 3);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int short0(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, (MINIMUM >> 0) - 1, 0);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int short1(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, (MINIMUM >> 1) - 1, 1);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int short2(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, (MINIMUM >> 2) - 1, 2);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int short3(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, (MINIMUM >> 3) - 1, 3);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int minimum(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, MINIMUM, 0);
    }

    @Test
    @IR(counts = {JAVA_CALL, ">= 1"}, failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int heapLarge0(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, LARGE >> 0, 0);
    }

    @Test
    @IR(counts = {JAVA_CALL, ">= 1"}, failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int heapLarge1(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, LARGE >> 1, 1);
    }

    @Test
    @IR(counts = {JAVA_CALL, ">= 1"}, failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int heapLarge2(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, LARGE >> 2, 2);
    }

    @Test
    @IR(counts = {JAVA_CALL, ">= 1"}, failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int heapLarge3(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, LARGE >> 3, 3);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heapAtCap0(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, PREFIX >> 0, 0);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heapAtCap1(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, PREFIX >> 1, 1);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heapAtCap2(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, PREFIX >> 2, 2);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heapAtCap3(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, PREFIX >> 3, 3);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeLarge0(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, LARGE >> 0, 0);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeLarge1(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, LARGE >> 1, 1);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeLarge2(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, LARGE >> 2, 2);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeLarge3(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, LARGE >> 3, 3);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int native4K0(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, 4096 >> 0, 0);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int native4K1(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, 4096 >> 1, 1);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int native4K2(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, 4096 >> 2, 2);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int native4K3(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, 4096 >> 3, 3);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixed4K0(byte[] a, long ao, long b) {
        return ArraysSupport.vectorizedMismatch(a, ao, null, b, 4096 >> 0, 0);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixed4K1(byte[] a, long ao, long b) {
        return ArraysSupport.vectorizedMismatch(a, ao, null, b, 4096 >> 1, 1);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixed4K2(byte[] a, long ao, long b) {
        return ArraysSupport.vectorizedMismatch(a, ao, null, b, 4096 >> 2, 2);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixed4K3(byte[] a, long ao, long b) {
        return ArraysSupport.vectorizedMismatch(a, ao, null, b, 4096 >> 3, 3);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverse4K0(long a, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(null, a, b, bo, 4096 >> 0, 0);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverse4K1(long a, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(null, a, b, bo, 4096 >> 1, 1);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverse4K2(long a, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(null, a, b, bo, 4096 >> 2, 2);
    }

    @Test
    @IR(counts = {LEAF, "1"}, failOn = {JAVA_CALL, IRNode.SAFEPOINT},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverse4K3(long a, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(null, a, b, bo, 4096 >> 3, 3);
    }

    // The writer is a separate parameter: the compiler cannot assume that it
    // differs from a compared array. Nullable bases and unrestricted long
    // offsets deliberately classify the prefix loads in the raw alias slice.
    @Test
    @IR(counts = {IRNode.STORE_B, "2", LEAF, "1"}, failOn = {JAVA_CALL},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heapStore0(byte[] a, long ao, byte[] b, long bo, byte[] writer, int index, byte value) {
        writer[index] = value;
        int result = ArraysSupport.vectorizedMismatch(a, ao, b, bo, MINIMUM >> 0, 0);
        writer[index] = (byte) (value ^ 1);
        return result;
    }

    @Test
    @IR(counts = {IRNode.STORE_B, "2", LEAF, "1"}, failOn = {JAVA_CALL},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heapStore1(byte[] a, long ao, byte[] b, long bo, byte[] writer, int index, byte value) {
        writer[index] = value;
        int result = ArraysSupport.vectorizedMismatch(a, ao, b, bo, MINIMUM >> 1, 1);
        writer[index] = (byte) (value ^ 1);
        return result;
    }

    @Test
    @IR(counts = {IRNode.STORE_B, "2", LEAF, "1"}, failOn = {JAVA_CALL},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heapStore2(byte[] a, long ao, byte[] b, long bo, byte[] writer, int index, byte value) {
        writer[index] = value;
        int result = ArraysSupport.vectorizedMismatch(a, ao, b, bo, MINIMUM >> 2, 2);
        writer[index] = (byte) (value ^ 1);
        return result;
    }

    @Test
    @IR(counts = {IRNode.STORE_B, "2", LEAF, "1"}, failOn = {JAVA_CALL},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heapStore3(byte[] a, long ao, byte[] b, long bo, byte[] writer, int index, byte value) {
        writer[index] = value;
        int result = ArraysSupport.vectorizedMismatch(a, ao, b, bo, MINIMUM >> 3, 3);
        writer[index] = (byte) (value ^ 1);
        return result;
    }

    @Test
    @IR(counts = {IRNode.STORE_B, "2"}, failOn = {JAVA_CALL, LEAF},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixedStore0(byte[] a, long ao, long b, byte[] writer, int index, byte value) {
        writer[index] = value;
        int result = ArraysSupport.vectorizedMismatch(a, ao, null, b, MINIMUM >> 0, 0);
        writer[index] = (byte) (value ^ 1);
        return result;
    }

    @Test
    @IR(counts = {IRNode.STORE_B, "2"}, failOn = {JAVA_CALL, LEAF},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixedStore1(byte[] a, long ao, long b, byte[] writer, int index, byte value) {
        writer[index] = value;
        int result = ArraysSupport.vectorizedMismatch(a, ao, null, b, MINIMUM >> 1, 1);
        writer[index] = (byte) (value ^ 1);
        return result;
    }

    @Test
    @IR(counts = {IRNode.STORE_B, "2"}, failOn = {JAVA_CALL, LEAF},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixedStore2(byte[] a, long ao, long b, byte[] writer, int index, byte value) {
        writer[index] = value;
        int result = ArraysSupport.vectorizedMismatch(a, ao, null, b, MINIMUM >> 2, 2);
        writer[index] = (byte) (value ^ 1);
        return result;
    }

    @Test
    @IR(counts = {IRNode.STORE_B, "2"}, failOn = {JAVA_CALL, LEAF},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixedStore3(byte[] a, long ao, long b, byte[] writer, int index, byte value) {
        writer[index] = value;
        int result = ArraysSupport.vectorizedMismatch(a, ao, null, b, MINIMUM >> 3, 3);
        writer[index] = (byte) (value ^ 1);
        return result;
    }

    @Test
    @IR(counts = {IRNode.STORE_B, "2"}, failOn = {JAVA_CALL, LEAF},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverseStore0(long a, byte[] b, long bo, byte[] writer, int index, byte value) {
        writer[index] = value;
        int result = ArraysSupport.vectorizedMismatch(null, a, b, bo, MINIMUM >> 0, 0);
        writer[index] = (byte) (value ^ 1);
        return result;
    }

    @Test
    @IR(counts = {IRNode.STORE_B, "2"}, failOn = {JAVA_CALL, LEAF},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverseStore1(long a, byte[] b, long bo, byte[] writer, int index, byte value) {
        writer[index] = value;
        int result = ArraysSupport.vectorizedMismatch(null, a, b, bo, MINIMUM >> 1, 1);
        writer[index] = (byte) (value ^ 1);
        return result;
    }

    @Test
    @IR(counts = {IRNode.STORE_B, "2"}, failOn = {JAVA_CALL, LEAF},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverseStore2(long a, byte[] b, long bo, byte[] writer, int index, byte value) {
        writer[index] = value;
        int result = ArraysSupport.vectorizedMismatch(null, a, b, bo, MINIMUM >> 2, 2);
        writer[index] = (byte) (value ^ 1);
        return result;
    }

    @Test
    @IR(counts = {IRNode.STORE_B, "2"}, failOn = {JAVA_CALL, LEAF},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverseStore3(long a, byte[] b, long bo, byte[] writer, int index, byte value) {
        writer[index] = value;
        int result = ArraysSupport.vectorizedMismatch(null, a, b, bo, MINIMUM >> 3, 3);
        writer[index] = (byte) (value ^ 1);
        return result;
    }

    @Run(test = {"heap0", "heap1", "heap2", "heap3", "native0", "native1", "native2", "native3", "mixed0", "mixed1", "mixed2", "mixed3", "reverse0", "reverse1", "reverse2", "reverse3", "short0", "short1", "short2", "short3", "minimum"})
    @Warmup(2000)
    public static void run(RunInfo info) {
        if (info.isWarmUp()) {
            int i = warmups++;
            int bytes = i % 128 == 0 ? LARGE : i % 8 == 0 ? PREFIX + 8 : MINIMUM + (i & 3) * 8;
            int[] differences = {-1, 1, 7, 10, 25, 82, 127, 128, 1267};
            int difference = differences[i % differences.length];
            if (difference >= bytes) {
                difference = -1;
            }
            setDifference(difference, 1, (byte) 1);
            for (int scale = 0; scale <= 3; scale++) {
                for (int storage = 0; storage < 4; storage++) {
                    raw(storage, scale, 1, bytes >> scale);
                }
                shortRange(scale, 1);
            }
            minimum(HA, BASE + 1, HB, BASE + 1);
            setDifference(difference, 1, (byte) 0);
        } else {
            verifyAll();
        }
    }

    private static int warmups;

    private record ConstantCase(String storage, int scale, int bytes) {
        String method() {
            return storage + (bytes == LARGE ? "Large" : bytes == PREFIX ? "AtCap" : "4K") + scale;
        }
    }

    private static final List<ConstantCase> CONSTANTS = constantCases();

    private static List<ConstantCase> constantCases() {
        List<ConstantCase> result = new ArrayList<>();
        for (String storage : new String[] {"heap", "native"}) {
            for (int scale = 0; scale <= 3; scale++) {
                result.add(new ConstantCase(storage, scale, LARGE));
            }
        }
        for (int scale = 0; scale <= 3; scale++) {
            result.add(new ConstantCase("heap", scale, PREFIX));
        }
        for (String storage : new String[] {"native", "mixed", "reverse"}) {
            for (int scale = 0; scale <= 3; scale++) {
                result.add(new ConstantCase(storage, scale, 4096));
            }
        }
        return List.copyOf(result);
    }

    @Run(test = {"heapAtCap0", "heapAtCap1", "heapAtCap2", "heapAtCap3", "heapLarge0", "heapLarge1", "heapLarge2", "heapLarge3", "nativeLarge0", "nativeLarge1", "nativeLarge2", "nativeLarge3", "native4K0", "native4K1", "native4K2", "native4K3", "mixed4K0", "mixed4K1", "mixed4K2", "mixed4K3", "reverse4K0", "reverse4K1", "reverse4K2", "reverse4K3"})
    @Warmup(30)
    public static void runLarge(RunInfo info) {
        if (info != null && info.isWarmUp()) {
            for (ConstantCase c : CONSTANTS) {
                constant(c, 1);
            }
        } else {
            for (ConstantCase c : CONSTANTS) {
                for (int offset : new int[] {0, 1, 7}) {
                    for (int difference : new int[] {-1, 0, 7, 8, 10, 25, 82, 127, 128, 1267,
                                                       PREFIX - 1, PREFIX, PREFIX + 1, c.bytes() - 1}) {
                        if (difference >= c.bytes()) {
                            continue;
                        }
                        setDifference(difference, offset, (byte) 1);
                        checkRaw(constant(c, offset), c.bytes() >> c.scale(), c.scale(), difference, c.method());
                        setDifference(difference, offset, (byte) 0);
                    }
                }
            }
        }
    }

    private static int constant(ConstantCase c, int offset) {
        if (c.bytes() == PREFIX) {
            long offsetInArray = BASE + offset;
            return switch (c.scale()) {
                case 0 -> heapAtCap0(HA, offsetInArray, HB, offsetInArray);
                case 1 -> heapAtCap1(HA, offsetInArray, HB, offsetInArray);
                case 2 -> heapAtCap2(HA, offsetInArray, HB, offsetInArray);
                default -> heapAtCap3(HA, offsetInArray, HB, offsetInArray);
            };
        }
        if (c.bytes() == LARGE) {
            return large(c.storage().equals("native"), c.scale(), offset);
        }
        long ao = BASE + offset, na = NA.address() + offset, nb = NB.address() + offset;
        int storage = switch (c.storage()) {
            case "native" -> 0;
            case "mixed" -> 1;
            case "reverse" -> 2;
            default -> throw new AssertionError(c);
        };
        return switch (4 * storage + c.scale()) {
            case 0 -> native4K0(na, nb);
            case 1 -> native4K1(na, nb);
            case 2 -> native4K2(na, nb);
            case 3 -> native4K3(na, nb);
            case 4 -> mixed4K0(HA, ao, nb);
            case 5 -> mixed4K1(HA, ao, nb);
            case 6 -> mixed4K2(HA, ao, nb);
            case 7 -> mixed4K3(HA, ao, nb);
            case 8 -> reverse4K0(na, HB, ao);
            case 9 -> reverse4K1(na, HB, ao);
            case 10 -> reverse4K2(na, HB, ao);
            case 11 -> reverse4K3(na, HB, ao);
            default -> throw new AssertionError(c);
        };
    }

    private static int raw(int storage, int scale, int offset, int length) {
        long ao = BASE + offset, na = NA.address() + offset, nb = NB.address() + offset;
        return switch (4 * storage + scale) {
            case 0 -> heap0(HA, ao, HB, ao, length);
            case 1 -> heap1(HA, ao, HB, ao, length);
            case 2 -> heap2(HA, ao, HB, ao, length);
            case 3 -> heap3(HA, ao, HB, ao, length);
            case 4 -> native0(na, nb, length);
            case 5 -> native1(na, nb, length);
            case 6 -> native2(na, nb, length);
            case 7 -> native3(na, nb, length);
            case 8 -> mixed0(HA, ao, nb, length);
            case 9 -> mixed1(HA, ao, nb, length);
            case 10 -> mixed2(HA, ao, nb, length);
            case 11 -> mixed3(HA, ao, nb, length);
            case 12 -> reverse0(na, HB, ao, length);
            case 13 -> reverse1(na, HB, ao, length);
            case 14 -> reverse2(na, HB, ao, length);
            case 15 -> reverse3(na, HB, ao, length);
            default -> throw new AssertionError("bad storage or scale");
        };
    }

    private static int shortRange(int scale, int offset) {
        long ao = BASE + offset;
        return switch (scale) {
            case 0 -> short0(HA, ao, HB, ao);
            case 1 -> short1(HA, ao, HB, ao);
            case 2 -> short2(HA, ao, HB, ao);
            case 3 -> short3(HA, ao, HB, ao);
            default -> throw new AssertionError(scale);
        };
    }

    private static int large(boolean nativeMemory, int scale, int offset) {
        long ao = BASE + offset, na = NA.address() + offset, nb = NB.address() + offset;
        return switch (scale + (nativeMemory ? 4 : 0)) {
            case 0 -> heapLarge0(HA, ao, HB, ao);
            case 1 -> heapLarge1(HA, ao, HB, ao);
            case 2 -> heapLarge2(HA, ao, HB, ao);
            case 3 -> heapLarge3(HA, ao, HB, ao);
            case 4 -> nativeLarge0(na, nb);
            case 5 -> nativeLarge1(na, nb);
            case 6 -> nativeLarge2(na, nb);
            case 7 -> nativeLarge3(na, nb);
            default -> throw new AssertionError(scale);
        };
    }

    private static void setDifference(int difference, int offset, byte value) {
        if (difference >= 0) {
            HB[offset + difference] = value;
            NB.set(ValueLayout.JAVA_BYTE, offset + difference, value);
        }
    }

    // A negative result describes the unexamined tail, which the public caller checks.
    // Requiring -1 for all equal inputs would incorrectly reject the original Java body.
    private static void checkRaw(int actual, int length, int scale, int difference, String context) {
        int expected = difference < 0 ? -1 : difference >> scale;
        if (actual >= 0) {
            if (actual != expected) {
                throw new AssertionError(context + ": length=" + length + " scale=" + scale +
                                         " difference=" + difference + " actual=" + actual);
            }
        } else {
            int tail = ~actual;
            if (tail < 0 || tail > length || tail >= (8 >> scale) ||
                    expected >= 0 && expected < length - tail) {
                throw new AssertionError(context + ": invalid unexamined tail " + tail +
                                         " length=" + length + " scale=" + scale + " difference=" + difference);
            }
        }
    }

    private static void verifyAll() {
        for (int scale = 0; scale <= 3; scale++) {
            int minimum = MINIMUM >> scale, prefix = PREFIX >> scale, limit = LARGE >> scale;
            for (int offset : new int[] {0, 1, 7}) {
                for (int length : new int[] {0, 1, 2, 3, 7, 8, minimum - 1, minimum, minimum + 1,
                        prefix - 1, prefix, prefix + 1, prefix + 2, prefix + 3, prefix + 4,
                        prefix + 5, prefix + 6, prefix + 7, limit - 1, limit, limit + 1, 2 * limit}) {
                    int bytes = length << scale;
                    // Poison outside both ends. Neither the stub nor its prefilters may use it.
                    if (offset > 0) {
                        setDifference(offset - 1, 0, (byte) 1);
                    }
                    setDifference(bytes, offset, (byte) 1);
                    for (int difference : new int[] {-1, 0, 7, 8, 10, 25, 82, 127, 128, 1267,
                                                    PREFIX - 1, PREFIX, PREFIX + 1, bytes - 1}) {
                        if (difference >= bytes || difference < -1) {
                            continue;
                        }
                        setDifference(difference, offset, (byte) 1);
                        for (int storage = 0; storage < 4; storage++) {
                            checkRaw(raw(storage, scale, offset, length), length, scale, difference,
                                     "storage=" + storage + " offset=" + offset);
                        }
                        setDifference(difference, offset, (byte) 0);
                    }
                    setDifference(bytes, offset, (byte) 0);
                    if (offset > 0) {
                        setDifference(offset - 1, 0, (byte) 0);
                    }
                }
            }
        }
        // Constant-size expansions have their own compilation decisions.
        for (int scale = 0; scale <= 3; scale++) {
            int length = (MINIMUM >> scale) - 1;
            int bytes = length << scale;
            for (int offset : new int[] {0, 1, 7}) {
                for (int difference : new int[] {-1, 0, 7, 8, 10, 25, 82, bytes - 1}) {
                    setDifference(difference, offset, (byte) 1);
                    checkRaw(shortRange(scale, offset), length, scale, difference, "constant short");
                    setDifference(difference, offset, (byte) 0);
                }
            }
        }
        for (int difference : new int[] {-1, 0, 7, 8, 10, 25, 82, 127}) {
            setDifference(difference, 1, (byte) 1);
            checkRaw(minimum(HA, BASE + 1, HB, BASE + 1), MINIMUM, 0, difference, "constant minimum");
            setDifference(difference, 1, (byte) 0);
        }
        // Empty/negative raw ranges must not touch these invalid native addresses.
        for (int scale = 0; scale <= 3; scale++) {
            for (int length : new int[] {0, -1, -8, Integer.MIN_VALUE}) {
                int actual = switch (scale) {
                    case 0 -> native0(0, 0, length);
                    case 1 -> native1(0, 0, length);
                    case 2 -> native2(0, 0, length);
                    default -> native3(0, 0, length);
                };
                if (actual != ~length) {
                    throw new AssertionError("invalid native range " + length + ": " + actual);
                }
            }
        }
        verifyPublic();
    }

    private static void verifyPublic() {
        for (int length : new int[] {127, 128, 129, PREFIX - 1, PREFIX, PREFIX + 1, LARGE, LARGE + 1}) {
            for (int kind = 0; kind < 8; kind++) {
                Object a = newArray(kind, length + 8), b = newArray(kind, length + 8);
                for (int difference : new int[] {-1, 0, 1, 7, 8, 10, 25, 82, 127, 128, 1267,
                                                PREFIX - 1, PREFIX, length - 1}) {
                    if (difference >= length) {
                        continue;
                    }
                    if (difference >= 0) {
                        java.lang.reflect.Array.set(b, difference + 1, one(kind));
                    }
                    int actual = publicMismatch(kind, a, b, 1, length);
                    if (actual != difference) {
                        throw new AssertionError("public kind=" + kind + " length=" + length +
                                                 " difference=" + difference + " actual=" + actual);
                    }
                    if (difference >= 0) {
                        java.lang.reflect.Array.set(b, difference + 1, zero(kind));
                    }
                }
            }
        }
        float[] fa = new float[PREFIX + 16], fb = fa.clone();
        double[] da = new double[PREFIX + 16], db = da.clone();
        for (int at : new int[] {1, 127, 128, 1267, PREFIX - 1, PREFIX, PREFIX + 1}) {
            fa[at] = Float.intBitsToFloat(0x7fc00001);
            fb[at] = Float.intBitsToFloat(0x7fc00002);
            da[at] = Double.longBitsToDouble(0x7ff8000000000001L);
            db[at] = Double.longBitsToDouble(0x7ff8000000000002L);
            if (Arrays.mismatch(fa, fb) != -1 || Arrays.mismatch(da, db) != -1) {
                throw new AssertionError("NaN payload mismatch at " + at);
            }
            fa[at] = -0.0f; fb[at] = 0.0f;
            da[at] = -0.0d; db[at] = 0.0d;
            if (Arrays.mismatch(fa, fb) != at || Arrays.mismatch(da, db) != at) {
                throw new AssertionError("signed zero mismatch at " + at);
            }
            fa[at] = fb[at] = 0.0f;
            da[at] = db[at] = 0.0d;
        }
        byte[] a = new byte[PREFIX + 8], b = a.clone();
        expect(IllegalArgumentException.class, () -> Arrays.mismatch(a, 2, 1, b, 0, 1));
        expect(ArrayIndexOutOfBoundsException.class, () -> Arrays.mismatch(a, -1, 1, b, 0, 1));
        expect(ArrayIndexOutOfBoundsException.class, () -> Arrays.mismatch(a, 0, a.length + 1, b, 0, 1));
        expect(NullPointerException.class, () -> Arrays.mismatch((byte[]) null, 0, 0, b, 0, 0));
    }

    private static Object newArray(int kind, int length) {
        return switch (kind) {
            case 0 -> new byte[length]; case 1 -> new boolean[length];
            case 2 -> new char[length]; case 3 -> new short[length];
            case 4 -> new int[length]; case 5 -> new long[length];
            case 6 -> new float[length]; default -> new double[length];
        };
    }

    private static Object one(int kind) {
        return switch (kind) {
            case 0 -> (byte) 1; case 1 -> true; case 2 -> (char) 1; case 3 -> (short) 1;
            case 4 -> 1; case 5 -> 1L; case 6 -> 1.0f; default -> 1.0d;
        };
    }

    private static Object zero(int kind) {
        return switch (kind) {
            case 0 -> (byte) 0; case 1 -> false; case 2 -> (char) 0; case 3 -> (short) 0;
            case 4 -> 0; case 5 -> 0L; case 6 -> 0.0f; default -> 0.0d;
        };
    }

    private static int publicMismatch(int kind, Object a, Object b, int from, int length) {
        int end = from + length;
        return switch (kind) {
            case 0 -> Arrays.mismatch((byte[]) a, from, end, (byte[]) b, from, end);
            case 1 -> Arrays.mismatch((boolean[]) a, from, end, (boolean[]) b, from, end);
            case 2 -> Arrays.mismatch((char[]) a, from, end, (char[]) b, from, end);
            case 3 -> Arrays.mismatch((short[]) a, from, end, (short[]) b, from, end);
            case 4 -> Arrays.mismatch((int[]) a, from, end, (int[]) b, from, end);
            case 5 -> Arrays.mismatch((long[]) a, from, end, (long[]) b, from, end);
            case 6 -> Arrays.mismatch((float[]) a, from, end, (float[]) b, from, end);
            default -> Arrays.mismatch((double[]) a, from, end, (double[]) b, from, end);
        };
    }

    private static void expect(Class<? extends Throwable> type, Runnable call) {
        try {
            call.run();
        } catch (Throwable ex) {
            if (ex.getClass() == type) {
                return;
            }
            throw new AssertionError("expected " + type + " but got " + ex, ex);
        }
        throw new AssertionError("missing " + type);
    }

    private record StoreCase(String storage, int scale) {
        String method() {
            return storage + "Store" + scale;
        }
    }

    private static final List<StoreCase> STORES = storeCases();
    private static final int[] STORE_POSITIONS = {0, 1, 7, 8, 10, 25, 82, 127};

    private static List<StoreCase> storeCases() {
        List<StoreCase> result = new ArrayList<>();
        for (String storage : new String[] {"heap", "mixed", "reverse"}) {
            for (int scale = 0; scale <= 3; scale++) {
                result.add(new StoreCase(storage, scale));
            }
        }
        return List.copyOf(result);
    }

    @Run(test = {"heapStore0", "heapStore1", "heapStore2", "heapStore3", "mixedStore0", "mixedStore1", "mixedStore2", "mixedStore3", "reverseStore0", "reverseStore1", "reverseStore2", "reverseStore3"})
    @Warmup(2000)
    public static void runStores(RunInfo info) {
        if (info.isWarmUp()) {
            int i = storeWarmups++;
            for (StoreCase c : STORES) {
                exerciseStore(c, i % 3, (i / 3) & 1, 1, STORE_POSITIONS[(i / 6) % STORE_POSITIONS.length]);
            }
        } else {
            verifyStores();
        }
    }

    private static int storeWarmups;

    private static int store(StoreCase c, byte[] writer, int index, byte value, int offset) {
        long ao = BASE + offset, na = NA.address() + offset, nb = NB.address() + offset;
        int storage = switch (c.storage()) {
            case "heap" -> 0;
            case "mixed" -> 1;
            case "reverse" -> 2;
            default -> throw new AssertionError(c);
        };
        return switch (4 * storage + c.scale()) {
            case 0 -> heapStore0(HA, ao, HB, ao, writer, index, value);
            case 1 -> heapStore1(HA, ao, HB, ao, writer, index, value);
            case 2 -> heapStore2(HA, ao, HB, ao, writer, index, value);
            case 3 -> heapStore3(HA, ao, HB, ao, writer, index, value);
            case 4 -> mixedStore0(HA, ao, nb, writer, index, value);
            case 5 -> mixedStore1(HA, ao, nb, writer, index, value);
            case 6 -> mixedStore2(HA, ao, nb, writer, index, value);
            case 7 -> mixedStore3(HA, ao, nb, writer, index, value);
            case 8 -> reverseStore0(na, HB, ao, writer, index, value);
            case 9 -> reverseStore1(na, HB, ao, writer, index, value);
            case 10 -> reverseStore2(na, HB, ao, writer, index, value);
            case 11 -> reverseStore3(na, HB, ao, writer, index, value);
            default -> throw new AssertionError(c);
        };
    }

    private static void exerciseStore(StoreCase c, int alias, int value, int offset, int position) {
        int index = offset + position;
        HA[index] = HB[index] = OTHER[index] = 0;
        NB.set(ValueLayout.JAVA_BYTE, index, (byte) 0);
        NA.set(ValueLayout.JAVA_BYTE, index, (byte) 0);
        byte[] writer = alias == 0 ? HA : alias == 1 ? HB : OTHER;
        // Both introducing and clearing a difference must be seen by the loads
        // in the very same compiled method as the store.
        writer[index] = (byte) (1 - value);
        int actual = store(c, writer, index, (byte) value, offset);
        boolean compared = c.storage().equals("heap") && alias < 2 ||
                           c.storage().equals("mixed") && alias == 0 ||
                           c.storage().equals("reverse") && alias == 1;
        int expectedDifference = compared && value != 0 ? position : -1;
        checkRaw(actual, MINIMUM >> c.scale(), c.scale(), expectedDifference,
                 c.method() + " writer=" + alias + " value=" + value + " offset=" + offset);
        if (writer[index] != (byte) (value ^ 1)) {
            throw new AssertionError(c.method() + ": missing trailing store for writer=" + alias +
                                     " value=" + value + " offset=" + offset + " position=" + position);
        }
        HA[index] = HB[index] = OTHER[index] = 0;
    }

    private static void verifyStores(StoreCase c) {
        for (int alias = 0; alias < 3; alias++) {
            for (int value : new int[] {0, 1}) {
                for (int offset : new int[] {0, 1, 7}) {
                    for (int position : STORE_POSITIONS) {
                        exerciseStore(c, alias, value, offset, position);
                    }
                }
            }
        }
    }

    private static void verifyStores() {
        for (StoreCase c : STORES) {
            verifyStores(c);
        }
        // The writer's ordinary Java exceptions precede any unsafe access.
        expect(NullPointerException.class, () -> heapStore0(null, 0, null, 0, null, 0, (byte) 1));
        expect(ArrayIndexOutOfBoundsException.class,
               () -> heapStore0(null, 0, null, 0, OTHER, -1, (byte) 1));
        expect(ArrayIndexOutOfBoundsException.class,
               () -> mixedStore0(null, 0, 0, OTHER, OTHER.length, (byte) 1));
    }

    private static final String MARKER = "@@bounded-mismatch ";

    private static void idealDriver(boolean storesOnly) throws Exception {
        String test = AArch64VectorizedMismatchDispatchTest.class.getName();
        List<String> flags = new ArrayList<>(List.of(
                "-Xbootclasspath/a:.", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                "--add-exports=java.base/jdk.internal.util=ALL-UNNAMED",
                "--enable-native-access=ALL-UNNAMED",
                "-XX:-TieredCompilation", "-XX:-BackgroundCompilation",
                "-XX:CompileThreshold=100000000", "-XX:+UseCountedLoopSafepoints",
                "-XX:LoopStripMiningIter=1000", "-XX:CompileCommand=quiet"));
        if (!storesOnly) {
            for (ConstantCase c : CONSTANTS) {
                flags.add("-XX:CompileCommand=compileonly," + test + "::" + c.method());
                flags.add("-XX:CompileCommand=PrintIdealPhase," + test + "::" + c.method() + ",BEFORE_MATCHING");
            }
        }
        for (StoreCase c : STORES) {
            flags.add("-XX:CompileCommand=compileonly," + test + "::" + c.method());
            flags.add("-XX:CompileCommand=PrintIdealPhase," + test + "::" + c.method() + ",BEFORE_MATCHING");
        }
        if (!storesOnly) {
            String fallback = "jdk.internal.util.ArraysSupport::vectorizedMismatch";
            flags.add("-XX:CompileCommand=compileonly," + fallback);
            flags.add("-XX:CompileCommand=PrintIdealPhase," + fallback + ",BEFORE_MATCHING");
        }
        flags.add(test);
        flags.add(storesOnly ? "store-ideal-child" : "ideal-child");
        OutputAnalyzer output = ProcessTools.executeProcess(ProcessTools.createLimitedTestJavaProcessBuilder(flags));
        Path capture = Path.of("AArch64VectorizedMismatchDispatchTest-" +
                               (storesOnly ? "store-ideal.log" : "ideal.log")).toAbsolutePath();
        Files.writeString(capture, output.getStdout() + "\n" + output.getStderr());
        System.out.println("Ideal graph capture: " + capture);
        output.shouldHaveExitValue(0);
        Map<String, List<String>> dumps = new HashMap<>();
        String current = null;
        for (String line : output.getStdout().lines().toList()) {
            if (line.startsWith(MARKER)) {
                current = line.substring(MARKER.length());
                if (!current.equals("end")) {
                    if (dumps.put(current, new ArrayList<>()) != null) {
                        throw new AssertionError("duplicate graph " + current);
                    }
                }
            } else if (current != null && !current.equals("end")) {
                dumps.get(current).add(line);
            }
        }
        int expected = STORES.size() + (storesOnly ? 0 : CONSTANTS.size() + 1);
        if (dumps.size() != expected) {
            throw new AssertionError("missing compilation graphs: " + dumps.keySet());
        }
        if (!storesOnly) {
            for (ConstantCase c : CONSTANTS) {
                Graph graph = new Graph(dumps.get(c.method()));
                if (c.storage().equals("heap")) {
                    if (c.bytes() == PREFIX) graph.verifyFullRange(c.scale(), c.bytes());
                    else graph.verifyJavaFallback(c.scale());
                } else {
                    graph.verifyFullRange(c.scale(), c.bytes());
                }
            }
        }
        for (StoreCase c : STORES) {
            boolean aarch64Policy = !storesOnly || Platform.isAArch64();
            int expectedLoads = c.storage().equals("heap") ? (aarch64Policy ? 4 : 0)
                                                           : (aarch64Policy ? 32 : 2);
            new Graph(dumps.get(c.method())).verifyStoreOrdering(expectedLoads, expectedLoads == 32 ? 0 : 1);
        }
        if (!storesOnly) {
            new Graph(dumps.get("fallback")).verifyPollingBody();
            System.out.println("Verified four bounded heap leaves, four direct Java fallbacks, sixteen full-range native/mixed leaves " +
                               "and the polling Java callee");
        }
        System.out.println("Verified twelve same-method heap-store/raw-prefix memory-order graphs");
    }

    private static void compile(WhiteBox wb, Method method, String name) {
        System.out.println(MARKER + name);
        System.out.flush();
        if (!wb.enqueueMethodForCompilation(method, 4) || wb.getMethodCompilationLevel(method) != 4) {
            throw new AssertionError("not C2 compiled: " + method);
        }
    }

    private static void idealChild(boolean storesOnly) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        if (!storesOnly) {
            // Above the interpreter leaf bound, this profiles the Java implementation itself.
            for (int i = 0; i < 30; i++) {
                int scale = i & 3;
                ArraysSupport.vectorizedMismatch(HA, BASE + 1, HB, BASE + 1, (2 * LARGE) >> scale, scale);
                ArraysSupport.vectorizedMismatch(null, NA.address() + 1, null, NB.address() + 1,
                                                 (2 * LARGE) >> scale, scale);
            }
            for (ConstantCase c : CONSTANTS) {
                for (int i = 0; i < 30; i++) {
                    constant(c, 1);
                }
                Method method = Arrays.stream(AArch64VectorizedMismatchDispatchTest.class.getDeclaredMethods())
                        .filter(m -> m.getName().equals(c.method())).findFirst().orElseThrow();
                compile(wb, method, c.method());
                checkRaw(constant(c, 1), c.bytes() >> c.scale(), c.scale(), -1, c.method());
            }
        }
        for (StoreCase c : STORES) {
            for (int i = 0; i < 200; i++) {
                exerciseStore(c, i % 3, (i / 3) & 1, 1, STORE_POSITIONS[(i / 6) % STORE_POSITIONS.length]);
            }
            Method method = Arrays.stream(AArch64VectorizedMismatchDispatchTest.class.getDeclaredMethods())
                    .filter(m -> m.getName().equals(c.method())).findFirst().orElseThrow();
            compile(wb, method, c.method());
            verifyStores(c);
        }
        if (!storesOnly) {
            Method fallback = ArraysSupport.class.getDeclaredMethod("vectorizedMismatch",
                    Object.class, long.class, Object.class, long.class, int.class, int.class);
            compile(wb, fallback, "fallback");
        }
        System.out.println(MARKER + "end");
    }

    // IR counts establish dispatch presence. These checks follow actual input edges,
    // rather than accepting an unrelated 2048 constant or return poll in the same graph.
    private static final class Graph {
        private record Node(int id, String name, int[] inputs, String detail) {}
        private static final Pattern NODE = Pattern.compile("^\\s*o?(\\d+)\\s+(\\w+)\\s+===(.*?)\\[\\[.*?\\]\\](.*)$");
        private static final Pattern INT = Pattern.compile("#int:(-?\\d+)");
        private static final Set<String> REGIONS = Set.of("Region", "Loop", "CountedLoop",
                "LongCountedLoop", "OuterStripMinedLoop");
        private final Map<Integer, Node> nodes = new HashMap<>();

        Graph(List<String> lines) {
            if (lines == null) {
                throw new AssertionError("missing graph");
            }
            for (String line : lines) {
                Matcher m = NODE.matcher(line);
                if (!m.matches()) {
                    continue;
                }
                List<Integer> inputs = new ArrayList<>();
                for (String token : m.group(3).replace('(', ' ').replace(')', ' ').trim().split("\\s+")) {
                    if (token.equals("|")) {
                        break;
                    }
                    if (token.equals("_")) {
                        inputs.add(-1);
                    } else if (token.matches("o?\\d+")) {
                        inputs.add(Integer.valueOf(token.replace("o", "")));
                    }
                }
                int id = Integer.parseInt(m.group(1));
                if (nodes.put(id, new Node(id, m.group(2),
                        inputs.stream().mapToInt(Integer::intValue).toArray(), m.group(4))) != null) {
                    throw new AssertionError("more than one compilation graph in one capture");
                }
            }
            if (nodes.isEmpty()) {
                throw new AssertionError("empty graph");
            }
        }

        private List<Node> named(String name) {
            return nodes.values().stream().filter(n -> n.name().equals(name)).toList();
        }

        private Node input(Node n, int index) {
            return index < n.inputs().length ? nodes.get(n.inputs()[index]) : null;
        }

        private void constantArgument(Node call, int index, int expected) {
            Node argument = input(call, index);
            Matcher value = argument == null ? null : INT.matcher(argument.detail());
            if (argument == null || !argument.name().equals("ConI") || !value.find() ||
                    Integer.parseInt(value.group(1)) != expected) {
                throw new AssertionError("wrong argument " + index + " of " + call + ": " + argument +
                                         "; expected " + expected);
            }
        }

        void verifyJavaFallback(int scale) {
            List<Node> leaves = named("CallLeaf").stream()
                    .filter(n -> n.detail().contains("# vectorizedMismatch")).toList();
            List<Node> fallback = named("CallStaticJava").stream()
                    .filter(n -> n.detail().contains("ArraysSupport::vectorizedMismatch")).toList();
            if (!leaves.isEmpty() || fallback.size() != 1) {
                throw new AssertionError("expected direct Java fallback without a vector prefix: " +
                                         leaves + "; " + fallback);
            }
            // The Java call keeps both original object/long pairs, then length and scale.
            constantArgument(fallback.getFirst(), 11, LARGE >> scale);
            constantArgument(fallback.getFirst(), 12, scale);
        }

        void verifyFullRange(int scale, int bytes) {
            List<Node> leaves = named("CallLeaf").stream()
                    .filter(n -> n.detail().contains("# vectorizedMismatch")).toList();
            List<Node> fallback = named("CallStaticJava").stream()
                    .filter(n -> n.detail().contains("ArraysSupport::vectorizedMismatch")).toList();
            if (leaves.size() != 1 || !fallback.isEmpty() || !named("SafePoint").isEmpty()) {
                throw new AssertionError("expected only the full-range native/mixed leaf: " +
                                         leaves + "; fallbacks=" + fallback + "; polls=" + named("SafePoint"));
            }
            constantArgument(leaves.getFirst(), 7, bytes >> scale);
            constantArgument(leaves.getFirst(), 8, scale);
        }

        // Follow memory edges only. A shared control ancestor cannot order a
        // raw alias load after a store in the byte-array alias slice.
        private List<Integer> memoryInputs(Node n) {
            List<Integer> result = new ArrayList<>();
            if (n.name().equals("MergeMem") || n.name().equals("Phi")) {
                for (int i = 1; i < n.inputs().length; i++) {
                    if (n.inputs()[i] >= 0) {
                        result.add(n.inputs()[i]);
                    }
                }
            } else {
                int index = n.name().startsWith("MemBar") || n.name().startsWith("Call") ? 2 :
                            n.name().startsWith("Store") || n.name().equals("ClearArray") ? 1 :
                            n.name().equals("SCMemProj") || n.name().equals("Proj") &&
                                    n.detail().contains("Memory:") ? 0 : -1;
                Node previous = index < 0 ? null : input(n, index);
                if (previous != null) {
                    result.add(previous.id());
                }
            }
            return result;
        }

        private boolean memoryDependsOn(Node memory, Node target) {
            if (memory == null) {
                return false;
            }
            ArrayDeque<Integer> work = new ArrayDeque<>(List.of(memory.id()));
            Set<Integer> seen = new HashSet<>();
            while (!work.isEmpty()) {
                int id = work.pop();
                if (id == target.id()) {
                    return true;
                }
                if (seen.add(id)) {
                    Node n = nodes.get(id);
                    if (n == null) {
                        throw new AssertionError("missing memory node " + id);
                    }
                    work.addAll(memoryInputs(n));
                }
            }
            return false;
        }

        private boolean dependsOn(Node node, Node target) {
            if (node == null) {
                return false;
            }
            ArrayDeque<Integer> work = new ArrayDeque<>(List.of(node.id()));
            Set<Integer> seen = new HashSet<>();
            while (!work.isEmpty()) {
                int id = work.pop();
                if (id == target.id()) {
                    return true;
                }
                if (seen.add(id)) {
                    Node n = nodes.get(id);
                    if (n == null) {
                        throw new AssertionError("missing dependency node " + id);
                    }
                    // Start points back to Root, whose Return inputs contain
                    // the whole graph. They are not execution predecessors.
                    if (n.name().equals("Start") || n.name().equals("Root")) {
                        continue;
                    }
                    for (int predecessor : n.inputs()) {
                        if (predecessor >= 0) {
                            work.add(predecessor);
                        }
                    }
                }
            }
            return false;
        }

        // Every memory predecessor path must cross a trailing barrier. Finding
        // one barrier on one branch alone would miss an unprotected early exit.
        private boolean memoryDominatedBy(Node memory, Set<Integer> barriers) {
            if (memory == null) {
                return false;
            }
            ArrayDeque<Integer> work = new ArrayDeque<>(List.of(memory.id()));
            Set<Integer> seen = new HashSet<>();
            while (!work.isEmpty()) {
                int id = work.pop();
                if (barriers.contains(id) || !seen.add(id)) {
                    continue;
                }
                Node n = nodes.get(id);
                if (n == null) {
                    throw new AssertionError("missing memory node " + id);
                }
                List<Integer> previous = memoryInputs(n);
                if (previous.isEmpty()) {
                    return false;
                }
                work.addAll(previous);
            }
            return true;
        }

        void verifyStoreOrdering(int expectedLoads, int expectedLeaves) {
            List<Node> stores = named("StoreB");
            List<Node> loads = named("LoadL").stream()
                    .filter(n -> n.detail().contains("idx=Raw")).toList();
            List<Node> leaves = named("CallLeaf").stream()
                    .filter(n -> n.detail().contains("# vectorizedMismatch")).toList();
            boolean javaCall = named("CallStaticJava").stream()
                    .anyMatch(n -> n.detail().contains("ArraysSupport::vectorizedMismatch"));
            if (stores.size() != 2 || stores.stream().anyMatch(n -> n.detail().contains("idx=Raw")) ||
                    loads.size() != expectedLoads || leaves.size() != expectedLeaves || javaCall) {
                throw new AssertionError("expected two heap byte stores, " + expectedLeaves + " mismatch leaves and " + expectedLoads +
                                         " raw prefix loads: stores=" + stores + "; loads=" + loads +
                                         "; leaves=" + leaves + "; Java call=" + javaCall);
            }
            Node first = stores.get(0), last = stores.get(1);
            if (memoryDependsOn(input(first, 1), last)) {
                Node swap = first;
                first = last;
                last = swap;
            }
            if (!memoryDependsOn(input(last, 1), first)) {
                throw new AssertionError("the two stores are not ordered: " + stores);
            }
            if (expectedLoads == 0) {
                // The existing x86 heap path has no scalar prefix: its full-memory
                // leaf orders both stores without needing new CPU-order barriers.
                Node leaf = leaves.getFirst();
                if (!memoryDependsOn(input(leaf, 2), first) ||
                        !memoryDependsOn(input(last, 1), leaf)) {
                    throw new AssertionError("the heap leaf is not between both stores");
                }
                return;
            }
            for (Node load : loads) {
                if (!memoryDependsOn(input(load, 1), first)) {
                    throw new AssertionError("raw prefix load can ignore the preceding heap store: " +
                                             load + "; store=" + first);
                }
            }
            Set<Integer> trailing = new HashSet<>();
            for (Node barrier : named("MemBarCPUOrder")) {
                Node control = input(barrier, 0);
                if (loads.stream().allMatch(load -> dependsOn(control, load))) {
                    trailing.add(barrier.id());
                }
            }
            if (trailing.isEmpty() || !memoryDominatedBy(input(last, 1), trailing)) {
                throw new AssertionError("following heap store can precede a raw prefix exit: " +
                                         last + "; trailing barriers=" + trailing);
            }
        }

        private List<Integer> controls(Node node) {
            List<Integer> result = new ArrayList<>();
            if (REGIONS.contains(node.name())) {
                for (int i = 1; i < node.inputs().length; i++) {
                    if (node.inputs()[i] >= 0) {
                        result.add(node.inputs()[i]);
                    }
                }
            } else if (node.inputs().length > 0 && node.inputs()[0] >= 0) {
                result.add(node.inputs()[0]);
            }
            return result;
        }

        private boolean inLoop(Node node) {
            ArrayDeque<Integer> work = new ArrayDeque<>(controls(node));
            Set<Integer> seen = new HashSet<>();
            while (!work.isEmpty()) {
                int id = work.pop();
                if (id == node.id()) {
                    return true;
                }
                Node next = nodes.get(id);
                if (next == null) {
                    throw new AssertionError("missing control node " + id);
                }
                if (seen.add(id) && !next.name().equals("Start")) {
                    work.addAll(controls(next));
                }
            }
            return false;
        }

        void verifyPollingBody() {
            boolean leaf = named("CallLeaf").stream()
                    .anyMatch(n -> n.detail().contains("# vectorizedMismatch"));
            boolean poll = named("SafePoint").stream().anyMatch(this::inLoop);
            if (leaf || !poll) {
                throw new AssertionError("the Java fallback must contain its polling loop: leaf=" + leaf +
                                         " polls=" + named("SafePoint"));
            }
        }
    }

    public static void main(String[] args) throws Exception {
        String mode = args.length == 0 ? "" : args[0];
        switch (mode) {
            case "semantic" -> {
                verifyAll();
                runLarge(null);
                verifyStores();
                System.out.println("Bounded mismatch semantic fixtures passed");
            }
            case "ideal" -> idealDriver(false);
            case "ideal-child" -> idealChild(false);
            case "store-ideal" -> idealDriver(true);
            case "store-ideal-child" -> idealChild(true);
            default -> TestFramework.runWithFlags(
                    "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                    "--add-exports=java.base/jdk.internal.util=ALL-UNNAMED",
                    "--enable-native-access=ALL-UNNAMED",
                    "-XX:-TieredCompilation", "-XX:+UseCountedLoopSafepoints",
                    "-XX:LoopStripMiningIter=1000");
        }
    }
}
