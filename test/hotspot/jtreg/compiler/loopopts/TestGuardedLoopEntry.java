/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Preserve dominating integer guards at counted-loop entry.
 * @requires vm.compiler2.enabled
 * @library /test/lib /
 * @run driver compiler.loopopts.TestGuardedLoopEntry
 */

package compiler.loopopts;

import java.util.Arrays;

import compiler.lib.ir_framework.CompilePhase;
import compiler.lib.ir_framework.DontCompile;
import compiler.lib.ir_framework.IR;
import compiler.lib.ir_framework.IRNode;
import compiler.lib.ir_framework.Run;
import compiler.lib.ir_framework.RunInfo;
import compiler.lib.ir_framework.Test;
import compiler.lib.ir_framework.TestFramework;

public class TestGuardedLoopEntry {
    public static void main(String[] args) {
        // Isolate the existing short-loop policy with its ordinary G1 limits.
        // These flags keep polling enabled; only the proven short loop loses
        // its redundant poll. Disable unrolling so the loop remains visible.
        TestFramework.runWithFlags("-XX:+UseCountedLoopSafepoints",
                                   "-XX:LoopStripMiningIter=1000",
                                   "-XX:LoopStripMiningIterShortLoop=100",
                                   "-XX:LoopUnrollLimit=0", "-XX:LoopMaxUnroll=0");
    }

    // Keep the loop present, with safepoints enabled. The direct guard must
    // supply the small entry interval; there is no min, mask or narrowed IV.
    // CastII presence alone does not identify the new entry cast: existing
    // range-check casts may also be present. The retained-loop/poll checks
    // distinguish the resulting optimization; inspect the cast's type and
    // inputs in the early graph when qualifying the mechanism itself.
    @Test
    @IR(counts = {IRNode.CAST_II, ">=1"}, phase = CompilePhase.AFTER_CLOOPS)
    @IR(counts = {IRNode.COUNTED_LOOP, "1", IRNode.SAFEPOINT, "0"},
        phase = CompilePhase.BEFORE_MATCHING)
    static int guardedRotate(int[] rep, int idx) {
        if (idx < 0 || idx > 2) {
            throw new IllegalArgumentException();
        }
        int offset = rep[idx];
        for (int k = idx; k > 0; k--) {
            rep[k] = rep[k - 1];
        }
        rep[0] = offset;
        return offset;
    }

    // The accepted projection has the opposite source polarity.
    @Test
    @IR(counts = {IRNode.CAST_II, ">=1"}, phase = CompilePhase.AFTER_CLOOPS)
    @IR(counts = {IRNode.COUNTED_LOOP, "1", IRNode.SAFEPOINT, "0"},
        phase = CompilePhase.BEFORE_MATCHING)
    static int acceptedPolarity(int[] rep, int idx) {
        if (idx >= 0 && idx <= 2) {
            int offset = rep[idx];
            for (int k = idx; k > 0; k--) {
                rep[k] = rep[k - 1];
            }
            rep[0] = offset;
            return offset;
        }
        throw new IllegalArgumentException();
    }

    @Test
    static int nonDominating(int[] rep, int idx, boolean check) {
        if (check && (idx < 0 || idx > 2)) {
            throw new IllegalArgumentException();
        }
        int offset = rep[idx];
        for (int k = idx; k > 0; k--) {
            rep[k] = rep[k - 1];
        }
        rep[0] = offset;
        return offset;
    }

    @Test
    static int mergedEntry(int[] rep, int idx, int other, boolean checkedEdge) {
        int start;
        if (checkedEdge) {
            if (idx < 0 || idx > 2) {
                throw new IllegalArgumentException();
            }
            start = idx;
        } else {
            start = other;
        }
        int offset = rep[start];
        for (int k = start; k > 0; k--) {
            rep[k] = rep[k - 1];
        }
        rep[0] = offset;
        return offset;
    }

    @Test
    static int unrelatedValue(int[] rep, int idx, int checked) {
        if (checked < 0 || checked > 2) {
            throw new IllegalArgumentException();
        }
        int offset = rep[idx];
        for (int k = idx; k > 0; k--) {
            rep[k] = rep[k - 1];
        }
        rep[0] = offset;
        return offset;
    }

    // A negative unsigned RHS does not establish a non-negative signed idx.
    @Test
    static int unsignedBound(int[] rep, int idx, int bound) {
        if (Integer.compareUnsigned(idx, bound) > 0) {
            throw new IllegalArgumentException();
        }
        int offset = rep[idx];
        for (int k = idx; k > 0; k--) {
            rep[k] = rep[k - 1];
        }
        rep[0] = offset;
        return offset;
    }

