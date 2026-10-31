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
 * @summary Reverse searches preserve matches across compilation tiers and boundaries
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires (os.arch == "amd64" | os.arch == "x86_64" | os.arch == "aarch64")
 * @library /test/lib
 * @modules java.base/java.lang:open
 * @compile/module=java.base java/lang/StringZillaDispatchHelper.java
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI TestStringZillaDispatch
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:-UseStringZillaIntrinsics TestStringZillaDispatch
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
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import jdk.test.whitebox.WhiteBox;

public class TestStringZillaDispatch {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();

    public static void main(String[] args) throws Exception {
        Method search = Class.forName("java.lang.StringZillaDispatchHelper")
                .getMethod("search", String.class, String.class, int.class);
        if (args.length != 0) {
            checkSearches(search);
            return;
        }
        for (int level : new int[]{1, 4}) {
            WB.deoptimizeMethod(search);
            if (!WB.enqueueMethodForCompilation(search, level) || !WB.isMethodCompiled(search)
                    || WB.getMethodCompilationLevel(search) != level) {
                throw new AssertionError("Cannot compile " + search + " at " + level);
            }
            checkSearches(search);
        }
    }

    private static void checkSearches(Method search) throws Exception {
        checkBoundaries(search);
        checkNarrowCandidates(search);
        checkFilteredBlocks(search);
        checkShortAndMixed(search);
        checkIntermediateUTF16(search);
        checkReverseSuffixes(search);
        checkLongUTF16Filters(search);
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
        for (int count : new int[]{4, 8, 9, 15, 16, 17, 23, 24, 25, 31, 32, 33, 47, 48, 49, 63, 64, 65, 66, 127, 128, 129, 130}) {
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

    private static void checkIntermediateUTF16(Method search) throws Exception {
        for (int count : new int[]{8, 9, 16, 32, 64, 128, 129}) {
            String needle = "\u0402" + "\u0401".repeat(count - 2) + "\u0403";
            String denseNeedle = "\u0401".repeat(count - 2) + "\u0402\u0401";
            for (int length : new int[]{127, 128, 129, 511, 512, 513, 1023, 1024, 4096}) {
                if (count > length) continue;
                String absent = "\u0401".repeat(length);
                checkReverse(search, absent, needle, Integer.MAX_VALUE, -1);
                checkReverse(search, absent, denseNeedle, Integer.MAX_VALUE, -1);
                if (length > count) {
                    char[] shiftedValue = absent.toCharArray();
                    ByteBuffer shifted = ByteBuffer.allocate((count + 1) * 2).order(ByteOrder.nativeOrder());
                    for (int i = 0; i < count; i++) {
                        shifted.putChar(1 + i * 2, denseNeedle.charAt(i));
                    }
                    for (int i = 0; i <= count; i++) {
                        shiftedValue[length - count - 1 + i] = shifted.getChar(i * 2);
                    }
                    checkReverse(search, new String(shiftedValue), denseNeedle, Integer.MAX_VALUE, -1);
                }
                for (int position : new int[]{0, 1, length / 2, length - count}) {
                    if (position + count > length) continue;
                    String value = absent.substring(0, position) + needle
                            + absent.substring(position + count);
                    for (int from : new int[]{position - 1, position, length - count,
                                             Integer.MAX_VALUE}) {
                        checkReverse(search, value, needle, from, from < position ? -1 : position);
                    }
                    String dense = absent.substring(0, position) + denseNeedle
                            + absent.substring(position + count);
                    for (int from : new int[]{position - 1, position, length - count,
                                             Integer.MAX_VALUE}) {
                        checkReverse(search, dense, denseNeedle, from, from < position ? -1 : position);
                    }
                }
            }
        }
    }

    private static void checkReverseSuffixes(Method search) throws Exception {
        for (int base : new int[]{'a', 0x0401}) {
            String unit = String.valueOf((char)base);
            for (int count : new int[]{4, 9, 12, 13, 15, 16, 17, 24, 25, 31, 32, 33, 64, 128, 129, 256, 257, 512}) {
                String repeated = unit.repeat(count);
                for (int change : base > 0xff ? new int[]{1, 0x100} : new int[]{1}) {
                    for (int distance = 1; distance <= Math.min(count, 17); distance++) {
                        int index = count - distance;
                        String needle = repeated.substring(0, index) + (char)(base + change)
                                + repeated.substring(index + 1);
                        checkReverse(search, needle, needle, Integer.MAX_VALUE, 0);
                        checkReverse(search, repeated + unit, needle, Integer.MAX_VALUE, -1);
                        checkReverse(search, needle + unit, needle, Integer.MAX_VALUE, 0);
                        checkReverse(search, unit + needle, needle, Integer.MAX_VALUE, 1);
                        if (count <= 128) {
                            checkReverse(search, unit.repeat(512), needle, Integer.MAX_VALUE, -1);
                            checkReverse(search, unit.repeat(512 - count) + needle,
                                    needle, Integer.MAX_VALUE, 512 - count);
                            checkReverse(search, unit.repeat(511 - count) + needle + unit,
                                    needle, Integer.MAX_VALUE, 511 - count);
                        }
                    }
                }
            }
        }
    }

    private static void checkNarrowCandidates(Method search) throws Exception {
        for (int count : new int[]{128, 129, 130, 511, 512, 513, 1023, 1024, 32767, 32768, 32769}) {
            String repeated = "\u0401".repeat(count);
            String prefix = "\u0402" + repeated.substring(1);
            String suffix = repeated.substring(0, count - 1) + "\u0402";
            String interior = repeated.substring(0, count - 2) + "\u0501\u0401";
            for (int from : new int[]{0, 1, Integer.MAX_VALUE}) {
                checkReverse(search, repeated, repeated, from, 0);
                checkReverse(search, repeated + "\u0401", repeated, from, Math.min(from, 1));
                checkReverse(search, repeated + "\u0401", suffix, from, -1);
                checkReverse(search, repeated + "\u0401", interior, from, -1);
                checkReverse(search, prefix + "\u0401", prefix, from, 0);
                checkReverse(search, "\u0401" + prefix, prefix, from, from < 1 ? -1 : 1);
            }
        }
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


    private static void checkLongUTF16Filters(Method search) throws Exception {
        int length = 2048;
        for (int count : new int[]{129, 255, 256, 257}) {
            String needle = "\u0402" + "\u0401".repeat(count - 2) + "\u0403";
            String absent = "\u0401".repeat(length);
            checkReverse(search, absent, needle, Integer.MAX_VALUE, -1);
            for (int position : new int[]{0, 1, 255, 256, 257, 510, 511, 512, length - count}) {
                String value = absent.substring(0, position) + needle
                        + absent.substring(position + count);
                for (int from : new int[]{position - 1, position, length - count, Integer.MAX_VALUE}) {
                    checkReverse(search, value, needle, from, from < position ? -1 : position);
                }
            }
            for (int mismatch : new int[]{0, count / 2, count - 9, count - 5, count - 1}) {
                char[] changed = needle.toCharArray();
                changed[mismatch] = '\u0404';
                String value = needle + "\u0401".repeat(length - count * 2) + new String(changed);
                checkReverse(search, value, needle, Integer.MAX_VALUE, 0);
                checkReverse(search, new String(changed), needle, Integer.MAX_VALUE, -1);
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
