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
 * @summary MemorySegment.mismatch reads only the bytes of the compared ranges,
 *          whatever the native threshold, including thresholds below a word
 * @key randomness
 * @library /test/lib
 * @build jdk.test.lib.RandomFactory
 * @run main/othervm -Djava.lang.foreign.native.threshold.power.mismatch=0 TestMismatchThreshold
 * @run main/othervm -Djava.lang.foreign.native.threshold.power.mismatch=1 TestMismatchThreshold
 * @run main/othervm -Djava.lang.foreign.native.threshold.power.mismatch=2 TestMismatchThreshold
 * @run main/othervm -Djava.lang.foreign.native.threshold.power.mismatch=3 TestMismatchThreshold
 * @run main/othervm TestMismatchThreshold
 * @run main/othervm -Xint -Djava.lang.foreign.native.threshold.power.mismatch=2 TestMismatchThreshold
 */

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.util.Random;
import jdk.test.lib.RandomFactory;

import static java.lang.foreign.ValueLayout.JAVA_BYTE;

public class TestMismatchThreshold {
    // Bytes on either side of the compared ranges, which always differ between the two segments.
    private static final int PAD = 16;
    // Above the default threshold of 64 bytes.
    private static final int MAX_LENGTH = 72;
    private static final Random RANDOM = RandomFactory.getRandom();

    public static void main(String[] args) {
        try (Arena arena = Arena.ofConfined()) {
            // Later rounds run compiled code.
            for (int round = 0; round < 3; round++) {
                for (int length = 0; length <= MAX_LENGTH; length++) {
                    for (int kinds = 0; kinds < 4; kinds++) {
                        check(arena, length, (kinds & 1) != 0, (kinds & 2) != 0);
                    }
                }
            }
        }
    }

    private static void check(Arena arena, int length, boolean heapA, boolean heapB) {
        int size = length + 2 * PAD;
        MemorySegment a = heapA ? MemorySegment.ofArray(new byte[size]) : arena.allocate(size);
        MemorySegment b = heapB ? MemorySegment.ofArray(new byte[size]) : arena.allocate(size);
        // Misaligned starts, differently for the two segments.
        int aFrom = PAD - RANDOM.nextInt(8);
        int bFrom = PAD - RANDOM.nextInt(8);
        for (int i = -aFrom; i < size - aFrom; i++) {
            byte value = (byte) RANDOM.nextInt();
            a.set(JAVA_BYTE, aFrom + i, value);
            int j = bFrom + i;
            if (j >= 0 && j < size) {
                // Equal inside the ranges, different outside them.
                b.set(JAVA_BYTE, j, i >= 0 && i < length ? value : (byte) ~value);
            }
        }
        String where = "length " + length + (heapA ? ", heap" : ", native") + (heapB ? "/heap" : "/native");

        check(mismatch(a, aFrom, length, b, bFrom, length), -1, where + ", equal");
        // The byte after the shorter range differs, which must not matter.
        check(mismatch(a, aFrom, length, b, bFrom, length + 1), length, where + ", prefix");
        check(mismatch(a, aFrom, length + 1, b, bFrom, length), length, where + ", prefix of the second");
        for (int position = 0; position < length; position++) {
            long offset = bFrom + position;
            byte value = b.get(JAVA_BYTE, offset);
            b.set(JAVA_BYTE, offset, (byte) ~value);
            check(mismatch(a, aFrom, length, b, bFrom, length), position, where + ", difference at " + position);
            b.set(JAVA_BYTE, offset, value);
        }
    }

    // Compares the ranges with the static method and with slices; both must agree.
    private static long mismatch(MemorySegment a, long aFrom, long aLength, MemorySegment b, long bFrom, long bLength) {
        long result = MemorySegment.mismatch(a, aFrom, aFrom + aLength, b, bFrom, bFrom + bLength);
        long sliced = a.asSlice(aFrom, aLength).mismatch(b.asSlice(bFrom, bLength));
        if (result != sliced) {
            throw new AssertionError("static " + result + " != slice " + sliced);
        }
        return result;
    }

    private static void check(long result, long expected, String what) {
        if (result != expected) {
            throw new AssertionError(what + ": " + result + " != " + expected);
        }
    }
}
