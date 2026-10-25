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
 * @summary Instant parsing intrinsic controls, execution tiers and values
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires vm.simpleArch == "x64" | vm.simpleArch == "aarch64"
 * @requires vm.compMode != "Xcomp"
 * @library /test/lib
 * @modules java.base/java.time:open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xint -XX:+CompactStrings compiler.intrinsics.time.TestInstantParseIntrinsic 0 true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xint -XX:-CompactStrings compiler.intrinsics.time.TestInstantParseIntrinsic 0 true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xint -XX:-UseInstantParseIntrinsic -XX:+CompactStrings
 *      compiler.intrinsics.time.TestInstantParseIntrinsic 0 false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xint -XX:-UseInstantParseIntrinsic -XX:-CompactStrings
 *      compiler.intrinsics.time.TestInstantParseIntrinsic 0 false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:TieredStopAtLevel=1 -XX:+CompactStrings
 *      compiler.intrinsics.time.TestInstantParseIntrinsic 1 true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:TieredStopAtLevel=1 -XX:-CompactStrings
 *      compiler.intrinsics.time.TestInstantParseIntrinsic 1 true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:-TieredCompilation -XX:+CompactStrings
 *      compiler.intrinsics.time.TestInstantParseIntrinsic 4 true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:-TieredCompilation -XX:-CompactStrings
 *      compiler.intrinsics.time.TestInstantParseIntrinsic 4 true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:+CompactStrings compiler.intrinsics.time.TestInstantParseIntrinsic 4 true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:-CompactStrings compiler.intrinsics.time.TestInstantParseIntrinsic 4 true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:-UseInstantParseIntrinsic -XX:+CompactStrings
 *      compiler.intrinsics.time.TestInstantParseIntrinsic 1 false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:-UseInstantParseIntrinsic -XX:-CompactStrings
 *      compiler.intrinsics.time.TestInstantParseIntrinsic 1 false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:DisableIntrinsic=_parseInstant -XX:+CompactStrings
 *      compiler.intrinsics.time.TestInstantParseIntrinsic 4 false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:DisableIntrinsic=_parseInstant -XX:-CompactStrings
 *      compiler.intrinsics.time.TestInstantParseIntrinsic 4 false
 */

package compiler.intrinsics.time;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.time.Instant;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Objects;
import jdk.test.lib.Utils;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.Compiler;
import jtreg.SkippedException;

public class TestInstantParseIntrinsic {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static Method fast;

