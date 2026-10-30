/*
 * Copyright (c) 2026. All rights reserved.
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
 *
 */

/*
 * @test
 * @summary Verify C2 clock leaf ABI shape, repeated observations and disable controls
 * @requires vm.compiler2.enabled & vm.debug
 * @library /test/lib /
 * @modules java.base/jdk.internal.misc
 * @run driver compiler.intrinsics.time.TestNanoTimeAdjustmentIR default
 * @run driver compiler.intrinsics.time.TestNanoTimeAdjustmentIR off
 * @run driver compiler.intrinsics.time.TestNanoTimeAdjustmentIR disabled
 */
package compiler.intrinsics.time;

import static compiler.intrinsics.time.TestNanoTimeAdjustmentIR.*;

import compiler.lib.ir_framework.CompilePhase;
import compiler.lib.ir_framework.IR;
import compiler.lib.ir_framework.Run;
import compiler.lib.ir_framework.Test;
import compiler.lib.ir_framework.TestFramework;
import jdk.internal.misc.VM;
import jdk.test.whitebox.WhiteBox;

public class TestNanoTimeAdjustmentIR {
    static final String LEAF = ".*CallLeaf.*javaTimeNanosAdjustment.*";
    static final String NATIVE = ".*CallStaticJava.*getNanoTimeAdjustment.*";
    static final RuntimeException MARKER = new RuntimeException("expected caller exception");
    static volatile long sink;
    static int finalizations;

    public static void main(String[] args) {
        boolean enabled = args[0].equals("default");
        if (!enabled && !args[0].equals("off") && !args[0].equals("disabled"))
            throw new AssertionError("Unknown mode " + args[0]);
        TestFramework framework = new TestFramework(enabled ? NanoTimeAdjustmentEnabled.class : NanoTimeAdjustmentFallback.class)
            .setDefaultWarmup(2000)
            .addFlags("-XX:+UnlockDiagnosticVMOptions",
                "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED");
        if (args[0].equals("off")) framework.addFlags("-XX:-InlineNanoTimeAdjustment");
        if (args[0].equals("disabled")) framework.addFlags("-XX:DisableIntrinsic=_getNanoTimeAdjustment");
        framework.start();
    }

    static void availability(boolean expected) throws Exception {
        if (WhiteBox.getWhiteBox().isIntrinsicAvailable(VM.class.getDeclaredMethod("getNanoTimeAdjustment", long.class), 4) != expected)
            throw new AssertionError("Intrinsic availability mismatch");
    }

}

// Top-level classes keep canonical and binary names identical for FlagVM.
class NanoTimeAdjustmentEnabled {
        @Test
        @IR(counts = {LEAF, "1"}, failOn = {NATIVE}, phase = CompilePhase.BEFORE_MATCHING)
        public static long single(long offset) { return VM.getNanoTimeAdjustment(offset); }

        @Test
        @IR(counts = {LEAF, "2"}, failOn = {NATIVE}, phase = CompilePhase.BEFORE_MATCHING)
        public static long pair(long offset) {
            long first = VM.getNanoTimeAdjustment(offset);
            long second = VM.getNanoTimeAdjustment(offset);
            return first ^ second;
        }

        @Test
        @IR(counts = {LEAF, "1"}, failOn = {NATIVE}, phase = CompilePhase.BEFORE_MATCHING)
        public static long exceptional(long offset, boolean doThrow) {
            try {
                long value = VM.getNanoTimeAdjustment(offset);
                sink ^= value;
                if (doThrow) throw MARKER;
                return value;
            } finally {
                finalizations++;
            }
        }

        @Run(test = {"single", "pair", "exceptional"})
        public static void run() throws Exception {
            availability(true);
            long offset = System.currentTimeMillis() / 1000 - 1024;
            if (single(offset) < 0) throw new AssertionError("valid offset rejected");
            sink ^= pair(offset); // Equal observations are valid on coarse clocks.
            int before = finalizations;
            if (exceptional(offset, false) < 0) throw new AssertionError("valid result rejected");
            try {
                exceptional(offset, true);
                throw new AssertionError("missing caller exception");
            } catch (RuntimeException actual) {
                if (actual != MARKER) throw new AssertionError("exception identity changed");
            }
            if (finalizations != before + 2) throw new AssertionError("finally state changed");
        }
    }

class NanoTimeAdjustmentFallback {
        @Test
        @IR(counts = {NATIVE, "1"}, failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
        public static long single(long offset) { return VM.getNanoTimeAdjustment(offset); }

        @Test
        @IR(counts = {NATIVE, "2"}, failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
        public static long pair(long offset) {
            long first = VM.getNanoTimeAdjustment(offset);
            long second = VM.getNanoTimeAdjustment(offset);
            return first ^ second;
        }

        @Test
        @IR(counts = {NATIVE, "1"}, failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
        public static long exceptional(long offset, boolean doThrow) {
            try {
                long value = VM.getNanoTimeAdjustment(offset);
                sink ^= value;
                if (doThrow) throw MARKER;
                return value;
            } finally {
                finalizations++;
            }
        }

        @Run(test = {"single", "pair", "exceptional"})
        public static void run() throws Exception {
            availability(false);
            long offset = System.currentTimeMillis() / 1000 - 1024;
            if (single(offset) < 0) throw new AssertionError("valid offset rejected");
            sink ^= pair(offset); // Equal observations are valid on coarse clocks.
            int before = finalizations;
            if (exceptional(offset, false) < 0) throw new AssertionError("valid result rejected");
            try {
                exceptional(offset, true);
                throw new AssertionError("missing caller exception");
            } catch (RuntimeException actual) {
                if (actual != MARKER) throw new AssertionError("exception identity changed");
            }
            if (finalizations != before + 2) throw new AssertionError("finally state changed");
        }
    }
