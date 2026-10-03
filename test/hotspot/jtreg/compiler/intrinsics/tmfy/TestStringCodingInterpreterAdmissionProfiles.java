/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
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
 * @summary A live interpreter MDP retains every original UTF-16 admission and conversion branch profile
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.compiler1.enabled & vm.compiler2.enabled & vm.flagless
 * @library /test/lib
 * @modules java.base/java.lang:+open java.base/jdk.internal.access
 * @build jdk.test.whitebox.WhiteBox compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmission
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmissionProfiles
 */
package compiler.intrinsics.tmfy;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

import static compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmission.SMALL_UNITS;
import static compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmission.check;
import static compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmission.prefix;
import static compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmission.readiness;

public class TestStringCodingInterpreterAdmissionProfiles {
    private static final int REPETITIONS = 19;
    private static final String PASS = "STRING_CODING_INTERPRETER_PROFILES_OK";
    private static volatile byte[] sink;
    private record Counts(long taken, long notTaken) { }

    private static void child(boolean rewrite) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        check(Boolean.TRUE.equals(wb.getBooleanVMFlag("ProfileInterpreter")), "interpreter profiling is disabled");
        Method origin = String.class.getDeclaredMethod("encodeUTF8_UTF16", byte[].class, Class.class);
        String[] inputs = Arrays.stream(SMALL_UNITS).mapToObj(n -> prefix(n, '\u0100')).toArray(String[]::new);
        Field ready = readiness();
        check(!ready.getBoolean(null), "converter is already ready");
        check(wb.getMethodData(origin) == 0, "startup allocated an origin MDO");
        String bytecodes = wb.printMethods("java.lang.String", "encodeUTF8_UTF16", 0x3);
        String opcode = rewrite ? "string_utf8_cold" : "iload";
        check(Pattern.compile("(?m)^\\s*37\\s+" + opcode + "(?:\\s|$)").matcher(bytecodes).find(),
                "unexpected raw admission opcode, rewrite=" + rewrite + "\n" + bytecodes);
        check(rewrite || !bytecodes.contains("string_utf8_cold"), "rewrite-disabled origin contains cold marker");
        // Execute the cold origin first, before allocating its first MDO. The
        // next entry must then use the ordinary bytecodes with a non-null MDP.
        sink = inputs[3].getBytes(StandardCharsets.UTF_8);
        check(wb.getMethodData(origin) == 0, "cold conversion unexpectedly allocated an MDO");
        wb.markMethodProfiled(origin);
        check(wb.getMethodData(origin) != 0, "WhiteBox did not create an MDO");
        check(!wb.isMethodCompiled(origin) && !wb.isMethodCompiled(origin, true), "origin is compiled");
        for (int i = 0; i < REPETITIONS; ++i) {
            for (String text : inputs) {
                byte[] encoded = text.getBytes(StandardCharsets.UTF_8);
                check(encoded.length == text.length() + 1
                                && encoded[encoded.length - 2] == (byte) 0xc4
                                && encoded[encoded.length - 1] == (byte) 0x80,
                        "profiled conversion output");
                for (int j = 0; j < encoded.length - 2; ++j) check(encoded[j] == 'a', "ASCII prefix changed");
                sink = encoded;
            }
        }
        check(!ready.getBoolean(null), "profiled small work initialized converter");
        check(!wb.isMethodCompiled(origin) && !wb.isMethodCompiled(origin, true), "origin compiled during profiling");
        System.out.println(PASS);
    }

    private static OutputAnalyzer run(boolean rewrite) throws Exception {
        // -Xint disables ProfileInterpreter on some configurations. Keep the
        // normal interpreter profiler and prevent compilation of this origin.
        return ProcessTools.executeTestJava(
                "-Xshare:off", "-Xbootclasspath/a:.", "-XX:+UseG1GC",
                "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI", "-XX:+PrintMethodData",
                "-XX:CompileThresholdScaling=100000", "-XX:+ProfileInterpreter",
                "-XX:CompileCommand=exclude,java.lang.String::encodeUTF8_UTF16",
                "-XX:" + (rewrite ? "+" : "-") + "RewriteBytecodes",
                "--add-opens=java.base/java.lang=ALL-UNNAMED",
                "--add-exports=java.base/jdk.internal.access=ALL-UNNAMED",
                TestStringCodingInterpreterAdmissionProfiles.class.getName(), "child", Boolean.toString(rewrite))
                .shouldHaveExitValue(0).shouldContain(PASS);
    }

    private static Map<Integer, Counts> branches(OutputAnalyzer output) {
        String text = output.getOutput();
        int start = text.indexOf("java.lang.String::encodeUTF8_UTF16([BLjava/lang/Class;)[B");
        check(start >= 0, "origin MDO missing\n" + text);
        int end = text.indexOf("------------------------------------------------------------------------", start);
        String data = end < 0 ? text.substring(start) : text.substring(start, end);
        Matcher matcher = Pattern.compile("bci:\\s*(\\d+)\\s+BranchData[^\\n]*taken\\((\\d+)\\)[^\\n]*\\R\\s*not taken\\((\\d+)\\)")
                .matcher(data);
        Map<Integer, Counts> result = new TreeMap<>();
        while (matcher.find()) {
            int bci = Integer.parseInt(matcher.group(1));
            check(result.put(bci, new Counts(Long.parseLong(matcher.group(2)),
                    Long.parseLong(matcher.group(3)))) == null, "duplicate branch BCI " + bci);
        }
        return result;
    }

    private static Map<Integer, Counts> expected() {
        Map<Integer, Counts> counts = new TreeMap<>();
        for (int bci : new int[] {14, 41, 49, 53, 61, 67, 73, 95, 103, 111, 130,
                165, 180, 205, 223, 244, 289, 300, 306, 320, 334, 338, 501}) {
            counts.put(bci, new Counts(0, 0));
        }
        long calls = (long) SMALL_UNITS.length * REPETITIONS;
        long units = Arrays.stream(SMALL_UNITS).asLongStream().sum() * REPETITIONS;
        long belowMinimum = Arrays.stream(SMALL_UNITS).filter(n -> n < 16).count() * REPETITIONS;
        long eligible = calls - belowMinimum;
        counts.put(14, new Counts(calls, 0));
        counts.put(41, new Counts(belowMinimum, eligible));
        for (int bci : List.of(49, 53, 61)) counts.put(bci, new Counts(0, eligible));
        counts.put(67, new Counts(eligible, 0));
        counts.put(165, new Counts(0, units));
        counts.put(180, new Counts(units - calls, calls));
        counts.put(205, new Counts(calls, calls));
        counts.put(223, new Counts(calls, 0));
        counts.put(244, new Counts(0, calls));
        counts.put(501, new Counts(calls, 0));
        return counts;
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) { child(Boolean.parseBoolean(args[1])); return; }
        Map<Integer, Counts> wanted = expected();
        for (boolean rewrite : new boolean[] {false, true}) {
            Map<Integer, Counts> actual = branches(run(rewrite));
            check(actual.equals(wanted), "original branch profiles changed, rewrite=" + rewrite
                    + "\nexpected " + wanted + "\nactual   " + actual);
        }
    }
}
