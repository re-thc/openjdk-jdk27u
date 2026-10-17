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
 * @run main/othervm -Xbootclasspath/a:. -Xint -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI TestStringZillaDispatch interpreted
 * @run main/othervm -Xbootclasspath/a:. -Xint -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:-UseStringZillaIntrinsics TestStringZillaDispatch interpreted
 * @run main/othervm -Xbootclasspath/a:. -Xint -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:DisableIntrinsic=_stringzillaRfindLatin1,_stringzillaRfindUTF16,_stringzillaRfindUTF16Latin1 TestStringZillaDispatch interpreted
 */


/*
 * @test id=limitedAVX
 * @summary Reverse-search boundaries in serial and AVX2 dispatch
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @modules java.base/java.lang:open
 * @compile/module=java.base java/lang/StringZillaDispatchHelper.java
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:UseAVX=0 TestStringZillaDispatch
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:UseAVX=2 TestStringZillaDispatch
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:UseAVX=0 -XX:DisableIntrinsic=_stringzillaRfindLatin1,_stringzillaRfindUTF16,_stringzillaRfindUTF16Latin1 TestStringZillaDispatch
 * @run main/othervm -Xbootclasspath/a:. -Xint -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:UseAVX=0 TestStringZillaDispatch interpreted
 * @run main/othervm -Xbootclasspath/a:. -Xint -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:UseAVX=2 TestStringZillaDispatch interpreted
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
        var configurationField = bridge.getDeclaredField("CONFIGURATION");
        configurationField.setAccessible(true);
        boolean msvcSerial = backend == 0 && (configurationField.getInt(null) & 16) != 0;
        Class<?> helper = Class.forName("java.lang.StringZillaDispatchHelper");
        Method tier = helper.getMethod("tier");
        Method latin = helper.getMethod("latin", int.class, int.class);
        Method latinFilter = helper.getMethod("latinFilter");
        Method utf16 = helper.getMethod("utf16", int.class, int.class);
        Method search = helper.getMethod("search", String.class, String.class, int.class);
        Method intrinsic = bridge.getDeclaredMethod("compilerTier");
        if (args.length != 0) {
            checkNarrowCandidates(search);
            checkShortAndMixed(search);
            return;
        }
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
            boolean avx2C2 = backend == 1 && expectedTier == 4;
            boolean msvcC1 = msvcSerial && expectedTier == 1;
            boolean msvcC2 = msvcSerial && expectedTier == 4;
            boolean scalarC1 = (backend == 0 || backend == 1) && expectedTier == 1;
            boolean scalarC2 = (backend == 0 || backend == 1) && expectedTier == 4;
            boolean neonC1 = backend == 4 && expectedTier == 1;
            boolean neonC2 = backend == 4 && expectedTier == 4;
            boolean longLatinC1 = (backend == 0 || backend == 4) && expectedTier == 1;
            boolean longLatinC2 = serialC2 || neonC2;
            boolean shortUTF16C2 = scalarC2 || neonC2;
            boolean longUTF16C1 = scalarC1 || neonC1;
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
            check(latin, 257, 257, !longLatinC1 && !longLatinC2);
            check(latin, 258, 257, !longLatinC1 && !longLatinC2);
            check(latin, 259, 257, !longLatinC1 && !longLatinC2);
            check(latin, 260, 257, !longLatinC2);
            check(latin, 261, 257, !longLatinC2);
            check(latin, 271, 257, !longLatinC2);
            check(latin, 272, 257, !neonC2);
            check(latin, 273, 257, true);
            check(latin, 288, 257, true);
            check(latin, 289, 257, true);
            check(latin, 290, 257, true);
            check(latin, 319, 257, true);
            check(latin, 320, 257, true);
            check(latin, 321, 257, true);
            check(latin, 322, 257, true);
            check(latin, 770, 257, true);
            check(utf16, 128, 4, !shortUTF16C2 && !msvcC1);
            check(utf16, 255, 4, !shortUTF16C2 && !msvcC1);
            check(utf16, 256, 4, !shortUTF16C2 && !msvcC1);
            check(utf16, 511, 32, !shortUTF16C2);
            check(utf16, 512, 8, !msvcC1 && !msvcC2 && !neonC2);
            check(utf16, 1023, 8, !msvcC1 && !msvcC2 && !neonC2);
            check(utf16, 1024, 8, !msvcC1 && !msvcC2);
            check(utf16, 1025, 8, !msvcC1 && !msvcC2);
            check(utf16, 512, 9, !msvcC2);
            check(utf16, 512, 32, !msvcC2);
            check(utf16, 512, 128, !msvcC2);
            check(utf16, 512, 129, true);
            check(utf16, 128, 33, !shortUTF16C2);
            check(utf16, 129, 128, !shortUTF16C2);
            check(utf16, 129, 129, !longUTF16C1 && !shortUTF16C2);
            check(utf16, 130, 129, !longUTF16C1 && !shortUTF16C2);
            check(utf16, 135, 129, !longUTF16C1 && !shortUTF16C2);
            check(utf16, 136, 129, !shortUTF16C2);
            check(utf16, 137, 129, !shortUTF16C2);
            check(utf16, 142, 129, !shortUTF16C2);
            check(utf16, 143, 129, !shortUTF16C2);
            check(utf16, 144, 129, !avx2C2);
            check(utf16, 145, 129, true);
            check(utf16, 146, 129, true);
            check(utf16, 512, 385, true);
            check(utf16, 4096, 4, !msvcC1 && !msvcC2);
            checkBoundaries(search);
            checkNarrowCandidates(search);
            checkFilteredBlocks(search);
            checkShortAndMixed(search);
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

    private static void checkReverse(Method search, String value, String needle,
                                     int from, int expected) throws Exception {
        StringBuilder builder = new StringBuilder(value).append(needle);
        StringBuffer buffer = new StringBuffer(value).append(needle);
        builder.setLength(value.length());
        buffer.setLength(value.length());
        if ((int)search.invoke(null, value, needle, from) != expected
                || builder.lastIndexOf(needle, from) != expected
                || buffer.lastIndexOf(needle, from) != expected) {
            throw new AssertionError("Reverse boundary: length=" + value.length()
                    + " count=" + needle.length() + " from=" + from + " expected=" + expected);
        }
    }

    private static void checkShortAndMixed(Method search) throws Exception {
        for (String unit : new String[]{"a", "\u0401"}) {
            String needle = unit.equals("a") ? "baac" : "\u0402\u0401\u0401\u0403";
            int[] lengths = unit.equals("a") ? new int[]{4, 31, 32, 33, 255, 256, 257}
                                            : new int[]{4, 15, 16, 17, 127, 128, 129};
            for (int length : lengths) {
                for (int position : new int[]{0, 1, length - needle.length()}) {
                    if (position + needle.length() > length) continue;
                    String value = unit.repeat(position) + needle
                            + unit.repeat(length - position - needle.length());
                    for (int from : new int[]{-1, 0, position - 1, position,
                                             length - needle.length(), Integer.MAX_VALUE}) {
                        checkReverse(search, value, needle, from, from < position ? -1 : position);
                        checkReverse(search, unit.repeat(length), needle, from, -1);
                    }
                }
            }
        }
        for (int count : new int[]{4, 8, 9, 23, 24, 25, 31, 32, 33, 47, 48, 49, 63, 64, 65, 66, 127, 128, 129, 130}) {
            String needle = "b" + "a".repeat(count - 2) + "c";
            int[] lengths = count == 4 ? new int[]{15, 16, 17, 127, 128, 129, 4096}
                                       : new int[]{127, 256, 4096, 4097};
            for (int length : lengths) {
                for (int position : new int[]{1, 17, length - count}) {
                    if (position < 1 || position + count > length) continue;
                    String value = "\u0100" + "x".repeat(position - 1) + needle
                            + "x".repeat(length - position - count);
                    for (int from : new int[]{0, position - 1, position, length - count,
                                             Integer.MAX_VALUE}) {
                        checkReverse(search, value, needle, from, from < position ? -1 : position);
                    }
                }
                checkReverse(search, "\u0100" + "x".repeat(length - 1), needle, length - count, -1);
                if (length < 17 + count * 2) continue;
                // The rightmost probe rejects a near-match and keeps searching.
                for (int mismatch : new int[]{0, 1, count / 2, count - 2}) {
                    char[] changed = needle.toCharArray();
                    changed[mismatch] = 'z';
                    String value = "\u0100" + "x".repeat(16) + needle
                            + "x".repeat(length - 17 - count * 2) + new String(changed);
                    checkReverse(search, value, needle, length - count, 17);
                    checkReverse(search, value, needle, 16, -1);
                }
            }
            if (count >= 128) {
                String repeated = "b" + "a".repeat(count - 1);
                String value = "\u0100" + "x".repeat(16) + repeated + "a".repeat(33);
                checkReverse(search, value, repeated, Integer.MAX_VALUE, 17);
                checkReverse(search, value, repeated, 16, -1);
            }
        }
    }

    private static void checkNarrowCandidates(Method search) throws Exception {
        for (int count : new int[]{257, 258, 511}) {
            String repeated = "a".repeat(count);
            String prefix = "b" + repeated.substring(1);
            String suffix = repeated.substring(2) + "ba";
            for (int from : new int[]{0, 1, Integer.MAX_VALUE}) {
                checkReverse(search, repeated + "a", suffix, from, -1);
                checkReverse(search, prefix + "a", prefix, from, 0);
                checkReverse(search, suffix + "a", suffix, from, 0);
                checkReverse(search, "a" + suffix, suffix, from, from < 1 ? -1 : 1);
            }
        }
    }

    private static void checkBoundaries(Method search) throws Exception {
        for (int length : new int[]{127, 128, 129, 255, 256, 257, 258, 259, 260, 261,
                                  271, 272, 273, 288, 289, 290, 511, 512, 513, 1023, 1024, 1025, 4096}) {
            for (int count : new int[]{1, 2, 4, 8, 9, 16, 31, 32, 33, 64, 128, 129, 255, 256, 257, 258, 385}) {
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
