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
 * @summary Interpreter Latin-1 forward search preserves small inputs and bounded Java fallback
 * @requires (os.arch == "amd64" | os.arch == "x86_64" | os.arch == "aarch64")
 * @run main/othervm -Xint TestStringZillaInterpreterSearch
 * @run main/othervm -Xint -XX:-UseStringZillaIntrinsics TestStringZillaInterpreterSearch
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_indexOfL,_stringzillaFindLatin1 TestStringZillaInterpreterSearch
 * @run main/othervm -Xint -XX:+UnlockExperimentalVMOptions -XX:-UseFourByteObjectHeaders TestStringZillaInterpreterSearch
 * @run main/othervm -Xint -XX:+UnlockExperimentalVMOptions -XX:-UseCompactObjectHeaders TestStringZillaInterpreterSearch
 */

import java.util.Arrays;
import java.util.Random;

public class TestStringZillaInterpreterSearch {
    private static int find(char[] source, char[] target) {
        for (int i = 0; i <= source.length - target.length; i++) {
            int j = 0;
            while (j < target.length && source[i + j] == target[j]) j++;
            if (j == target.length) return i;
        }
        return -1;
    }

    private static void check(char[] source, char[] target) {
        String value = new String(source);
        String needle = new String(target);
        int expected = find(source, target);
        if (value.indexOf(needle) != expected || value.contains(needle) != (expected >= 0)) {
            throw new AssertionError("source=" + source.length + ", target=" + target.length
                    + ", expected=" + expected);
        }
    }

    public static void main(String[] args) {
        Random random = new Random(729041);
        for (int trial = 0; trial < 2000; trial++) {
            char[] source = new char[random.nextInt(1025)];
            char[] target = new char[random.nextInt(65)];
            for (int i = 0; i < source.length; i++) source[i] = (char)random.nextInt(256);
            for (int i = 0; i < target.length; i++) target[i] = (char)random.nextInt(256);
            if (target.length <= source.length && random.nextBoolean()) {
                int start = random.nextInt(source.length - target.length + 1);
                System.arraycopy(target, 0, source, start, target.length);
            }
            check(source, target);
        }
        for (int length : new int[]{32768, 65535, 65536, 65537}) {
            for (int count : new int[]{0, 1, 4, 64, 65, 129}) {
                char[] source = new char[length];
                char[] target = new char[count];
                Arrays.fill(source, 'a');
                Arrays.fill(target, 'a');
                if (count > 0) target[0] = 'b';
                check(source, target);
                if (count > 0) {
                    System.arraycopy(target, 0, source, length - count, count);
                    check(source, target);
                }
            }
        }
        try {
            "source".indexOf((String)null);
            throw new AssertionError("Missing NullPointerException");
        } catch (NullPointerException expected) {
        }
    }
}
