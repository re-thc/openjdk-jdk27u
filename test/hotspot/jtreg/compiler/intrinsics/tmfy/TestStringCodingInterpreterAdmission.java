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
 * @summary Cold interpreted UTF-16 admission preserves results, strict errors, readiness and class initialization
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.flagless
 * @library /test/lib
 * @modules java.base/java.lang:+open java.base/jdk.internal.access
 * @run driver compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmission
 */
/*
 * @test id=cds
 * @summary Archived String retains cold interpreter admission and its rewrite-disabled fallback
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.cds & vm.flagless
 * @library /test/lib
 * @modules java.base/java.lang:+open java.base/jdk.internal.access
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmission cds-driver
 */
package compiler.intrinsics.tmfy;

import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.charset.UnmappableCharacterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

import jdk.internal.access.SharedSecrets;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class TestStringCodingInterpreterAdmission {
    static final int[] SMALL_UNITS = {1, 8, 15, 16, 17, 511};
    private static final String ENTER = "STRING_CODING_INTERPRETER_CHILD_ENTER";
    private static final String PASS = "STRING_CODING_INTERPRETER_ADMISSION_OK";

    static Field readiness() throws Exception {
        Field field = Class.forName("java.lang.StringCoding").getDeclaredField("utf8Ready");
        field.setAccessible(true);
        return field;
    }

    // Build both input and oracle without executing a String UTF-8 conversion.
    static String prefix(int units, char last) {
        char[] chars = new char[units];
        Arrays.fill(chars, 'a');
        if (units != 0) chars[units - 1] = last;
        return new String(chars);
    }

    private static byte[] expected(String text) {
        byte[] bytes = new byte[text.length() * 3];
        int p = 0;
        for (int i = 0; i < text.length(); ++i) {
            int c = text.charAt(i);
            if (c < 0x80) {
                bytes[p++] = (byte) c;
            } else if (c < 0x800) {
                bytes[p++] = (byte) (0xc0 | c >> 6);
                bytes[p++] = (byte) (0x80 | c & 0x3f);
            } else if (Character.isSurrogate((char) c)) {
                if (Character.isHighSurrogate((char) c) && i + 1 < text.length()
                        && Character.isLowSurrogate(text.charAt(i + 1))) {
                    int cp = Character.toCodePoint((char) c, text.charAt(++i));
                    bytes[p++] = (byte) (0xf0 | cp >> 18);
                    bytes[p++] = (byte) (0x80 | cp >> 12 & 0x3f);
                    bytes[p++] = (byte) (0x80 | cp >> 6 & 0x3f);
                    bytes[p++] = (byte) (0x80 | cp & 0x3f);
                } else {
                    bytes[p++] = '?';
                }
            } else {
                bytes[p++] = (byte) (0xe0 | c >> 12);
                bytes[p++] = (byte) (0x80 | c >> 6 & 0x3f);
                bytes[p++] = (byte) (0x80 | c & 0x3f);
            }
        }
        return Arrays.copyOf(bytes, p);
    }

    static void convert(String text) {
        byte[] wanted = expected(text);
        byte[] actual = text.getBytes(StandardCharsets.UTF_8);
        check(Arrays.equals(wanted, actual), "replacement output, units=" + text.length());
        byte[] second = text.getBytes(StandardCharsets.UTF_8);
        check(actual != second && Arrays.equals(wanted, second), "result array ownership");
    }

    static void strict(String text, int malformed) throws Exception {
        for (boolean utf8Only : new boolean[] {false, true}) {
            try {
                byte[] bytes = utf8Only
                        ? SharedSecrets.getJavaLangAccess().getBytesUTF8OrThrow(text)
                        : SharedSecrets.getJavaLangAccess().uncheckedGetBytesOrThrow(text, StandardCharsets.UTF_8);
                check(malformed < 0, "strict encoder accepted a surrogate at " + malformed);
                check(Arrays.equals(bytes, expected(text)), "strict output changed");
            } catch (UnmappableCharacterException error) {
                check(malformed >= 0 && error.getInputLength() == 1, "strict exception type or length");
                check(error.getCause() instanceof IllegalArgumentException
                                && error.getCause().getMessage().equals(
                                        "malformed input offset : " + malformed + ", length : 1"),
                        "strict exception offset changed");
            }
        }
    }

    private static void cases(int units) throws Exception {
        for (char last : new char[] {'\u0100', '\u4e2d', '\ud800', '\udc00'}) {
            String text = prefix(units, last);
            convert(text);
            strict(text, Character.isSurrogate(last) ? units - 1 : -1);
        }
        char[] chars = new char[units];
        Arrays.fill(chars, '\u0100');
        String text = new String(chars);
        convert(text);
        strict(text, -1);
        if (units >= 2) {
            Arrays.fill(chars, 'a');
            chars[units - 2] = '\ud83d';
            chars[units - 1] = '\ude00';
            text = new String(chars);
            convert(text);
            strict(text, -1);
            chars[0] = '\udc00';
            text = new String(chars);
            convert(text);
            strict(text, 0);
        }
    }

    private static void child(boolean archived) throws Exception {
        // This marker precedes our reflective readiness observation. Record
        // initialization timing against the rewrite-disabled control for this
        // same VM configuration, without assuming a universal startup order.
        System.out.println(ENTER);
        Field ready = readiness();
        if (archived) {
            WhiteBox wb = WhiteBox.getWhiteBox();
            check(wb.isSharedClass(String.class) && wb.isSharedClass(ready.getDeclaringClass()),
                    "String and StringCoding must come from the archive");
            // The raw archived marker survives even when runtime rewriting is
            // disabled; the template must then execute the ordinary iload.
            String bytecodes = wb.printMethods("java.lang.String", "encodeUTF8_UTF16", 0x3);
            check(Pattern.compile("(?m)^\\s*37\\s+string_utf8_cold(?:\\s|$)").matcher(bytecodes).find(),
                    "archive did not retain the cold admission marker\n" + bytecodes);
        }
        check(!ready.getBoolean(null), "converter initialized before the first test conversion");
        cases(0);
        check(!ready.getBoolean(null), "empty input initialized converter");
        for (int units : SMALL_UNITS) {
            cases(units);
            check(!ready.getBoolean(null), "small input initialized converter: " + units);
        }
        // Even at the cold-work boundary, strict callers must retain their
        // exception path and must not initialize the replacement converter.
        strict(prefix(512, '\u0100'), -1);
        strict(prefix(512, '\ud800'), 511);
        check(!ready.getBoolean(null), "strict work initialized converter");
        convert(prefix(512, '\u0100'));
        check(ready.getBoolean(null), "512 code units did not initialize converter");
        cases(512);
        cases(0);
        for (int units : SMALL_UNITS) cases(units);
        check(ready.getBoolean(null), "readiness was not monotonic");
        System.out.println(PASS);
    }

    private static boolean run(boolean rewrite, boolean compact, boolean archived) throws Exception {
        List<String> options = new ArrayList<>(List.of(
                "-Xint", "-XX:+UseG1GC", "-Xlog:class+init=info",
                "-XX:" + (rewrite ? "+" : "-") + "RewriteBytecodes",
                "-XX:" + (compact ? "+" : "-") + "CompactStrings",
                archived ? "-Xshare:on" : "-Xshare:off",
                "--add-opens=java.base/java.lang=ALL-UNNAMED",
                "--add-exports=java.base/jdk.internal.access=ALL-UNNAMED"));
        if (archived) {
            options.addAll(List.of("-Xbootclasspath/a:.", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI"));
        }
        options.addAll(List.of(TestStringCodingInterpreterAdmission.class.getName(),
                "child", Boolean.toString(archived)));
        OutputAnalyzer output = ProcessTools.executeTestJava(options.toArray(String[]::new))
                .shouldHaveExitValue(0).shouldContain(PASS);
        String log = output.getOutput();
        String initialization = "Initializing 'java/lang/StringCoding'";
        int initialized = log.indexOf(initialization);
        check(initialized >= 0, "StringCoding initialization was not observable\n" + log);
        check(log.indexOf(initialization, initialized + initialization.length()) < 0,
                "StringCoding initialized more than once\n" + log);
        return initialized < log.indexOf(ENTER);
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0 && args[0].equals("child")) {
            child(Boolean.parseBoolean(args[1]));
            return;
        }
        boolean archived = args.length != 0 && args[0].equals("cds-driver");
        for (boolean compact : archived ? new boolean[] {true} : new boolean[] {true, false}) {
            boolean ordinaryBeforeMain = run(false, compact, archived);
            boolean rewrittenBeforeMain = run(true, compact, archived);
            check(ordinaryBeforeMain == rewrittenBeforeMain,
                    "rewriting changed StringCoding initialization timing, compact=" + compact + ", cds=" + archived);
        }
    }

    static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
