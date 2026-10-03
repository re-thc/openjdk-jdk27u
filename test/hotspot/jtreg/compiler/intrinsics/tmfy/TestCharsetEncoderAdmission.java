/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
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
 * @summary Charset admission respects caller directives and out-of-line predicate execution
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.gc.Serial & vm.compiler1.enabled & vm.compiler2.enabled & vm.flagless
 * @library /test/lib
 * @modules java.base/sun.nio.cs:+open java.base/java.lang:+open
 * @build compiler.intrinsics.tmfy.CharsetEncoderTestSupport jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.intrinsics.tmfy.TestCharsetEncoderAdmission
 */
package compiler.intrinsics.tmfy;

import java.util.ArrayList;
import java.util.List;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.NMethod;

import static compiler.intrinsics.tmfy.CharsetEncoderTestSupport.*;

public class TestCharsetEncoderAdmission {
    private static final String TYPED = "_tmfy_encodeUtf16ArrayUtf8";
    private static final String POLICY_ID = "_tmfy_useNativeEncoder";
    private static final String MATCH = HOLDER + "::encodeArrayLoopSlow";

    public static void main(String[] args) throws Throwable {
        if (args.length != 0) {
            runChild(args[0], Integer.parseInt(args[1]));
            return;
        }
        // Exercise admission controls at both compiler tiers. The disabled
        // typed callee plus interpreted out-of-line predicate case catches a
        // compiled caller inheriting interpreter-only raw-leaf permission.
        for (String mode : List.of("policy-root", "out-of-line-disabled", "target-whitebox",
                "target-directive", "caller-disable", "policy-disable", "no-inline")) {
            for (int level : new int[] {1, 4}) launch(mode, level);
        }
        launch("unsupported-collector", 1);
    }

    private static void launch(String mode, int level) throws Exception {
        List<String> options = new ArrayList<>(List.of(
                "-Xbootclasspath/a:.", "-Xbatch", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                "-XX:+TmfyStringCodingCounters", "--add-opens=java.base/sun.nio.cs=ALL-UNNAMED",
                "--add-opens=java.base/java.lang=ALL-UNNAMED",
                mode.equals("unsupported-collector") ? "-XX:+UseSerialGC" : "-XX:+UseG1GC",
                level == 1 ? "-XX:TieredStopAtLevel=1" : "-XX:-TieredCompilation"));
        if (mode.equals("policy-disable")) options.add("-XX:DisableIntrinsic=" + POLICY_ID);
        // Use the CompileCommand path that fills the effective intrinsic-control
        // table. The JSON string option alone does not populate it in this VM.
        String disabled = switch (mode) {
            case "policy-root" -> POLICY_ID;
            case "out-of-line-disabled" -> POLICY_ID + "," + TYPED;
            case "caller-disable" -> TYPED;
            default -> null;
        };
        if (disabled != null) {
            options.add("-XX:CompileCommand=option," + MATCH + ",ccstrlist,DisableIntrinsic," + disabled);
        }
        if (mode.equals("no-inline")) options.add("-XX:-Inline");
        options.add(TestCharsetEncoderAdmission.class.getName());
        options.add(mode);
        options.add(Integer.toString(level));
        ProcessTools.executeTestJava(options.toArray(String[]::new)).shouldHaveExitValue(0)
                .shouldContain("CHARSET_ENCODER_ADMISSION_OK " + mode + " level=" + level);
    }

    private static void runChild(String mode, int level) throws Throwable {
        WhiteBox wb = WhiteBox.getWhiteBox();
        wb.testSetDontInlineMethod(ORIGIN, true);
        if (mode.equals("policy-root")) {
            wb.testSetDontInlineMethod(POLICY, true);
            check(wb.enqueueMethodForCompilation(POLICY, level), "policy root compilation rejected");
            NMethod policy = NMethod.get(POLICY, false);
            check(policy != null && policy.comp_level == level, "policy root nmethod missing");
            check(!(boolean) invoke(POLICY), "reusable compiled predicate must execute its false body");
            check(NMethod.get(POLICY, false).compile_id == policy.compile_id,
                    "policy invocation invalidated the root being tested");
            // The caller-local launch option disables the policy intrinsic,
            // forcing this caller through the independently compiled false body.
        } else if (mode.equals("out-of-line-disabled")) {
            wb.testSetDontInlineMethod(POLICY, true);
            wb.makeMethodNotCompilable(POLICY);
            wb.deoptimizeMethod(POLICY);
            // Disabling both intrinsics locally leaves global interpreter
            // eligibility intact. The specialized entry must reject this
            // compiled caller's return PC rather than bypass its directive.
        } else if (mode.equals("target-whitebox")) {
            wb.testSetDontInlineMethod(NATIVE, true);
        } else if (mode.equals("target-directive")) {
            addDirective(wb, "inline: [\"-" + HOLDER + "::" + NATIVE_NAME + "\"]");
        }

        PublicCall call = new PublicCall();
        for (int i = 0; i < 300; i++) call.run();
        wb.deoptimizeMethod(ORIGIN);
        check(wb.enqueueMethodForCompilation(ORIGIN, level), "origin compilation rejected");
        NMethod origin = NMethod.get(ORIGIN, false);
        check(origin != null && origin.comp_level == level, "exact Charset slow-loop compilation missing");
        long[] before = counters();
        for (int i = 0; i < 100; i++) call.run();
        // C2's intrinsic-first call selection remains active with -Inline;
        // that flag disables ordinary bytecode inlining, not intrinsics.
        // C1's call selection checks Inline before attempting the intrinsic.
        long expectedLeaves = mode.equals("no-inline") && level == 4 ? 100 : 0;
        route(before, expectedLeaves, 0, "compiled public route for " + mode);
        NMethod after = NMethod.get(ORIGIN, false);
        check(after != null && after.compile_id == origin.compile_id,
                "recorded Charset nmethod was not retained during measured calls");
        if (mode.equals("out-of-line-disabled")) {
            check(NMethod.get(POLICY, false) == null, "out-of-line predicate unexpectedly compiled");
        }
        // Functional coverage is outside the measured nmethod window because
        // uncommon error cases are permitted to deoptimize this compiled method.
        semantics();
        System.out.println("CHARSET_ENCODER_ADMISSION_OK " + mode + " level=" + level);
    }

    private static void addDirective(WhiteBox wb, String option) {
        check(wb.addCompilerDirective("[{ match: \"" + MATCH + "\", " + option + " }]") == 1,
                "caller directive rejected: " + option);
    }
}
