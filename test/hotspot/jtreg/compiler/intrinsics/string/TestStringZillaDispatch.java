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
 * @summary Reverse-search dispatch folds the compiling tier and preserves boundary matches
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires (os.arch == "amd64" | os.arch == "x86_64" | os.arch == "aarch64")
 * @library /test/lib
 * @modules java.base/java.lang:open
 * @compile/module=java.base java/lang/StringZillaDispatchHelper.java
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI TestStringZillaDispatch
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:-UseStringZillaIntrinsics TestStringZillaDispatch
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:DisableIntrinsic=_stringzillaCompilerTier TestStringZillaDispatch
 */

import java.lang.reflect.Method;
import jdk.test.whitebox.WhiteBox;

public class TestStringZillaDispatch {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();

    public static void main(String[] args) throws Exception {
        Class<?> bridge = Class.forName("java.lang.StringZilla");
        var backendField = bridge.getDeclaredField("BACKEND");
        backendField.setAccessible(true);
        int backend = backendField.getInt(null);
        Class<?> helper = Class.forName("java.lang.StringZillaDispatchHelper");
        Method tier = helper.getMethod("tier");
        Method latin = helper.getMethod("latin", int.class, int.class);
        Method latinFilter = helper.getMethod("latinFilter");
        Method utf16 = helper.getMethod("utf16", int.class, int.class);
        Method search = helper.getMethod("search", String.class, String.class, int.class);
        Method intrinsic = bridge.getDeclaredMethod("compilerTier");
        for (int level : new int[]{1, 4}) {
            for (Method method : new Method[]{tier, latin, latinFilter, utf16, search}) {
                WB.deoptimizeMethod(method);
                if (!WB.enqueueMethodForCompilation(method, level)
                        || !WB.isMethodCompiled(method)
                        || WB.getMethodCompilationLevel(method) != level) {
                    throw new AssertionError("Cannot compile " + method + " at " + level);
                }
            }
            int expectedTier = WB.isIntrinsicAvailable(intrinsic, level) ? level : 0;
            if ((int)tier.invoke(null) != expectedTier) {
                throw new AssertionError("Tier not folded at compilation level " + level);
            }
            boolean serialC2 = backend == 0 && expectedTier == 4;
            boolean scalarC1 = (backend == 0 || backend == 1) && expectedTier == 1;
            boolean scalarC2 = (backend == 0 || backend == 1) && expectedTier == 4;
            if ((boolean)latinFilter.invoke(null) != serialC2) {
                throw new AssertionError("Latin-1 filter routing at compilation level " + level);
            }
            check(latin, 4096, 31, !serialC2);
            check(latin, 1023, 32, !serialC2);
            check(latin, 1024, 32, true);
            check(latin, 4096, 64, true);
            check(latin, 257, 256, !scalarC2);
            check(latin, 258, 256, !scalarC2);
            check(latin, 259, 256, !serialC2);
            check(latin, 260, 256, !serialC2);
            check(latin, 258, 257, !scalarC1 && !scalarC2);
            check(latin, 259, 257, !scalarC1 && !scalarC2);
            check(latin, 260, 257, !scalarC2);
            check(latin, 261, 257, !scalarC2);
            check(latin, 271, 257, !scalarC2);
            check(latin, 272, 257, true);
            check(latin, 273, 257, true);
            check(latin, 770, 257, true);
            check(utf16, 128, 4, !scalarC2);
            check(utf16, 255, 4, !scalarC2);
            check(utf16, 256, 4, !scalarC2);
            check(utf16, 511, 32, !scalarC2);
            check(utf16, 512, 32, true);
            check(utf16, 128, 33, !scalarC2);
            check(utf16, 129, 128, !scalarC2);
            check(utf16, 130, 129, !scalarC1 && !scalarC2);
            check(utf16, 135, 129, !scalarC1 && !scalarC2);
            check(utf16, 136, 129, !scalarC2);
            check(utf16, 137, 129, !scalarC2);
            check(utf16, 143, 129, !scalarC2);
            check(utf16, 144, 129, true);
            check(utf16, 145, 129, true);
            check(utf16, 512, 385, true);
            check(utf16, 4096, 4, true);
            checkBoundaries(search);
            checkFilteredBlocks(search);
        }
    }

    private static void check(Method method, int length, int count, boolean expected) throws Exception {
        if ((boolean)method.invoke(null, length, count) != expected) {
            throw new AssertionError(method + " length=" + length + " count=" + count);
        }
    }

    private static void checkFilteredBlocks(Method search) throws Exception {
        for (int count : new int[]{1, 4, 31, 32, 33}) {
            String needle = "b" + "z".repeat(count - 1);
            int length = 4096;
            for (int position : new int[]{0, 1, 255, 256, 257, 1023, length - count}) {
                String value = "a".repeat(position) + needle
                        + "a".repeat(length - position - count);
                StringBuilder builder = new StringBuilder(value).append(needle);
                StringBuffer buffer = new StringBuffer(value).append(needle);
                builder.setLength(length);
                buffer.setLength(length);
                for (int from : new int[]{position - 1, position, length - count}) {
                    int expected = from < position ? -1 : position;
                    if ((int)search.invoke(null, value, needle, from) != expected
                            || builder.lastIndexOf(needle, from) != expected
                            || buffer.lastIndexOf(needle, from) != expected) {
                        throw new AssertionError("Filtered block/capacity: " + position + "/" + count);
                    }
                }
            }
        }
    }

    private static void checkBoundaries(Method search) throws Exception {
        for (int length : new int[]{127, 128, 129, 255, 256, 257, 258, 259, 260, 261,
                                  271, 272, 273, 511, 512, 513, 1023, 1024, 1025, 4096}) {
            for (int count : new int[]{1, 2, 4, 16, 31, 32, 33, 64, 128, 129, 255, 256, 257, 258, 385}) {
                if (count >= length) continue;
                for (int base : new int[]{'a', 0x0401}) {
                    String repeated = String.valueOf((char)base);
                    String needle = (char)(base + 1) + repeated.repeat(count - 1);
                    String value = needle + repeated.repeat(length - count);
                    for (int from : new int[]{0, 1, length - count - 1, length - count}) {
                        int actual = (int)search.invoke(null, value, needle, from);
                        if (actual != 0 || new StringBuilder(value).lastIndexOf(needle, from) != 0
                                || new StringBuffer(value).lastIndexOf(needle, from) != 0) {
                            throw new AssertionError("Overlapping boundary match: " + length + "/" + count);
                        }
                        String absent = (char)(base + 2) + repeated.repeat(count - 1);
                        if ((int)search.invoke(null, value, absent, from) != -1) {
                            throw new AssertionError("Boundary miss: " + length + "/" + count);
                        }
                    }
                }
            }
        }
    }
}
