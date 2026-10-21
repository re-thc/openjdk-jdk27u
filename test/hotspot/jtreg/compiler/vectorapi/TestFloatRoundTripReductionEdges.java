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
import java.util.*;
import compiler.lib.ir_framework.*;
import jdk.incubator.vector.*;
import jdk.test.whitebox.WhiteBox;

/*
 * @test
 * @summary Shared intermediates and permitted lane trees preserve strict outer order
 * @modules jdk.incubator.vector
 * @library /test/lib /
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:. -Xint compiler.vectorapi.TestFloatRoundTripReductionEdges semantics 0
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 compiler.vectorapi.TestFloatRoundTripReductionEdges semantics 1
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:. -Xbatch -XX:-TieredCompilation compiler.vectorapi.TestFloatRoundTripReductionEdges semantics 4
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:. -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100000000 compiler.vectorapi.TestFloatRoundTripReductionEdges cold 0
 * @run driver compiler.vectorapi.TestFloatRoundTripReductionEdges
 */
public class TestFloatRoundTripReductionEdges {
    static final VectorSpecies<Float> F4 = FloatVector.SPECIES_128;
    static final VectorSpecies<Integer> I4 = IntVector.SPECIES_128;
    static final float[] A = new float[257];
    static final float[] OUT = new float[257];
    static final int[] INTS = new int[257];
    static volatile float sink;
    static long checks;
    static int warmIndex;

    @ForceInline
    static FloatVector roundTrip(FloatVector v) {
        return (FloatVector)((IntVector)v.convertShape(VectorOperators.F2I, I4, 0))
                .convertShape(VectorOperators.I2F, F4, 0);
    }

    @Test
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"})
    public static float sharedInt(float[] a, int[] out, int length, float sum) {
        for (int i = 0; i < F4.loopBound(length); i += 4) {
            IntVector v = (IntVector)FloatVector.fromArray(F4, a, i).convertShape(VectorOperators.F2I, I4, 0);
            v.intoArray(out, i);
            sum += ((FloatVector)v.convertShape(VectorOperators.I2F, F4, 0)).reduceLanes(VectorOperators.ADD);
        }
        return sum;
    }

    @Test
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"})
    public static float sharedReduction(float[] a, float[] out, int length, float sum) {
        for (int i = 0; i < F4.loopBound(length); i += 4) {
            float reduced = roundTrip(FloatVector.fromArray(F4, a, i)).reduceLanes(VectorOperators.ADD);
            out[i / 4] = reduced;
            sum += reduced;
        }
        return sum;
    }

