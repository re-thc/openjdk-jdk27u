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
 * @summary Compiled decimal integer parsing uses typed leaves and ordinary Java fallback
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "aarch64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -Xbatch -XX:-TieredCompilation -XX:CompileCommand=dontinline,TestDecimalIntegerParsingIntrinsics::parse* TestDecimalIntegerParsingIntrinsics 4 true false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:-UseFastIntegerIntrinsics -Xbatch -XX:-TieredCompilation -XX:CompileCommand=dontinline,TestDecimalIntegerParsingIntrinsics::parse* TestDecimalIntegerParsingIntrinsics 4 false false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -XX:DisableIntrinsic=_parseUnsignedDecimalLong -Xbatch -XX:-TieredCompilation -XX:CompileCommand=dontinline,TestDecimalIntegerParsingIntrinsics::parse* TestDecimalIntegerParsingIntrinsics 4 true true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -XX:DisableIntrinsic=_parseDecimalInt,_parseDecimalLong,_parseUnsignedDecimalInt,_parseUnsignedDecimalLong -Xbatch -XX:-TieredCompilation -XX:CompileCommand=dontinline,TestDecimalIntegerParsingIntrinsics::parse* TestDecimalIntegerParsingIntrinsics 4 false false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -Xbatch -XX:TieredStopAtLevel=1 -XX:CompileCommand=dontinline,TestDecimalIntegerParsingIntrinsics::parse* TestDecimalIntegerParsingIntrinsics 1 true false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:-UseFastIntegerIntrinsics -Xbatch -XX:TieredStopAtLevel=1 -XX:CompileCommand=dontinline,TestDecimalIntegerParsingIntrinsics::parse* TestDecimalIntegerParsingIntrinsics 1 false false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -XX:DisableIntrinsic=_parseUnsignedDecimalLong -Xbatch -XX:TieredStopAtLevel=1 -XX:CompileCommand=dontinline,TestDecimalIntegerParsingIntrinsics::parse* TestDecimalIntegerParsingIntrinsics 1 true true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -XX:DisableIntrinsic=_parseDecimalInt,_parseDecimalLong,_parseUnsignedDecimalInt,_parseUnsignedDecimalLong -Xbatch -XX:TieredStopAtLevel=1 -XX:CompileCommand=dontinline,TestDecimalIntegerParsingIntrinsics::parse* TestDecimalIntegerParsingIntrinsics 1 false false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -Xbatch -XX:TieredStopAtLevel=2 -XX:CompileCommand=dontinline,TestDecimalIntegerParsingIntrinsics::parse* TestDecimalIntegerParsingIntrinsics 2 true false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -Xbatch -XX:TieredStopAtLevel=3 -XX:CompileCommand=dontinline,TestDecimalIntegerParsingIntrinsics::parse* TestDecimalIntegerParsingIntrinsics 3 true false
 */

import java.lang.reflect.Method;
import jdk.test.whitebox.WhiteBox;

public class TestDecimalIntegerParsingIntrinsics {
    private static volatile long sink;

    private static int parseInt(String text, int radix) {
        return Integer.parseInt(text, radix);
    }

    private static long parseLong(String text, int radix) {
        return Long.parseLong(text, radix);
    }

    private static int parseUnsignedInt(String text, int radix) {
        return Integer.parseUnsignedInt(text, radix);
    }

    private static long parseUnsignedLong(String text, int radix) {
        return Long.parseUnsignedLong(text, radix);
    }

    private static long parseWithHandler(String text, int radix, long fallback) {
        try {
            return Long.parseUnsignedLong(text, radix);
        } catch (NumberFormatException expected) {
            return fallback;
        }
    }

    private static long parseConstants() {
        long result = 0;
        try {
            result += Integer.parseInt(null, 10);
        } catch (NumberFormatException expected) {
            result = 17;
        }
        result += Long.parseLong("12", 16);
        result += Integer.parseUnsignedInt("12345", 10);
        Integer.parseInt("123", 10);
        return result;
    }