    @Run(test = {"guardedRotate", "acceptedPolarity", "nonDominating",
                 "mergedEntry", "unrelatedValue", "unsignedBound"})
    static void runGuards(RunInfo info) {
        // Both paths of the non-dominating/merged guards are exercised before
        // compilation. idx=5 on the unguarded edge must not acquire [0, 2].
        for (int kind = 0; kind < 6; kind++) {
            for (int idx = 0; idx <= 2; idx++) {
                checkRotate(kind, new int[] {11, 22, 33, 44, 55, 66, 77},
                            idx, 2, true);
                checkRotate(kind, new int[] {11, 22, 33, 44, 55, 66, 77},
                            idx, 5, false);
            }
        }
        checkRotate(2, new int[] {11, 22, 33, 44, 55, 66, 77}, 5, 0, false);
        checkRotate(3, new int[] {11, 22, 33, 44, 55, 66, 77}, 1, 5, false);
        checkRotate(4, new int[] {11, 22, 33, 44, 55, 66, 77}, 5, 1, false);
        checkRotate(5, new int[] {11, 22, 33, 44, 55, 66, 77}, 5, -1, false);
        if (info.isWarmUp()) {
            return;
        }
        int[] indices = {Integer.MIN_VALUE, Integer.MIN_VALUE + 1, -2, -1,
                         0, 1, 2, 3, 5, Integer.MAX_VALUE - 1, Integer.MAX_VALUE};
        int[] bounds = {Integer.MIN_VALUE, -1, 0, 1, 2, 5, Integer.MAX_VALUE};
        for (int kind = 0; kind < 6; kind++) {
            for (int length = -1; length <= 7; length++) {
                int[] rep = initialArray(length, Integer.MIN_VALUE);
                for (int idx : indices) {
                    for (int other : bounds) {
                        checkRotate(kind, rep, idx, other, false);
                        checkRotate(kind, rep, idx, other, true);
                    }
                }
            }
        }
    }

    // No array check can supply a narrower range before these loop entries.
    @Test
    @IR(counts = {IRNode.CAST_II, ">=1"}, phase = CompilePhase.AFTER_CLOOPS)
    @IR(counts = {IRNode.COUNTED_LOOP, "1", IRNode.SAFEPOINT, "0"},
        phase = CompilePhase.BEFORE_MATCHING)
    static long guardedArithmetic(int start) {
        if (start < 0 || start > 2) {
            throw new IllegalArgumentException();
        }
        long hash = 0;
        for (int k = start; k > 0; k--) {
            hash = 31 * hash + k;
        }
        return hash;
    }

    @Test
    @IR(counts = {IRNode.CAST_II, ">=1"}, phase = CompilePhase.AFTER_CLOOPS)
    @IR(counts = {IRNode.COUNTED_LOOP, "1", IRNode.SAFEPOINT, "0"},
        phase = CompilePhase.BEFORE_MATCHING)
    static long unsignedArithmetic(int start) {
        if (Integer.compareUnsigned(start, 2) > 0) {
            throw new IllegalArgumentException();
        }
        long hash = 0;
        for (int k = start; k > 0; k--) {
            hash = 31 * hash + k;
        }
        return hash;
    }

    @Run(test = {"guardedArithmetic", "unsignedArithmetic"})
    static void runArithmetic(RunInfo info) {
        int[] starts = info.isWarmUp() ? new int[] {0, 1, 2}
                                      : new int[] {Integer.MIN_VALUE, -1, 0, 1, 2, 3, Integer.MAX_VALUE};
        for (int start : starts) {
            for (boolean unsigned : new boolean[] {false, true}) {
                Outcome actual;
                try {
                    long value = unsigned ? unsignedArithmetic(start) : guardedArithmetic(start);
                    actual = new Outcome(value, null);
                } catch (RuntimeException e) {
                    actual = exceptionOutcome(e);
                }
                Outcome expected = smallArithmeticReference(start);
                verify("arithmetic " + unsigned + ": " + start, actual, expected, null, null);
            }
        }
    }

    // Constant negative unsigned RHS values must not establish a contiguous
    // nonnegative signed interval. In particular, MIN_VALUE reaches the loop,
    // not an array check. The independent step cap bounds every input.
    @Test
    static long unsignedNegativeBound(int start) {
        if (Integer.compareUnsigned(start, -2) > 0) {
            throw new IllegalArgumentException();
        }
        long hash = 0;
        int steps = 0;
        int k = start;
        for (; k != 0; k--) {
            hash = 31 * hash + k;
            if (++steps == 8) {
                break;
            }
        }
        return hash ^ ((long) k << 32) ^ steps;
    }

