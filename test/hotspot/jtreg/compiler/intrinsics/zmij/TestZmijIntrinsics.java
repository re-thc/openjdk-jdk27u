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
 * @summary Verify typed zmij intrinsic availability and per-intrinsic controls
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "aarch64")
 * @library /test/lib
 * @modules java.base/jdk.internal.math
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI TestZmijIntrinsics true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:-UseZmijIntrinsics TestZmijIntrinsics false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:DisableIntrinsic=_putFloatDecimalLatin1,_putFloatDecimalUTF16,_putDoubleDecimalLatin1,_putDoubleDecimalUTF16,_floatToDecimalLatin1,_decimalZmij TestZmijIntrinsics false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:ControlIntrinsic=-_putFloatDecimalLatin1,-_putFloatDecimalUTF16,-_putDoubleDecimalLatin1,-_putDoubleDecimalUTF16,-_floatToDecimalLatin1,-_decimalZmij TestZmijIntrinsics false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:DisableIntrinsic=_putFloatDecimalUTF16 TestZmijIntrinsics true false
 */

import java.lang.reflect.Method;
import jdk.internal.math.DoubleToDecimal;
import jdk.internal.math.FloatToDecimal;
import jdk.test.whitebox.WhiteBox;

public class TestZmijIntrinsics {
    public static void main(String[] args) throws Exception {
        boolean expected = Boolean.parseBoolean(args[0]);
        boolean expectedFloatUTF16 = args.length > 1 ? Boolean.parseBoolean(args[1]) : expected;
        WhiteBox wb = WhiteBox.getWhiteBox();
        Method floatLatin1 = FloatToDecimal.class.getDeclaredMethod("putDecimalLatin1", byte[].class, int.class, float.class);
        Method floatUTF16 = FloatToDecimal.class.getDeclaredMethod("putDecimalUTF16", byte[].class, int.class, float.class);
        Method[] methods = {
            floatLatin1,
            floatUTF16,
            DoubleToDecimal.class.getDeclaredMethod("putDecimalLatin1", byte[].class, int.class, double.class),
            DoubleToDecimal.class.getDeclaredMethod("putDecimalUTF16", byte[].class, int.class, double.class),
            FloatToDecimal.class.getDeclaredMethod("toDecimalLatin1", byte[].class, int.class, float.class),
            DoubleToDecimal.class.getDeclaredMethod("decimal0", long.class)
        };
        for (Method method : methods) {
            for (int level : new int[] {1, 4}) {
                boolean available = method == floatUTF16 ? expectedFloatUTF16 : expected;
                if (method == floatLatin1 && level == 4) {
                    available = false;
                }
                if (wb.isIntrinsicAvailable(method, level) != available) {
                    throw new AssertionError(method + " intrinsic availability at level " + level + " expected " + available);
                }
            }
        }
    }
}
