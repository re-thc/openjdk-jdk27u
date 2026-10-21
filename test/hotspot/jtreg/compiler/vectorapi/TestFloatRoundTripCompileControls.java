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
package compiler.vectorapi;

import java.lang.reflect.Method;
import compiler.lib.ir_framework.ForceInline;
import jdk.incubator.vector.*;
import jdk.test.whitebox.WhiteBox;

/*
 * @test
 * @summary Bounded C2 compilation of long recurrences and explicit OSR exclusion
 * @requires vm.compiler2.enabled
 * @modules jdk.incubator.vector
 * @library /test/lib /
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:. -XX:-TieredCompilation compiler.vectorapi.TestFloatRoundTripCompileControls chains
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:. -XX:-TieredCompilation compiler.vectorapi.TestFloatRoundTripCompileControls osr
 */
public class TestFloatRoundTripCompileControls {
    static final VectorSpecies<Float> F4 = FloatVector.SPECIES_128;
    static final VectorSpecies<Integer> I4 = IntVector.SPECIES_128;
    static final float[] A = new float[1024];
    static volatile float sink;
    // Bytecode index of the loop header in osrNegative.
    static final int OSR_BCI = 2;
    static { for (int i = 0; i < A.length; i++) A[i] = i % 7 - 3; }

    @ForceInline
    static float block(float[] a, int index) {
        IntVector v = (IntVector)FloatVector.fromArray(F4, a, index).convertShape(VectorOperators.F2I, I4, 0);
        return ((FloatVector)v.convertShape(VectorOperators.I2F, F4, 0)).reduceLanes(VectorOperators.ADD);
    }

    public static float osrNegative(float[] a, int count, float sum) {
        for (int i = 0; i < count; i++) sum += block(a, (i & 63) * 4);
        return sum;
    }

    public static float chain1(float[] a, float sum) {
        for (int i = 0; i <= a.length - 4; i += 4) {
            sum += block(a, i + 0);
        }
        return sum;
    }

    public static float chain8(float[] a, float sum) {
        for (int i = 0; i <= a.length - 32; i += 32) {
            sum += block(a, i + 0);
            sum += block(a, i + 4);
            sum += block(a, i + 8);
            sum += block(a, i + 12);
            sum += block(a, i + 16);
            sum += block(a, i + 20);
            sum += block(a, i + 24);
            sum += block(a, i + 28);
        }
        return sum;
    }

    public static float chain32(float[] a, float sum) {
        for (int i = 0; i <= a.length - 128; i += 128) {
            sum += block(a, i + 0);
            sum += block(a, i + 4);
            sum += block(a, i + 8);
            sum += block(a, i + 12);
            sum += block(a, i + 16);
            sum += block(a, i + 20);
            sum += block(a, i + 24);
            sum += block(a, i + 28);
            sum += block(a, i + 32);
            sum += block(a, i + 36);
            sum += block(a, i + 40);
            sum += block(a, i + 44);
            sum += block(a, i + 48);
            sum += block(a, i + 52);
            sum += block(a, i + 56);
            sum += block(a, i + 60);
            sum += block(a, i + 64);
            sum += block(a, i + 68);
            sum += block(a, i + 72);
            sum += block(a, i + 76);
            sum += block(a, i + 80);
            sum += block(a, i + 84);
            sum += block(a, i + 88);
            sum += block(a, i + 92);
            sum += block(a, i + 96);
            sum += block(a, i + 100);
            sum += block(a, i + 104);
            sum += block(a, i + 108);
            sum += block(a, i + 112);
            sum += block(a, i + 116);
            sum += block(a, i + 120);
            sum += block(a, i + 124);
        }
        return sum;
    }

    public static float chain64(float[] a, float sum) {
        for (int i = 0; i <= a.length - 256; i += 256) {
            sum += block(a, i + 0);
            sum += block(a, i + 4);
            sum += block(a, i + 8);
            sum += block(a, i + 12);
            sum += block(a, i + 16);
            sum += block(a, i + 20);
            sum += block(a, i + 24);
            sum += block(a, i + 28);
            sum += block(a, i + 32);
            sum += block(a, i + 36);
            sum += block(a, i + 40);
            sum += block(a, i + 44);
            sum += block(a, i + 48);
            sum += block(a, i + 52);
            sum += block(a, i + 56);
            sum += block(a, i + 60);
            sum += block(a, i + 64);
            sum += block(a, i + 68);
            sum += block(a, i + 72);
            sum += block(a, i + 76);
            sum += block(a, i + 80);
            sum += block(a, i + 84);
            sum += block(a, i + 88);
            sum += block(a, i + 92);
            sum += block(a, i + 96);
            sum += block(a, i + 100);
            sum += block(a, i + 104);
            sum += block(a, i + 108);
            sum += block(a, i + 112);
            sum += block(a, i + 116);
            sum += block(a, i + 120);
            sum += block(a, i + 124);
            sum += block(a, i + 128);
            sum += block(a, i + 132);
            sum += block(a, i + 136);
            sum += block(a, i + 140);
            sum += block(a, i + 144);
            sum += block(a, i + 148);
            sum += block(a, i + 152);
            sum += block(a, i + 156);
            sum += block(a, i + 160);
            sum += block(a, i + 164);
            sum += block(a, i + 168);
            sum += block(a, i + 172);
            sum += block(a, i + 176);
            sum += block(a, i + 180);
            sum += block(a, i + 184);
            sum += block(a, i + 188);
            sum += block(a, i + 192);
            sum += block(a, i + 196);
            sum += block(a, i + 200);
            sum += block(a, i + 204);
            sum += block(a, i + 208);
            sum += block(a, i + 212);
            sum += block(a, i + 216);
            sum += block(a, i + 220);
            sum += block(a, i + 224);
            sum += block(a, i + 228);
            sum += block(a, i + 232);
            sum += block(a, i + 236);
            sum += block(a, i + 240);
            sum += block(a, i + 244);
            sum += block(a, i + 248);
            sum += block(a, i + 252);
        }
        return sum;
    }