    @Test
    static long unsignedSignCrossing(int start) {
        if (Integer.compareUnsigned(start, Integer.MIN_VALUE) > 0) {
            throw new IllegalArgumentException();
        }
        long hash = 0;
        int steps = 0;
        int k = start;
        for (; k != 0; k--) {
            hash = 31 * hash + k;
            if (++steps == 8) {
                break;
            }
        }
        return hash ^ ((long) k << 32) ^ steps;
    }

    // hi==MAX_VALUE is deliberately outside the bounded-entry refinement.
    @Test
    static long unsignedMaxBound(int start) {
        if (Integer.compareUnsigned(start, Integer.MAX_VALUE) > 0) {
            throw new IllegalArgumentException();
        }
        long hash = 0;
        int steps = 0;
        int k = start;
        for (; k != 0; k--) {
            hash = 31 * hash + k;
            if (++steps == 8) {
                break;
            }
        }
        return hash ^ ((long) k << 32) ^ steps;
    }

    @Test
    static long unsignedZeroBound(int start) {
        if (Integer.compareUnsigned(start, 0) > 0) {
            throw new IllegalArgumentException();
        }
        long hash = 0;
        int steps = 0;
        int k = start;
        for (; k != 0; k--) {
            hash = 31 * hash + k;
            if (++steps == 8) {
                break;
            }
        }
        return hash ^ ((long) k << 32) ^ steps;
    }

    @Run(test = {"unsignedNegativeBound", "unsignedSignCrossing",
                 "unsignedMaxBound", "unsignedZeroBound"})
    static void runUnsigned(RunInfo info) {
        int[] starts = info.isWarmUp() ? new int[] {Integer.MIN_VALUE, 0, 1, 2, Integer.MAX_VALUE}
                                      : new int[] {Integer.MIN_VALUE, Integer.MIN_VALUE + 1,
                                                   -2, -1, 0, 1, 2, 3,
                                                   Integer.MAX_VALUE - 1, Integer.MAX_VALUE};
        for (int kind = 0; kind < 4; kind++) {
            for (int start : starts) {
                Outcome actual;
                try {
                    long value = switch (kind) {
                        case 0 -> unsignedNegativeBound(start);
                        case 1 -> unsignedSignCrossing(start);
                        case 2 -> unsignedMaxBound(start);
                        case 3 -> unsignedZeroBound(start);
                        default -> throw new AssertionError(kind);
                    };
                    actual = new Outcome(value, null);
                } catch (RuntimeException e) {
                    actual = exceptionOutcome(e);
                }
                Outcome expected = unsignedReference(kind, start);
                verify("unsigned " + kind + ": " + start, actual, expected, null, null);
            }
        }
    }

    // The accepted unsigned interval crosses the signed boundary. A negative
    // constant RHS must not be mistaken for a small nonnegative upper bound.
    // No array check or secondary induction variable obscures this fallback.
    @Test
    @IR(counts = {IRNode.COUNTED_LOOP, "1", IRNode.SAFEPOINT, "1"},
        phase = CompilePhase.BEFORE_MATCHING)
    static long unsignedNegativeDescending(int start) {
        if (Integer.compareUnsigned(start, Integer.MIN_VALUE + 5) > 0) {
            throw new IllegalArgumentException();
        }
        long hash = 0;
        for (int k = start; k > 0; k--) {
            hash = 31 * hash + k;
        }
        return hash;
    }

    // The loop is on the rejected projection of the small-interval test.
    @Test
    @IR(counts = {IRNode.COUNTED_LOOP, "1", IRNode.SAFEPOINT, "1"},
        phase = CompilePhase.BEFORE_MATCHING)
    static long rejectedProjectionDescending(int start) {
        if (start >= 0 && start <= 2) {
            return -1;
        }
        long hash = 0;
        for (int k = start; k > 0; k--) {
            hash = 31 * hash + k;
        }
        return hash;
    }

