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
 * @summary Signed variable byte lanes retain bounds and a constant-lane fallback
 * @requires vm.compiler2.enabled
 * @modules jdk.incubator.vector
 * @library /test/lib /
 * @run driver compiler.vectorapi.TestByteVectorVariableLane
 */
package compiler.vectorapi;

import compiler.lib.ir_framework.*;
import jdk.incubator.vector.*;
import jdk.test.lib.Platform;

public class TestByteVectorVariableLane {
    private static final byte[] A = new byte[64];
    static { for (int i = 0; i < A.length; i++) A[i] = (byte)(31 * i - 128); }

    public static void main(String[] args) {
        TestFramework framework = new TestFramework().addFlags("--add-modules=jdk.incubator.vector");
        if (Platform.isAArch64()) framework.addFlags("-XX:UseSVE=0");
        framework.start();
    }

    @Test
    @IR(phase = CompilePhase.BEFORE_MATCHING, counts = {"\\bExtractBVar\\b", "1"}, failOn = {"\\bJump\\b"},
        applyIfPlatform = {"aarch64", "true"}, applyIfCPUFeature = {"asimd", "true"},
        applyIf = {"MaxVectorSize", ">= 8"})
    @IR(phase = CompilePhase.BEFORE_MATCHING, counts = {"\\bExtractB\\b", "> 0"},
        failOn = {"\\bExtractBVar\\b"}, applyIfPlatform = {"x64", "true"})
    @IR(failOn = {IRNode.ALLOC, IRNode.ALLOC_ARRAY}, applyIfPlatform = {"x64", "true"})
    @IR(failOn = {IRNode.ALLOC, IRNode.ALLOC_ARRAY},
        applyIfPlatform = {"aarch64", "true"}, applyIfCPUFeature = {"asimd", "true"},
        applyIf = {"MaxVectorSize", ">= 8"})
    public static int dynamic64(int index) {
        return ByteVector.fromArray(ByteVector.SPECIES_64, A, 0).lane(index);
    }

    @Test
    @IR(phase = CompilePhase.BEFORE_MATCHING, counts = {"\\bExtractBVar\\b", "1"}, failOn = {"\\bJump\\b"},
        applyIfPlatform = {"aarch64", "true"}, applyIfCPUFeature = {"asimd", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    @IR(phase = CompilePhase.BEFORE_MATCHING, counts = {"\\bExtractB\\b", "> 0", "\\bJump\\b", "1"},
        failOn = {"\\bExtractBVar\\b"}, applyIfPlatform = {"x64", "true"})
    @IR(failOn = {IRNode.ALLOC, IRNode.ALLOC_ARRAY}, applyIfPlatform = {"x64", "true"})
    @IR(failOn = {IRNode.ALLOC, IRNode.ALLOC_ARRAY},
        applyIfPlatform = {"aarch64", "true"}, applyIfCPUFeature = {"asimd", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static int dynamic128(int index) {
        return ByteVector.fromArray(ByteVector.SPECIES_128, A, 0).lane(index);
    }

    @Test
    @IR(phase = CompilePhase.BEFORE_MATCHING, failOn = {"\\bExtractBVar\\b", "\\bJump\\b"})
    public static int constant128() {
        return ByteVector.fromArray(ByteVector.SPECIES_128, A, 0).lane(7);
    }

    @Test
    @IR(phase = CompilePhase.BEFORE_MATCHING, failOn = {"\\bExtractBVar\\b"}, applyIf = {"MaxVectorSize", "<= 16"})
    public static int dynamic256(int index) {
        return ByteVector.fromArray(ByteVector.SPECIES_256, A, 0).lane(index);
    }

    @Test
    @IR(phase = CompilePhase.BEFORE_MATCHING, counts = {"\\bExtractBVar\\b", "1"}, failOn = {"\\bJump\\b"},
        applyIfPlatform = {"aarch64", "true"}, applyIfCPUFeature = {"asimd", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    @IR(failOn = {IRNode.ALLOC, IRNode.ALLOC_ARRAY},
        applyIfPlatformOr = {"aarch64", "true", "x64", "true"}, applyIf = {"MaxVectorSize", ">= 16"})
    public static int signAndUnsigned128(int index) {
        int lane = ByteVector.fromArray(ByteVector.SPECIES_128, A, 0).lane(index);
        return (lane < 0 ? 0x10000 : 0) | (lane & 0xff);
    }

    @Run(test = {"dynamic64", "dynamic128", "constant128", "dynamic256", "signAndUnsigned128"})
    public static void check() {
        for (int i = 0; i < 32; i++) {
            if (dynamic64(i & 7) != A[i & 7] || dynamic128(i & 15) != A[i & 15] ||
                constant128() != A[7] || dynamic256(i) != A[i] ||
                signAndUnsigned128(i & 15) != ((A[i & 15] < 0 ? 0x10000 : 0) | (A[i & 15] & 0xff))) {
                throw new AssertionError("lane " + i);
            }
        }
    }
}
