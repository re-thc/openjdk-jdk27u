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
 * @summary Check variable byte lane signedness, every index, bounds and exception order
 * @modules jdk.incubator.vector
 * @run main/othervm -Xint compiler.vectorapi.TestByteVectorVariableLaneSemantics
 * @run main/othervm -XX:TieredStopAtLevel=1 compiler.vectorapi.TestByteVectorVariableLaneSemantics
 * @run main/othervm -Xbatch compiler.vectorapi.TestByteVectorVariableLaneSemantics
 */
package compiler.vectorapi;

import jdk.incubator.vector.*;
import java.util.List;

public class TestByteVectorVariableLaneSemantics {
    private static int checks;
    private static volatile int index;
    private static int lane(VectorSpecies<Byte> species, byte[] a, int offset, int i) {
        return ByteVector.fromArray(species, a, offset).lane(i);
    }
    private static void expect(Class<? extends Throwable> type, Runnable action) {
        try { action.run(); }
        catch (Throwable thrown) {
            if (!type.isInstance(thrown)) throw new AssertionError(thrown);
            checks++;
            return;
        }
        throw new AssertionError("Missing " + type.getName());
    }
    public static void main(String[] args) {
        for (VectorSpecies<Byte> species : List.of(ByteVector.SPECIES_64,
                ByteVector.SPECIES_128, ByteVector.SPECIES_256, ByteVector.SPECIES_512,
                ByteVector.SPECIES_MAX)) {
            int length = species.length();
            byte[] a = new byte[length + 5];
            for (int value = -128; value <= 127; value++) {
                for (int i = 0; i < length; i++) a[i + 3] = (byte)(value + i);
                for (int i = 0; i < length; i++) {
                    index = i;
                    if (lane(species, a, 3, index) != a[i + 3]) throw new AssertionError("signed lane " + i);
                    checks++;
                }
            }
            ByteVector vector = ByteVector.fromArray(species, a, 3);
            for (int bad : new int[]{-1, -128, length, length + 1, length + 127, length + 128, length + 255, length + 256, Integer.MIN_VALUE, Integer.MAX_VALUE}) {
                expect(IllegalArgumentException.class, () -> vector.lane(bad));
                expect(IllegalArgumentException.class, () -> lane(species, a, 3, bad));
            }
            // The array load precedes lane validation; a bad lane cannot hide its exception.
            expect(NullPointerException.class, () -> lane(species, null, 0, -1));
            expect(IndexOutOfBoundsException.class, () -> lane(species, new byte[length - 1], 0, -1));
            ByteVector missing = null;
            expect(NullPointerException.class, () -> missing.lane(-1));
            // Existing variable boolean extraction shares the backend instruction rule.
            boolean[] bits = new boolean[length];
            for (int i = 0; i < length; i++) bits[i] = (i & 1) != 0;
            VectorMask<Byte> mask = VectorMask.fromArray(species, bits, 0);
            for (int i = 0; i < length; i++) {
                boolean expected = bits[i];
                if (mask.laneIsSet(i) != expected) {
                    throw new AssertionError("boolean lane " + i);
                }
                checks++;
            }
        }
        System.out.println("PASS scalar_checks=" + checks);
    }
}