    @Run(test = {"unsignedNegativeDescending", "rejectedProjectionDescending"})
    static void runDescendingFallbacks() {
        // Do not add large positive inputs to these uncapped loops. Negative
        // boundary values take zero iterations; the largest positive is five.
        int[] starts = {Integer.MIN_VALUE, Integer.MIN_VALUE + 1,
                        Integer.MIN_VALUE + 4, Integer.MIN_VALUE + 5,
                        Integer.MIN_VALUE + 6, -2, -1, 0, 1, 2, 3, 4, 5};
        for (int start : starts) {
            for (boolean rejectedProjection : new boolean[] {false, true}) {
                Outcome actual;
                try {
                    long value = rejectedProjection ? rejectedProjectionDescending(start)
                                                    : unsignedNegativeDescending(start);
                    actual = new Outcome(value, null);
                } catch (RuntimeException e) {
                    actual = exceptionOutcome(e);
                }
                Outcome expected = descendingFallbackReference(rejectedProjection, start);
                verify("descending fallback " + rejectedProjection + ": " + start,
                       actual, expected, null, null);
            }
        }
    }

    @Test
    static long positiveStride(int start) {
        if (start < 0 || start > 7) {
            throw new IllegalArgumentException();
        }
        long hash = 0;
        for (int k = start; k < 12; k += 2) {
            hash = 31 * hash + k;
        }
        return hash;
    }

    @Test
    static long guardedDoWhile(int start, boolean negativeEntry) {
        if (negativeEntry) {
            // A negative entry still executes the do-while body once. Keep
            // this fallback separate from the nonnegative guarded entry.
            if (start < -2 || start > 0) {
                throw new IllegalArgumentException();
            }
            long hash = 1;
            int k = start;
            do {
                hash = 31 * hash + k;
                k--;
            } while (k > 0);
            return hash;
        }
        if (start < 0 || start > 7) {
            throw new IllegalArgumentException();
        }
        long hash = 1;
        int k = start;
        do {
            hash = 31 * hash + k;
            k--;
        } while (k > 0);
        return hash;
    }

    @Test
    static long nestedBounds(int outer, int inner) {
        if (outer < 0 || outer > 7) {
            throw new IllegalArgumentException();
        }
        long hash = 0;
        for (int i = outer; i > 0; i--) {
            // This guard must not throw when the outer loop has zero trips.
            if (inner < 0 || inner > 5) {
                throw new IllegalArgumentException();
            }
            for (int j = inner; j > 0; j--) {
                hash = 31 * hash + (17 * i + j);
            }
        }
        return hash;
    }

    @Test
    static long largerBound(int start) {
        if (start < 0 || start > 4095) {
            throw new IllegalArgumentException();
        }
        long hash = 0;
        for (int k = start; k > 0; k--) {
            hash = 31 * hash + k;
        }
        return hash;
    }

    @Run(test = {"positiveStride", "guardedDoWhile", "nestedBounds", "largerBound"})
    static void runAdditionalShapes(RunInfo info) {
        // Warm a few bounded entries, not the large range's upper endpoint.
        checkAdditionalShape(0, 0, 0);
        checkAdditionalShape(0, 3, 0);
        checkAdditionalShape(0, 7, 0);
        checkAdditionalShape(1, 0, 0);
        checkAdditionalShape(1, 1, 0);
        checkAdditionalShape(1, 7, 0);
        checkAdditionalShape(1, -2, 1);
        checkAdditionalShape(1, -1, 1);
        checkAdditionalShape(1, 0, 1);
        checkAdditionalShape(2, 0, 6);
        checkAdditionalShape(2, 2, 3);
        checkAdditionalShape(2, 1, 0);
        checkAdditionalShape(3, 0, 0);
        checkAdditionalShape(3, 2, 0);
        checkAdditionalShape(3, 127, 0);
        if (info.isWarmUp()) {
            return;
        }
        for (int start : new int[] {Integer.MIN_VALUE, -1, 0, 1, 2, 3, 7, 8, Integer.MAX_VALUE}) {
            checkAdditionalShape(0, start, 0);
        }
        for (int start : new int[] {Integer.MIN_VALUE, -3, -2, -1, 0, 1, 2, 7, 8, Integer.MAX_VALUE}) {
            checkAdditionalShape(1, start, 0);
            checkAdditionalShape(1, start, 1);
        }
        int[] outers = {Integer.MIN_VALUE, -1, 0, 1, 2, 7, 8, Integer.MAX_VALUE};
        int[] inners = {Integer.MIN_VALUE, -1, 0, 1, 2, 5, 6, Integer.MAX_VALUE};
        for (int outer : outers) {
            for (int inner : inners) {
                checkAdditionalShape(2, outer, inner);
            }
        }
        for (int start : new int[] {Integer.MIN_VALUE, -1, 0, 1, 2, 127, 4095, 4096, Integer.MAX_VALUE}) {
            checkAdditionalShape(3, start, 0);
        }
    }

