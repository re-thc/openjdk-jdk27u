/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */
import java.util.Random;
import jdk.incubator.vector.*;

/** Standalone qualification kernels; each process selects one path. */
public final class PhaseVectorKernels {
    static final VectorShape SHAPE = VectorShape.forBitSize(Integer.getInteger("vectorBits", 128));
    static final VectorSpecies<Float> FS = VectorSpecies.of(float.class, SHAPE);
    static final VectorSpecies<Integer> IS = FS.withLanes(int.class);
    static final float[] input = new float[1024];
    static final int[] intInput = new int[1024];
    static final int[] output = new int[1024];
    static volatile long sink;
    static {
        Random random = new Random(8392004);
        for (int i = 0; i < input.length; i++) {
            input[i] = random.nextFloat() * 4.0f - 2.0f;
            intInput[i] = random.nextInt();
        }
    }
    public static long conversion(int ignored) {
        float sum = 0;
        for (int i = 0; i < input.length; i += FS.length()) {
            var vector = FloatVector.fromArray(FS, input, i);
            var integers = vector.convert(VectorOperators.F2I, 0).reinterpretAsInts();
            var floats = integers.convert(VectorOperators.I2F, 0).reinterpretAsFloats();
            sum += floats.reduceLanes(VectorOperators.ADD);
        }
        return Float.floatToRawIntBits(sum);
    }
    public static long rawBits(int ignored) {
        for (int i = 0; i < input.length; i += FS.length()) {
            FloatVector.fromArray(FS, input, i).reinterpretAsBytes().reinterpretAsInts().intoArray(output, i);
        }
        return output[1023];
    }
    public static long directBits(int ignored) {
        for (int i = 0; i < input.length; i += FS.length()) {
            FloatVector.fromArray(FS, input, i).reinterpretAsInts().intoArray(output, i);
        }
        return output[1023];
    }
    public static long arithmetic(int ignored) {
        var sum = IntVector.zero(IS);
        for (int i = 0; i < input.length; i += IS.length()) {
            sum = sum.add(IntVector.fromArray(IS, intInput, i).mul(3).add(7));
        }
        return sum.reduceLanes(VectorOperators.ADD);
    }
    public static long osrAccumulator(int count) {
        var sum = IntVector.zero(IS);
        for (int i = 0; i < count; i++) sum = sum.add(i);
        return sum.reduceLanes(VectorOperators.ADD);
    }
    public static long osrTransient(int count) {
        int sum = 0;
        for (int i = 0; i < count; i++) sum += IntVector.broadcast(IS, i).reduceLanes(VectorOperators.ADD);
        return sum;
    }
    public static long osrArray(int count) {
        int[] state = new int[IS.length()];
        for (int i = 0; i < count; i++) {
            IntVector.fromArray(IS, state, 0).add(i).intoArray(state, 0);
        }
        return IntVector.fromArray(IS, state, 0).reduceLanes(VectorOperators.ADD);
    }
    public static long osrScalar(int count) {
        int sum = 0;
        for (int i = 0; i < count; i++) sum += i * IS.length();
        return sum;
    }
    // A substantial vector helper exposes the ordinary argument/return
    // boundary. Scalar array controls and explicit diagnostic forced-inlining
    // runs distinguish boundary boxing from the arithmetic operations.
    public static int vectorArguments(IntVector a, IntVector b) {
        a = a.add(b).lanewise(VectorOperators.XOR, 0).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        a = a.add(b).lanewise(VectorOperators.XOR, 1).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        a = a.add(b).lanewise(VectorOperators.XOR, 2).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        a = a.add(b).lanewise(VectorOperators.XOR, 3).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        a = a.add(b).lanewise(VectorOperators.XOR, 4).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        a = a.add(b).lanewise(VectorOperators.XOR, 5).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        a = a.add(b).lanewise(VectorOperators.XOR, 6).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        a = a.add(b).lanewise(VectorOperators.XOR, 7).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        a = a.add(b).lanewise(VectorOperators.XOR, 8).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        a = a.add(b).lanewise(VectorOperators.XOR, 9).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        a = a.add(b).lanewise(VectorOperators.XOR, 10).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        a = a.add(b).lanewise(VectorOperators.XOR, 11).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        a = a.add(b).lanewise(VectorOperators.XOR, 12).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        a = a.add(b).lanewise(VectorOperators.XOR, 13).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        a = a.add(b).lanewise(VectorOperators.XOR, 14).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        a = a.add(b).lanewise(VectorOperators.XOR, 15).mul(3).add(7);
        b = b.lanewise(VectorOperators.XOR, a).add(11).mul(5);
        return a.add(b).reduceLanes(VectorOperators.ADD);
    }
    public static IntVector vectorReturn(int[] data, int offset) {
        var a = IntVector.fromArray(IS, data, offset);
        a = a.mul(3).lanewise(VectorOperators.XOR, 0).add(7);
        a = a.mul(3).lanewise(VectorOperators.XOR, 1).add(7);
        a = a.mul(3).lanewise(VectorOperators.XOR, 2).add(7);
        a = a.mul(3).lanewise(VectorOperators.XOR, 3).add(7);
        a = a.mul(3).lanewise(VectorOperators.XOR, 4).add(7);
        a = a.mul(3).lanewise(VectorOperators.XOR, 5).add(7);
        a = a.mul(3).lanewise(VectorOperators.XOR, 6).add(7);
        a = a.mul(3).lanewise(VectorOperators.XOR, 7).add(7);
        a = a.mul(3).lanewise(VectorOperators.XOR, 8).add(7);
        a = a.mul(3).lanewise(VectorOperators.XOR, 9).add(7);
        a = a.mul(3).lanewise(VectorOperators.XOR, 10).add(7);
        a = a.mul(3).lanewise(VectorOperators.XOR, 11).add(7);
        a = a.mul(3).lanewise(VectorOperators.XOR, 12).add(7);
        a = a.mul(3).lanewise(VectorOperators.XOR, 13).add(7);
        a = a.mul(3).lanewise(VectorOperators.XOR, 14).add(7);
        a = a.mul(3).lanewise(VectorOperators.XOR, 15).add(7);
        return a;
    }
    public static int arrayArguments(int[] data, int offset) {
        int sum = 0;
        for (int lane = 0; lane < IS.length(); lane++) {
            int a = data[offset + lane], b = data[offset + IS.length() + lane];
            for (int round = 0; round < 16; round++) {
                a = ((a + b) ^ round) * 3 + 7;
                b = (b ^ a) + 11;
                b *= 5;
            }
            sum += a + b;
        }
        return sum;
    }
    public static long signatureArgs(int ignored) {
        int sum = 0;
        for (int i = 0; i < intInput.length; i += 2 * IS.length()) {
            sum += vectorArguments(IntVector.fromArray(IS, intInput, i),
                                   IntVector.fromArray(IS, intInput, i + IS.length()));
        }
        return sum;
    }
    public static long signatureReturn(int ignored) {
        int sum = 0;
        for (int i = 0; i < intInput.length; i += IS.length()) {
            vectorReturn(intInput, i).intoArray(output, i);
            sum += output[i];
        }
        return sum;
    }
    public static int[] arrayReturn(int[] data, int offset, int[] destination) {
        for (int lane = 0; lane < IS.length(); lane++) {
            int a = data[offset + lane];
            for (int round = 0; round < 16; round++) a = (a * 3 ^ round) + 7;
            destination[offset + lane] = a;
        }
        return destination;
    }
    public static long signatureArrayReturn(int ignored) {
        int sum = 0;
        for (int i = 0; i < intInput.length; i += IS.length()) sum += arrayReturn(intInput, i, output)[i];
        return sum;
    }
    public static long signatureArray(int ignored) {
        int sum = 0;
        for (int i = 0; i < intInput.length; i += 2 * IS.length()) sum += arrayArguments(intInput, i);
        return sum;
    }
    public static long expected(String kernel, int count) {
        if (kernel.startsWith("osr")) return (int) ((long) count * (count - 1) / 2 * IS.length());
        if (kernel.equals("rawBits") || kernel.equals("directBits")) return Float.floatToRawIntBits(input[1023]);
        if (kernel.equals("arithmetic")) {
            int sum = 0; for (int value : intInput) sum += value * 3 + 7; return sum;
        }
        if (kernel.equals("conversion")) {
            float sum = 0; for (float value : input) sum += (int) value; return Float.floatToRawIntBits(sum);
        }
        if (kernel.equals("signatureArgs") || kernel.equals("signatureArray")) {
            int sum = 0;
            for (int i = 0; i < intInput.length; i += 2 * IS.length()) sum += arrayArguments(intInput, i);
            return sum;
        }
        if (kernel.equals("signatureReturn") || kernel.equals("signatureArrayReturn")) {
            int sum = 0;
            for (int i = 0; i < intInput.length; i += IS.length()) {
                int a = intInput[i];
                for (int round = 0; round < 16; round++) a = (a * 3 ^ round) + 7;
                sum += a;
            }
            return sum;
        }
        throw new IllegalArgumentException(kernel);
    }
}