    /*
     * Normal jtreg runs check availability, compilation and correctness.
     * With a matching VM and an INSTANT_SPEEDATE_FORCE_FAILURE JNI library,
     * -Dtest.instant.jniMiss=true additionally proves bypass of the JNI body.
     * Run the disabled controls too: they must observe MISS, confirming that
     * this is the poisoned fixture rather than an ordinary JNI implementation.
     */
    public static void main(String[] args) throws Exception {
        int level = Integer.parseInt(args[0]);
        boolean intrinsic = Boolean.parseBoolean(args[1]);
        boolean jniMiss = Boolean.getBoolean("test.instant.jniMiss");
        check(level == 0 || level == 1 || level == 4, "Unexpected compilation level");
        Class<?> config = Class.forName("java.time.InstantParserConfig");
        var enabled = config.getDeclaredField("ENABLED");
        enabled.setAccessible(true);
        if (!enabled.getBoolean(null) || "false".equals(System.getProperty("jdk.time.instantSpeedate"))) {
            check(!jniMiss, "Poisoned-JNI route proof requires an enabled native image");
            throw new SkippedException("Native Instant parsing is configured out or startup-disabled");
        }
        Class<?> parser = Class.forName("java.time.InstantParser");
        fast = parser.getDeclaredMethod("tryParse", String.class);
        fast.setAccessible(true);
        Method nativeMethod = parser.getDeclaredMethod("parse0", String.class);

        // Initialize the independent library entry before asking the compiler.
        same(Instant.parse("1970-01-01T00:00:00Z"), Instant.EPOCH, "Library initialization");
        for (int i = 0; i < 32; i++) invokeFast("1970-01-01T00:00:00Z");
        check(WB.getBooleanVMFlag("UseInstantParseIntrinsic") != null, "Intrinsic flag is missing");
        if (intrinsic) {
            check(Boolean.TRUE.equals(WB.getBooleanVMFlag("UseInstantParseIntrinsic")),
                    "Intrinsic must be enabled");
        }
        for (int compilerLevel : new int[] {1, 4}) {
            boolean compilerEnabled = compilerLevel == 1 ? Compiler.isC1Enabled() : Compiler.isC2Enabled();
            if (compilerEnabled) {
                check(WB.isIntrinsicAvailable(nativeMethod, fast, compilerLevel) == intrinsic,
                        "Wrong intrinsic availability at level " + compilerLevel);
            }
        }
        if (level != 0) {
            WB.deoptimizeMethod(fast);
            check(WB.enqueueMethodForCompilation(fast, level), "Compilation was not enqueued");
            check(Utils.waitForCondition(() -> WB.getMethodCompilationLevel(fast) == level,
                    Utils.adjustTimeout(10_000)), "Compilation did not reach the requested tier");
        }
        check(WB.getMethodCompilationLevel(fast) == level, "Wrong helper compilation level");

        boolean libraryResult = intrinsic || !jniMiss;
        String[] fractions = {"", ".1", ".12", ".123", ".1234", ".12345", ".123456"};
        int[] nanos = {0, 100_000_000, 120_000_000, 123_000_000, 123_400_000, 123_450_000, 123_456_000};
        for (int i = 0; i < fractions.length; i++) {
            nativeValue("1970-01-01T00:00:00" + fractions[i] + "Z",
                    Instant.ofEpochSecond(0, nanos[i]), libraryResult);
        }
        nativeValue("1969-12-31T23:59:59.000001Z", Instant.ofEpochSecond(-1, 1000), libraryResult);
        nativeValue("1969-12-31T23:59:59.999999Z", Instant.ofEpochSecond(-1, 999_999_000), libraryResult);
        nativeValue("0000-01-01T00:00:00Z", Instant.ofEpochSecond(-62_167_219_200L), libraryResult);
        nativeValue("9999-12-31T23:59:59.999999Z",
                Instant.ofEpochSecond(253_402_300_799L, 999_999_000), libraryResult);
        check(WB.getMethodCompilationLevel(fast) == level, "Valid values lost the selected compilation tier");

        String lexical = "1969-12-31_23:59:59,000001z";
        if (libraryResult) {
            nativeValue(lexical, Instant.ofEpochSecond(-1, 1000), true);
        } else {
            same(invokeFast(lexical), null, "Poisoned JNI must miss");
            reject(lexical);
        }
        for (String text : new String[] {"1970-01-01T00:00:00.1234567Z",
                "1970-01-01T00:00:00.12345678Z", "1970-01-01T00:00:00.123456789Z",
                "2000-01-01T24:00:00Z", "2016-12-31T23:59:60.123456Z",
                "2000-01-01T00:00:00+01:00", "+10000-01-01T00:00:00Z"}) {
            same(invokeFast(text), null, "Unsupported input must fall back");
            same(Instant.parse(text), DateTimeFormatter.ISO_INSTANT.parse(text, Instant::from),
                    "Public fallback value");
        }
        for (String text : new String[] {"1900-02-29T00:00:00Z", "2000-13-01T00:00:00Z",
                "2000-01-01T00:60:00Z", "2000-01-01T00:00:00ZZ",
                "2000-01-01T\u01300:00:00Z", "2000-01-01T\ud8000:00:00Z"}) {
            reject(text);
        }
        same(Instant.parse(new StringBuilder("1969-12-31T23:59:59.000001Z")),
                Instant.ofEpochSecond(-1, 1000), "Custom CharSequence fallback");
        System.out.println("Instant intrinsic: level=" + level + ", enabled=" + intrinsic
                + ", poisonedJNI=" + jniMiss + "; availability and values checked");
    }

    private static Instant invokeFast(String text) throws Exception {
        try {
            return (Instant)fast.invoke(null, text);
        } catch (InvocationTargetException ex) {
            if (ex.getCause() instanceof RuntimeException cause) throw cause;
            if (ex.getCause() instanceof Error cause) throw cause;
            throw new AssertionError("Unexpected parser exception", ex.getCause());
        }
    }

    private static void nativeValue(String text, Instant expected, boolean libraryResult) throws Exception {
        // Fresh String storage also exercises the intrinsic's array lifetime.
        same(invokeFast(new String(text.toCharArray())), libraryResult ? expected : null,
                "Direct helper value for " + text);
        same(Instant.parse(new String(text.toCharArray())), expected, "Public value for " + text);
    }

    private static void reject(String text) {
        try {
            Instant.parse(text);
            throw new AssertionError("Accepted invalid input: " + text);
        } catch (DateTimeParseException expected) {
            same(expected.getParsedString(), text, "Rejected input");
        }
    }

    private static void same(Object actual, Object expected, String context) {
        check(Objects.equals(actual, expected), context + ": expected " + expected + ", got " + actual);
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
