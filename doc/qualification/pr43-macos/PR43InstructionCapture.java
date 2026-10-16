/*
 * Copyright (c) 2026, re-thc. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

/*
 * @test
 * @summary Capture installed PR43 matcher probe instructions from prebuilt release VMs.
 * @requires (os.arch == "aarch64") & vm.compiler2.enabled
 * @library /test/lib /
 * @modules jdk.incubator.vector
 * @build compiler.c2.aarch64.TestLongBitfieldExtract
 *        compiler.c2.aarch64.TestTruncatedLongShift
 *        compiler.c2.aarch64.TestTruncatedLongBitwise
 *        compiler.vectorapi.TestFirstTrueMaskNormalization
 * @run driver compiler.c2.aarch64.PR43InstructionCapture compiler.c2.aarch64.TestLongBitfieldExtract
 * @run driver compiler.c2.aarch64.PR43InstructionCapture compiler.c2.aarch64.TestTruncatedLongShift
 * @run driver compiler.c2.aarch64.PR43InstructionCapture compiler.c2.aarch64.TestTruncatedLongBitwise
 * @run driver compiler.c2.aarch64.PR43InstructionCapture compiler.vectorapi.TestFirstTrueMaskNormalization
 */
package compiler.c2.aarch64;

import compiler.lib.ir_framework.Test;
import compiler.lib.ir_framework.TestFramework;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Set;

// Instruction-only driver. Original semantic and C2 assertions are preserved.
// Instruction output is separate from the normal active-IR qualification gate.
public class PR43InstructionCapture {
    private static final Set<String> ALLOWED = Set.of(
            "compiler.c2.aarch64.TestLongBitfieldExtract",
            "compiler.c2.aarch64.TestTruncatedLongShift",
            "compiler.c2.aarch64.TestTruncatedLongBitwise",
            "compiler.vectorapi.TestFirstTrueMaskNormalization");

    public static void main(String[] args) throws Exception {
        if (args.length != 1 || !ALLOWED.contains(args[0])) {
            throw new IllegalArgumentException("Choose exactly one of the four pinned PR43 matcher classes");
        }
        System.setProperty("VerifyIR", "false"); // Separate from the mandatory active-IR runs.
        Class<?> testClass = Class.forName(args[0]);
        ArrayList<String> flags = new ArrayList<>();
        flags.add("-XX:+UnlockDiagnosticVMOptions");
        flags.add("-XX:+LogCompilation");
        flags.add("-XX:LogFile=pr43-instructions-" + testClass.getSimpleName() + "-%p.log");
        if (args[0].equals("compiler.vectorapi.TestFirstTrueMaskNormalization")) {
            flags.add("--add-modules=jdk.incubator.vector");
            flags.add("-XX:UseSVE=0");
        }
        for (Method method : testClass.getDeclaredMethods()) {
            if (method.isAnnotationPresent(Test.class)) {
                flags.add("-XX:CompileCommand=print," + args[0] + "::" + method.getName());
            }
        }
        new TestFramework(testClass).addFlags(flags.toArray(String[]::new)).start();
    }
}
