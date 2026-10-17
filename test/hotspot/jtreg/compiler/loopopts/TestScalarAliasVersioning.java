/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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

package compiler.loopopts;

import compiler.lib.ir_framework.CompilePhase;
import compiler.lib.ir_framework.DontInline;
import compiler.lib.ir_framework.IR;
import compiler.lib.ir_framework.IRNode;
import compiler.lib.ir_framework.Run;
import compiler.lib.ir_framework.Scenario;
import compiler.lib.ir_framework.Test;
import compiler.lib.ir_framework.TestFramework;
import java.util.Arrays;
import java.util.IdentityHashMap;
import jdk.test.lib.Asserts;

/*
 * @test
 * @summary Check scalar array load versioning, its alias fallback, and its exclusions.
 * @requires vm.compiler2.enabled
 * @library /test/lib /
 * @run driver compiler.loopopts.TestScalarAliasVersioning
 */
public class TestScalarAliasVersioning {
    private static final int SIZE = 64;
    private static final byte[] CALL_BYTES = {(byte) 0x55};
    private static int[] escapedRep;

    /*
     * The accepted phase is emitted before the next IGVN round. Identify actual
     * node IDs, not arbitrary LoadI/CmpP counts:
     *  - a pinned fast load and its loop use the same entry control;
     *  - that load uses the fast memory Phi's entry memory, which may be an
     *    outer-loop Phi rather than a method-entry memory projection;
     *  - a different loop's load still uses its own loop-carried memory Phi;
     *  - both loads use the same invariant address;
     *  - the ne selector compares that address's base with a store's array base.
     * Predicates can occur between the selector and each loop entry. The
     * compiler's post-transform verifier additionally checks their dominance.
     * Whole-graph lookaheads allow arbitrary dump order. A missing accepted
     * phase, a guard alone, or a clone without the memory rewrite cannot pass.
     */
    private static final String VERSIONED_MEMORY = "(?ms)\\A"
            + "(?=.*^\\h*\\d+\\h+LoadI\\h+===\\h+(?<fastControl>\\d+)\\h+"
            + "(?<entryMemory>\\d+)\\h+(?<address>\\d+)\\h+[^\\r\\n]*\\bpinned\\b)"
            + "(?=.*^\\h*(?<fastLoop>\\d+)\\h+Loop\\h+===\\h+\\S+\\h+\\k<fastControl>\\h+)"
            + "(?=.*^\\h*(?<fastMemory>\\d+)\\h+Phi\\h+===\\h+\\k<fastLoop>\\h+"
            + "\\k<entryMemory>\\h+\\d+\\h+[^\\r\\n]*\\bMemory:)"
            + "(?=.*^\\h*(?!\\k<fastLoop>\\b)(?<slowLoop>\\d+)\\h+Loop\\h+===\\h+)"
            + "(?=.*^\\h*(?!\\k<fastMemory>\\b)(?<slowMemory>\\d+)\\h+Phi\\h+===\\h+"
            + "\\k<slowLoop>\\h+\\k<entryMemory>\\h+\\d+\\h+[^\\r\\n]*\\bMemory:)"
            + "(?=.*^\\h*\\d+\\h+LoadI\\h+===\\h+\\S+\\h+\\k<slowMemory>\\h+\\k<address>\\h+)"
            + "(?=.*^\\h*\\k<address>\\h+AddP\\h+===\\h+_\\h+(?<readAddressBase>\\d+)\\h+\\k<readAddressBase>\\h+\\d+\\h+)"
            + "(?=.*^\\h*(?<comparison>\\d+)\\h+CmpP\\h+===\\h+_\\h+(?<readBase>\\d+)\\h+"
            + "(?!\\k<readBase>\\b)(?<writeBase>\\d+)\\h+)"
            + "(?=.*^\\h*\\k<readBase>\\h+Parm\\h+===\\h+[^\\r\\n]*\\bParm0:)"
            + "(?=.*^\\h*\\k<writeBase>\\h+Parm\\h+===\\h+[^\\r\\n]*\\bParm1:)"
            // The compiler compares uncast oop identities. The load address
            // can still use its existing one- or two-level non-null cast.
            + "(?=(?:.*^\\h*\\k<address>\\h+AddP\\h+===\\h+_\\h+\\k<readBase>\\h+"
            + "|.*^\\h*\\k<readAddressBase>\\h+(?:CastPP|CheckCastPP)\\h+===\\h+\\S+\\h+\\k<readBase>\\h+"
            + "|(?=.*^\\h*\\k<readAddressBase>\\h+(?:CastPP|CheckCastPP)\\h+===\\h+\\S+\\h+(?<readCast>\\d+)\\h+)"
            + ".*^\\h*\\k<readCast>\\h+(?:CastPP|CheckCastPP)\\h+===\\h+\\S+\\h+\\k<readBase>\\h+))"
            // Bind the store operand first: a varying address can contain an
            // intermediate AddP that is not itself used by a StoreI.
            + "(?=.*^\\h*\\d+\\h+StoreI\\h+===\\h+\\S+\\h+\\d+\\h+(?<writeAddress>\\d+)\\h+)"
            + "(?=.*^\\h*\\k<writeAddress>\\h+AddP\\h+===\\h+_\\h+(?<writeAddressBase>\\d+)\\h+)"
            + "(?=(?:.*^\\h*\\k<writeAddress>\\h+AddP\\h+===\\h+_\\h+\\k<writeBase>\\h+"
            + "|.*^\\h*\\k<writeAddressBase>\\h+(?:CastPP|CheckCastPP)\\h+===\\h+\\S+\\h+\\k<writeBase>\\h+"
            + "|(?=.*^\\h*\\k<writeAddressBase>\\h+(?:CastPP|CheckCastPP)\\h+===\\h+\\S+\\h+(?<writeCast>\\d+)\\h+)"
            + ".*^\\h*\\k<writeCast>\\h+(?:CastPP|CheckCastPP)\\h+===\\h+\\S+\\h+\\k<writeBase>\\h+))"
            + "(?=.*^\\h*(?<condition>\\d+)\\h+Bool\\h+===\\h+_\\h+\\k<comparison>\\h+[^\\r\\n]*\\[ne\\])"
            + "(?=.*^\\h*(?<selector>\\d+)\\h+If\\h+===\\h+\\d+\\h+\\k<condition>\\h+)"
            + "(?=.*^\\h*\\d+\\h+IfTrue\\h+===\\h+\\k<selector>\\h+)"
            + "(?=.*^\\h*\\d+\\h+IfFalse\\h+===\\h+\\k<selector>\\h+)"
            + ".*\\z";

