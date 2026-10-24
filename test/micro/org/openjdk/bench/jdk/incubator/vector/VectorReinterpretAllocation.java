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
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
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

package org.openjdk.bench.jdk.incubator.vector;

import java.util.Random;
import java.util.concurrent.TimeUnit;
import jdk.incubator.vector.*;
import org.openjdk.jmh.annotations.*;

/**
 * Reinterpretation in numeric, raw-bit and identity-shape pipelines, with controls.
 * Select a fixed shape per fork using -jvmArgsAppend -DvectorBits=64 (or 128,
 * 256, 512). Use -prof gc to measure materialization as well as elapsed time.
 */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(value = 3, jvmArgs = {"--add-modules=jdk.incubator.vector"})
@State(Scope.Thread)
public class VectorReinterpretAllocation {
    private static final VectorSpecies<Float> FS = VectorSpecies.of(float.class,
        VectorShape.forBitSize(Integer.getInteger("vectorBits", 128)));
    private static final VectorSpecies<Integer> IS = FS.withLanes(int.class);
    private float[] input;
    private int[] intInput;
    private int[] output;

    @Setup
    public void setup() {
        input = new float[1024];
        intInput = new int[1024];
        output = new int[1024];
        Random r = new Random(8392004);
        for (int i = 0; i < input.length; i++) input[i] = r.nextFloat() * 4.0f - 2.0f;
        for (int i = 0; i < output.length; i++) intInput[i] = output[i] = i;
    }

    @Benchmark
    @CompilerControl(CompilerControl.Mode.DONT_INLINE)
    public float conversion() {
        float sum = 0;
        for (int i = 0; i < input.length; i += FS.length()) {
            FloatVector v = FloatVector.fromArray(FS, input, i);
            IntVector iv = v.convert(VectorOperators.F2I, 0).reinterpretAsInts();
            FloatVector fv = iv.convert(VectorOperators.I2F, 0).reinterpretAsFloats();
            sum += fv.reduceLanes(VectorOperators.ADD);
        }
        return sum;
    }

    @Benchmark
    @CompilerControl(CompilerControl.Mode.DONT_INLINE)
    public int[] rawBits() {
        for (int i = 0; i < input.length; i += FS.length()) {
            FloatVector.fromArray(FS, input, i).reinterpretAsBytes().reinterpretAsInts().intoArray(output, i);
        }
        return output;
    }

    @Benchmark
    @CompilerControl(CompilerControl.Mode.DONT_INLINE)
    public int[] directBits() {
        for (int i = 0; i < input.length; i += FS.length()) {
            FloatVector.fromArray(FS, input, i).reinterpretAsInts().intoArray(output, i);
        }
        return output;
    }

    @Benchmark
    @CompilerControl(CompilerControl.Mode.DONT_INLINE)
    public int[] identityReinterpret() {
        for (int i = 0; i < intInput.length; i += IS.length()) {
            IntVector v = (IntVector) IntVector.fromArray(IS, intInput, i).reinterpretShape(IS, 0);
            v.intoArray(output, i);
        }
        return output;
    }

    @Benchmark
    @CompilerControl(CompilerControl.Mode.DONT_INLINE)
    public int[] identityCast() {
        for (int i = 0; i < intInput.length; i += IS.length()) {
            IntVector v = (IntVector) IntVector.fromArray(IS, intInput, i).castShape(IS, 0);
            v.intoArray(output, i);
        }
        return output;
    }

    @Benchmark
    @CompilerControl(CompilerControl.Mode.DONT_INLINE)
    public int arithmetic() {
        IntVector sum = IntVector.zero(IS);
        for (int i = 0; i < output.length; i += IS.length()) {
            sum = sum.add(IntVector.fromArray(IS, output, i).mul(3).add(7));
        }
        return sum.reduceLanes(VectorOperators.ADD);
    }
}