    // Repeat-offset resolution, including the no-op idx=0 case. Only the
    // corruption exception class is replaced; integer wrap and array-access
    // ordering are retained. Do not prevalidate or pad the three-word state.
    @Test
    @IR(counts = {IRNode.CAST_II, ">=1"}, phase = CompilePhase.AFTER_CLOOPS)
    @IR(counts = {IRNode.COUNTED_LOOP, "1", IRNode.SAFEPOINT, "0"},
        phase = CompilePhase.BEFORE_MATCHING)
    static int repeatStandalone(int[] rep, int offsetValue, int literalLength) {
        if (offsetValue > 3) {
            int offset = offsetValue - 3;
            rep[2] = rep[1];
            rep[1] = rep[0];
            rep[0] = offset;
            return offset;
        }
        int idx = offsetValue - 1;
        if (literalLength == 0) {
            idx++;
        }
        if (idx == 0) {
            return rep[0];
        }
        if (idx == 3) {
            int offset = rep[0] - 1;
            if (offset <= 0) {
                throw new IllegalArgumentException("Invalid repeat offset");
            }
            rep[2] = rep[1];
            rep[1] = rep[0];
            rep[0] = offset;
            return offset;
        }
        if (idx < 0 || idx > 2) {
            throw new IllegalArgumentException("Bad repeat code");
        }
        int offset = rep[idx];
        for (int k = idx; k > 0; k--) {
            rep[k] = rep[k - 1];
        }
        rep[0] = offset;
        return offset;
    }

    // @Test methods cannot inline in the IR framework. This ordinary helper
    // repeats the standalone body so the caller tests normal hot inlining,
    // without any forced-inline annotation or command.
    static int repeatInline(int[] rep, int offsetValue, int literalLength) {
        if (offsetValue > 3) {
            int offset = offsetValue - 3;
            rep[2] = rep[1];
            rep[1] = rep[0];
            rep[0] = offset;
            return offset;
        }
        int idx = offsetValue - 1;
        if (literalLength == 0) {
            idx++;
        }
        if (idx == 0) {
            return rep[0];
        }
        if (idx == 3) {
            int offset = rep[0] - 1;
            if (offset <= 0) {
                throw new IllegalArgumentException("Invalid repeat offset");
            }
            rep[2] = rep[1];
            rep[1] = rep[0];
            rep[0] = offset;
            return offset;
        }
        if (idx < 0 || idx > 2) {
            throw new IllegalArgumentException("Bad repeat code");
        }
        int offset = rep[idx];
        for (int k = idx; k > 0; k--) {
            rep[k] = rep[k - 1];
        }
        rep[0] = offset;
        return offset;
    }

    @Test
    @IR(counts = {IRNode.CAST_II, ">=1"}, phase = CompilePhase.AFTER_CLOOPS)
    @IR(counts = {IRNode.COUNTED_LOOP, "1", IRNode.SAFEPOINT, "0",
                  IRNode.STATIC_CALL_OF_METHOD, "repeatInline", "0"},
        phase = CompilePhase.BEFORE_MATCHING)
    static int repeatHotInline(int[] rep, int offsetValue, int literalLength) {
        return repeatInline(rep, offsetValue, literalLength);
    }

    @Run(test = {"repeatStandalone", "repeatHotInline"})
    static void runRepeat(RunInfo info) {
        for (int code = 0; code <= 6; code++) {
            checkRepeat(false, new int[] {17, 29, 41}, code, 0);
            if (code != 0) {
                checkRepeat(false, new int[] {17, 29, 41}, code, 1);
            }
            checkRepeat(true, new int[] {17, 29, 41}, code, 0);
            if (code != 0) {
                checkRepeat(true, new int[] {17, 29, 41}, code, 1);
            }
        }
        if (info.isWarmUp()) {
            return;
        }
        int[] codes = {Integer.MIN_VALUE, Integer.MIN_VALUE + 1, -2, -1,
                       0, 1, 2, 3, 4, 5, Integer.MAX_VALUE};
        int[] lengths = {Integer.MIN_VALUE, -1, 0, 1, Integer.MAX_VALUE};
        int[] firstValues = {Integer.MIN_VALUE, -1, 0, 1, 2, 17, Integer.MAX_VALUE};
        for (int length = -1; length <= 4; length++) {
            for (int first : firstValues) {
                int[] rep = initialArray(length, first);
                for (int code : codes) {
                    for (int literals : lengths) {
                        checkRepeat(false, rep, code, literals);
                        checkRepeat(true, rep, code, literals);
                    }
                }
            }
        }
    }

