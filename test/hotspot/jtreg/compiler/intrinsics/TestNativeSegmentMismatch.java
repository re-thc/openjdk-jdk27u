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

package compiler.intrinsics;

/*
 * @test
 * @summary Check that bounded native MemorySegment mismatch uses the SIMD stub
 * @requires vm.compiler2.enabled & (vm.simpleArch == "x64")
 * @requires vm.opt.final.UseVectorizedMismatchIntrinsic == true
 * @library /test/lib /
 * @run driver compiler.intrinsics.TestNativeSegmentMismatch
 */

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;

import compiler.lib.ir_framework.IR;
import compiler.lib.ir_framework.IRNode;
import compiler.lib.ir_framework.Run;
import compiler.lib.ir_framework.Test;
import compiler.lib.ir_framework.TestFramework;

public class TestNativeSegmentMismatch {
    private static final Arena ARENA = Arena.ofAuto();
    private static final MemorySegment NATIVE_A = ARENA.allocate(4097);
    private static final MemorySegment NATIVE_B = ARENA.allocate(4097);
    private static final MemorySegment HEAP = MemorySegment.ofArray(new byte[4097]);

    public static void main(String[] args) {
        TestFramework.run();
    }

    @Test
    @IR(counts = {IRNode.CALL_OF, "vectorizedMismatch", "1"})
    public static long nativeNative(MemorySegment a, MemorySegment b) {
        return a.mismatch(b);
    }

    @Test
    @IR(counts = {IRNode.CALL_OF, "vectorizedMismatch", "1"})
    public static long nativeHeap(MemorySegment a, MemorySegment b) {
        return a.mismatch(b);
    }

    @Test
    @IR(counts = {IRNode.CALL_OF, "vectorizedMismatch", "1"})
    public static long heapNative(MemorySegment a, MemorySegment b) {
        return a.mismatch(b);
    }

    @Run(test = {"nativeNative", "nativeHeap", "heapNative"})
    public static void run() {
        for (int size : new int[] {64, 65, 127, 128, 129, 4095, 4096}) {
            MemorySegment a = NATIVE_A.asSlice(1, size);
            MemorySegment b = NATIVE_B.asSlice(0, size);
            MemorySegment heap = HEAP.asSlice(1, size);
            check(nativeNative(a, b), -1);
            check(nativeHeap(a, heap), -1);
            check(heapNative(heap, b), -1);
            for (int position : new int[] {1, 31, 32, size - 1}) {
                b.set(ValueLayout.JAVA_BYTE, position, (byte) 1);
                check(nativeNative(a, b), position);
                check(heapNative(heap, b), position);
                b.set(ValueLayout.JAVA_BYTE, position, (byte) 0);
                heap.set(ValueLayout.JAVA_BYTE, position, (byte) 1);
                check(nativeHeap(a, heap), position);
                heap.set(ValueLayout.JAVA_BYTE, position, (byte) 0);
            }
        }
    }

    private static void check(long result, long expected) {
        if (result != expected) {
            throw new AssertionError(result + " != " + expected);
        }
    }
}
