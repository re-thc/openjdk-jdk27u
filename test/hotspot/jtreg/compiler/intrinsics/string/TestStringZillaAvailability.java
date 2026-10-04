/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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
 * @summary StringZilla intrinsic registration and independent C1/C2 availability
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires (os.arch == "amd64" | os.arch == "x86_64" | os.arch == "aarch64")
 * @library /test/lib
 * @modules java.base/java.lang:open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseStringZillaIntrinsics TestStringZillaAvailability true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:-UseStringZillaIntrinsics TestStringZillaAvailability false
 */

import java.lang.reflect.Method;
import jdk.test.whitebox.WhiteBox;

public class TestStringZillaAvailability {
    public static void main(String[] args) throws Exception {
        boolean expected = Boolean.parseBoolean(args[0]);
        WhiteBox wb = WhiteBox.getWhiteBox();
        Class<?> klass = Class.forName("java.lang.StringZilla");
        var enabled = klass.getDeclaredField("ENABLED");
        enabled.setAccessible(true);
        if (enabled.getBoolean(null) != expected) {
            throw new AssertionError("Java gate does not match UseStringZillaIntrinsics");
        }
        String[] substrings = {"findLatin1", "findUTF16", "rfindLatin1", "rfindUTF16",
                               "findUTF16Latin1", "rfindUTF16Latin1"};
        String[] characters = {"findCharLatin1", "findCharUTF16", "rfindCharLatin1", "rfindCharUTF16"};
        for (String name : substrings) {
            check(wb, klass.getDeclaredMethod(name, byte[].class, int.class, int.class, byte[].class, int.class), expected);
        }
        for (String name : characters) {
            check(wb, klass.getDeclaredMethod(name, byte[].class, int.class, int.class, int.class), expected);
        }
        Class<?> latin1 = Class.forName("java.lang.StringLatin1");
        Method equals = latin1.getDeclaredMethod("equals0", byte[].class, byte[].class);
        if (wb.isIntrinsicAvailable(equals, 1) != expected || !wb.isIntrinsicAvailable(equals, 4)) {
            throw new AssertionError("String equality must enable C1 independently and retain C2");
        }
    }

    private static void check(WhiteBox wb, Method method, boolean expected) {
        for (int level : new int[]{1, 4}) {
            boolean actual = wb.isIntrinsicAvailable(method, level);
            if (actual != expected) throw new AssertionError(method + " level=" + level + " available=" + actual);
        }
    }
}