    // Ordinary null checks do not match: both compared values must be actual
    // array parameters. There is no Java array-identity guard in the kernels.
    private static final String ARRAY_ALIAS_GUARD = "(?ms)\\A"
            + "(?=.*^\\h*\\d+\\h+CmpP\\h+===\\h+_\\h+(?<read>\\d+)\\h+"
            + "(?!\\k<read>\\b)(?<write>\\d+)\\h+)"
            + "(?=.*^\\h*\\k<read>\\h+Parm\\h+===\\h+[^\\r\\n]*\\bParm0:)"
            + "(?=.*^\\h*\\k<write>\\h+Parm\\h+===\\h+[^\\r\\n]*\\bParm[12]:)"
            + ".*\\z";

    public static void main(String[] args) {
        // Keep the default, explicit opt-in and explicit disabled cases. Only
        // opt-in may satisfy the accepted-phase activation assertion. These are
        // compiler unit tests, not codec captures or a performance test.
        new TestFramework().addScenarios(new Scenario(0),
                new Scenario(1, "-XX:+LoopScalarAliasVersioning"),
                new Scenario(2, "-XX:-LoopScalarAliasVersioning")).start();
    }

    @Test
    @IR(counts = {VERSIONED_MEMORY, "1", IRNode.SAFEPOINT, ">= 2"},
        failOn = {IRNode.COUNTED_LOOP},
        phase = CompilePhase.AFTER_SCALAR_ALIAS_VERSIONING,
        applyIfAnd = {"LoopScalarAliasVersioning", "true", "LoopMultiversioning", "true",
                      "LoopUnswitching", "true"})
    @IR(failOn = {ARRAY_ALIAS_GUARD}, phase = CompilePhase.BEFORE_MATCHING,
        applyIf = {"LoopScalarAliasVersioning", "false"})
    public static long checked(int[] rep, int[] heads, int[] unused, int limit, int mask) {
        int initial = rep[0];
        // Expose null/bounds safety before the loop without asserting that rep
        // and heads differ. The same-array case must use the original loop.
        if (heads.length < SIZE) {
            throw new IllegalArgumentException("short heads");
        }
        long state = 0;
        int i = 0;
        while (i < limit) {
            int repeat = rep[0];
            // Keep a varying head address, while making store bounds safety
            // explicit independently of speculative range-check elimination.
            heads[i & (SIZE - 1)] = 11 + 2 * i;
            state = Long.rotateLeft(state, 3) ^ (repeat + (long) i);
            i = (i << 1) + 1;
        }
        return state + initial;
    }

