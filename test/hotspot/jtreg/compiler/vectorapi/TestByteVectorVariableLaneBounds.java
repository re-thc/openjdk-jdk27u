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
}
