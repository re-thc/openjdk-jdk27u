/*
 * Copyright (c) 2020, 2025, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 8323552
 * @summary Mismatch results and proper prefixes across the signed-int length boundary
 * @requires (sun.arch.data.model == "64" & os.maxMemory >= 8g)
 * @run main/othervm/timeout=480 -Xmx256m TestLongMismatch
 * @run main/othervm/timeout=480 -Xmx256m -Xbatch -XX:TieredStopAtLevel=1 TestLongMismatch
 * @run main/othervm/timeout=480 -Xmx256m -Xbatch -XX:-TieredCompilation TestLongMismatch
 * @run main/othervm/timeout=480 -Xmx256m -Xbatch -XX:-TieredCompilation
 *                  -XX:+UnlockDiagnosticVMOptions -XX:-UseVectorizedMismatchIntrinsic TestLongMismatch
 */

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;

public class TestLongMismatch {
    private static void check(long actual, long expected) {
        if (actual != expected) {
            throw new AssertionError(actual + " != " + expected);
        }
    }

    public static void main(String[] args) {
        long size = (long) Integer.MAX_VALUE + 10;
        try (Arena arena = Arena.ofConfined()) {
            MemorySegment a = arena.allocate(size, 8);
            MemorySegment b = arena.allocate(size, 8);
            // Compile the same public path before exercising long offsets.
            for (int i = 0; i < 15000; i++) {
                check(MemorySegment.mismatch(a, 0, 128, b, 0, 128), -1);
            }
            check(a.mismatch(a), -1);
            check(a.mismatch(b), -1);
            for (long position : new long[] {Integer.MAX_VALUE - 1L,
                    Integer.MAX_VALUE, Integer.MAX_VALUE + 1L, size - 1}) {
                b.set(ValueLayout.JAVA_BYTE, position, (byte) 1);
                check(a.mismatch(b), position);
                check(b.mismatch(a), position);
                b.set(ValueLayout.JAVA_BYTE, position, (byte) 0);
            }
            for (long prefix : new long[] {Integer.MAX_VALUE - 1L,
                    Integer.MAX_VALUE, Integer.MAX_VALUE + 1L}) {
                check(a.asSlice(0, prefix).mismatch(b.asSlice(0, prefix)), -1);
                check(MemorySegment.mismatch(a, 0, size, b, 0, prefix), prefix);
                check(MemorySegment.mismatch(b, 0, prefix, a, 0, size), prefix);
            }
        }
    }
}
