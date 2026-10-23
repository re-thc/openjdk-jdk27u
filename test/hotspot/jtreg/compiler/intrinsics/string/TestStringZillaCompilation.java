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
 * @summary StringZilla search callers must compile in C1 and C2, without bailout
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires (os.arch == "amd64" | os.arch == "x86_64" | os.arch == "aarch64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:CompileCommand=dontinline,TestStringZillaCompilation::probe* TestStringZillaCompilation
 */

import java.lang.reflect.Method;
import jdk.test.whitebox.WhiteBox;

public class TestStringZillaCompilation {
    private static String latin = "a".repeat(4096);
    private static String utf16 = "\u0400".repeat(4096);
    private static String latinNeedle = "wxyz";
    private static String utf16Needle = "\u0410\u0411\u0412\u0413";
    private static StringBuilder builder = new StringBuilder(latin);
    private static StringBuffer buffer = new StringBuffer(utf16);
    private static String largeLatin = "a".repeat(131072);
    private static String largeUTF16 = "\u0400".repeat(65537);
    private static String largeLatinCopy = new String(largeLatin.toCharArray());
    private static String largeUTF16Copy = new String(largeUTF16.toCharArray());
    private static String overlappingLatinNeedle = "b" + "a".repeat(256);
    private static String overlappingUTF16Needle = "\u0402" + "\u0401".repeat(128);
    private static String overlappingLatin = overlappingLatinNeedle + "a";
    private static String overlappingUTF16 = overlappingUTF16Needle + "\u0401";
    private static String whitespace = " \t\n\u001c".repeat(1024);
    private static String scanLines = latin + "\r\n" + latin;

    public static int probeLatin() { return latin.indexOf(latinNeedle); }
    public static int probeUTF16() { return utf16.indexOf(utf16Needle); }
    public static int probeMixed() { return utf16.indexOf(latinNeedle); }
    public static int probeRange() { return latin.indexOf(latinNeedle, 17, 4000); }
    public static int probeUTF16Range() { return utf16.indexOf(utf16Needle, 17, 4000); }
    public static int probeMixedRange() { return utf16.indexOf(latinNeedle, 17, 4000); }
    public static int probeReverseLatin() { return latin.lastIndexOf(latinNeedle); }
    public static int probeReverseUTF16() { return utf16.lastIndexOf(utf16Needle); }
    public static int probeReverseMixed() { return utf16.lastIndexOf(latinNeedle); }
    public static int probeChar() { return latin.indexOf('z'); }
    public static int probeUTF16Char() { return utf16.indexOf(0x0413); }
    public static int probeSupplementary() { return utf16.indexOf(0x10400); }
    public static int probeReverseChar() { return latin.lastIndexOf('z'); }
    public static int probeReverseUTF16Char() { return utf16.lastIndexOf(0x0413); }
    public static int probeReverseSupplementary() { return utf16.lastIndexOf(0x10400); }
    public static int probeBuilder() { return builder.indexOf(latinNeedle); }
    public static int probeBuffer() { return buffer.indexOf(utf16Needle); }
    public static int probeTrim() { return whitespace.trim().isEmpty() ? -1 : 0; }
    public static int probeStrip() { return whitespace.strip().isEmpty() ? -1 : 0; }
    public static int probeStripLeading() { return whitespace.stripLeading().isEmpty() ? -1 : 0; }
    public static int probeStripTrailing() { return whitespace.stripTrailing().isEmpty() ? -1 : 0; }
    public static int probeIsBlank() { return whitespace.isBlank() ? -1 : 0; }
    public static int probeLines() { return scanLines.lines().count() == 2 ? -1 : 0; }

    public static int probeEquality() { return latin.equals(new String(latin.toCharArray())) ? -1 : 0; }
    public static int probeUTF16Equality() { return utf16.equals(new String(utf16.toCharArray())) ? -1 : 0; }
    public static int probeLargeEquality() { return largeLatin.equals(largeLatinCopy) ? -1 : 0; }
    public static int probeLargeUTF16Equality() { return largeUTF16.equals(largeUTF16Copy) ? -1 : 0; }
    public static int probeLargeReverse() { return largeLatin.lastIndexOf(latinNeedle); }
    public static int probeLargeUTF16Reverse() { return largeUTF16.lastIndexOf(utf16Needle); }
    public static int probeLocalBuilder() { return new StringBuilder(latin).indexOf(latinNeedle); }
    public static int probeLocalString() { return new StringBuilder(utf16).toString().lastIndexOf(utf16Needle); }
    public static int probeLocalChar() { return new StringBuilder(utf16).toString().lastIndexOf(0x0413); }
    public static int probeOverlappingLatin() { return overlappingLatin.lastIndexOf(overlappingLatinNeedle); }
    public static int probeOverlappingUTF16() { return overlappingUTF16.lastIndexOf(overlappingUTF16Needle); }
    public static int probeOverlappingBuilder() { return new StringBuilder(overlappingLatin).lastIndexOf(overlappingLatinNeedle); }
    public static int probeOverlappingBuffer() { return new StringBuffer(overlappingUTF16).lastIndexOf(overlappingUTF16Needle); }

    public static void main(String[] args) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        for (Method method : TestStringZillaCompilation.class.getDeclaredMethods()) {
            if (!method.getName().startsWith("probe")) continue;
            for (int i = 0; i < 2000; i++) check(method);
            for (int level : new int[]{1, 4}) {
                wb.deoptimizeMethod(method);
                if (!wb.enqueueMethodForCompilation(method, level)) {
                    throw new AssertionError("Cannot enqueue " + method + " at " + level);
                }
                if (!wb.isMethodCompiled(method) || wb.getMethodCompilationLevel(method) != level) {
                    throw new AssertionError("Compilation bailed out: " + method + " level " + level);
                }
                check(method);
            }
        }
    }

    private static void check(Method method) throws Exception {
        int result = (Integer) method.invoke(null);
        int expected = method.getName().startsWith("probeOverlapping") ? 0 : -1;
        if (result != expected) throw new AssertionError(method + " returned " + result);
    }
}
