/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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
 * @summary Verify fast_float intrinsic availability and per-intrinsic controls
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "aarch64")
 * @library /test/lib
 * @modules java.base/jdk.internal.math
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI TestFastFloatIntrinsics true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:-UseFastFloatIntrinsics TestFastFloatIntrinsics false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:DisableIntrinsic=_parseFastFloat,_parseFastFloatDigits TestFastFloatIntrinsics false
 */

import java.lang.reflect.Method;
import jdk.internal.math.FloatingDecimal;
import jdk.test.whitebox.WhiteBox;

public class TestFastFloatIntrinsics {
    public static void main(String[] args) throws Exception {
        boolean expected = Boolean.parseBoolean(args[0]);
        WhiteBox wb = WhiteBox.getWhiteBox();
        Method[] methods = {
            FloatingDecimal.class.getDeclaredMethod("parseFastFloat", String.class, int.class),
            FloatingDecimal.class.getDeclaredMethod("parseFastFloatDigits", byte[].class, int.class, int.class)
        };
        for (Method method : methods) {
            for (int level : new int[] {1, 4}) {
                if (wb.isIntrinsicAvailable(method, level) != expected) {
                    throw new AssertionError(method + " intrinsic availability at level " + level + " expected " + expected);
                }
            }
        }
    }
}
