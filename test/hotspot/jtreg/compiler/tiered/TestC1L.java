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
 * @summary C1L retains tier promotion and ordinary Java semantics
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.compMode == "Xmixed"
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *       -Xbatch
 *      -XX:Tier3InvocationThreshold=2000 -XX:Tier3MinInvocationThreshold=1000 -XX:Tier3CompileThreshold=2000
 *      -XX:Tier4InvocationThreshold=5000 -XX:Tier4CompileThreshold=5000
 *      -XX:CompileCommand=compileonly,compiler.tiered.TestC1L::target
 *      compiler.tiered.TestC1L 3
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:-UseC1L -Xbatch
 *      -XX:Tier3InvocationThreshold=2000 -XX:Tier3MinInvocationThreshold=1000 -XX:Tier3CompileThreshold=2000
 *      -XX:Tier4InvocationThreshold=5000 -XX:Tier4CompileThreshold=5000
 *      -XX:CompileCommand=compileonly,compiler.tiered.TestC1L::target
 *      compiler.tiered.TestC1L 3
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:+UseC1L -Xbatch -XX:TieredStopAtLevel=1
 *      -XX:CompileCommand=compileonly,compiler.tiered.TestC1L::target
 *      compiler.tiered.TestC1L 1 terminal
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:+UseC1L -Xbatch -XX:TieredStopAtLevel=2
 *      -XX:CompileCommand=compileonly,compiler.tiered.TestC1L::target
 *      compiler.tiered.TestC1L 2 terminal
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:+UseC1L -Xbatch -XX:TieredStopAtLevel=3
 *      -XX:CompileCommand=compileonly,compiler.tiered.TestC1L::target
 *      compiler.tiered.TestC1L 3 terminal
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:+UseC1L -Xbatch -XX:CompilationMode=quick-only
 *      -XX:CompileCommand=compileonly,compiler.tiered.TestC1L::target
 *      compiler.tiered.TestC1L 1 terminal
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:+UseC1L -Xbatch -XX:CompilationMode=high-only
 *      -XX:CompileCommand=compileonly,compiler.tiered.TestC1L::target
 *      compiler.tiered.TestC1L 4 terminal
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:+UseC1L -Xbatch
 *      -XX:TieredStopAtLevel=3
 *      -XX:CompileCommand=compileonly,compiler.tiered.TestC1L::loopTarget
 *      compiler.tiered.TestC1L osr
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:-UseC1L -Xbatch
 *      -XX:TieredStopAtLevel=3
 *      -XX:CompileCommand=compileonly,compiler.tiered.TestC1L::loopTarget
 *      compiler.tiered.TestC1L osr
 */
package compiler.tiered;

import java.lang.reflect.Method;
import jdk.test.whitebox.WhiteBox;

public class TestC1L {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static final Object LOCK = new Object();
    private static volatile Object root;

    static int target(int[] a, int index, int divisor) {
        synchronized (LOCK) {
            try {
                root = a;
                if (divisor == -7) return index;
                return (a[index] + Math.abs(index)) / divisor;
            } catch (NullPointerException e) {
                return -11;
            } catch (ArrayIndexOutOfBoundsException e) {
                return -12;
            } catch (ArithmeticException e) {
                return -13;
            }
        }
    }

    static void check(boolean ok, String message) {
        if (!ok) throw new AssertionError(message);
    }

    static void semantics() {
        check(target(new int[] { 42 }, 0, 2) == 21, "normal result");
        check(target(null, 0, 1) == -11, "null exception");
        check(target(new int[1], 2, 1) == -12, "range exception");
        check(target(new int[1], 0, 0) == -13, "division exception");
        System.gc();
        check(root != null, "GC root");
    }

    static long loopTarget(int[] values) {
        synchronized (LOCK) {
            long sum = 0;
            for (int i = 0; i < (1 << 22); i++) sum += values[i & 255];
            return sum;
        }
    }

    public static void main(String[] args) throws Exception {
        if (args[0].equals("osr")) {
            int[] values = new int[256];
            for (int i = 0; i < values.length; i++) values[i] = i;
            check(loopTarget(values) == (1L << 14) * 32640, "OSR result");
            Method loop = TestC1L.class.getDeclaredMethod("loopTarget", int[].class);
            int level = WB.getMethodCompilationLevel(loop, true);
            System.out.println("OSR tier: " + level);
            check(level == 3, "normal C1 OSR tier");
            WB.deoptimizeMethod(loop, true);
            check(loopTarget(values) == (1L << 14) * 32640, "OSR after deopt");
            return;
        }
        Method method = TestC1L.class.getDeclaredMethod("target", int[].class, int.class, int.class);
        int first = Integer.parseInt(args[0]);
        boolean seenFirst = false;
        boolean seenProfile = false;
        int last = 0;
        int[] array = { 42 };
        for (int i = 0; i < 100_000; i++) {
            check(target(array, 0, 2) == 21, "result during promotion");
            int level = WB.getMethodCompilationLevel(method);
            if (level != last) {
                System.out.println("Transition " + last + " -> " + level + " at call " + (i + 1));
                if (!seenFirst) {
                    check(level == first, "unexpected first tier: " + level);
                    seenFirst = true;
                    if (WB.getBooleanVMFlag("UseC1L") && args.length == 1)
                        check(i < 2000, "lean compilation was not early");
                }
                if (level == 3) seenProfile = true;
                last = level;
            }
            if (args.length > 1 && level == first) {
                semantics();
                return;
            }
            if (level == 4) break;
        }
        check(seenFirst && seenProfile && last == 4, "missing full-profile/C2 promotion");
        semantics();
        // Exercise each C1 tier after deoptimization, including lean full-profile C1.
        for (int level = 1; level <= 3; level++) {
            WB.deoptimizeMethod(method);
            WB.clearMethodState(method);
            check(WB.enqueueMethodForCompilation(method, level), "enqueue tier " + level);
            check(WB.getMethodCompilationLevel(method) == level, "compiled tier " + level);
            semantics();
        }
    }
}
