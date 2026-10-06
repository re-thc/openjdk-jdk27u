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
 * @summary Bounded native calls: chunk overlaps, long needles, odd UTF-16 matches and equality
 * @run main/othervm -Xint StringZillaBounded
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 StringZillaBounded
 * @run main/othervm -Xbatch -XX:-TieredCompilation StringZillaBounded
 * @run main/othervm -Xcomp -XX:-TieredCompilation StringZillaBounded
 * @run main/othervm -Xbatch -XX:-CompactStrings StringZillaBounded
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_stringzillaEqualsRange,_stringzillaFindLatin1,_stringzillaFindUTF16,_stringzillaRfindLatin1,_stringzillaRfindUTF16,_stringzillaFindUTF16Latin1,_stringzillaRfindUTF16Latin1,_stringzillaFindCharLatin1,_stringzillaFindCharUTF16,_stringzillaRfindCharLatin1,_stringzillaRfindCharUTF16 StringZillaBounded
 * @run main/othervm -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_stringzillaEqualsRange,_stringzillaFindLatin1,_stringzillaFindUTF16,_stringzillaRfindLatin1,_stringzillaRfindUTF16,_stringzillaFindUTF16Latin1,_stringzillaRfindUTF16Latin1,_stringzillaFindCharLatin1,_stringzillaFindCharUTF16,_stringzillaRfindCharLatin1,_stringzillaRfindCharUTF16,_indexOfL,_indexOfU,_indexOfUL,_indexOfIL,_indexOfIU,_indexOfIUL,_indexOfL_char,_indexOfU_char,_equalsL StringZillaBounded
 * @run main/othervm -Xbatch -XX:-UseStringZillaIntrinsics StringZillaBounded
 */

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;

public class StringZillaBounded {
    private static void equal(int actual, int expected) {
        if (actual != expected) throw new AssertionError(actual + " != " + expected);
    }

    private static void check(String s, String t, int expected) {
        equal(s.indexOf(t), expected);
        equal(s.lastIndexOf(t), expected);
        equal(s.indexOf(t, 1), expected < 1 ? -1 : expected);
        equal(s.lastIndexOf(t, Integer.MAX_VALUE), expected);
        equal(s.indexOf(t, 7, s.length()), expected < 7 ? -1 : expected);
        if (expected >= 0) equal(s.lastIndexOf(t, expected - 1), -1);
        StringBuilder builder = new StringBuilder(s + t);
        builder.setLength(s.length());
        builder.ensureCapacity(s.length() + 65536);
        equal(builder.indexOf(t), expected);
        equal(builder.lastIndexOf(t), expected);
        StringBuffer buffer = new StringBuffer(builder);
        equal(buffer.indexOf(t), expected);
        equal(buffer.lastIndexOf(t), expected);
        int cp = t.codePointAt(0);
        equal(s.indexOf(cp), expected);
        equal(s.lastIndexOf(cp), expected);
    }

    private static char[] needle(int count, boolean utf16) {
        char[] target = new char[count];
        Arrays.fill(target, utf16 ? (char)0x0400 : 'a');
        target[0] = utf16 ? (char)0x0410 : 'b';
        target[count - 1] = utf16 ? (char)0x0411 : 'c';
        return target;
    }

    public static void main(String[] args) {
        // One occurrence, with unique first/last characters: expected positions
        // follow construction rather than another search implementation.
        for (int size : new int[]{32767, 32768, 32769, 65535, 65536, 65537, 131072}) {
            for (int coder = 0; coder < 3; coder++) {
                char filler = coder == 0 ? 'a' : (char)0x0400;
                char[] target = needle(4, coder == 1);
                String t = new String(target);
                for (int pos : new int[]{0, 1, 32766, 32767, 32768, 65534, 65535, 65536, size - 4}) {
                    if (pos + target.length > size) continue;
                    char[] chars = new char[size];
                    Arrays.fill(chars, filler);
                    System.arraycopy(target, 0, chars, pos, target.length);
                    check(new String(chars), t, pos);
                }
                check(String.valueOf(filler).repeat(size), t, -1);
            }
            // A supplementary code point must survive the UTF-16 chunk edge.
            if (size >= 32769) {
                char[] chars = new char[size];
                Arrays.fill(chars, (char)0x0400);
                chars[32767] = 0xd83d;
                chars[32768] = 0xde42;
                check(new String(chars), "\ud83d\ude42", 32767);
            }
        }
        for (int count : new int[]{63, 64, 65, 256, 1024, 2048, 2049}) {
            for (boolean utf16 : new boolean[]{false, true}) {
                char[] target = needle(count, utf16);
                char[] chars = new char[8192];
                Arrays.fill(chars, (char)0x0400);
                System.arraycopy(target, 0, chars, 1234, count);
                check(new String(chars), new String(target), 1234);
            }
        }
        // Actual odd-byte matches, followed/preceded by an aligned match.
        for (int count : new int[]{16, 64, 256}) {
            char[] target = new char[count];
            Arrays.fill(target, (char)0x0401);
            target[count - 2] = 0x0402;
            ByteBuffer shifted = ByteBuffer.allocate((count + 1) * 2).order(ByteOrder.nativeOrder());
            for (int i = 0; i < count; i++) shifted.putChar(1 + i * 2, target[i]);
            char[] chars = new char[512 + count + 1];
            Arrays.fill(chars, 0, 512, (char)0x0401);
            for (int i = 0; i <= count; i++) chars[512 + i] = shifted.getChar(i * 2);
            String odd = new String(chars), t = new String(target);
            equal(odd.indexOf(t), -1);
            equal(odd.lastIndexOf(t), -1);
            equal((odd + t).indexOf(t), odd.length());
            equal((t + odd).lastIndexOf(t), 0);
        }
        for (String unit : new String[]{"a", "\u0400"}) {
            for (int size : new int[]{32767, 32768, 32769, 65535, 65536, 65537, 131072}) {
                String left = unit.repeat(size);
                if (!left.equals(new String(left.toCharArray()))) throw new AssertionError("Large equality");
                for (int pos : new int[]{0, 32767, 32768, 65535, 65536, size - 1}) {
                    if (pos >= size) continue;
                    char[] chars = left.toCharArray();
                    chars[pos]++;
                    if (left.equals(new String(chars))) throw new AssertionError("Large mismatch at " + pos);
                }
            }
        }
        System.out.println("Bounded searches and equality passed");
    }
}
