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
 * @summary Exercise native and mixed MemorySegment mismatch boundaries
 * @run main/othervm -Xint TestNativeMismatch
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestNativeMismatch
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000 TestNativeMismatch
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000
 *                  -XX:+UnlockDiagnosticVMOptions -XX:-UseVectorizedMismatchIntrinsic TestNativeMismatch
 */

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;

public class TestNativeMismatch {
    private static final int LIMIT = 1 << 20;
    private static final int[] SIZES = {
            1, 7, 8, 15, 16, 31, 32, 63, 64, 65, 127, 128, 129,
            255, 256, 257, 4095, 4096, 4097, 65535, 65536, 65537,
            LIMIT - 1, LIMIT, LIMIT + 1
    };

    private static long nativeNative(MemorySegment a, MemorySegment b) {
        return a.mismatch(b);
    }

    private static long nativeHeap(MemorySegment a, MemorySegment b) {
        return a.mismatch(b);
    }

    private static long heapNative(MemorySegment a, MemorySegment b) {
        return a.mismatch(b);
    }

    private static long mismatch(MemorySegment a, MemorySegment b) {
        if (a.isNative()) {
            return b.isNative() ? nativeNative(a, b) : nativeHeap(a, b);
        }
        return heapNative(a, b);
    }

    private static void check(MemorySegment a, MemorySegment b, long expected) {
        long result = mismatch(a, b);
        if (result != expected) {
            throw new AssertionError("size=" + a.byteSize() + ": " + result + " != " + expected);
        }
    }

    private static void checkPair(MemorySegment a, MemorySegment b) {
        MemorySegment warmA = a.asSlice(0, 128);
        MemorySegment warmB = b.asSlice(0, 128);
        for (int i = 0; i < 5000; i++) {
            check(warmA, warmB, -1);
        }
        for (int size : SIZES) {
            for (int alignment = 0; alignment < 8; alignment++) {
                MemorySegment left = a.asSlice(alignment, size);
                MemorySegment right = b.asSlice((alignment + 3) & 7, size);
                check(left, right, -1);
                check(left.asReadOnly(), right.asReadOnly(), -1);
                check(left, right.asSlice(0, size - 1), size - 1);
                int[] positions = size <= 257 ? null : new int[] {0, 1, 7, 31, 32, 63, 64, size - 1};
                int count = positions == null ? size : positions.length;
                for (int i = 0; i < count; i++) {
                    int position = positions == null ? i : positions[i];
                    right.set(ValueLayout.JAVA_BYTE, position, (byte) 1);
                    check(left, right, position);
                    check(right, left, position);
                    right.set(ValueLayout.JAVA_BYTE, position, (byte) 0);
                }
                // Aliasing is legal for read-only mismatch inputs.
                check(left, left, -1);
            }
        }
    }

    public static void main(String[] args) {
        try (Arena confined = Arena.ofConfined(); Arena shared = Arena.ofShared()) {
            MemorySegment a = confined.allocate(LIMIT + 16);
            MemorySegment b = shared.allocate(LIMIT + 16);
            MemorySegment heap = MemorySegment.ofArray(new byte[LIMIT + 16]);
            checkPair(a, b);
            checkPair(a, heap);
            checkPair(heap, b);
        }
    }
}
