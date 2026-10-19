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
 * @summary Random serialization preserves the seed and cached Gaussian for subclasses too
 * @run main Serialization
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Arrays;
import java.util.Random;

public class Serialization {
    public static void main(String[] args) throws Exception {
        for (long seed : new long[] {0, 1, -1, Long.MIN_VALUE, Long.MAX_VALUE}) {
            for (Random original : new Random[] {new Random(seed), new SubRandom(seed)}) {
                original.nextLong();
                original.nextGaussian();
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                try (ObjectOutputStream out = new ObjectOutputStream(bytes)) {
                    out.writeObject(original);
                }
                Random restored;
                try (ObjectInputStream in = new ObjectInputStream(
                        new ByteArrayInputStream(bytes.toByteArray()))) {
                    restored = (Random) in.readObject();
                }
                if (restored.getClass() != original.getClass()) {
                    throw new AssertionError("Subclass not preserved");
                }
                compare(original, restored);
                original.setSeed(~seed);
                restored.setSeed(~seed);
                compare(original, restored);
            }
        }
    }

    private static void compare(Random a, Random b) {
        for (int i = 0; i < 100; i++) {
            if (a.nextInt() != b.nextInt() || a.nextLong() != b.nextLong() ||
                    a.nextDouble() != b.nextDouble() || a.nextGaussian() != b.nextGaussian()) {
                throw new AssertionError("Deserialized sequence differs");
            }
            byte[] x = new byte[17];
            byte[] y = new byte[17];
            a.nextBytes(x);
            b.nextBytes(y);
            if (!Arrays.equals(x, y)) throw new AssertionError("Byte sequence differs");
        }
    }

    private static class SubRandom extends Random {
        private static final long serialVersionUID = 1L;
        SubRandom(long seed) { super(seed); }
    }
}