    // The emergency iteration cap keeps deliberately overflowing/zero-stride
    // inputs bounded. It does not narrow or replace the tested entry value.
    @Test
    static long strided(int start, int stride) {
        if (start < 0 || start > 2) {
            throw new IllegalArgumentException();
        }
        long hash = 0;
        int steps = 0;
        int k = start;
        for (; k > 0; k += stride) {
            hash = 31 * hash + k;
            if (++steps == 8) {
                break;
            }
        }
        return hash ^ ((long) k << 32) ^ steps;
    }

    @Test
    static long upperOverflow(int start) {
        if (start < Integer.MAX_VALUE - 2) {
            throw new IllegalArgumentException();
        }
        long hash = 0;
        int steps = 0;
        int k = start;
        // At most two iterations: MAX-2 -> MAX -> MIN+1. No step cap
        // supplies an alternative small induction variable to the compiler.
        for (; k > 0; k += 2) {
            hash = 31 * hash + k;
            steps++;
        }
        return hash ^ ((long) k << 32) ^ steps;
    }

    @Test
    static long lowerOverflow(int start) {
        if (start > Integer.MIN_VALUE + 2) {
            throw new IllegalArgumentException();
        }
        long hash = 0;
        int steps = 0;
        int k = start;
        // At most two iterations: MIN+2 -> MIN -> MAX-1.
        for (; k < 0; k -= 2) {
            hash = 31 * hash + k;
            steps++;
        }
        return hash ^ ((long) k << 32) ^ steps;
    }

    @Run(test = {"strided", "upperOverflow", "lowerOverflow"})
    static void runStrides(RunInfo info) {
        int[] starts = {Integer.MIN_VALUE, Integer.MIN_VALUE + 1, Integer.MIN_VALUE + 2,
                        -1, 0, 1, 2, 3, Integer.MAX_VALUE - 2,
                        Integer.MAX_VALUE - 1, Integer.MAX_VALUE};
        int[] strides = {Integer.MIN_VALUE, -3, -2, -1, 0, 1, 2, 3, Integer.MAX_VALUE};
        for (int kind = 0; kind < 3; kind++) {
            if (info.isWarmUp()) {
                int start = kind == 0 ? 2 : kind == 1 ? Integer.MAX_VALUE - 1
                                                     : Integer.MIN_VALUE + 1;
                checkStride(kind, start, kind == 0 ? -1 : kind == 1 ? 2 : -2);
                if (kind == 0) {
                    checkStride(kind, start, 1);
                }
            } else {
                for (int start : starts) {
                    if (kind == 0) {
                        for (int stride : strides) {
                            checkStride(kind, start, stride);
                        }
                    } else {
                        checkStride(kind, start, kind == 1 ? 2 : -2);
                    }
                }
            }
        }
    }

    private record Outcome(long value, Class<?> exception, String message) {
        Outcome(long value, Class<?> exception) {
            this(value, exception, null);
        }
    }

    private static Outcome exceptionOutcome(RuntimeException exception) {
        // Compare the two explicit corruption messages. VM-generated array
        // and null-pointer exception messages may differ after compilation.
        return new Outcome(0, exception.getClass(),
                           exception instanceof IllegalArgumentException ? exception.getMessage() : null);
    }

    private static int[] initialArray(int length, int first) {
        if (length < 0) {
            return null;
        }
        int[] rep = new int[length];
        Arrays.fill(rep, 0x13579bdf);
        if (length > 0) {
            rep[0] = first;
        }
        if (length > 1) {
            rep[1] = 29;
        }
        if (length > 2) {
            rep[2] = 41;
        }
        return rep;
    }

    private static int[] copy(int[] rep) {
        return rep == null ? null : rep.clone();
    }

    @DontCompile
    private static Outcome smallArithmeticReference(int start) {
        return switch (start) {
            case 0 -> new Outcome(0, null);
            case 1 -> new Outcome(1, null);
            case 2 -> new Outcome(63, null);
            default -> new Outcome(0, IllegalArgumentException.class);
        };
    }

