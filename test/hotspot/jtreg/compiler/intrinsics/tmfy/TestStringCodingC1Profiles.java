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
 * @summary C1 Latin-1 chunks preserve original branch, invocation and backedge profiles and tiered promotion
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.compiler1.enabled & vm.compiler2.enabled & vm.flagless
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.intrinsics.tmfy.TestStringCodingC1Profiles
 */
package compiler.intrinsics.tmfy;

import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.lib.util.StringCodingAccess;
import jdk.test.whitebox.WhiteBox;

public class TestStringCodingC1Profiles {
    private static final int[] SUFFIXES = {15, 16, 17, 4095, 4096, 4097, 4111, 4112, 8192, 8193};
    private static final int REPETITIONS = 17;
    private static volatile byte[] sink;
    private record Input(String text, byte[] expected, int suffix, int negatives) { }

    private static Input input(int suffix) {
        int prefix = 7;
        char[] chars = new char[prefix + suffix];
        Arrays.fill(chars, 'a');
        int negatives = 0;
        for (int i = 0; i < suffix; i += 3) {
            chars[prefix + i] = (char) (0x80 + (i & 0x7f));
            ++negatives;
        }
        byte[] expected = new byte[chars.length + negatives];
        int p = 0;
        for (char c : chars) {
            if (c < 128) expected[p++] = (byte)c;
            else {
                expected[p++] = (byte)(0xc0 | c >> 6);
                expected[p++] = (byte)(0x80 | c & 0x3f);
            }
        }
        return new Input(new String(chars), expected, suffix, negatives);
    }

    private static void convert(Input input) {
        byte[] actual = input.text.getBytes(StandardCharsets.UTF_8);
        if (!Arrays.equals(actual, input.expected)) {
            throw new AssertionError("UTF-8 mismatch at " + Arrays.mismatch(actual, input.expected) +
                    ", actual length " + actual.length + ", expected length " + input.expected.length +
                    ", suffix " + input.suffix);
        }
        sink = actual;
    }

