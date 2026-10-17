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

import java.util.Arrays;
import compiler.lib.ir_framework.*;

/*
 * @test
 * @bug 8392077
 * @summary Force profitable strict reduction IR controls while preserving scalar order
 * @modules jdk.incubator.vector
 * @library /test/lib /
 * @run driver compiler.vectorapi.TestZeroSeedFPReductionStrictIR
 */
public class TestZeroSeedFPReductionStrictIR {
    static final float[] F = new float[1024];
    static final double[] D = new double[1024];
    static long checks;
    static {
        for (int i = 0; i < F.length; i++) {
            F[i] = (i % 7) - 3;
            D[i] = F[i];
        }
    }

    public static void main(String[] args) {
        // This override exercises legal strict lowering, independently of the
        // production cost model. It is confined to this IR-control Test VM.
        TestFramework.runWithFlags("--add-modules=jdk.incubator.vector",
            "-XX:+UnlockDiagnosticVMOptions",
            "-XX:AutoVectorizationOverrideProfitability=2",
            "-XX:CompileCommand=exclude,compiler.vectorapi.TestZeroSeedFPReductionStrictIR::scalarFloatOracle",
            "-XX:CompileCommand=exclude,compiler.vectorapi.TestZeroSeedFPReductionStrictIR::scalarDoubleOracle");
    }

