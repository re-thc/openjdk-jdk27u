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
 * @summary Verify compiled decimal integer routes and Java fallbacks
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "aarch64")
 * @library /test/lib
 * @modules java.base/jdk.internal.util
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -XX:+UseZmijIntegerIntrinsics -Xbatch -XX:TieredStopAtLevel=1 -XX:CompileCommand=dontinline,java.lang.Integer::parse* -XX:CompileCommand=dontinline,java.lang.Long::parse* -XX:CompileCommand=dontinline,TestDecimalIntegerIntrinsics::write* TestDecimalIntegerIntrinsics 1 true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -XX:+UseZmijIntegerIntrinsics -Xbatch -XX:-TieredCompilation -XX:CompileCommand=dontinline,java.lang.Integer::parse* -XX:CompileCommand=dontinline,java.lang.Long::parse* -XX:CompileCommand=dontinline,TestDecimalIntegerIntrinsics::write* TestDecimalIntegerIntrinsics 4 true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -XX:-UseZmijIntegerIntrinsics -Xbatch -XX:TieredStopAtLevel=1 -XX:CompileCommand=dontinline,java.lang.Integer::parse* -XX:CompileCommand=dontinline,java.lang.Long::parse* -XX:CompileCommand=dontinline,TestDecimalIntegerIntrinsics::write* TestDecimalIntegerIntrinsics 1 false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -XX:-UseZmijIntegerIntrinsics -Xbatch -XX:-TieredCompilation -XX:CompileCommand=dontinline,java.lang.Integer::parse* -XX:CompileCommand=dontinline,java.lang.Long::parse* -XX:CompileCommand=dontinline,TestDecimalIntegerIntrinsics::write* TestDecimalIntegerIntrinsics 4 false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -XX:+UseZmijIntegerIntrinsics -Xbatch -XX:TieredStopAtLevel=1 -XX:DisableIntrinsic=_formatDecimalLongUTF16 -XX:CompileCommand=dontinline,java.lang.Integer::parse* -XX:CompileCommand=dontinline,java.lang.Long::parse* -XX:CompileCommand=dontinline,TestDecimalIntegerIntrinsics::write* TestDecimalIntegerIntrinsics 1 true longUTF16
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -XX:+UseZmijIntegerIntrinsics -Xbatch -XX:-TieredCompilation -XX:DisableIntrinsic=_formatDecimalLongUTF16 -XX:CompileCommand=dontinline,java.lang.Integer::parse* -XX:CompileCommand=dontinline,java.lang.Long::parse* -XX:CompileCommand=dontinline,TestDecimalIntegerIntrinsics::write* TestDecimalIntegerIntrinsics 4 true longUTF16
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -XX:+UseZmijIntegerIntrinsics -Xbatch -XX:-TieredCompilation -XX:ControlIntrinsic=-_formatDecimalIntLatin1,-_formatDecimalIntUTF16,-_formatDecimalLongLatin1,-_formatDecimalLongUTF16 -XX:CompileCommand=dontinline,java.lang.Integer::parse* -XX:CompileCommand=dontinline,java.lang.Long::parse* -XX:CompileCommand=dontinline,TestDecimalIntegerIntrinsics::write* TestDecimalIntegerIntrinsics 4 false
 */

import java.lang.reflect.Method;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.whitebox.WhiteBox;
import jdk.internal.util.DecimalDigits;

