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
package compiler.vectorapi;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Random;
import compiler.lib.ir_framework.*;
import jdk.incubator.vector.*;
import jdk.test.whitebox.WhiteBox;

/*
 * @test
 * @summary Conversion/reduction idiom preserves scalar recurrence order and excluded loop shapes
 * @modules jdk.incubator.vector
 * @library /test/lib /
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:. -Xint compiler.vectorapi.TestFloatRoundTripReduction semantics 0
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 compiler.vectorapi.TestFloatRoundTripReduction semantics 1
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:. -Xbatch -XX:-TieredCompilation compiler.vectorapi.TestFloatRoundTripReduction semantics 4
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:. -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100000000 compiler.vectorapi.TestFloatRoundTripReduction cold 0
 * @run driver compiler.vectorapi.TestFloatRoundTripReduction
 */
public class TestFloatRoundTripReduction {
    static final VectorSpecies<Float> F4 = FloatVector.SPECIES_128;
    static final VectorSpecies<Integer> I4 = IntVector.SPECIES_128;
    static final float[] A = new float[257];
    static final float[] B = new float[257];
    static final float[] OUT = new float[257];
    static final double[] D = new double[257];
    static volatile float sink;
    static long checks;
    static {
        for (int i = 0; i < A.length; i++) {
            A[i] = (i % 31 - 15) / 4.0f;
            B[i] = (i % 17 - 8) / 4.0f;
            D[i] = A[i];
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            int required = Integer.parseInt(args[1]);
            int[] warmLengths = {0, 1, 3, 4, 5, 16, 65};
            if (!args[0].equals("cold")) {
                for (int i = 0; i < 21000; i++) sink = carried128(A, warmLengths[i % warmLengths.length], (i & 1) == 0 ? 0.0f : -0.0f);
            }
            Method method = TestFloatRoundTripReduction.class.getDeclaredMethod("carried128", float[].class, int.class, float.class);
            int actual = WhiteBox.getWhiteBox().getMethodCompilationLevel(method, false);
            if (actual != required) throw new AssertionError("ordinary level " + actual + " expected " + required);
            semanticCases();
            int after = WhiteBox.getWhiteBox().getMethodCompilationLevel(method, false);
            if (after != required) throw new AssertionError("final ordinary level " + after + " expected " + required);
            System.out.println("ROUNDTRIP_REDUCTION_PASS mode=" + args[0] + " checked_method=carried128 required=" + required + " actual=" + actual + " after=" + after + " aggregate_semantic_checks=" + checks);
        } else {
            TestFramework.runWithFlags("--add-modules=jdk.incubator.vector", "-XX:ActiveProcessorCount=2");
        }
    }

    @ForceInline
    static FloatVector roundTrip(FloatVector v) {
        return (FloatVector)((IntVector)v.convertShape(VectorOperators.F2I, I4, 0))
                .convertShape(VectorOperators.I2F, F4, 0);
    }

    @Test
    @IR(counts={"convF2I2F_reduce_acc4F_neon",">=1"}, phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"}, applyIfAnd={"UseSVE","0","MaxVectorSize",">=16"})
    @IR(counts={"convF2I2F_reduce_acc4F_neon",">=1"}, phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"}, applyIfAnd={"UseSVE",">0","MaxVectorSize","16"})
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"}, applyIfAnd={"UseSVE",">0","MaxVectorSize",">16"})
    public static float carried128(float[] a, int length, float sum) {
        int i = 0;
        for (; i < F4.loopBound(length); i += F4.length()) {
            sum += roundTrip(FloatVector.fromArray(F4, a, i)).reduceLanes(VectorOperators.ADD);
        }
        for (; i < length; i++) sum += (float)(int)a[i];
        return sum;
    }

    @Test
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING, applyIfPlatform={"aarch64","true"})
    public static float carried64(float[] a, int length, float sum) {
        var fs = FloatVector.SPECIES_64;
        var is = IntVector.SPECIES_64;
        int i = 0;
        for (; i < fs.loopBound(length); i += fs.length()) {
            var v = (IntVector)FloatVector.fromArray(fs, a, i).convertShape(VectorOperators.F2I, is, 0);
            sum += ((FloatVector)v.convertShape(VectorOperators.I2F, fs, 0)).reduceLanes(VectorOperators.ADD);
        }
        for (; i < length; i++) sum += (float)(int)a[i];
        return sum;
    }

    @Test
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING, applyIfPlatform={"aarch64","true"})
    public static float carried256(float[] a, int length, float sum) {
        var fs = FloatVector.SPECIES_256;
        var is = IntVector.SPECIES_256;
        int i = 0;
        for (; i < fs.loopBound(length); i += fs.length()) {
            var v = (IntVector)FloatVector.fromArray(fs, a, i).convertShape(VectorOperators.F2I, is, 0);
            sum += ((FloatVector)v.convertShape(VectorOperators.I2F, fs, 0)).reduceLanes(VectorOperators.ADD);
        }
        for (; i < length; i++) sum += (float)(int)a[i];
        return sum;
    }

