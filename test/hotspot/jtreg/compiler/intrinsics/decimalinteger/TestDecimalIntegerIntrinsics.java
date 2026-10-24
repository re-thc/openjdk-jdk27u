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
 * @summary Integer interpreter intrinsics keep compiled Java implementations
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @library /test/lib
 * @modules java.base/jdk.internal.util
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -XX:+UseZmijIntegerIntrinsics -Xbatch -XX:TieredStopAtLevel=1 -XX:CompileCommand=dontinline,java.lang.Integer::parse* -XX:CompileCommand=dontinline,java.lang.Long::parse* -XX:CompileCommand=dontinline,jdk.internal.util.DecimalDigits::uncheckedGetChars* TestDecimalIntegerIntrinsics 1
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseFastIntegerIntrinsics -XX:+UseZmijIntegerIntrinsics -Xbatch -XX:-TieredCompilation -XX:CompileCommand=dontinline,java.lang.Integer::parse* -XX:CompileCommand=dontinline,java.lang.Long::parse* -XX:CompileCommand=dontinline,jdk.internal.util.DecimalDigits::uncheckedGetChars* TestDecimalIntegerIntrinsics 4
 */

import java.lang.reflect.Method;
import jdk.test.whitebox.WhiteBox;
import jdk.internal.util.DecimalDigits;

public class TestDecimalIntegerIntrinsics {
    public static void main(String[] args) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        for (String flag : new String[] {"UseFastIntegerIntrinsics", "UseZmijIntegerIntrinsics"}) {
            if (!Boolean.TRUE.equals(wb.getBooleanVMFlag(flag))) {
                throw new AssertionError(flag + " must be enabled");
            }
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
        // Tiered VMs retain ordinary Java entries and advance hot methods to compilation.
        byte[] output = new byte[64];
        long sum = 0;
        for (int n = 0; n < 100_000; ++n) {
            sum += Integer.parseInt("123", 10);
            sum += Long.parseLong("123", 10);
            sum += Integer.parseUnsignedInt("123", 10);
            sum += Long.parseUnsignedLong("123", 10);
            sum += DecimalDigits.uncheckedGetCharsLatin1(n, 32, output);
            sum += DecimalDigits.uncheckedGetCharsUTF16(n, 32, output);
            sum += DecimalDigits.uncheckedGetCharsLatin1((long) n, 32, output);
            sum += DecimalDigits.uncheckedGetCharsUTF16((long) n, 32, output);
        }
        if (sum == 0) {
            throw new AssertionError("Conversions were not consumed");
        }
        int expectedLevel = Integer.parseInt(args[0]);
        for (Method method : methods) {
            int actual = wb.getMethodCompilationLevel(method);
            if (actual != expectedLevel) {
                throw new AssertionError(method + " compilation level " + actual + " expected " + expectedLevel);
            }
            for (int level : new int[] {1, 4}) {
                if (wb.isIntrinsicAvailable(method, level)) {
                    throw new AssertionError(method + " must keep its Java body at " + level);
                }
            }
        }
    }
}