    @Test
    @IR(counts={"convF2I2F_reduce_acc4F_neon",">=1"}, phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"}, applyIfAnd={"UseSVE","0","MaxVectorSize",">=16"})
    @IR(counts={"convF2I2F_reduce_acc4F_neon",">=1"}, phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"}, applyIfAnd={"UseSVE",">0","MaxVectorSize","16"})
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"}, applyIfAnd={"UseSVE",">0","MaxVectorSize",">16"})
    public static float reversed(float[] a, int length, float sum) {
        for (int i = 0; i < F4.loopBound(length); i += 4) {
            sum = roundTrip(FloatVector.fromArray(F4, a, i)).reduceLanes(VectorOperators.ADD) + sum;
        }
        return sum;
    }

    @Test
    @IR(counts={"VectorLongToMask|VectorLoadMask|VectorMaskGen|VectorBlend",">=1"},
        phase=CompilePhase.PRINT_IDEAL, applyIfCPUFeatureOr={"asimd","true","sse2","true"},
        applyIf={"MaxVectorSize",">=16"})
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"})
    public static float runtimeMasked(float[] a, int length, float sum, long maskBits) {
        var mask = VectorMask.fromLong(F4, maskBits);
        for (int i = 0; i < F4.loopBound(length); i += 4) {
            sum += roundTrip(FloatVector.fromArray(F4, a, i)).reduceLanes(VectorOperators.ADD, mask);
        }
        return sum;
    }

    // The constant mask can disappear. No exclusion assertion is made here.
    @Test
    public static float allTrueMask(float[] a, int length, float sum) {
        var mask = VectorMask.fromLong(F4, -1);
        for (int i = 0; i < F4.loopBound(length); i += 4) {
            sum += roundTrip(FloatVector.fromArray(F4, a, i)).reduceLanes(VectorOperators.ADD, mask);
        }
        return sum;
    }

    @Test
    @IR(failOn={"convF2I2F_reduce_acc4F_neon"}, phase=CompilePhase.MATCHING,
        applyIfPlatform={"aarch64","true"})
    public static float plainMixed(float[] a, int length, float sum) {
        for (int i = 0; i < F4.loopBound(length); i += 4) {
            sum += FloatVector.fromArray(F4, a, i).reduceLanes(VectorOperators.ADD);
        }
        return sum;
    }

    @Run(test={"sharedInt","sharedReduction","reversed","runtimeMasked","allTrueMask","plainMixed"})
    @Warmup(2000)
    public static void run(RunInfo info) {
        for (int i = 0; i < A.length; i++) A[i] = i % 7 - 3;
        if (info.isWarmUp()) {
            check(A, new int[]{0, 4, 8, 12, 20}[warmIndex++ % 5], 1, (warmIndex & 1) == 0 ? 5 : 15);
        } else {
            // Check exceptional inputs after forced C2 compilation and verify residency.
            cases();
            verifyLevels(WhiteBox.getWhiteBox(), 4, "ir-after-cases");
        }
    }

    @DontCompile
    static int bits(float value) {
        return Float.floatToIntBits(value); // NaN payloads are not promised by ADD.
    }

    @DontCompile
    static Set<Integer> trees(float[] lanes, int mask, Map<Integer, Set<Integer>> memo) {
        if (memo.containsKey(mask)) return memo.get(mask);
        Set<Integer> result = new HashSet<>();
        if (Integer.bitCount(mask) == 1) {
            result.add(bits(lanes[Integer.numberOfTrailingZeros(mask)]));
        } else {
            for (int left = (mask - 1) & mask; left != 0; left = (left - 1) & mask) {
                int right = mask ^ left;
                if (right == 0) continue;
                for (int x : trees(lanes, left, memo)) for (int y : trees(lanes, right, memo)) {
                    result.add(bits(Float.intBitsToFloat(x) + Float.intBitsToFloat(y)));
                }
            }
        }
        memo.put(mask, result);
        return result;
    }

    @DontCompile
    static Set<Integer> laneResults(float[] a, int offset, boolean cast, long mask) {
        float[] lanes = new float[Long.bitCount(mask & 15)];
        int index = 0;
        for (int i = 0; i < 4; i++) if ((mask & (1L << i)) != 0) {
            lanes[index++] = cast ? (float)(int)a[offset + i] : a[offset + i];
        }
        if (lanes.length == 0) return Set.of(bits(0.0f));
        Set<Integer> result = new HashSet<>(trees(lanes, (1 << lanes.length) - 1, new HashMap<>()));
        // Include the scalar fallback's identity leaf. Lane-only reductions are also allowed.
        lanes = Arrays.copyOf(lanes, lanes.length + 1);
        result.addAll(trees(lanes, (1 << lanes.length) - 1, new HashMap<>()));
        return result;
    }

    @DontCompile
    static Set<Integer> outerResults(float[] a, int length, float seed, boolean cast, long mask) {
        Set<Integer> states = Set.of(bits(seed));
        for (int i = 0; i < F4.loopBound(length); i += 4) {
            Set<Integer> next = new HashSet<>();
            for (int previous : states) for (int lane : laneResults(a, i, cast, mask)) {
                // Never put the incoming scalar into a lane tree or change block order.
                next.add(bits(Float.intBitsToFloat(previous) + Float.intBitsToFloat(lane)));
            }
            if (next.size() > 4096) throw new AssertionError("Oracle state budget exceeded");
            states = next;
        }
        return states;
    }

    @DontCompile
    static void member(float got, Set<Integer> allowed) {
        if (!allowed.contains(bits(got))) throw new AssertionError("Result " + got + " outside " + allowed);
        checks++;
    }

    @DontCompile
    static void check(float[] a, int length, float seed, long mask) {
        Set<Integer> cast = outerResults(a, length, seed, true, 15);
        Arrays.fill(INTS, 0x12345678);
        member(sharedInt(a, INTS, length, seed), cast);
        for (int i = 0; i < F4.loopBound(length); i++) {
            if (INTS[i] != (int)a[i]) throw new AssertionError("Shared int lane " + i);
            checks++;
        }
        for (int i = F4.loopBound(length); i < INTS.length; i++) {
            if (INTS[i] != 0x12345678) throw new AssertionError("Shared int tail " + i);
        }
        Arrays.fill(OUT, Float.NaN);
        member(sharedReduction(a, OUT, length, seed), cast);
        for (int i = 0; i < length / 4; i++) member(OUT[i], laneResults(a, i * 4, true, 15));
        for (int i = length / 4; i < OUT.length; i++) {
            if (!Float.isNaN(OUT[i])) throw new AssertionError("Shared reduction tail " + i);
        }
        member(reversed(a, length, seed), cast);
        member(allTrueMask(a, length, seed), cast);
        member(runtimeMasked(a, length, seed, mask), outerResults(a, length, seed, true, mask));
        member(plainMixed(a, length, seed), outerResults(a, length, seed, false, 15));
    }

    static void cases() {
        float qnan = Float.intBitsToFloat(0x7fc12345);
        float snan = Float.intBitsToFloat(0xff812345);
        float[][] vectors = {
            {0x1p25f, 1, -0x1p25f, 1}, {Float.POSITIVE_INFINITY, Float.NEGATIVE_INFINITY, qnan, -0.0f},
            {Float.MAX_VALUE, -Float.MAX_VALUE, 0x1p-149f, -0x1p-149f}, {snan, -0.0f, 0.0f, 3},
            {0x1.fffffep30f, 0x1p31f, -0x1p31f, 1}, {16777216, 1, -16777216, -1}
        };
        float[] seeds = {0.0f, -0.0f, 1, -1, 16777216, -16777216,
                         Float.POSITIVE_INFINITY, Float.NEGATIVE_INFINITY, qnan};
        for (int round = 0; round < 24; round++) {
            float[] a = new float[17];
            for (int block = 0; block < 4; block++) for (int lane = 0; lane < 4; lane++) {
                a[block * 4 + lane] = vectors[(round + block) % vectors.length][(lane + round / 6) & 3];
            }
            int[] original = new int[a.length];
            for (int i = 0; i < a.length; i++) original[i] = Float.floatToRawIntBits(a[i]);
            for (int length : new int[]{0, 1, 3, 4, 5, 7, 8, 9, 12, 13, 16, 17}) {
                for (float seed : seeds) check(a, length, seed, (round & 1) == 0 ? 5 : 15);
            }
            for (int i = 0; i < a.length; i++) {
                if (Float.floatToRawIntBits(a[i]) != original[i]) throw new AssertionError("Source mutated");
            }
        }
        float[] order = new float[12];
        order[0] = 16777216; order[4] = 1; order[8] = -16777216;
        Set<Integer> allowed = outerResults(order, 12, 0, true, 15);
        if (!allowed.equals(Set.of(bits(0.0f)))) throw new AssertionError("Outer-order oracle too broad");
        check(order, 12, 0, 5);
    }

    public static void main(String[] args) throws Exception {
        if (args.length == 0) {
            TestFramework.runWithFlags("--add-modules=jdk.incubator.vector");
            return;
        }
        int required = Integer.parseInt(args[1]);
        WhiteBox wb = WhiteBox.getWhiteBox();
        wb.testSetForceInlineMethod(TestFloatRoundTripReductionEdges.class.getDeclaredMethod("roundTrip", FloatVector.class), true);
        for (Method method : TestFloatRoundTripReductionEdges.class.getDeclaredMethods()) {
            if (method.isAnnotationPresent(Test.class)) wb.testSetDontInlineMethod(method, true);
            if (method.isAnnotationPresent(DontCompile.class)) {
                wb.makeMethodNotCompilable(method, -1, false);
                wb.makeMethodNotCompilable(method, -1, true);
            }
        }
        for (int i = 0; i < A.length; i++) A[i] = i % 7 - 3;
        if (required != 0) for (int i = 0; i < 21000; i++) {
            int length = new int[]{0, 4, 8, 12, 20}[i % 5];
            sink = sharedInt(A, INTS, length, 1) + sharedReduction(A, OUT, length, 1)
                    + reversed(A, length, 1) + runtimeMasked(A, length, 1, i % 3 == 0 ? 15 : 5)
                    + allTrueMask(A, length, 1) + plainMixed(A, length, 1);
        }
        verifyLevels(wb, required, "before");
        cases();
        verifyLevels(wb, required, "after");
        System.out.println("ROUNDTRIP_EDGES_PASS mode=" + args[0] + " six_targets_level=" + required + " checks=" + checks);
    }

    static void verifyLevels(WhiteBox wb, int required, String phase) {
        for (Method method : TestFloatRoundTripReductionEdges.class.getDeclaredMethods()) {
            if (method.isAnnotationPresent(Test.class)) {
                int actual = wb.getMethodCompilationLevel(method, false);
                if (actual != required) throw new AssertionError(method + " " + phase + " level " + actual);
                System.out.println("EDGE_TIER method=" + method.getName() + " phase=" + phase + " actual=" + actual);
            }
        }
    }
}