    @Test
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING, applyIfPlatform={"aarch64","true"})
    public static float carried512(float[] a, int length, float sum) {
        var fs = FloatVector.SPECIES_512;
        var is = IntVector.SPECIES_512;
        int i = 0;
        for (; i < fs.loopBound(length); i += fs.length()) {
            var v = (IntVector)FloatVector.fromArray(fs, a, i).convertShape(VectorOperators.F2I, is, 0);
            sum += ((FloatVector)v.convertShape(VectorOperators.I2F, fs, 0)).reduceLanes(VectorOperators.ADD);
        }
        for (; i < length; i++) sum += (float)(int)a[i];
        return sum;
    }

    @Test
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING, applyIfPlatform={"aarch64","true"})
    public static void independent(float[] a, float[] out, int length, float seed) {
        for (int i = 0; i < F4.loopBound(length); i += F4.length()) {
            out[i / 4] = seed + roundTrip(FloatVector.fromArray(F4, a, i)).reduceLanes(VectorOperators.ADD);
        }
    }

    @Test
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING, applyIfPlatform={"aarch64","true"})
    public static float twoAccumulators(float[] a, float[] b, int length, float first, float second) {
        int i = 0;
        for (; i < F4.loopBound(length); i += F4.length()) {
            first += roundTrip(FloatVector.fromArray(F4, a, i)).reduceLanes(VectorOperators.ADD);
            second += roundTrip(FloatVector.fromArray(F4, b, i)).reduceLanes(VectorOperators.ADD);
        }
        for (; i < length; i++) {
            first += (float)(int)a[i];
            second += (float)(int)b[i];
        }
        return first + second;
    }

    @Test
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING, applyIfPlatform={"aarch64","true"})
    public static float sharedVector(float[] a, float[] out, int length, float sum) {
        int i = 0;
        for (; i < F4.loopBound(length); i += F4.length()) {
            FloatVector v = roundTrip(FloatVector.fromArray(F4, a, i));
            sum += v.reduceLanes(VectorOperators.ADD);
            v.intoArray(out, i);
        }
        for (; i < length; i++) sum += (float)(int)a[i];
        return sum;
    }

    @Test
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING, applyIfPlatform={"aarch64","true"})
    public static float masked(float[] a, int length, float sum, long maskBits) {
        var mask = VectorMask.fromLong(F4, maskBits);
        for (int i = 0; i < F4.loopBound(length); i += F4.length()) {
            sum += roundTrip(FloatVector.fromArray(F4, a, i)).reduceLanes(VectorOperators.ADD, mask);
        }
        return sum;
    }

    @Test
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING, applyIfPlatform={"aarch64","true"})
    public static float strictScalar(float[] a, int length, float sum) {
        for (int i = 0; i < length; i++) sum += (float)(int)a[i];
        return sum;
    }

    @Test
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING, applyIfPlatform={"aarch64","true"})
    public static float plainReduction(float[] a, int length, float sum) {
        int i = 0;
        for (; i < F4.loopBound(length); i += F4.length()) sum += FloatVector.fromArray(F4, a, i).reduceLanes(VectorOperators.ADD);
        for (; i < length; i++) sum += a[i];
        return sum;
    }

    @Test
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING, applyIfPlatform={"aarch64","true"})
    public static double double128(double[] a, int length, double sum) {
        var species = DoubleVector.SPECIES_128;
        int i = 0;
        for (; i < species.loopBound(length); i += species.length()) sum += DoubleVector.fromArray(species, a, i).reduceLanes(VectorOperators.ADD);
        for (; i < length; i++) sum += a[i];
        return sum;
    }

    @Run(test={"carried128","carried64","carried256","carried512","independent","twoAccumulators","sharedVector","masked","strictScalar","plainReduction","double128"})
    @Warmup(2000)
    public static void run() { check(A, B, D, 129, 1.0f); }

    @DontCompile
    static float block(float[] a, int offset, int lanes, boolean cast, long mask) {
        float sum = 0.0f;
        for (int i = 0; i < lanes; i++) if ((mask & (1L << i)) != 0) sum += cast ? (float)(int)a[offset + i] : a[offset + i];
        return sum;
    }
    @DontCompile
    static float reference(float[] a, int length, float seed, int lanes, boolean cast, long mask, boolean tail) {
        int i = 0;
        for (; i + lanes <= length; i += lanes) seed += block(a, i, lanes, cast, mask);
        if (tail) for (; i < length; i++) seed += cast ? (float)(int)a[i] : a[i];
        return seed;
    }
    static void equal(float got, float want) {
        if (Float.isNaN(want) ? !Float.isNaN(got) : Float.floatToRawIntBits(got) != Float.floatToRawIntBits(want))
            throw new AssertionError("float result " + got + " expected " + want);
        checks++;
    }
    @DontCompile
    static void check(float[] a, float[] b, double[] d, int length, float seed) {
        equal(carried128(a,length,seed), reference(a,length,seed,4,true,-1,true));
        equal(carried64(a,length,seed), reference(a,length,seed,2,true,-1,true));
        equal(carried256(a,length,seed), reference(a,length,seed,8,true,-1,true));
        equal(carried512(a,length,seed), reference(a,length,seed,16,true,-1,true));
        equal(twoAccumulators(a,b,length,seed,-seed), reference(a,length,seed,4,true,-1,true) + reference(b,length,-seed,4,true,-1,true));
        equal(strictScalar(a,length,seed), reference(a,length,seed,1,true,-1,true));
        equal(plainReduction(a,length,seed), reference(a,length,seed,4,false,-1,true));
        equal(masked(a,length,seed,5), reference(a,length,seed,4,true,5,false));
        Arrays.fill(OUT,Float.NaN);independent(a,OUT,length,seed);
        for (int i = 0; i < length/4; i++) equal(OUT[i],seed+block(a,4*i,4,true,-1));
        for (int i = length/4; i < OUT.length; i++) if (!Float.isNaN(OUT[i])) throw new AssertionError("independent tail overwritten");
        Arrays.fill(OUT,Float.NaN);equal(sharedVector(a,OUT,length,seed),reference(a,length,seed,4,true,-1,true));
        for (int i = 0; i < (length&~3); i++) equal(OUT[i],(float)(int)a[i]);
        for (int i = length&~3; i < OUT.length; i++) if (!Float.isNaN(OUT[i])) throw new AssertionError("shared tail overwritten");
        double want = seed;
        int i = 0;
        for (; i+2 <= length; i+=2) want += (0.0+d[i])+d[i+1];
        for (; i < length; i++) want += d[i];
        double got=double128(d,length,seed);
        if (Double.isNaN(want) ? !Double.isNaN(got) : Double.doubleToRawLongBits(got)!=Double.doubleToRawLongBits(want)) throw new AssertionError("double result");
        checks++;
    }
    static void semanticCases() {
        int[] bits={0,0x80000000,1,0x80000001,0x007fffff,0x00800000,0x3f7fffff,0xbf7fffff,0x3fc00000,0xbfc00000,0x4b800000,0xcb800000,0x4effffff,0x4f000000,0x4f000001,0xceffffff,0xcf000000,0xcf000001,0x7f7fffff,0xff7fffff,0x7f800000,0xff800000,0x7fc12345,0xffc12345,0x7f812345,0xff812345};
        float[] seeds={0.0f,-0.0f,1,-1,16777216,-16777216,Float.POSITIVE_INFINITY,Float.NEGATIVE_INFINITY,Float.NaN};
        int[] lengths={0,1,2,3,4,5,7,8,9,15,16,17,31,32,33,64,65,127,128,129,255,256,257};
        Random random=new Random(0xF214);
        float[] a=new float[257],b=new float[257];double[] d=new double[257];
        a[0]=16777216.0f; a[16]=1.0f; a[32]=-16777216.0f;
        b[0]=-16777216.0f; b[16]=1.0f; b[32]=16777216.0f;
        for(int i=0;i<a.length;i++) d[i]=a[i];
        check(a,b,d,49,0.0f); // Outer reassociation would change the float result.
        // At most one exceptional/large value per 16 lanes makes each lane
        // reduction order-independent. Small full vectors are exact quarters.
        // Large/small/large blocks still expose illegal outer reassociation.
        for (int round=0;round<32;round++) {
            Arrays.fill(a,0);Arrays.fill(b,0);
            if ((round&1)==0) {
                for (int i=0;i<a.length;i+=16) {a[i]=Float.intBitsToFloat(bits[(round+i/16)%bits.length]);b[i]=Float.intBitsToFloat(bits[(round+i/16+7)%bits.length]);}
            } else for(int i=0;i<a.length;i++){a[i]=(random.nextInt(2048)-1024)/4.0f;b[i]=(random.nextInt(2048)-1024)/4.0f;}
            for(int i=0;i<a.length;i++)d[i]=a[i];
            float[] beforeA=a.clone(),beforeB=b.clone();
            for(int length:lengths)for(float seed:seeds)check(a,b,d,length,seed);
            for(int i=0;i<a.length;i++)if(Float.floatToRawIntBits(a[i])!=Float.floatToRawIntBits(beforeA[i])||Float.floatToRawIntBits(b[i])!=Float.floatToRawIntBits(beforeB[i]))throw new AssertionError("source mutated");
        }
    }
}