    @Test
    public static long unchecked(int[] rep, int[] heads, int[] unused, int limit, int mask) {
        long state = 0;
        int i = 0;
        while (i < limit) {
            int repeat = rep[0];
            heads[i & mask] = 11 + 2 * i;
            state = Long.rotateLeft(state, 3) ^ (repeat + (long) i);
            i = (i << 1) + 1;
        }
        return state;
    }

    @Test
    public static long epochs(int[] rep, int[] heads, int[] unused, int limit, int mask) {
        if (heads.length < SIZE) {
            throw new IllegalArgumentException("short heads");
        }
        long result = 0;
        for (int epoch = 0; epoch < 3; epoch++) {
            int initial = rep[0];
            long state = 0;
            int i = 0;
            while (i < limit) {
                int repeat = rep[0];
                heads[i & mask] = 11 + 2 * i;
                state = Long.rotateLeft(state, 3) ^ (repeat + (long) i);
                i = (i << 1) + 1;
            }
            result ^= state + initial;
            rep[0] = 29 + 3 * epoch;
        }
        return result;
    }

    @DontInline
    private static int mutate(byte[] bytes, int value) {
        // A byte[]-only call signature is not a no-clobber summary for int[].
        // Exercise the global alias that such a returning Java call can write.
        escapedRep[0] = value;
        return value ^ bytes[0];
    }

