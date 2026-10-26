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
 * @summary C1L preserves forced inlining, intrinsics and method handles
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.compMode == "Xmixed"
 * @library /test/lib
 * @modules java.base/jdk.internal.vm.annotation
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.tiered.TestC1LInlining
 */
package compiler.tiered;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import jdk.internal.vm.annotation.ForceInline;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class TestC1LInlining {
    public static void main(String[] args) throws Exception {
        run(false, 2);
        run(true, 2);
        run(true, 3);
        run(true, 0); // Natural promotion without WhiteBox enqueue.
    }

    private static void run(boolean c1l, int level) throws Exception {
        List<String> flags = new ArrayList<>(List.of(
            "-Xbootclasspath/a:." + java.io.File.pathSeparator
                + System.getProperty("test.classes"),
            "-XX:+UnlockDiagnosticVMOptions",
            "-XX:+WhiteBoxAPI",
            "-XX:" + (c1l ? "+" : "-") + "UseC1L",
            "-Xbatch",
            "-XX:CompileThresholdScaling=" + (level == 0 ? "1" : "100"),
            "-XX:+PrintInlining",
            "-XX:CompileCommand=compileonly," + Work.class.getName() + "::target",
            "-XX:CompileCommand=inline," + Work.class.getName() + "::directed",
            Work.class.getName(),
            Integer.toString(level)));
        OutputAnalyzer out = ProcessTools.executeTestJava(flags.toArray(String[]::new));
        out.shouldHaveExitValue(0).shouldContain("CHECKSUM_OK")
           .shouldMatch(".*::forced .*force inline by annotation.*")
           .shouldMatch(".*::directed .*force inline by CompileCommand.*")
           .shouldContain("intrinsic");
        out.shouldMatch(".*::tiny .*inline.*");
        if (level == 0)
            out.shouldContain("NATURAL_C2_OK");
        System.out.println("C1L=" + c1l + ", level=" + level + " passed");
    }

    public static class Work {
        private static final WhiteBox WB = WhiteBox.getWhiteBox();
        private static final MethodHandle HANDLE;
        private static final MethodHandle ADAPTED;
        private static final MethodHandle BOUND;

        static {
            try {
                HANDLE = MethodHandles.lookup().findStatic(Work.class, "optional",
                    MethodType.methodType(int.class, int.class));
                ADAPTED = HANDLE.asType(MethodType.methodType(Object.class, Object.class));
                BOUND = MethodHandles.insertArguments(HANDLE, 0, 11);
            } catch (ReflectiveOperationException e) {
                throw new ExceptionInInitializerError(e);
            }
        }

        static int tiny(int x) {
            return x + 1;
        }

        static int optional(int x) {
            return (x * 3 + 7) ^ (x >>> 2);
        }

        @ForceInline
        static int forced(int x) {
            return (x * 5 + 11) ^ (x >>> 3);
        }

        static int directed(int x) {
            return (x * 7 + 13) ^ (x >>> 4);
        }

        // This natural-promotion root is monitor-eligible for early C1L.
        static synchronized int target(int x) throws Throwable {
            int[] a = {x};
            int[] b = new int[1];
            System.arraycopy(a, 0, b, 0, 1);
            Object adapted = (Object) ADAPTED.invokeExact((Object) Integer.valueOf(x));
            return tiny(x) + optional(x) + forced(x) + directed(x)
                 + (int) HANDLE.invokeExact(x) + (int) (Integer) adapted
                 + (int) BOUND.invokeExact() + Math.abs(b[0]);
        }

        static void verify(int x) throws Throwable {
            int expected = (x + 1) + 3 * ((x * 3 + 7) ^ (x >>> 2)) + ((11 * 3 + 7) ^ (11 >>> 2))
                         + ((x * 5 + 11) ^ (x >>> 3)) + ((x * 7 + 13) ^ (x >>> 4)) + Math.abs(x);
            if (target(x) != expected)
                throw new AssertionError("wrong result for " + x);
        }

        public static void main(String[] args) throws Throwable {
            for (int i = 0; i < 20; i++)
                verify(i);
            Method method = Work.class.getDeclaredMethod("target", int.class);
            int level = Integer.parseInt(args[0]);
            if (level == 0) {
                boolean sawC1L = false;
                for (int i = 20; i < 100_000; i++) {
                    verify(i);
                    int current = WB.getMethodCompilationLevel(method);
                    if (current == 3)
                        sawC1L = true;
                    if (current == 4) {
                        if (!sawC1L)
                            throw new AssertionError("missing natural C1L tier");
                        verify(-31);
                        System.out.println("NATURAL_C2_OK at call " + (i + 1));
                        System.out.println("CHECKSUM_OK");
                        return;
                    }
                }
                throw new AssertionError("natural C2 promotion missing");
            }
            if (!WB.enqueueMethodForCompilation(method, level)
                || WB.getMethodCompilationLevel(method) != level)
                throw new AssertionError("requested level not installed");
            for (int i = -20; i < 20; i++)
                verify(i);
            WB.deoptimizeMethod(method);
            for (int i = -20; i < 20; i++)
                verify(i);
            System.out.println("CHECKSUM_OK");
        }
    }
}
