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
 * @summary Early C1 respects level-specific exclusions before selecting the early path
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.compMode == "Xmixed"
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:-UseC1L -Xbatch
 *      -XX:CompileThresholdScaling=1 -XX:Tier0InvokeNotifyFreqLog=7 -XX:Tier3InvokeNotifyFreqLog=10
 *      -XX:Tier3InvocationThreshold=200 -XX:Tier3MinInvocationThreshold=100 -XX:Tier3CompileThreshold=2000
 *      -XX:Tier4InvocationThreshold=5000 -XX:Tier4MinInvocationThreshold=600 -XX:Tier4CompileThreshold=15000
 *      -XX:CompileCommand=compileonly,compiler.tiered.TestC1LExclusion::target
 *      -XX:CompileCommand=exclude,compiler.tiered.TestC1LExclusion::target,10
 *      compiler.tiered.TestC1LExclusion 10
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:-UseC1L -Xbatch
 *      -XX:CompileThresholdScaling=1 -XX:Tier0InvokeNotifyFreqLog=7 -XX:Tier3InvokeNotifyFreqLog=10
 *      -XX:Tier3InvocationThreshold=200 -XX:Tier3MinInvocationThreshold=100 -XX:Tier3CompileThreshold=2000
 *      -XX:Tier4InvocationThreshold=5000 -XX:Tier4MinInvocationThreshold=600 -XX:Tier4CompileThreshold=15000
 *      -XX:CompileCommand=compileonly,compiler.tiered.TestC1LExclusion::target
 *      -XX:CompileCommand=exclude,compiler.tiered.TestC1LExclusion::target,100
 *      compiler.tiered.TestC1LExclusion 100
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:+UseC1L -Xbatch
 *      -XX:CompileThresholdScaling=1 -XX:Tier0InvokeNotifyFreqLog=7 -XX:Tier3InvokeNotifyFreqLog=10
 *      -XX:Tier3InvocationThreshold=200 -XX:Tier3MinInvocationThreshold=100 -XX:Tier3CompileThreshold=2000
 *      -XX:Tier4InvocationThreshold=5000 -XX:Tier4MinInvocationThreshold=600 -XX:Tier4CompileThreshold=15000
 *      -XX:CompileCommand=compileonly,compiler.tiered.TestC1LExclusion::target
 *      -XX:CompileCommand=exclude,compiler.tiered.TestC1LExclusion::target,10
 *      compiler.tiered.TestC1LExclusion 10
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:+UseC1L -Xbatch
 *      -XX:CompileThresholdScaling=1 -XX:Tier0InvokeNotifyFreqLog=7 -XX:Tier3InvokeNotifyFreqLog=10
 *      -XX:Tier3InvocationThreshold=200 -XX:Tier3MinInvocationThreshold=100 -XX:Tier3CompileThreshold=2000
 *      -XX:Tier4InvocationThreshold=5000 -XX:Tier4MinInvocationThreshold=600 -XX:Tier4CompileThreshold=15000
 *      -XX:CompileCommand=compileonly,compiler.tiered.TestC1LExclusion::target
 *      -XX:CompileCommand=exclude,compiler.tiered.TestC1LExclusion::target,100
 *      compiler.tiered.TestC1LExclusion 100
 */
package compiler.tiered;

import java.lang.reflect.Method;

import jdk.test.whitebox.WhiteBox;

public class TestC1LExclusion {
    static int target(int x) {
        // Keep a backward branch in the method, but the positive test inputs
        // never execute its body. This makes the target structurally loop-
        // eligible without adding backedge work before the exclusion checks.
        for (int i = x; i < 0; i++) {
            x += i;
        }
        return x > 0 ? (x * 3 + 7) ^ (x >>> 2) : -x + 5;
    }

    public static void main(String[] args) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        Method m = TestC1LExclusion.class.getDeclaredMethod("target", int.class);
        int mask = Integer.parseInt(args[0]), last = 0;
        boolean profiled = false;

        for (int i = 1; i <= 100_000; i++) {
            if (target(i) != ((i * 3 + 7) ^ (i >>> 2)))
                throw new AssertionError("checksum");
            int level = wb.getMethodCompilationLevel(m);
            if (level != last) {
                System.out.println(last + " -> " + level + " at " + i);
                if (level == 2 || (mask == 100 && level == 3))
                    throw new AssertionError("excluded early path selected");
                if (mask == 10 && last == 0 && level != 3)
                    throw new AssertionError("allowed normal C1 skipped");
                if (level == 3)
                    profiled = true;
                last = level;
            }
            if (level == 4) {
                if (mask == 10 && !profiled)
                    throw new AssertionError("missing normal full profiling");
                return;
            }
        }
        throw new AssertionError("normal C2 not reached");
    }
}