    private static Method prepare(int level, boolean pristineProfile) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        Method origin = String.class.getDeclaredMethod("encodeUTF8", byte.class, byte[].class, Class.class);
        wb.testSetDontInlineMethod(origin, true);
        if (!StringCodingAccess.ready()) throw new AssertionError("native initialization failed");
        convert(input(17));
        wb.deoptimizeMethod(origin);
        // clearMethodState resets invocation/backedge counters, not branch
        // cells. The profile child suppresses automatic startup profiling and
        // checks that this explicit request creates the first MDO.
        if (pristineProfile && wb.getMethodData(origin) != 0) {
            throw new AssertionError("origin already has profiling history");
        }
        wb.markMethodProfiled(origin);
        if (!wb.enqueueMethodForCompilation(origin, level) || wb.getMethodCompilationLevel(origin) != level) {
            throw new AssertionError("requested C1 level missing: " + level);
        }
        return origin;
    }

    private static void child(String[] args) throws Exception {
        int level = Integer.parseInt(args[1]);
        boolean enabled = Boolean.parseBoolean(args[2]);
        WhiteBox wb = WhiteBox.getWhiteBox();
        Input[] inputs = args[0].equals("profile")
                ? Arrays.stream(SUFFIXES).mapToObj(TestStringCodingC1Profiles::input).toArray(Input[]::new)
                : null;
        Method origin = prepare(level, args[0].equals("profile"));
        if (args[0].equals("promotion")) {
            Input input = input(Integer.parseInt(args[3]));
            long[] before = StringCodingAccess.counters0();
            wb.clearMethodState(origin);
            for (int i = 0; i < 200; ++i) {
                convert(input);
                if (wb.getMethodCompilationLevel(origin) >= level + 1 ||
                        wb.getMethodCompilationLevel(origin, true) >= level + 1) {
                    long[] after = StringCodingAccess.counters0();
                    if (enabled ? after[0] <= before[0] : after[0] != before[0]) {
                        throw new AssertionError("promotion used the wrong native route");
                    }
                    if (after[1] != before[1] || after[2] != before[2]) {
                        throw new AssertionError("promotion used JNI or rejected a chunk");
                    }
                    return;
                }
            }
            throw new AssertionError("logical backedges did not promote C1 level " + level);
        }
        long[] before = StringCodingAccess.counters0();
        wb.clearMethodState(origin);
        for (int i = 0; i < REPETITIONS; ++i) for (Input input : inputs) convert(input);
        long[] after = StringCodingAccess.counters0();
        long chunks = 0;
        for (int n : SUFFIXES) chunks += n / 4096 + (n % 4096 >= 16 ? 1 : 0);
        chunks *= REPETITIONS;
        if (after[0] - before[0] != (enabled ? chunks : 0)) throw new AssertionError("wrong native chunk count");
        if (after[1] != before[1] || after[2] != before[2]) throw new AssertionError("unexpected JNI or rejection");
        if (wb.getMethodCompilationLevel(origin) != level) throw new AssertionError("C1 profile level changed");
    }

    private static OutputAnalyzer run(String mode, int level, boolean enabled, int suffix) throws Exception {
        var options = new ArrayList<String>();
        options.addAll(Arrays.asList("-Xbootclasspath/a:.", "-Xbatch", "-XX:+UseG1GC",
                "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI", "-XX:+TmfyStringCodingCounters",
                "--add-opens=java.base/java.lang=ALL-UNNAMED", enabled ? "-XX:+UseTmfyStringCoding" : "-XX:-UseTmfyStringCoding"));
        if (mode.equals("profile")) {
            options.add("-Xshare:off");
            options.add("-XX:CompileThresholdScaling=100000");
            options.add("-XX:TieredStopAtLevel=" + level);
            options.add("-XX:+PrintMethodData");
        } else {
            options.addAll(Arrays.asList("-XX:Tier2BackedgeNotifyFreqLog=8", "-XX:Tier3BackedgeNotifyFreqLog=8",
                    "-XX:Tier2InvokeNotifyFreqLog=20", "-XX:Tier3InvokeNotifyFreqLog=20",
                    "-XX:Tier3BackEdgeThreshold=512", "-XX:Tier4BackEdgeThreshold=1024"));
        }
        options.addAll(Arrays.asList(TestStringCodingC1Profiles.class.getName(), mode,
                Integer.toString(level), Boolean.toString(enabled), Integer.toString(suffix)));
        return ProcessTools.executeTestJava(options.toArray(String[]::new)).shouldHaveExitValue(0);
    }

    private static String originProfile(OutputAnalyzer output) {
        String all = output.getOutput();
        String header = "java.lang.String::encodeUTF8(B[BLjava/lang/Class;)[B";
        int begin = all.indexOf(header);
        if (begin < 0) throw new AssertionError("origin MDO missing\n" + all);
        int end = all.indexOf("------------------------------------------------------------------------", begin);
        return end < 0 ? all.substring(begin) : all.substring(begin, end);
    }

    private static long value(String data, String expression) {
        Matcher matcher = Pattern.compile(expression, Pattern.DOTALL).matcher(data);
        if (!matcher.find()) throw new AssertionError("missing " + expression + "\n" + data);
        return Long.parseLong(matcher.group(1));
    }

    private static void equals(long actual, long expected, String label) {
        if (actual != expected) throw new AssertionError(label + ": " + actual + " != " + expected);
    }

    private static void checkProfile(String data, int level) {
        long bytes = Arrays.stream(SUFFIXES).asLongStream().sum() * REPETITIONS;
        long negatives = Arrays.stream(SUFFIXES).mapToLong(n -> (n + 2) / 3).sum() * REPETITIONS;
        // prepare executes the origin once before creating its MDO. Resetting
        // its MethodCounters deliberately retains 1 to distinguish an executed
        // method from a never-executed method (InvocationCounter::reset).
        equals(value(data, "invocation_counter:\\s*(\\d+)"), 1 + SUFFIXES.length * REPETITIONS, "invocations");
        equals(value(data, "backedge_counter:\\s*(\\d+)"), 1 + bytes, "backedges");
        if (level == 3) {
            equals(value(data, "bci: 64\\s+BranchData[^\\n]*taken\\((\\d+)\\)"), SUFFIXES.length * REPETITIONS, "loop exits");
            equals(value(data, "bci: 64\\s+BranchData[^\\n]*\\n\\s*not taken\\((\\d+)\\)"), bytes, "loop body");
            equals(value(data, "bci: 75\\s+BranchData[^\\n]*taken\\((\\d+)\\)"), bytes - negatives, "ASCII bytes");
            equals(value(data, "bci: 75\\s+BranchData[^\\n]*\\n\\s*not taken\\((\\d+)\\)"), negatives, "non-ASCII bytes");
            equals(value(data, "bci: 118\\s+JumpData[^\\n]*taken\\((\\d+)\\)"), negatives, "two-byte branch");
            equals(value(data, "bci: 134\\s+JumpData[^\\n]*taken\\((\\d+)\\)"), bytes, "loop jumps");
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) { child(args); return; }
        for (int level : new int[] {2, 3}) {
            for (boolean enabled : new boolean[] {false, true}) checkProfile(originProfile(run("profile", level, enabled, 0)), level);
            for (int suffix : new int[] {17, 4095, 4097}) {
                run("promotion", level, false, suffix);
                run("promotion", level, true, suffix);
            }
        }
    }
}