    @DontCompile
    private static Outcome unsignedReference(int kind, int start) {
        long bound = switch (kind) {
            case 0 -> 0xffff_fffeL;
            case 1 -> 0x8000_0000L;
            case 2 -> 0x7fff_ffffL;
            case 3 -> 0;
            default -> throw new AssertionError(kind);
        };
        if ((start & 0xffff_ffffL) > bound) {
            return new Outcome(0, IllegalArgumentException.class);
        }
        long current = start;
        long hash = 0;
        int steps = 0;
        while (current != 0 && steps < 8) {
            hash = 31 * hash + current;
            steps++;
            if (steps != 8) {
                current = (int) (current - 1);
            }
        }
        return new Outcome(hash ^ (current << 32) ^ steps, null);
    }

    @DontCompile
    private static Outcome descendingFallbackReference(boolean rejectedProjection, int start) {
        if (rejectedProjection) {
            if (start >= 0 && start <= 2) {
                return new Outcome(-1, null);
            }
        } else if ((start & 0xffff_ffffL) > 0x8000_0005L) {
            return new Outcome(0, IllegalArgumentException.class);
        }
        long hash = 0;
        for (long k = start; k > 0; k--) {
            hash = 31 * hash + k;
        }
        return new Outcome(hash, null);
    }

    private static void checkAdditionalShape(int kind, int start, int other) {
        Outcome actual;
        try {
            long value = switch (kind) {
                case 0 -> positiveStride(start);
                case 1 -> guardedDoWhile(start, other != 0);
                case 2 -> nestedBounds(start, other);
                case 3 -> largerBound(start);
                default -> throw new AssertionError(kind);
            };
            actual = new Outcome(value, null);
        } catch (RuntimeException e) {
            actual = exceptionOutcome(e);
        }
        Outcome expected = additionalShapeReference(kind, start, other);
        verify("additional shape " + kind + ": " + start + ", " + other,
               actual, expected, null, null);
    }

    // Interpret a fixed trip count and reconstruct each value in long rather
    // than repeating the target's int-IV updates or do-while structure.
    @DontCompile
    private static Outcome additionalShapeReference(int kind, int start, int other) {
        try {
            long hash = 0;
            switch (kind) {
                case 0:
                    if (start < 0 || start > 7) {
                        throw new IllegalArgumentException();
                    }
                    long trips = (13L - start) / 2;
                    for (long n = 0; n < trips; n++) {
                        hash = 31 * hash + (start + 2 * n);
                    }
                    break;
                case 1:
                    if (other != 0 ? start < -2 || start > 0 : start < 0 || start > 7) {
                        throw new IllegalArgumentException();
                    }
                    hash = 1;
                    long doTrips = start > 0 ? start : 1;
                    for (long n = 0; n < doTrips; n++) {
                        hash = 31 * hash + (start - n);
                    }
                    break;
                case 2:
                    if (start < 0 || start > 7) {
                        throw new IllegalArgumentException();
                    }
                    // The inner check is reached only after an outer trip.
                    if (start > 0 && (other < 0 || other > 5)) {
                        throw new IllegalArgumentException();
                    }
                    for (long n = 0; n < start; n++) {
                        for (long m = 0; m < other; m++) {
                            hash = 31 * hash + (17 * (start - n) + other - m);
                        }
                    }
                    break;
                case 3:
                    if (start < 0 || start > 4095) {
                        throw new IllegalArgumentException();
                    }
                    for (long n = 0; n < start; n++) {
                        hash = 31 * hash + (start - n);
                    }
                    break;
                default:
                    throw new AssertionError(kind);
            }
            return new Outcome(hash, null);
        } catch (RuntimeException e) {
            return exceptionOutcome(e);
        }
    }

    private static void checkRotate(int kind, int[] initial, int idx, int other, boolean edge) {
        int[] actual = copy(initial);
        int[] expected = copy(initial);
        Outcome a;
        try {
            int value = switch (kind) {
                case 0 -> guardedRotate(actual, idx);
                case 1 -> acceptedPolarity(actual, idx);
                case 2 -> nonDominating(actual, idx, edge);
                case 3 -> mergedEntry(actual, idx, other, edge);
                case 4 -> unrelatedValue(actual, idx, other);
                case 5 -> unsignedBound(actual, idx, other);
                default -> throw new AssertionError(kind);
            };
            a = new Outcome(value, null);
        } catch (RuntimeException e) {
            a = exceptionOutcome(e);
        }
        Outcome e = rotateReference(kind, expected, idx, other, edge);
        verify("rotate " + kind + ": " + idx + ", " + other + ", " + edge,
               a, e, actual, expected);
    }