    @Test
    @IR(failOn = {ARRAY_ALIAS_GUARD},
        counts = {IRNode.CALL_OF_METHOD, "mutate", "> 0"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static long withCall(int[] rep, int[] heads, int[] unused, int limit, int mask) {
        escapedRep = rep;
        int initial = rep[0];
        if (heads.length < SIZE) {
            throw new IllegalArgumentException("short heads");
        }
        long state = 0;
        int i = 0;
        while (i < limit) {
            int repeat = rep[0];
            heads[i & mask] = 11 + 2 * i;
            state = Long.rotateLeft(state, 3) ^ (repeat + (long) i);
            state ^= mutate(CALL_BYTES, 17 + i);
            i = (i << 1) + 1;
        }
        return state + initial;
    }

    @Test
    @IR(failOn = {ARRAY_ALIAS_GUARD}, phase = CompilePhase.BEFORE_MATCHING)
    public static long withExtraWriter(int[] rep, int[] heads, int[] other, int limit, int mask) {
        int initial = rep[0];
        if (heads.length < SIZE || other.length < SIZE) {
            throw new IllegalArgumentException("short writer");
        }
        long state = 0;
        int i = 0;
        while (i < limit) {
            int repeat = rep[0];
            heads[i & mask] = 11 + 2 * i;
            other[i & mask] = 23 + 3 * i;
            state = Long.rotateLeft(state, 3) ^ (repeat + (long) i);
            i = (i << 1) + 1;
        }
        return state + initial;
    }

    @Test
    public static long skipRead(int[] rep, int[] heads, int[] unused, int limit, int mask) {
        long state = 0;
        int i = 0;
        while (i < limit) {
            if (mask < 0) {
                break;
            }
            int repeat = rep[0];
            heads[i & mask] = 11 + 2 * i;
            state = Long.rotateLeft(state, 3) ^ (repeat + (long) i);
            i = (i << 1) + 1;
        }
        return state;
    }

    @FunctionalInterface
    private interface Kernel {
        long apply(int[] rep, int[] heads, int[] other, int limit, int mask);
    }

    private record ArraysState(int[] rep, int[] heads, int[] other) {
        ArraysState copy() {
            var copies = new IdentityHashMap<int[], int[]>();
            return new ArraysState(copy(rep, copies), copy(heads, copies), copy(other, copies));
        }

        private static int[] copy(int[] array, IdentityHashMap<int[], int[]> copies) {
            return array == null ? null : copies.computeIfAbsent(array, a -> a.clone());
        }
    }

    /*
     * Independent oracle: repeat state is held in a scalar and updated
     * explicitly when a writer aliases rep. There is no invariant array load
     * inside this loop for the optimization under test to transform.
     */
    private static long reference(ArraysState arrays, int limit, int mask,
                                  boolean precheck, boolean call, boolean extra) {
        int initial = precheck ? arrays.rep[0] : 0;
        if (precheck && arrays.heads.length < SIZE) {
            throw new IllegalArgumentException("short heads");
        }
        if (extra && arrays.other.length < SIZE) {
            throw new IllegalArgumentException("short writer");
        }
        if (limit <= 0) {
            return initial;
        }
        int current = precheck ? initial : arrays.rep[0];
        boolean headsAlias = arrays.rep == arrays.heads;
        boolean otherAlias = arrays.rep == arrays.other;
        long state = 0;
        // Bounded test inputs keep this arithmetic below overflow and ensure
        // termination; it is the same non-linear progression as the kernels.
        for (int i = 0; i < limit; i = 2 * i + 1) {
            int before = current;
            int index = i & mask;
            int value = 11 + 2 * i;
            arrays.heads[index] = value;
            if (headsAlias && index == 0) {
                current = value;
            }
            if (extra) {
                int otherValue = 23 + 3 * i;
                arrays.other[index] = otherValue;
                if (otherAlias && index == 0) {
                    current = otherValue;
                }
            }
            state = Long.rotateLeft(state, 3) ^ (before + (long) i);
            if (call) {
                current = 17 + i;
                arrays.rep[0] = current;
                state ^= current ^ 0x55;
            }
        }
        return state + initial;
    }

    private static long referenceEpochs(ArraysState arrays, int limit, int mask) {
        if (arrays.heads.length < SIZE) {
            throw new IllegalArgumentException("short heads");
        }
        long result = 0;
        for (int epoch = 0; epoch < 3; epoch++) {
            result ^= reference(arrays, limit, mask, true, false, false);
            arrays.rep[0] = 29 + 3 * epoch;
        }
        return result;
    }

    private static void compare(String label, Kernel kernel, ArraysState input,
                                int limit, int mask, boolean precheck, boolean call, boolean extra,
                                boolean outerEpochs) {
        ArraysState expected = input.copy();
        ArraysState actual = input.copy();
        long expectedValue = 0;
        long actualValue = 0;
        Class<?> expectedException = null;
        Class<?> actualException = null;
        try {
            expectedValue = outerEpochs ? referenceEpochs(expected, limit, mask)
                    : reference(expected, limit, mask, precheck, call, extra);
        } catch (RuntimeException e) {
            expectedException = e.getClass();
        }
        try {
            actualValue = kernel.apply(actual.rep, actual.heads, actual.other, limit, mask);
        } catch (RuntimeException e) {
            actualException = e.getClass();
        }
        Asserts.assertEQ(actualException, expectedException, label + ": exception order");
        if (expectedException == null) {
            Asserts.assertEQ(actualValue, expectedValue, label + ": value");
        }
        Asserts.assertTrue(Arrays.equals(actual.rep, expected.rep), label + ": rep state");
        Asserts.assertTrue(Arrays.equals(actual.heads, expected.heads), label + ": heads state");
        Asserts.assertTrue(Arrays.equals(actual.other, expected.other), label + ": other state");
    }

    @Run(test = {"checked", "unchecked", "epochs", "withCall", "withExtraWriter", "skipRead"})
    public static void run() {
        for (int seed : new int[] {7, Integer.MAX_VALUE}) {
            for (int limit : new int[] {0, 2, 128}) {
                for (boolean alias : new boolean[] {false, true}) {
                    int[] rep = new int[SIZE];
                    rep[0] = seed;
                    int[] heads = alias ? rep : new int[SIZE];
                    ArraysState input = new ArraysState(rep, heads, new int[SIZE]);
                    compare("checked", TestScalarAliasVersioning::checked, input, limit, 63,
                            true, false, false, false);
                    compare("unchecked", TestScalarAliasVersioning::unchecked, input, limit, 63,
                            false, false, false, false);
                    compare("conditional read", TestScalarAliasVersioning::skipRead, input, limit, 63,
                            false, false, false, false);
                    compare("epochs", TestScalarAliasVersioning::epochs, input, limit, 63,
                            true, false, false, true);
                    compare("call", TestScalarAliasVersioning::withCall, input, limit, 63,
                            true, true, false, false);
                    // A rep != heads guard alone would not protect this writer.
                    ArraysState extraAliasesRep = new ArraysState(rep, new int[SIZE], rep);
                    compare("extra writer aliases rep", TestScalarAliasVersioning::withExtraWriter,
                            extraAliasesRep, limit, 63, true, false, true, false);
                    compare("extra disjoint writer", TestScalarAliasVersioning::withExtraWriter,
                            input, limit, 63, true, false, true, false);
                }
            }
        }

        int[] witness = new int[SIZE];
        witness[0] = 7;
        // The initial precheck contributes 7. Within the loop, repeat reads
        // observe 7 then 11, giving 52 rather than a preloaded value's 48.
        Asserts.assertEQ(checked(witness, witness, null, 2, 63), 59L, "same-array witness");
        int[] disjoint = new int[SIZE];
        disjoint[0] = 7;
        Asserts.assertEQ(checked(disjoint, new int[SIZE], null, 2, 63), 55L, "disjoint witness");

        for (int limit : new int[] {-1, 0}) {
            compare("zero trip null", TestScalarAliasVersioning::unchecked,
                    new ArraysState(null, null, null), limit, 63, false, false, false, false);
            compare("zero trip empty", TestScalarAliasVersioning::unchecked,
                    new ArraysState(new int[0], null, null), limit, 63, false, false, false, false);
        }
        compare("load null precedes store bounds", TestScalarAliasVersioning::unchecked,
                new ArraysState(null, new int[0], null), 2, 63, false, false, false, false);
        compare("load bounds precedes store null", TestScalarAliasVersioning::unchecked,
                new ArraysState(new int[0], null, null), 2, 63, false, false, false, false);
        compare("store null", TestScalarAliasVersioning::unchecked,
                new ArraysState(new int[] {7}, null, null), 2, 63, false, false, false, false);
        compare("store bounds", TestScalarAliasVersioning::unchecked,
                new ArraysState(new int[] {7}, new int[0], null), 2, 63, false, false, false, false);
        compare("store before later bounds", TestScalarAliasVersioning::unchecked,
                new ArraysState(new int[] {7}, new int[] {99}, null), 2, 63,
                false, false, false, false);
        int[] one = {7};
        compare("alias store before later bounds", TestScalarAliasVersioning::unchecked,
                new ArraysState(one, one, null), 2, 63, false, false, false, false);

        // In contrast to unchecked(), checked() explicitly reads rep before
        // the loop and must retain that exception even for a zero-trip loop.
        compare("explicit precheck null", TestScalarAliasVersioning::checked,
                new ArraysState(null, new int[SIZE], null), 0, 63, true, false, false, false);
        compare("explicit precheck bounds", TestScalarAliasVersioning::checked,
                new ArraysState(new int[0], new int[SIZE], null), 0, 63, true, false, false, false);
        Asserts.assertEQ(skipRead(null, null, null, 2, -1), 0L, "exit before first read");
    }
}