    @Test
    @IR(counts={IRNode.ADD_REDUCTION_VF,">=1","requires_strict_order",">=1"},
        failOn={"no_strict_order"},phase=CompilePhase.PRINT_IDEAL,
        applyIfPlatform={"aarch64","true"},
        applyIfAnd={"UseSVE",">0","SuperWordReductions","true","UseSuperWord","true",
                    "AutoVectorizationOverrideProfitability","2"})
    @IR(counts={"reduce_addF_sve",">=1"},
        failOn={"reduce_non_strict_order_add[24]F_neon","reduce_addFHF_masked"},
        phase=CompilePhase.MATCHING,applyIfPlatform={"aarch64","true"},
        applyIfAnd={"UseSVE",">0","MaxVectorSize","16"})
    // Larger SVE may still have a partial reduction when the unroll factor
    // limits its input width. Both forms below use ordered SVE FADDA.
    @IR(counts={"reduce_addF_sve|reduce_addFHF_masked",">=1"},
        failOn={"reduce_non_strict_order_add[24]F_neon"},
        phase=CompilePhase.MATCHING,applyIfPlatform={"aarch64","true"},
        applyIfAnd={"UseSVE",">0","MaxVectorSize",">16"})
    @IR(counts={IRNode.ADD_REDUCTION_VF,">=1","requires_strict_order",">=1"},
        failOn={"no_strict_order"},phase=CompilePhase.PRINT_IDEAL,
        applyIfPlatform={"x64","true"},
        applyIfAnd={"SuperWordReductions","true","UseSuperWord","true",
                    "AutoVectorizationOverrideProfitability","2","MaxVectorSize",">=8"})
    @IR(counts={IRNode.ADD_F,">=1"},
        failOn={IRNode.ADD_REDUCTION_VF,"no_strict_order"},phase=CompilePhase.PRINT_IDEAL,
        applyIfPlatform={"aarch64","true"},applyIf={"UseSVE","0"})
    @IR(failOn={"reduce_non_strict_order_add[24]F_neon"},phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"},applyIf={"UseSVE","0"})
    public static float strictFloat(float seed) {
        for (int i = 0; i < F.length; i++) seed += F[i];
        return seed;
    }

    @Test
    @IR(counts={IRNode.ADD_REDUCTION_VD,">=1","requires_strict_order",">=1"},
        failOn={"no_strict_order"},phase=CompilePhase.PRINT_IDEAL,
        applyIfPlatform={"aarch64","true"},
        applyIfAnd={"UseSVE",">0","SuperWordReductions","true","UseSuperWord","true",
                    "AutoVectorizationOverrideProfitability","2"})
    @IR(counts={"reduce_addD_sve",">=1"},
        failOn={"reduce_non_strict_order_add2D_neon","reduce_addD_masked"},
        phase=CompilePhase.MATCHING,applyIfPlatform={"aarch64","true"},
        applyIfAnd={"UseSVE",">0","MaxVectorSize","16"})
    @IR(counts={"reduce_addD_sve|reduce_addD_masked",">=1"},
        failOn={"reduce_non_strict_order_add2D_neon"},
        phase=CompilePhase.MATCHING,applyIfPlatform={"aarch64","true"},
        applyIfAnd={"UseSVE",">0","MaxVectorSize",">16"})
    @IR(counts={IRNode.ADD_REDUCTION_VD,">=1","requires_strict_order",">=1"},
        failOn={"no_strict_order"},phase=CompilePhase.PRINT_IDEAL,
        applyIfPlatform={"x64","true"},
        applyIfAnd={"SuperWordReductions","true","UseSuperWord","true",
                    "AutoVectorizationOverrideProfitability","2","MaxVectorSize",">=16"})
    @IR(counts={IRNode.ADD_D,">=1"},
        failOn={IRNode.ADD_REDUCTION_VD,"no_strict_order"},phase=CompilePhase.PRINT_IDEAL,
        applyIfPlatform={"aarch64","true"},applyIf={"UseSVE","0"})
    @IR(failOn={"reduce_non_strict_order_add2D_neon"},phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"},applyIf={"UseSVE","0"})
    public static double strictDouble(double seed) {
        for (int i = 0; i < D.length; i++) seed += D[i];
        return seed;
    }

    static float scalarFloatOracle(float[] input, float seed) {
        for (int i = 0; i < input.length; i++) seed = seed + input[i];
        return seed;
    }

    static double scalarDoubleOracle(double[] input, double seed) {
        for (int i = 0; i < input.length; i++) seed = seed + input[i];
        return seed;
    }

    static void check(float fseed, double dseed) {
        float actualF = strictFloat(fseed);
        float expectedF = scalarFloatOracle(F, fseed);
        double actualD = strictDouble(dseed);
        double expectedD = scalarDoubleOracle(D, dseed);
        checks += 2;
        // NaN payloads are unspecified; signed zero and finite results are exact.
        if (Float.floatToIntBits(actualF) != Float.floatToIntBits(expectedF)
                || Double.doubleToLongBits(actualD) != Double.doubleToLongBits(expectedD)) {
            throw new AssertionError("strict scalar order: float " + actualF + " != " + expectedF
                + ", double " + actualD + " != " + expectedD);
        }
    }

    @Run(test={"strictFloat","strictDouble"})
    public static void run(RunInfo info) {
        check(2.5f, 2.5);
        if (info.isWarmUp()) return;
        float[] fvalues = {+0.0f, -0.0f, Float.POSITIVE_INFINITY, Float.NEGATIVE_INFINITY,
                           Float.intBitsToFloat(0x7fc12345), Float.intBitsToFloat(0xffc12345),
                           Float.intBitsToFloat(0x7f812345)};
        double[] dvalues = {+0.0, -0.0, Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY,
                            Double.longBitsToDouble(0x7ff8123456789abcL),
                            Double.longBitsToDouble(0xfff8123456789abcL),
                            Double.longBitsToDouble(0x7ff0123456789abcL)};
        for (int i = 0; i < fvalues.length; i++) {
            Arrays.fill(F, fvalues[i]);
            Arrays.fill(D, dvalues[i]);
            for (int j = 0; j < fvalues.length; j++) check(fvalues[j], dvalues[j]);
        }
        Arrays.fill(F, 0.0f);
        Arrays.fill(D, 0.0);
        F[0] = -0x1p25f; F[1] = 1.0f;
        D[0] = -0x1p54; D[1] = 1.0;
        check(0x1p25f, 0x1p54);
        if (strictFloat(0x1p25f) != 1.0f || strictDouble(0x1p54) != 1.0) {
            throw new AssertionError("ordered cancellation witness");
        }
        System.out.println("STRICT_REDUCTION_CONTROL_PASS checks=" + checks);
    }
}