    static void awaitLevel(WhiteBox wb, Method method, boolean osr) throws Exception {
        long deadline = System.nanoTime() + 30_000_000_000L;
        while (wb.getMethodCompilationLevel(method, osr) != 4) {
            if (System.nanoTime() > deadline) throw new AssertionError("C2 installation deadline: " + method);
            Thread.sleep(5);
        }
    }

    static float oracle(int iterations, boolean osr) {
        float sum = 0;
        if (osr) {
            for (int i = 0; i < iterations; i++) {
                float block = 0;
                for (int lane = 0; lane < 4; lane++) block += (float)(int)A[(i & 63) * 4 + lane];
                sum += block;
            }
        } else {
            for (int i = 0; i < A.length; i++) sum += (float)(int)A[i];
        }
        return sum;
    }

    public static void main(String[] args) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        // The standalone WB driver does not interpret IR-framework annotations.
        // Force this helper inline so all terms belong to one carried AddF chain.
        Method block = TestFloatRoundTripCompileControls.class.getDeclaredMethod("block", float[].class, int.class);
        wb.testSetForceInlineMethod(block, true);
        Method oracle = TestFloatRoundTripCompileControls.class.getDeclaredMethod("oracle", int.class, boolean.class);
        wb.makeMethodNotCompilable(oracle, -1, false);
        wb.makeMethodNotCompilable(oracle, -1, true);
        for (int i = 0; i < 20; i++) sink = chain1(A, 0);
        if (args[0].equals("osr")) {
            Method method = TestFloatRoundTripCompileControls.class.getDeclaredMethod("osrNegative", float[].class, int.class, float.class);
            wb.testSetDontInlineMethod(method, true);
            for (int i = 0; i < 16; i++) sink = osrNegative(A, 128, 0);
            if (wb.getMethodCompilationLevel(method, false) != 0) throw new AssertionError("Unexpected ordinary entry");
            if (!wb.enqueueMethodForCompilation(method, 4, OSR_BCI)) throw new AssertionError("OSR enqueue rejected");
            awaitLevel(wb, method, true);
            float got = osrNegative(A, 200000, 0);
            if (got != oracle(200000, true)) throw new AssertionError("OSR scalar result");
            if (wb.getMethodCompilationLevel(method, false) != 0 || wb.getMethodCompilationLevel(method, true) != 4)
                throw new AssertionError("OSR isolation lost");
            System.out.println("ROUNDTRIP_OSR_NEGATIVE_PASS ordinary=0 osr=4 bci=" + OSR_BCI);
            return;
        }
        for (int count : new int[]{1, 8, 32, 64}) {
            if (Integer.getInteger("chainLength", count) != count) continue;
            Method method = TestFloatRoundTripCompileControls.class.getDeclaredMethod("chain" + count, float[].class, float.class);
            // Populate profiles before explicitly requesting C2 compilation.
            for (int i = 0; i < 20; i++) sink = (float)method.invoke(null, A, 0.0f);
            for (int round = 0; round < 1; round++) {
                if (wb.getMethodCompilationLevel(method, false) != 0) throw new AssertionError("Unexpected pre-existing ordinary entry");
                long start = System.nanoTime();
                if (!wb.enqueueMethodForCompilation(method, 4)) throw new AssertionError("Chain enqueue rejected");
                awaitLevel(wb, method, false);
                long elapsed = System.nanoTime() - start;
                float got = (float)method.invoke(null, A, 0.0f);
                if (got != oracle(0, false) || wb.getMethodCompilationLevel(method, false) != 4)
                    throw new AssertionError("Chain result or actual ordinary C2");
                System.out.println("ROUNDTRIP_CHAIN count=" + count + " round=" + round
                        + " enqueue_to_install_ns=" + elapsed + " actual=4");
            }
        }
        System.out.println("ROUNDTRIP_CHAIN_PASS bound=64 rounds=1; native driver uses fresh JVMs for repetitions");
    }
}
