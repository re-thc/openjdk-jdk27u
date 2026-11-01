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
 * @summary Keep signed-long decimal writers as single native leaves
 * @requires vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "aarch64")
 * @library /test/lib /
 * @modules java.base/jdk.internal.util
 * @run driver TestDecimalLongIntrinsicIR
 */

import java.nio.ByteOrder;
import java.util.Arrays;
import compiler.lib.ir_framework.IR;
import compiler.lib.ir_framework.IRNode;
import compiler.lib.ir_framework.Run;
import compiler.lib.ir_framework.Test;
import compiler.lib.ir_framework.TestFramework;
import jdk.internal.util.DecimalDigits;

public class TestDecimalLongIntrinsicIR {
    private static final int END = 32;
    private static final byte[] LATIN1 = new byte[64];
    private static final byte[] UTF16 = new byte[128];
    private static final boolean LITTLE_ENDIAN = ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN;
    private static final long[] VALUES = values();
    private int cursor;

    public static void main(String[] args) {
        TestFramework.runWithFlags("-XX:+UseZmijIntegerIntrinsics",
                "--add-exports=java.base/jdk.internal.util=ALL-UNNAMED");
    }

    @Test
    @IR(counts = {IRNode.CALL_OF, "formatZmijInteger", "1"},
        failOn = {IRNode.IF, IRNode.ANY_LOOP, IRNode.CALL})
    public static int latin1(long value) {
        return DecimalDigits.uncheckedGetCharsLatin1(value, END, LATIN1);
    }

    @Test
    @IR(counts = {IRNode.CALL_OF, "formatZmijInteger", "1"},
        failOn = {IRNode.IF, IRNode.ANY_LOOP, IRNode.CALL})
    public static int utf16(long value) {
        return DecimalDigits.uncheckedGetCharsUTF16(value, END, UTF16);
    }

    @Run(test = {"latin1", "utf16"})
    public void run() {
        long value = VALUES[cursor++ % VALUES.length];
        Arrays.fill(LATIN1, (byte) 0x55);
        Arrays.fill(UTF16, (byte) 0x55);
        String expected = decimal(value);
        check(LATIN1, latin1(value), expected, false);
        check(UTF16, utf16(value), expected, true);
    }

    private static void check(byte[] output, int start, String expected, boolean utf16) {
        if (start != END - expected.length()) {
            throw new AssertionError("Wrong start index for " + expected + ": " + start);
        }
        int coder = utf16 ? 1 : 0;
        for (int i = 0; i < output.length; ++i) {
            int wanted = 0x55;
            if (i >= (start << coder) && i < (END << coder)) {
                int digit = expected.charAt((i >> coder) - start);
                int shift = utf16 && ((i & 1) == 0) != LITTLE_ENDIAN ? 8 : 0;
                wanted = (digit >> shift) & 0xff;
            }
            if ((output[i] & 0xff) != wanted) {
                throw new AssertionError("Wrong byte at " + i + " for " + expected);
            }
        }
    }

    private static long[] values() {
        long[] values = new long[19 * 6 + 8];
        int n = 0;
        long power = 1;
        for (int digits = 1; digits <= 19; ++digits) {
            for (long value : new long[] {power - 1, power, power + 1}) {
                values[n++] = value;
                values[n++] = -value;
            }
            if (digits < 19) power *= 10;
        }
        for (long value : new long[] {(1L << 32) - 1, 1L << 32, (1L << 32) + 1}) {
            values[n++] = value;
            values[n++] = -value;
        }
        values[n++] = Long.MIN_VALUE;
        values[n] = Long.MAX_VALUE;
        return values;
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
        if (negative) digits[--position] = '-';
        return new String(digits, position, digits.length - position);
    }
}
