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
 * @summary Test the level of a method's first compilation with and without TieredLazyProfiling
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.flagless
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 *
 * @comment default flags: first tier 2, then tier 3 or 4
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -Xbatch -XX:+TieredCompilation
 *                   -XX:CompileCommand=compileonly,compiler.tiered.TestLazyProfiling::hot
 *                   compiler.tiered.TestLazyProfiling 2
 *
 * @comment lazy profiling off: first tier 3
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -Xbatch -XX:+TieredCompilation -XX:-TieredLazyProfiling
 *                   -XX:CompileCommand=compileonly,compiler.tiered.TestLazyProfiling::hot
 *                   compiler.tiered.TestLazyProfiling 3
 *
 * @comment tier 2 excluded for the method (mask 10 is tier 2 only): first tier 3
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -Xbatch -XX:+TieredCompilation
 *                   -XX:CompileCommand=compileonly,compiler.tiered.TestLazyProfiling::hot
 *                   -XX:CompileCommand=exclude,compiler.tiered.TestLazyProfiling::hot,10
 *                   compiler.tiered.TestLazyProfiling 3
 */

package compiler.tiered;

import java.lang.reflect.Method;

import jdk.test.lib.Asserts;
import jdk.test.whitebox.WhiteBox;

public class TestLazyProfiling {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static final int COMP_LEVEL_NONE = 0;
    private static final int COMP_LEVEL_SIMPLE = 1;
    private static final int COMP_LEVEL_LIMITED_PROFILE = 2;
    private static final int COMP_LEVEL_FULL_PROFILE = 3;

    // The policy compiles the method after a few hundred invocations.
    private static final int MAX_CALLS_UNTIL_COMPILED = 10_000;
    // A lazily profiled method is promoted at the first tier 2 invocation notification, which is
    // at about 2^14 invocations, see Tier2InvokeNotifyFreqLog.
    private static final int MAX_CALLS_UNTIL_PROMOTED = 200_000;

    private static int sink;

    // Not trivial for the policy (neither an accessor nor a constant getter), and loop free, so
    // that no OSR compilation takes part.
    static int hot(int x) {
        int r = x ^ (x >>> 3);
        if ((x & 1) == 0) {
            r += 42;
        } else if (x % 3 == 0) {
            r -= 7;
        }
        return r;
    }

    // Invokes hot() until it has code at the given minimum level or the call budget is used up.
    // -Xbatch makes the compilation synchronous, so the first level that is seen is the first
    // level that the policy chose.
    private static int callUntilLevel(Method hot, int minLevel, int maxCalls) {
        int level = WB.getMethodCompilationLevel(hot);
        for (int i = 0; i < maxCalls && level < minLevel; i++) {
            sink += hot(i);
            level = WB.getMethodCompilationLevel(hot);
        }
        return level;
    }

    public static void main(String[] args) throws Exception {
        int expectedFirstLevel = Integer.parseInt(args[0]);
        Method hot = TestLazyProfiling.class.getDeclaredMethod("hot", int.class);

        Asserts.assertEQ(COMP_LEVEL_NONE, WB.getMethodCompilationLevel(hot), "compiled before the test");
        int firstLevel = callUntilLevel(hot, COMP_LEVEL_SIMPLE, MAX_CALLS_UNTIL_COMPILED);
        Asserts.assertEQ(expectedFirstLevel, firstLevel, "first compilation level");

        if (expectedFirstLevel == COMP_LEVEL_LIMITED_PROFILE) {
            // A lazily profiled method must not stay at tier 2 when it stays hot.
            int level = callUntilLevel(hot, COMP_LEVEL_FULL_PROFILE, MAX_CALLS_UNTIL_PROMOTED);
            Asserts.assertGTE(level, COMP_LEVEL_FULL_PROFILE, "hot method not promoted from tier 2");
        }
    }
}
