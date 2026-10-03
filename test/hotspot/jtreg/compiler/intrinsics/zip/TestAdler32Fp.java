/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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
 */

/*
 * @test
 * @summary Preserve scalar and vector floating-point values across bulk Adler32 calls
 * @modules jdk.incubator.vector
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000 compiler.intrinsics.zip.TestAdler32Fp
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 compiler.intrinsics.zip.TestAdler32Fp
 * @run main/othervm -Xint compiler.intrinsics.zip.TestAdler32Fp 300
 */

package compiler.intrinsics.zip;

import java.util.zip.Adler32;
import jdk.incubator.vector.DoubleVector;
import jdk.incubator.vector.VectorOperators;
import jdk.incubator.vector.VectorSpecies;

public class TestAdler32Fp {
    private static final VectorSpecies<Double> SPECIES = DoubleVector.SPECIES_PREFERRED;

    private static double scalar(Adler32 adler, byte[] bytes, double[] values) {
        double v0 = values[0], v1 = values[1], v2 = values[2], v3 = values[3];
        double v4 = values[4], v5 = values[5], v6 = values[6], v7 = values[7];
        double v8 = values[8], v9 = values[9], v10 = values[10], v11 = values[11];
        double v12 = values[12], v13 = values[13], v14 = values[14], v15 = values[15];
        adler.update(bytes, 0, 4096);
        // Depend on the checksum result so these operations cannot move ahead
        // of the native call and shorten the floating-point live ranges.
        return v0 + adler.getValue() + v1 + v2 + v3 + v4 + v5 + v6 + v7
               + v8 + v9 + v10 + v11 + v12 + v13 + v14 + v15;
    }

    private static double vector(Adler32 adler, byte[] bytes, double[] values) {
        DoubleVector v = DoubleVector.fromArray(SPECIES, values, 16);
        adler.update(bytes, 0, 4096);
        return v.add((double) adler.getValue()).reduceLanes(VectorOperators.ADD);
    }

    public static void main(String[] args) {
        int iterations = args.length == 0 ? 5000 : Integer.parseInt(args[0]);
        byte[] bytes = new byte[4096];
        new java.util.Random(42).nextBytes(bytes);
        double[] values = new double[16 + SPECIES.length()];
        Adler32 adler = new Adler32();
        for (int i = 0; i < iterations; i++) {
            // Binary fractions keep every tested sum exact, including changes
            // in vector reduction order on different supported architectures.
            for (int j = 0; j < values.length; j++) {
                values[j] = (i + j + 1) * 0.25;
            }
            double actual = scalar(adler, bytes, values);
            double expected = values[0] + adler.getValue();
            for (int j = 1; j < 16; j++) expected += values[j];
            if (actual != expected) throw new AssertionError("scalar " + actual + " != " + expected);
            actual = vector(adler, bytes, values);
            expected = 0;
            for (int j = 16; j < values.length; j++) expected += values[j] + adler.getValue();
            if (actual != expected) throw new AssertionError("vector " + actual + " != " + expected);
        }
    }
}