    // Interpreted and structurally independent: overlapping arraycopy rather
    // than the target's descending induction variable.
    @DontCompile
    private static Outcome rotateReference(int kind, int[] rep, int idx, int other, boolean edge) {
        try {
            boolean accepted = switch (kind) {
                case 0, 1 -> idx >= 0 && idx <= 2;
                case 2, 3 -> !edge || (idx >= 0 && idx <= 2);
                case 4 -> other >= 0 && other <= 2;
                case 5 -> (idx & 0xffff_ffffL) <= (other & 0xffff_ffffL);
                default -> throw new AssertionError(kind);
            };
            if (!accepted) {
                throw new IllegalArgumentException();
            }
            int start = kind == 3 && !edge ? other : idx;
            int value = rep[start];
            System.arraycopy(rep, 0, rep, 1, start);
            rep[0] = value;
            return new Outcome(value, null);
        } catch (RuntimeException e) {
            return exceptionOutcome(e);
        }
    }

    private static void checkRepeat(boolean inline, int[] initial, int code, int literals) {
        int[] actual = copy(initial);
        int[] expected = copy(initial);
        Outcome a;
        try {
            int value = inline ? repeatHotInline(actual, code, literals)
                               : repeatStandalone(actual, code, literals);
            a = new Outcome(value, null);
        } catch (RuntimeException e) {
            a = exceptionOutcome(e);
        }
        Outcome e = repeatReference(expected, code, literals);
        verify("repeat " + inline + ": " + code + ", " + literals,
               a, e, actual, expected);
    }

    // Enumerate all three moves instead of reproducing the counted loop. The
    // assignments retain load/store exception order and any partial state.
    @DontCompile
    private static Outcome repeatReference(int[] rep, int code, int literals) {
        try {
            int value;
            if (code > 3) {
                value = code - 3;
                rep[2] = rep[1];
                rep[1] = rep[0];
                rep[0] = value;
            } else {
                int selected = literals == 0 ? code : code - 1;
                switch (selected) {
                    case 0:
                        return new Outcome(rep[0], null);
                    case 1:
                        value = rep[1];
                        rep[1] = rep[0];
                        break;
                    case 2:
                        value = rep[2];
                        rep[2] = rep[1];
                        rep[1] = rep[0];
                        break;
                    case 3:
                        value = rep[0] - 1;
                        if (value <= 0) {
                            throw new IllegalArgumentException("Invalid repeat offset");
                        }
                        rep[2] = rep[1];
                        rep[1] = rep[0];
                        break;
                    default:
                        throw new IllegalArgumentException("Bad repeat code");
                }
                rep[0] = value;
            }
            return new Outcome(value, null);
        } catch (RuntimeException e) {
            return exceptionOutcome(e);
        }
    }

    private static void checkStride(int kind, int start, int stride) {
        int effectiveStride = kind == 1 ? 2 : kind == 2 ? -2 : stride;
        Outcome actual;
        try {
            long value = switch (kind) {
                case 0 -> strided(start, stride);
                case 1 -> upperOverflow(start);
                case 2 -> lowerOverflow(start);
                default -> throw new AssertionError(kind);
            };
            actual = new Outcome(value, null);
        } catch (RuntimeException e) {
            actual = exceptionOutcome(e);
        }
        Outcome expected = strideReference(kind, start, effectiveStride);
        verify("stride " + kind + ": " + start + ", " + effectiveStride,
               actual, expected, null, null);
    }

    @DontCompile
    private static Outcome strideReference(int kind, int start, int stride) {
        boolean accepted = switch (kind) {
            case 0 -> start >= 0 && start <= 2;
            case 1 -> start >= Integer.MAX_VALUE - 2;
            case 2 -> start <= Integer.MIN_VALUE + 2;
            default -> throw new AssertionError(kind);
        };
        if (!accepted) {
            return new Outcome(0, IllegalArgumentException.class);
        }
        long current = start;
        long hash = 0;
        int steps = 0;
        while (steps < 8 && (kind == 2 ? current < 0 : current > 0)) {
            hash = 31 * hash + current;
            steps++;
            if (steps != 8) {
                // Compute in long and explicitly truncate after every update.
                current = (int) (current + stride);
            }
        }
        return new Outcome(hash ^ (current << 32) ^ steps, null);
    }

    private static void verify(String context, Outcome actual, Outcome expected,
                               int[] actualState, int[] expectedState) {
        if (!actual.equals(expected) || !Arrays.equals(actualState, expectedState)) {
            throw new AssertionError(context + ": actual=" + actual + " " + Arrays.toString(actualState)
                                     + ", expected=" + expected + " " + Arrays.toString(expectedState));
        }
    }
}
