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
 * @summary String equality boundaries and live values across C1/C2 intrinsics
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires (os.arch == "amd64" | os.arch == "x86_64" | os.arch == "aarch64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:CompileCommand=dontinline,TestStringZillaEquality::probe TestStringZillaEquality
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:-UseCompactObjectHeaders -XX:-CompactStrings -XX:CompileCommand=dontinline,TestStringZillaEquality::probe TestStringZillaEquality
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:-UseStringZillaIntrinsics -XX:CompileCommand=dontinline,TestStringZillaEquality::probe TestStringZillaEquality
 */

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import jdk.test.whitebox.WhiteBox;

public class TestStringZillaEquality {
    record Case(String left, String right, boolean equal) {}
    private static final List<Case> cases = new ArrayList<>();
    private static final long[] values = new long[16];

    // Keep many values live around the intrinsic so register spills cannot
    // silently corrupt either its result or its caller's state.
    public static long probe(String left, String right, long[] v) {
        long a = v[0], b = v[1], c = v[2], d = v[3];
        long e = v[4], f = v[5], g = v[6], h = v[7];
        long i = v[8], j = v[9], k = v[10], l = v[11];
        long m = v[12], n = v[13], o = v[14], p = v[15];
        boolean equal = left.equals(right);
        return (equal ? 123 : -123) + a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p;
    }

    private static void check(Case test, int seed) {
        long expected = test.equal ? 123 : -123;
        for (int i = 0; i < values.length; i++) {
            values[i] = ((long)seed << (i + 1)) ^ (0x12345678abcdefL * (i + 1));
            expected += values[i];
        }
        long actual = probe(test.left, test.right, values);
        if (actual != expected) {
            throw new AssertionError("Equality/caller state: " + actual + " != " + expected +
                                     " at length " + test.left.length());
        }
    }

    public static void main(String[] args) throws Exception {
        for (int base : new int[]{'a', 0x400}) {
            for (int size = 0; size <= 40; size++) {
                char[] content = new char[size];
                for (int i = 0; i < size; i++) content[i] = (char)(base + i % 16);
                String left = new String(content);
                cases.add(new Case(left, new String(content.clone()), true));
                cases.add(new Case(left, null, false));
                cases.add(new Case(left, left + "x", false));
                for (int i = 0; i < size; i++) {
                    content[i]++;
                    cases.add(new Case(left, new String(content), false));
                    content[i]--;
                    content[i] ^= 0x100;
                    cases.add(new Case(left, new String(content), false));
                    content[i] ^= 0x100;
                }
            }
        }
        for (int base : new int[]{'a', 0x400}) {
            for (int size : new int[]{32767, 32768, 32769, 65535, 65536, 65537, 131072}) {
                char[] content = new char[size];
                java.util.Arrays.fill(content, (char)base);
                String left = new String(content);
                cases.add(new Case(left, new String(content.clone()), true));
                for (int pos : new int[]{0, 32767, 32768, 65535, 65536, size - 1}) {
                    if (pos >= size) continue;
                    content[pos]++;
                    cases.add(new Case(left, new String(content), false));
                    content[pos]--;
                }
            }
        }
        for (int i = 0; i < 5000; i++) check(cases.get(i % cases.size()), i);
        WhiteBox wb = WhiteBox.getWhiteBox();
        Method method = TestStringZillaEquality.class.getMethod("probe", String.class, String.class, long[].class);
        for (int level : new int[]{1, 4}) {
            wb.deoptimizeMethod(method);
            if (!wb.enqueueMethodForCompilation(method, level) || !wb.isMethodCompiled(method) ||
                wb.getMethodCompilationLevel(method) != level) {
                throw new AssertionError("Equality caller did not compile at level " + level);
            }
            for (int i = 0; i < cases.size(); i++) check(cases.get(i), i * 37);
            if (level == 1 && (!wb.isMethodCompiled(method) || wb.getMethodCompilationLevel(method) != 1)) {
                throw new AssertionError("Large equality must use a Java slow call without deoptimizing its C1 caller");
            }
        }
    }
}