public class TestDecimalIntegerIntrinsics {
    public static void main(String[] args) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        if (!Boolean.TRUE.equals(wb.getBooleanVMFlag("UseFastIntegerIntrinsics"))) {
            throw new AssertionError("UseFastIntegerIntrinsics must be enabled");
        }
        Method[] methods = {
            Integer.class.getDeclaredMethod("parseInt", String.class, int.class),
            Long.class.getDeclaredMethod("parseLong", String.class, int.class),
            Integer.class.getDeclaredMethod("parseUnsignedInt", String.class, int.class),
            Long.class.getDeclaredMethod("parseUnsignedLong", String.class, int.class),
            DecimalDigits.class.getDeclaredMethod("uncheckedGetCharsLatin1", int.class, int.class, byte[].class),
            DecimalDigits.class.getDeclaredMethod("uncheckedGetCharsUTF16", int.class, int.class, byte[].class),
            DecimalDigits.class.getDeclaredMethod("uncheckedGetCharsLatin1", long.class, int.class, byte[].class),
            DecimalDigits.class.getDeclaredMethod("uncheckedGetCharsUTF16", long.class, int.class, byte[].class)
        };
        Method[] writers = {
            TestDecimalIntegerIntrinsics.class.getDeclaredMethod("writeIntLatin1", int.class, int.class, byte[].class),
            TestDecimalIntegerIntrinsics.class.getDeclaredMethod("writeIntUTF16", int.class, int.class, byte[].class),
            TestDecimalIntegerIntrinsics.class.getDeclaredMethod("writeLongLatin1", long.class, int.class, byte[].class),
            TestDecimalIntegerIntrinsics.class.getDeclaredMethod("writeLongUTF16", long.class, int.class, byte[].class)
        };
        byte[] output = new byte[64];
        long sum = 0;
        for (int n = 0; n < 100_000; ++n) {
            sum += Integer.parseInt("123", 10);
            sum += Long.parseLong("123", 10);
            sum += Integer.parseUnsignedInt("123", 10);
            sum += Long.parseUnsignedLong("123", 10);
            sum += writeIntLatin1(n, 32, output);
            sum += writeIntUTF16(n, 32, output);
            sum += writeLongLatin1((long) n << 32, 32, output);
            sum += writeLongUTF16((long) n << 32, 32, output);
        }
        if (sum == 0) {
            throw new AssertionError("Conversions were not consumed");
        }
        int expectedLevel = Integer.parseInt(args[0]);
        boolean formatEnabled = Boolean.parseBoolean(args[1]);
        boolean disableLongUTF16 = args.length > 2;
        for (int i = 0; i < methods.length; ++i) {
            Method method = methods[i];
            if (i < 4) {
                requireLevel(wb, method, expectedLevel);
            }
            boolean expected = i < 4 || (formatEnabled && !(i == 7 && disableLongUTF16)
                    && (expectedLevel == 1 || i >= 6));
            if (wb.isIntrinsicAvailable(method, expectedLevel) != expected) {
                throw new AssertionError(method + " intrinsic availability at " + expectedLevel + " expected " + expected);
            }
        }
        for (Method writer : writers) {
            requireLevel(wb, writer, expectedLevel);
        }
        for (long value : new long[] {0, 1, -1, 2, -2, 3, -3, 4, -4, 5, -5, 6, -6,
                7, -7, 8, -8, 9, -9, 10, -10, 99, -99, 100, -100,
                9999, 10000, Integer.MIN_VALUE, Integer.MAX_VALUE, 1L << 32,
                -(1L << 32), 999999999999L, 1000000000000L, 1000000000001L,
                -999999999999L, -1000000000000L, -1000000000001L,
                Long.MIN_VALUE, Long.MAX_VALUE}) {
            for (int offset : new int[] {0, 1, 7}) {
                check(value, offset, false, true);
                check(value, offset, true, true);
                if (value == (int) value) {
                    check(value, offset, false, false);
                    check(value, offset, true, false);
                }
            }
        }
    }

    private static void requireLevel(WhiteBox wb, Method method, int expected) {
        int actual = wb.getMethodCompilationLevel(method);
        if (actual != expected) {
            throw new AssertionError(method + " compilation level " + actual + " expected " + expected);
        }
    }

    private static int writeIntLatin1(int value, int index, byte[] output) {
        return DecimalDigits.uncheckedGetCharsLatin1(value, index, output);
    }

    private static int writeIntUTF16(int value, int index, byte[] output) {
        return DecimalDigits.uncheckedGetCharsUTF16(value, index, output);
    }

    private static int writeLongLatin1(long value, int index, byte[] output) {
        return DecimalDigits.uncheckedGetCharsLatin1(value, index, output);
    }

    private static int writeLongUTF16(long value, int index, byte[] output) {
        return DecimalDigits.uncheckedGetCharsUTF16(value, index, output);
    }

    private static void check(long value, int offset, boolean utf16, boolean wide) {
        String expected = decimal(value);
        int coder = utf16 ? 1 : 0;
        int end = offset + expected.length();
        byte[] output = new byte[(end + 5) << coder];
        Arrays.fill(output, (byte) 0x55);
        int start = wide
                ? (utf16 ? writeLongUTF16(value, end, output) : writeLongLatin1(value, end, output))
                : (utf16 ? writeIntUTF16((int) value, end, output) : writeIntLatin1((int) value, end, output));
        if (start != offset) {
            throw new AssertionError("Wrong start index: " + start + " expected " + offset);
        }
        var charset = utf16 ? (ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN
                ? StandardCharsets.UTF_16LE : StandardCharsets.UTF_16BE) : StandardCharsets.ISO_8859_1;
        String actual = new String(output, start << coder, expected.length() << coder, charset);
        if (!actual.equals(expected)) {
            throw new AssertionError("Wrong digits: " + actual + " expected " + expected);
        }
        for (int i = 0; i < output.length; ++i) {
            if ((i < (start << coder) || i >= (end << coder)) && output[i] != 0x55) {
                throw new AssertionError("Write outside exact text at " + i);
            }
        }
    }

    private static String decimal(long value) {
        char[] digits = new char[20];
        int position = digits.length;
        boolean negative = value < 0;
        long remaining = negative ? value : -value;
        do {
            digits[--position] = (char) ('0' - remaining % 10);
            remaining /= 10;
        } while (remaining != 0);
        if (negative) {
            digits[--position] = '-';
        }
        return new String(digits, position, digits.length - position);
    }
}
