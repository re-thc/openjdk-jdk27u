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
 * @summary Public Latin-1 UTF-8 conversion executes distinct C1 root and original-loop OSR entries
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.compiler1.enabled & vm.flagless
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.intrinsics.tmfy.TestStringCodingC1Entry
 */
package compiler.intrinsics.tmfy;

import java.lang.classfile.ClassFile;
import java.lang.classfile.attribute.CodeAttribute;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.process.ProcessTools;
import jdk.test.lib.util.StringCodingAccess;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.NMethod;

public class TestStringCodingC1Entry {
    private static volatile byte[] sink;

    private static void checkOriginalLoop() throws Exception {
        try (var stream = String.class.getResourceAsStream("String.class")) {
            var origin = ClassFile.of().parse(stream.readAllBytes()).methods().stream()
                    .filter(m -> m.methodName().equalsString("encodeUTF8") &&
                            m.methodType().equalsString("(B[BLjava/lang/Class;)[B"))
                    .findFirst().orElseThrow();
            byte[] code = ((CodeAttribute)origin.code().orElseThrow()).codeArray();
            // The OSR entry must be the original loop header, reached by its
            // original iinc/goto. Fail explicitly if the Java origin changes.
            if (code.length != 156 || (code[60] & 255) != 0x15 || code[61] != 6 ||
                    (code[131] & 255) != 0x84 || code[132] != 6 || code[133] != 1 ||
                    (code[134] & 255) != 0xa7 ||
                    134 + (short)((code[135] & 255) << 8 | (code[136] & 255)) != 60) {
                throw new AssertionError("original loop 60/131/134 changed");
            }
        }
    }

    private static void child(String mode, int level) throws Exception {
        WhiteBox WB = WhiteBox.getWhiteBox();
        checkOriginalLoop();
        char[] chars = new char[7 + 32769];
        Arrays.fill(chars, 'a');
        int negatives = 0;
        for (int i = 7; i < chars.length; i += 3) {
            chars[i] = (char)(0x80 + (i & 127));
            ++negatives;
        }
        String input = new String(chars);
        byte[] expected = new byte[chars.length + negatives];
        int p = 0;
        for (char c : chars) {
            if (c < 128) expected[p++] = (byte)c;
            else {
                expected[p++] = (byte)(0xc0 | c >> 6);
                expected[p++] = (byte)(0x80 | c & 63);
            }
        }
        if (!StringCodingAccess.ready()) throw new AssertionError("native setup failed");
        Method origin = String.class.getDeclaredMethod("encodeUTF8", byte.class, byte[].class, Class.class);
        WB.testSetDontInlineMethod(origin, true);
        WB.deoptimizeMethod(origin, false);
        WB.deoptimizeMethod(origin, true);
        boolean osr = mode.equals("osr");
        if (!WB.enqueueMethodForCompilation(origin, level, osr ? 60 : -1)) {
            throw new AssertionError("C1 compilation rejected");
        }
        NMethod compiled = NMethod.get(origin, osr);
        if (compiled == null || compiled.comp_level != level || NMethod.get(origin, !osr) != null ||
                (osr && WB.getMethodEntryBci(origin) != 60)) {
            throw new AssertionError("wrong C1 entry before conversion");
        }
        long[] before = StringCodingAccess.counters0();
        byte[] actual = input.getBytes(StandardCharsets.UTF_8);
        long[] after = StringCodingAccess.counters0();
        if (!Arrays.equals(actual, expected)) throw new AssertionError("public conversion mismatch");
        sink = actual;
        long chunks = after[0] - before[0];
        if (chunks <= 0 || (!osr && chunks != 8) || after[1] != before[1] || after[2] != before[2]) {
            throw new AssertionError("wrong native route: raw=" + chunks +
                    " JNI=" + (after[1] - before[1]) + " rejected=" + (after[2] - before[2]));
        }
        NMethod retained = NMethod.get(origin, osr);
        if (retained == null || retained.compile_id != compiled.compile_id || NMethod.get(origin, !osr) != null) {
            throw new AssertionError("entry changed during conversion");
        }
        // An OSR nmethod merely existing is not proof of entry. The positive
        // raw-leaf delta, absent regular nmethod, and DontInline boundary prove
        // actual entry: the unmodified interpreted Latin-1 loop cannot call it.
        System.out.println("ENTRY_PASS " + mode + " level=" + level + " chunks=" + chunks +
                " compile_id=" + compiled.compile_id + " original_loop=60/134");
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) { child(args[0], Integer.parseInt(args[1])); return; }
        for (int level : new int[] {1, 3}) for (String mode : new String[] {"root", "osr"}) {
            ProcessTools.executeTestJava("-Xbootclasspath/a:.", "-Xbatch", "-Xshare:off",
                    "-XX:+UseG1GC", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                    "-XX:+UseTmfyStringCoding", "-XX:+TmfyStringCodingCounters",
                    "--add-opens=java.base/java.lang=ALL-UNNAMED", "-XX:TieredStopAtLevel=" + level,
                    "-XX:Tier3InvocationThreshold=2147483647", "-XX:Tier3MinInvocationThreshold=2147483647",
                    "-XX:Tier3CompileThreshold=2147483647", "-XX:Tier3BackEdgeThreshold=2147483647",
                    "-XX:Tier0BackedgeNotifyFreqLog=8",
                    mode.equals("root") ? "-XX:-UseOnStackReplacement" : "-XX:+UseOnStackReplacement",
                    TestStringCodingC1Entry.class.getName(),
                    mode, Integer.toString(level)).shouldHaveExitValue(0).shouldContain("ENTRY_PASS " + mode);
        }
    }
}
