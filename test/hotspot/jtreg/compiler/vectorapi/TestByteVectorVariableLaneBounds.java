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
/*
 * @test
 * @summary Invalid byte lanes and array access preserve exception ordering in C2
 * @requires vm.compiler2.enabled
 * @modules jdk.incubator.vector
 * @library /test/lib /
 * @run driver compiler.vectorapi.TestByteVectorVariableLaneBounds
 */
package compiler.vectorapi;

import compiler.lib.ir_framework.*;
import jdk.incubator.vector.*;
import jdk.test.lib.Platform;

public class TestByteVectorVariableLaneBounds {
    private static final byte[] A = new byte[16];
    private static final byte[] SHORT = new byte[15];
    private static final int[] BAD64 = badIndices(8);
    private static final int[] BAD128 = badIndices(16);
    private static volatile int runtimeIndex;
    static { for (int i = 0; i < A.length; i++) A[i] = (byte)(17 * i - 128); }

    private static int[] badIndices(int length) {
        return new int[]{-1, -128, -256, length, length + 1, 127, 128,
                         255, 256, 257, 256 + length, Integer.MIN_VALUE, Integer.MAX_VALUE};
    }
    public static void main(String[] args) {
        TestFramework framework = new TestFramework().addFlags("--add-modules=jdk.incubator.vector");
        if (Platform.isAArch64()) framework.addFlags("-XX:UseSVE=0");
        framework.start();
    }

    @Test
    public static int negativeIndex() {
        return ByteVector.fromArray(ByteVector.SPECIES_128, A, 0).lane(-1);
    }
    @Test
    public static int upperIndex() {
        return ByteVector.fromArray(ByteVector.SPECIES_128, A, 0).lane(16);
    }
    @Test
    @IR(phase = CompilePhase.BEFORE_MATCHING, counts = {"\\bLoadRange\\b", "> 0"})
    public static int badLaneAfterArray(byte[] a) {
        return ByteVector.fromArray(ByteVector.SPECIES_128, a, 0).lane(-1);
    }
    @Run(test = {"negativeIndex", "upperIndex", "badLaneAfterArray"})
    public static void check() {
        try { negativeIndex(); throw new AssertionError("negative index"); }
        catch (IllegalArgumentException expected) { }
        try { upperIndex(); throw new AssertionError("upper index"); }
        catch (IllegalArgumentException expected) { }
        try { badLaneAfterArray(A); throw new AssertionError("negative index after load"); }
        catch (IllegalArgumentException expected) { }
        try { badLaneAfterArray(null); throw new AssertionError("null array before lane"); }
        catch (NullPointerException expected) { }
        try { badLaneAfterArray(SHORT); throw new AssertionError("short array before lane"); }
        catch (IndexOutOfBoundsException expected) { }
    }
    @Test
    @IR(phase = CompilePhase.BEFORE_MATCHING, counts = {"\\bExtractBVar\\b", "1"},
        failOn = {"\\bJump\\b"}, applyIfPlatform = {"aarch64", "true"},
        applyIfCPUFeature = {"asimd", "true"}, applyIf = {"MaxVectorSize", ">= 8"})
    public static int runtime64(int index) {
        return ByteVector.fromArray(ByteVector.SPECIES_64, A, 0).lane(index);
    }

    @Test
    @IR(phase = CompilePhase.BEFORE_MATCHING, counts = {"\\bExtractBVar\\b", "1"},
        failOn = {"\\bJump\\b"}, applyIfPlatform = {"aarch64", "true"},
        applyIfCPUFeature = {"asimd", "true"}, applyIf = {"MaxVectorSize", ">= 16"})
    public static int runtime128(int index) {
        return ByteVector.fromArray(ByteVector.SPECIES_128, A, 0).lane(index);
    }

    @Run(test = "runtime64")
    public static void checkRuntime64(RunInfo info) {
        checkRuntime(info, false);
    }

    @Run(test = "runtime128")
    public static void checkRuntime128(RunInfo info) {
        checkRuntime(info, true);
    }

    private static int invokeRuntime(boolean wide) {
        return wide ? runtime128(runtimeIndex) : runtime64(runtimeIndex);
    }

    private static void requireC2(RunInfo info, boolean required) {
        if (required && !info.isTestC2Compiled()) {
            throw new AssertionError(info.getTest().getName() + " lost C2 residency");
        }
    }

    private static void checkRuntime(RunInfo info, boolean wide) {
        int length = wide ? 16 : 8;
        int[] bad = wide ? BAD128 : BAD64;
        boolean required = !info.isWarmUp() && info.isC2CompilationEnabled() && !info.isCompilationSkipped();
        // Warm both successful and throwing paths. After compilation, verify
        // residency around every call: silently running later cases after a
        // compiled-method retirement is not a pass.
        for (int i = 0; i < length; i++) {
            runtimeIndex = i;
            requireC2(info, required);
            if (invokeRuntime(wide) != A[i]) throw new AssertionError("valid lane " + i);
            requireC2(info, required);
        }
        for (int index : bad) {
            runtimeIndex = index;
            requireC2(info, required);
            boolean threw = false;
            try { invokeRuntime(wide); }
            catch (IllegalArgumentException expected) { threw = true; }
            requireC2(info, required);
            if (!threw) throw new AssertionError("wrapped invalid lane " + index + " for " + length);
        }
        // An invalid access must not corrupt a subsequent valid extraction.
        runtimeIndex = length - 1;
        requireC2(info, required);
        if (invokeRuntime(wide) != A[length - 1]) throw new AssertionError("valid after invalid");
        requireC2(info, required);
        if (!info.isWarmUp()) {
            System.out.println("RUNTIME_BOUNDS method=" + info.getTest().getName() +
                    " c2_checked=" + required + " valid=" + (length + 1) + " invalid=" + bad.length);
        }
    }

}
