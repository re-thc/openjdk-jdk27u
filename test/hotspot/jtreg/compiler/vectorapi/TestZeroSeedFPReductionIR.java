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

import compiler.lib.ir_framework.*;
import jdk.incubator.vector.*;

/*
 * @test
 * @bug 8392077
 * @summary Verify zero-seed non-strict reductions and strict/wide controls
 * @modules jdk.incubator.vector
 * @library /test/lib /
 * @run driver compiler.vectorapi.TestZeroSeedFPReductionIR
 */
public class TestZeroSeedFPReductionIR {
    static final float[] F = new float[1024];
    static final double[] D = new double[1024];
    static {
        for(int i=0;i<1024;i++){F[i]=(i%7)-3;D[i]=F[i];}
    }
    public static void main(String[] args) { TestFramework.runWithFlags("--add-modules=jdk.incubator.vector"); }

    // SVE partial reductions receive an explicit generated mask. The narrow
    // NEON rules only apply to unpredicated inputs: SVE disabled, or a species
    // whose size equals the native vector size. Masked SVE retains its scalar
    // identity seed and does not exercise the zero-seed NEON optimization.
    @Test
    @IR(counts={IRNode.ADD_REDUCTION_VF,">=1","no_strict_order",">=1"},
        failOn={"requires_strict_order"},phase=CompilePhase.PRINT_IDEAL,
        applyIfCPUFeatureOr={"asimd","true","sse2","true"},applyIf={"MaxVectorSize",">=8"})
    @IR(counts={"reduce_non_strict_order_add2F_neon",">=1"},
        failOn={"reduce_addFHF_masked"},phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"},applyIfAnd={"UseSVE","0","MaxVectorSize",">=8"})
    @IR(counts={"reduce_addFHF_masked",">=1","vmask_gen_imm",">=1"},
        failOn={"reduce_non_strict_order_add2F_neon"},phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"},applyIfAnd={"UseSVE",">0","MaxVectorSize",">8"})
    public static float float64() { return FloatVector.fromArray(FloatVector.SPECIES_64,F,0).reduceLanes(VectorOperators.ADD); }

    @Test
    @IR(counts={IRNode.ADD_REDUCTION_VF,">=1","no_strict_order",">=1"},
        failOn={"requires_strict_order"},phase=CompilePhase.PRINT_IDEAL,
        applyIfCPUFeatureOr={"asimd","true","sse2","true"},applyIf={"MaxVectorSize",">=16"})
    @IR(counts={"reduce_non_strict_order_add4F_neon",">=1"},
        failOn={"reduce_addFHF_masked"},phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"},applyIfAnd={"UseSVE","0","MaxVectorSize",">=16"})
    @IR(counts={"reduce_non_strict_order_add4F_neon",">=1"},
        failOn={"reduce_addFHF_masked"},phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"},applyIfAnd={"UseSVE",">0","MaxVectorSize","16"})
    @IR(counts={"reduce_addFHF_masked",">=1","vmask_gen_imm",">=1"},
        failOn={"reduce_non_strict_order_add4F_neon"},phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"},applyIfAnd={"UseSVE",">0","MaxVectorSize",">16"})
    public static float float128() { return FloatVector.fromArray(FloatVector.SPECIES_128,F,0).reduceLanes(VectorOperators.ADD); }

    @Test
    @IR(counts={IRNode.ADD_REDUCTION_VD,">=1","no_strict_order",">=1"},
        failOn={"requires_strict_order"},phase=CompilePhase.PRINT_IDEAL,
        applyIfCPUFeatureOr={"asimd","true","sse2","true"},applyIf={"MaxVectorSize",">=16"})
    @IR(counts={"reduce_non_strict_order_add2D_neon",">=1"},
        failOn={"reduce_addD_masked"},phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"},applyIfAnd={"UseSVE","0","MaxVectorSize",">=16"})
    @IR(counts={"reduce_non_strict_order_add2D_neon",">=1"},
        failOn={"reduce_addD_masked"},phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"},applyIfAnd={"UseSVE",">0","MaxVectorSize","16"})
    @IR(counts={"reduce_addD_masked",">=1","vmask_gen_imm",">=1"},
        failOn={"reduce_non_strict_order_add2D_neon"},phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"},applyIfAnd={"UseSVE",">0","MaxVectorSize",">16"})
    public static double double128() { return DoubleVector.fromArray(DoubleVector.SPECIES_128,D,0).reduceLanes(VectorOperators.ADD); }

    @Test
    @IR(counts={IRNode.ADD_REDUCTION_VF,">=1",IRNode.ADD_F,">=1","no_strict_order",">=1"},
        failOn={"requires_strict_order"},phase=CompilePhase.PRINT_IDEAL,
        applyIfCPUFeatureOr={"asimd","true","sse2","true"},applyIf={"MaxVectorSize",">=16"})
    public static float carriedFloat128(float seed) {
        for(int i=0;i<F.length;i+=4)seed+=FloatVector.fromArray(FloatVector.SPECIES_128,F,i).reduceLanes(VectorOperators.ADD);
        return seed;
    }

    @Test
    @IR(counts={IRNode.ADD_REDUCTION_VD,">=1",IRNode.ADD_D,">=1","no_strict_order",">=1"},
        failOn={"requires_strict_order"},phase=CompilePhase.PRINT_IDEAL,
        applyIfCPUFeatureOr={"asimd","true","sse2","true"},applyIf={"MaxVectorSize",">=16"})
    public static double carriedDouble128(double seed) {
        for(int i=0;i<D.length;i+=2)seed+=DoubleVector.fromArray(DoubleVector.SPECIES_128,D,i).reduceLanes(VectorOperators.ADD);
        return seed;
    }

    @Test
    @IR(counts={IRNode.ADD_REDUCTION_VF,">=1","no_strict_order",">=1"},
        failOn={"requires_strict_order"},phase=CompilePhase.PRINT_IDEAL,
        applyIfCPUFeatureOr={"asimd","true","sse2","true"},applyIf={"MaxVectorSize",">=16"})
    public static void independentFloat128(float[] out) {
        for(int i=0;i<F.length;i+=4)out[i/4]=FloatVector.fromArray(FloatVector.SPECIES_128,F,i).reduceLanes(VectorOperators.ADD);
    }

    @Test
    @IR(counts={IRNode.ADD_REDUCTION_VD,">=1","no_strict_order",">=1"},
        failOn={"requires_strict_order"},phase=CompilePhase.PRINT_IDEAL,
        applyIfCPUFeatureOr={"asimd","true","sse2","true"},applyIf={"MaxVectorSize",">=16"})
    public static void independentDouble128(double[] out) {
        for(int i=0;i<D.length;i+=2)out[i/2]=DoubleVector.fromArray(DoubleVector.SPECIES_128,D,i).reduceLanes(VectorOperators.ADD);
    }

    @Test
    @IR(counts={IRNode.ADD_REDUCTION_VF,">=1","no_strict_order",">=1"},
        failOn={"requires_strict_order"},phase=CompilePhase.PRINT_IDEAL,
        applyIfPlatform={"aarch64","true"},applyIfAnd={"UseSVE",">0","MaxVectorSize",">=16"})
    @IR(counts={"reduce_addFHF_masked",">=1"},
        failOn={"reduce_non_strict_order_add4F_neon"},phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"},applyIfAnd={"UseSVE",">0","MaxVectorSize",">=16"})
    public static float maskedFloat128(long mask) {
        return FloatVector.fromArray(FloatVector.SPECIES_128,F,0).reduceLanes(VectorOperators.ADD,VectorMask.fromLong(FloatVector.SPECIES_128,mask));
    }

    @Test
    @IR(counts={IRNode.ADD_REDUCTION_VD,">=1","no_strict_order",">=1"},
        failOn={"requires_strict_order"},phase=CompilePhase.PRINT_IDEAL,
        applyIfPlatform={"aarch64","true"},applyIfAnd={"UseSVE",">0","MaxVectorSize",">=16"})
    @IR(counts={"reduce_addD_masked",">=1"},
        failOn={"reduce_non_strict_order_add2D_neon"},phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"},applyIfAnd={"UseSVE",">0","MaxVectorSize",">=16"})
    public static double maskedDouble128(long mask) {
        return DoubleVector.fromArray(DoubleVector.SPECIES_128,D,0).reduceLanes(VectorOperators.ADD,VectorMask.fromLong(DoubleVector.SPECIES_128,mask));
    }

    @Test
    @IR(counts={IRNode.ADD_REDUCTION_VF,">=1","no_strict_order",">=1"},
        phase=CompilePhase.PRINT_IDEAL,applyIfPlatform={"aarch64","true"},
        applyIfAnd={"UseSVE",">0","MaxVectorSize",">=32"})
    @IR(counts={"reduce_addF_sve",">=1"},
        failOn={"reduce_non_strict_order_add4F_neon","reduce_addFHF_masked"},
        phase=CompilePhase.MATCHING,applyIfPlatform={"aarch64","true"},
        applyIfAnd={"UseSVE",">0","MaxVectorSize","32"})
    @IR(counts={"reduce_addFHF_masked",">=1","vmask_gen_imm",">=1"},
        failOn={"reduce_non_strict_order_add4F_neon","reduce_addF_sve"},
        phase=CompilePhase.MATCHING,applyIfPlatform={"aarch64","true"},
        applyIfAnd={"UseSVE",">0","MaxVectorSize",">32"})
    public static float floatWide256() { return FloatVector.fromArray(FloatVector.SPECIES_256,F,0).reduceLanes(VectorOperators.ADD); }

    @Test
    @IR(counts={IRNode.ADD_REDUCTION_VD,">=1","no_strict_order",">=1"},
        phase=CompilePhase.PRINT_IDEAL,applyIfPlatform={"aarch64","true"},
        applyIfAnd={"UseSVE",">0","MaxVectorSize",">=32"})
    @IR(counts={"reduce_addD_sve",">=1"},
        failOn={"reduce_non_strict_order_add2D_neon","reduce_addD_masked"},
        phase=CompilePhase.MATCHING,applyIfPlatform={"aarch64","true"},
        applyIfAnd={"UseSVE",">0","MaxVectorSize","32"})
    @IR(counts={"reduce_addD_masked",">=1","vmask_gen_imm",">=1"},
        failOn={"reduce_non_strict_order_add2D_neon","reduce_addD_sve"},
        phase=CompilePhase.MATCHING,applyIfPlatform={"aarch64","true"},
        applyIfAnd={"UseSVE",">0","MaxVectorSize",">32"})
    public static double doubleWide256() { return DoubleVector.fromArray(DoubleVector.SPECIES_256,D,0).reduceLanes(VectorOperators.ADD); }

    @Test
    // The default cost model may keep a bare strict sum scalar. Positive
    // strict vector IR controls live in TestZeroSeedFPReductionStrictIR.
    @IR(failOn={"no_strict_order"},phase=CompilePhase.PRINT_IDEAL)
    public static float strictFloat(float seed) { for(int i=0;i<F.length;i++)seed+=F[i];return seed; }

    @Test
    @IR(failOn={"no_strict_order"},phase=CompilePhase.PRINT_IDEAL)
    public static double strictDouble(double seed) { for(int i=0;i<D.length;i++)seed+=D[i];return seed; }

    @Run(test={"float64","float128","double128","maskedFloat128","maskedDouble128",
               "floatWide256","doubleWide256","strictFloat","strictDouble",
               "carriedFloat128","carriedDouble128","independentFloat128","independentDouble128"})
    public static void run() {
        if(float64()!=F[0]+F[1])throw new AssertionError();
        if(float128()!=F[0]+F[1]+F[2]+F[3])throw new AssertionError();
        if(double128()!=D[0]+D[1])throw new AssertionError();
        for(long m:new long[]{0,1,2,3,5,15}) {
            float f=0;for(int i=0;i<4;i++)if((m&(1L<<i))!=0)f+=F[i];
            double d=0;for(int i=0;i<2;i++)if((m&(1L<<i))!=0)d+=D[i];
            if(maskedFloat128(m)!=f || maskedDouble128(m)!=d)throw new AssertionError();
        }
        float f=0;for(int i=0;i<8;i++)f+=F[i];
        double d=0;for(int i=0;i<4;i++)d+=D[i];
        if(floatWide256()!=f || doubleWide256()!=d)throw new AssertionError();
        f=17;d=17;for(int i=0;i<1024;i++){f+=F[i];d+=D[i];}
        if(strictFloat(17)!=f || strictDouble(17)!=d || carriedFloat128(17)!=f || carriedDouble128(17)!=d)throw new AssertionError();
        float[] fo=new float[256];double[] dout=new double[512];
        independentFloat128(fo);independentDouble128(dout);
        for(int i=0;i<fo.length;i++)if(fo[i]!=F[i*4]+F[i*4+1]+F[i*4+2]+F[i*4+3])throw new AssertionError();
        for(int i=0;i<dout.length;i++)if(dout[i]!=D[i*2]+D[i*2+1])throw new AssertionError();
    }
}