    public static void main(String[] args) throws Exception {
        int level = Integer.parseInt(args[0]);
        boolean enabled = Boolean.parseBoolean(args[1]);
        boolean disableUnsignedLong = Boolean.parseBoolean(args[2]);
        WhiteBox wb = WhiteBox.getWhiteBox();
        String[] names = {"parseInt", "parseLong", "parseUnsignedInt", "parseUnsignedLong"};
        Class<?>[] holders = {Integer.class, Long.class, Integer.class, Long.class};
        for (int n = 0; n < 100_000; ++n) {
            sink = parseInt("12345", 10) + parseLong("12345", 10)
                    + parseUnsignedInt("12345", 10) + parseUnsignedLong("12345", 10)
                    + parseWithHandler("12345", 10, -1);
        }
        for (int i = 0; i < names.length; ++i) {
            Method wrapper = TestDecimalIntegerParsingIntrinsics.class.getDeclaredMethod(names[i], String.class, int.class);
            requireLevel(wb, wrapper, level);
            Method target = holders[i].getDeclaredMethod(names[i], String.class, int.class);
            requireLevel(wb, target, level);
            boolean expected = enabled && !(i == 3 && disableUnsignedLong);
            if (wb.isIntrinsicAvailable(target, level) != expected) {
                throw new AssertionError(target + " intrinsic availability expected " + expected);
            }
        }
        requireLevel(wb, TestDecimalIntegerParsingIntrinsics.class.getDeclaredMethod(
                "parseWithHandler", String.class, int.class, long.class), level);
        requireLevel(wb, TestDecimalIntegerParsingIntrinsics.class.getDeclaredMethod("parseConstants"), level);
        if (parseConstants() != 12380) {
            throw new AssertionError("constant null/radix/native branches");
        }
        for (String text : new String[] {null, "1_0", "18446744073709551616"}) {
            if (parseWithHandler(text, 10, 0x123456789abcdefL) != 0x123456789abcdefL) {
                throw new AssertionError("compiled Java exception handler");
            }
        }
        if (parseWithHandler("9223372036854775808", 10, 1) != Long.MIN_VALUE
                || parseWithHandler("１２３", 10, 1) != 123
                || parseWithHandler("123", 1, 19) != 19) {
            throw new AssertionError("compiled Java fallback");
        }

        for (String text : new String[] {"0", "-0", "+0", "0000"}) {
            checkSigned(text, 10, 0, true);
        }
        for (String text : new String[] {"123", "+123", "000123", "１２３", "١٢٣", "0".repeat(1024) + "123"}) {
            checkSigned(text, 10, 123, true);
            checkUnsigned(text, 10, 123, true);
        }
        for (long value : new long[] {1234, 12345, 123456, -1234, -12345}) {
            checkSigned(Long.toString(value), 10, value, true);
        }
        checkSigned("+1234", 10, 1234, true);
        checkSigned("+12345", 10, 12345, true);
        checkUnsigned("1234", 10, 1234, true);
        checkUnsigned("12345", 10, 12345, true);
        for (String text : new String[] {"１２３４５", "١٢٣٤٥", "00012345"}) {
            checkSigned(text, 10, 12345, true);
            checkUnsigned(text, 10, 12345, true);
        }
        checkSigned("-123", 10, -123, true);
        checkSigned("2147483647", 10, Integer.MAX_VALUE, true);
        checkSigned("-2147483648", 10, Integer.MIN_VALUE, true);
        checkSigned("2147483648", 10, 2147483648L, false);
        checkSigned("-2147483649", 10, -2147483649L, false);
        checkSigned("9223372036854775807", 10, Long.MAX_VALUE, false);
        checkSigned("-9223372036854775808", 10, Long.MIN_VALUE, false);
        checkUnsigned("4294967295", 10, 0xffffffffL, true);
        checkUnsigned("4294967296", 10, 0x100000000L, false);
        checkUnsigned("9223372036854775808", 10, Long.MIN_VALUE, false);
        checkUnsigned("18446744073709551615", 10, -1L, false);
        checkSigned("-7fffffff", 16, -2147483647L, true);
        checkSigned("z", 36, 35, true);
        checkUnsigned("ffffffff", 16, 0xffffffffL, true);
        for (String text : new String[] {null, "", "+", "-", "++1", "+-1", " 1", "1 ",
                "0x10", "1_0", "12a", "a12", "12a45", "+-123", "1\u00002", "9223372036854775808", "-9223372036854775809"}) {
            reject(() -> parseInt(text, 10));
            reject(() -> parseLong(text, 10));
        }
        for (String text : new String[] {null, "", "+", "-", "-0", "-1", "18446744073709551616", "1_0", "１２a"}) {
            reject(() -> parseUnsignedInt(text, 10));
            reject(() -> parseUnsignedLong(text, 10));
        }
        for (int radix : new int[] {1, 37, Integer.MIN_VALUE, Integer.MAX_VALUE}) {
            reject(() -> parseInt("123", radix));
            reject(() -> parseLong("123", radix));
            reject(() -> parseUnsignedInt("123", radix));
            reject(() -> parseUnsignedLong("123", radix));
        }
    }

    private static void checkSigned(String text, int radix, long expected, boolean fitsInt) {
        if (parseLong(text, radix) != expected) {
            throw new AssertionError("signed long: " + text);
        }
        if (fitsInt) {
            if (parseInt(text, radix) != (int) expected) {
                throw new AssertionError("signed int: " + text);
            }
        } else {
            reject(() -> parseInt(text, radix));
        }
    }

    private static void checkUnsigned(String text, int radix, long expected, boolean fitsInt) {
        if (parseUnsignedLong(text, radix) != expected) {
            throw new AssertionError("unsigned long: " + text);
        }
        if (fitsInt) {
            if (parseUnsignedInt(text, radix) != (int) expected) {
                throw new AssertionError("unsigned int: " + text);
            }
        } else {
            reject(() -> parseUnsignedInt(text, radix));
        }
    }

    private static void reject(Runnable call) {
        try {
            call.run();
        } catch (NumberFormatException expected) {
            return;
        }
        throw new AssertionError("NumberFormatException expected");
    }

    private static void requireLevel(WhiteBox wb, Method method, int level) {
        if (wb.getMethodCompilationLevel(method) != level) {
            wb.enqueueMethodForCompilation(method, level);
        }
        if (wb.getMethodCompilationLevel(method) != level) {
            throw new AssertionError(method + " did not compile at level " + level);
        }
    }
}
