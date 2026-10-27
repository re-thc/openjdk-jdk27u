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
 * @summary String.codePointCount and StringBuilder.codePointCount of UTF-16 text give the count of the
 *          loop that counts each unpaired surrogate as a code point, in every tier, and the
 *          intrinsic is used by C1 and C2
 * @requires (os.arch == "aarch64") | (os.arch == "amd64" & vm.cpu.features ~= ".*sse4.2.*")
 * @requires vm.compiler1.enabled & vm.compMode != "Xint"
 * @library /test/lib
 * @run main/othervm -Xint TestCodePointCount light
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestCodePointCount
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestCodePointCount
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestCodePointCount
 * @run main/othervm TestCodePointCount inlined
 */

import java.util.Random;
import java.util.regex.Pattern;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class TestCodePointCount {
    private static int checks;

    /** What the loop counts: each char, less one for each high surrogate followed by a low one. */
    private static int reference(CharSequence s, int begin, int end) {
        int count = end - begin;
        for (int i = begin; i < end - 1; ) {
            if (Character.isHighSurrogate(s.charAt(i++)) && Character.isLowSurrogate(s.charAt(i))) {
                count--;
                i++;
            }
        }
        return count;
    }

    private static void check(String text, int begin, int end) {
        int want = reference(text, begin, end);
        int got = text.codePointCount(begin, end);
        if (got != want) {
            throw new AssertionError("String.codePointCount(" + begin + ", " + end + ") of " + text.length()
                    + " chars is " + got + ", expected " + want);
        }
        StringBuilder sb = new StringBuilder(text);
        got = sb.codePointCount(begin, end);
        if (got != want) {
            throw new AssertionError("StringBuilder.codePointCount(" + begin + ", " + end + ") of " + text.length()
                    + " chars is " + got + ", expected " + want);
        }
        checks += 2;
    }

    /** Text with a char that is not Latin-1, so that the string is UTF-16, and pairs and offenders. */
    private static char[] text(Random random, int length, int pairs, int lone) {
        char[] chars = new char[length];
        for (int i = 0; i < length; i++) {
            chars[i] = random.nextInt(4) == 0 ? (char) (0x100 + random.nextInt(0xd700)) : (char) ('a' + random.nextInt(26));
        }
        for (int n = 0; n < pairs && length > 1; n++) {
            int at = random.nextInt(length - 1);
            chars[at] = (char) (0xd800 + random.nextInt(0x400));
            chars[at + 1] = (char) (0xdc00 + random.nextInt(0x400));
        }
        for (int n = 0; n < lone && length > 0; n++) {
            int at = random.nextInt(4) == 0 ? length - 1 : random.nextInt(length);
            chars[at] = random.nextBoolean() ? (char) (0xd800 + random.nextInt(0x400)) : (char) (0xdc00 + random.nextInt(0x400));
        }
        if (length > 0) {
            chars[random.nextInt(length)] = '€';
        }
        return chars;
    }

    private static void differential(boolean light) {
        Random random = new Random(0xc0de);
        int[] lengths = {0, 1, 2, 63, 64, 65, 100, 127, 128, 129, 130, 255, 256, 257, 1000, 4096, 4099};
        for (int length : lengths) {
            for (int pairs : new int[]{0, 1, length / 8, length / 2}) {
                for (int lone : new int[]{0, 1, 3}) {
                    String s = new String(text(random, length, pairs, lone));
                    check(s, 0, length);
                    if (length > 3) {
                        int a = random.nextInt(length / 2), b = length - random.nextInt(length / 2);
                        check(s, a, b);
                        check(s, a, a);
                    }
                }
            }
        }
        // A pair, and a lone surrogate, in every place around the end of the shortest bulk range of 128 chars
        for (int at = 120; at < 134; at++) {
            for (int kind = 0; kind < 4; kind++) {
                char[] chars = text(random, 260, 0, 0);
                java.util.Arrays.fill(chars, 'a');
                chars[0] = '€';
                switch (kind) {
                    case 0 -> { chars[at] = '\ud83d'; chars[at + 1] = '\ude00'; }
                    case 1 -> chars[at] = '\ud83d';
                    case 2 -> chars[at] = '\ude00';
                    default -> { chars[at] = '\ude00'; chars[at + 1] = '\ud83d'; }
                }
                String s = new String(chars);
                check(s, 0, s.length());
                check(s, 1, s.length() - 1);
            }
        }
        if (light) {
            System.out.println("passed " + checks + " checks");
            return;
        }
        // Longer than one call of the intrinsic, with a pair across the bound of a call, a lone
        // surrogate there, and an offender after it
        int bound = 1 << 20;
        for (int kind = 0; kind < 4; kind++) {
            char[] chars = new char[bound + 3000];
            java.util.Arrays.fill(chars, 'x');
            chars[7] = '€';
            int at = bound - 1;
            switch (kind) {
                case 0 -> { chars[at] = '\ud83d'; chars[at + 1] = '\ude00'; }
                case 1 -> { chars[at] = '\ud83d'; chars[at + 1] = 'y'; }
                case 2 -> { chars[at] = 'y'; chars[at + 1] = '\ude00'; }
                default -> { chars[at - 5] = '\ude00'; }
            }
            for (int i = 0; i < chars.length - 1; i += 4099) {
                if (i != at && i != at - 5 && i + 1 != at && i + 1 < chars.length) {
                    chars[i] = '\ud83d';
                    chars[i + 1] = '\ude00';
                }
            }
            String s = new String(chars);
            check(s, 0, s.length());
            check(s, 3, s.length() - 3);
        }
        System.out.println("passed " + checks + " checks");
    }

    private static void inlined() throws Exception {
        for (String mode : new String[]{"-XX:TieredStopAtLevel=1", "-XX:-TieredCompilation"}) {
            OutputAnalyzer output = ProcessTools.executeTestJava("-Xbatch", mode,
                    "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintInlining",
                    "-cp", System.getProperty("test.classes"), "CodePointWork");
            output.shouldHaveExitValue(0);
            output.shouldMatch(Pattern.quote("StringUTF16::countCodePoints") + " \\(\\d+ bytes\\)\\s+\\(?intrinsic\\)?");
        }
        // The intrinsic is what makes a long count fast: the loop of the same work with it disabled
        // takes several times as long in the interpreter
        long on = Long.parseLong(ProcessTools.executeTestJava("-Xint", "-cp", System.getProperty("test.classes"),
                "CodePointWork", "time").shouldHaveExitValue(0).getStdout().trim());
        long off = Long.parseLong(ProcessTools.executeTestJava("-Xint", "-XX:-UseSIMDUTFIntrinsics", "-cp",
                System.getProperty("test.classes"), "CodePointWork", "time").shouldHaveExitValue(0).getStdout().trim());
        System.out.println("-Xint: " + on + " ns with the leaf, " + off + " ns without");
        if (off < 10 * on) {
            throw new AssertionError("codePointCount does not reach its interpreter leaf: " + on + " ns against " + off + " ns");
        }
    }

    public static void main(String[] args) {
        if (args.length > 0 && args[0].equals("inlined")) {
            try {
                inlined();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            return;
        }
        differential(args.length > 0);
    }
}

/** Callers of codePointCount that are hot enough to be compiled and inlined, or timed. */
class CodePointWork {
    public static void main(String[] args) {
        char[] chars = new char[4096];
        java.util.Arrays.fill(chars, 'a');
        chars[5] = '€';
        chars[100] = '\ud83d';
        chars[101] = '\ude00';
        String text = new String(chars);
        long sink = 0;
        if (args.length > 0) {
            long best = Long.MAX_VALUE;
            for (int i = 0; i < 7; i++) {
                long t = System.nanoTime();
                for (int j = 0; j < 20; j++) {
                    sink += text.codePointCount(0, text.length());
                }
                best = Math.min(best, System.nanoTime() - t);
            }
            System.out.println(best);
            if (sink == 42) System.out.println(sink);
            return;
        }
        StringBuilder sb = new StringBuilder(text);
        for (int i = 0; i < 40000; i++) {
            sink += text.codePointCount(0, text.length());
            sink += sb.codePointCount(0, sb.length());
        }
        System.out.println(sink);
    }
}
