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
 * @summary StringZilla search: encodings, ranges, builder capacity, and Unicode boundaries
 * @run main/othervm -Xint -XX:+UseStringZillaIntrinsics StringZillaSearch
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseStringZillaIntrinsics StringZillaSearch
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+UseStringZillaIntrinsics StringZillaSearch
 * @run main/othervm -Xcomp -XX:-TieredCompilation -XX:+UseStringZillaIntrinsics StringZillaSearch
 * @run main/othervm -Xbatch -XX:+UseStringZillaIntrinsics -XX:-CompactStrings StringZillaSearch
 * @run main/othervm -Xint -XX:+UseStringZillaIntrinsics -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_stringzillaFindLatin1,_stringzillaFindUTF16,_stringzillaRfindLatin1,_stringzillaRfindUTF16,_stringzillaFindUTF16Latin1,_stringzillaRfindUTF16Latin1,_stringzillaFindCharLatin1,_stringzillaFindCharUTF16,_stringzillaRfindCharLatin1,_stringzillaRfindCharUTF16 StringZillaSearch
 * @run main/othervm -Xbatch -XX:+UseStringZillaIntrinsics -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_stringzillaFindLatin1,_stringzillaFindUTF16,_stringzillaRfindLatin1,_stringzillaRfindUTF16,_stringzillaFindUTF16Latin1,_stringzillaRfindUTF16Latin1,_stringzillaFindCharLatin1,_stringzillaFindCharUTF16,_stringzillaRfindCharLatin1,_stringzillaRfindCharUTF16,_indexOfL,_indexOfU,_indexOfUL,_indexOfIL,_indexOfIU,_indexOfIUL,_indexOfL_char,_indexOfU_char,_equalsL StringZillaSearch
 * @run main/othervm -Xbatch -XX:-UseStringZillaIntrinsics StringZillaSearch
 */

import java.util.Random;
import java.util.concurrent.atomic.AtomicBoolean;

public class StringZillaSearch {
    private static void equal(int actual, int expected) {
        if (actual != expected) throw new AssertionError(actual + " != " + expected);
    }

    // Independent code-unit oracle: never invokes a search API.
    private static int search(String s, String t, int from, boolean reverse) {
        int n = s.length(), m = t.length();
        if (reverse) {
            for (int i = Math.min(from, n - m); i >= 0; i--) {
                int j = 0;
                while (j < m && s.charAt(i + j) == t.charAt(j)) j++;
                if (j == m) return i;
            }
        } else {
            if (m == 0) return Math.min(n, Math.max(0, from));
            for (int i = Math.max(0, from); i <= n - m; i++) {
                int j = 0;
                while (j < m && s.charAt(i + j) == t.charAt(j)) j++;
                if (j == m) return i;
            }
        }
        return -1;
    }

    private static void check(String s, String t, int from) {
        int first = search(s, t, from, false), last = search(s, t, from, true);
        equal(s.indexOf(t, from), first);
        equal(s.lastIndexOf(t, from), last);
        equal(s.indexOf(t), search(s, t, 0, false));
        equal(s.lastIndexOf(t), search(s, t, s.length(), true));
        int begin = Math.max(0, Math.min(from, s.length()));
        int end = Math.min(s.length(), begin + 257);
        int ranged = search(s.substring(begin, end), t, 0, false);
        equal(s.indexOf(t, begin, end), ranged < 0 ? -1 : begin + ranged);
        StringBuilder builder = new StringBuilder(s + t + "poison");
        builder.setLength(s.length()); // Matches in unused capacity must be ignored.
        builder.ensureCapacity(s.length() + 1024);
        equal(builder.indexOf(t, from), first);
        equal(builder.lastIndexOf(t, from), last);
        StringBuffer buffer = new StringBuffer(builder);
        equal(buffer.indexOf(t, from), first);
        equal(buffer.lastIndexOf(t, from), last);
        if (s.contains((CharSequence)new StringBuilder(t)) != (search(s, t, 0, false) >= 0))
            throw new AssertionError("contains");
    }

    private static void character(String s, int cp, int from) {
        int first = -1, last = -1;
        if (Character.isValidCodePoint(cp)) {
            String t = new String(Character.toChars(cp));
            first = search(s, t, from, false);
            last = search(s, t, from, true);
        }
        equal(s.indexOf(cp, from), first);
        equal(s.lastIndexOf(cp, from), last);
        int begin = Math.max(0, Math.min(from, s.length()));
        int end = Math.min(s.length(), begin + 257);
        int expected = Character.isValidCodePoint(cp)
                ? search(s.substring(begin, end), new String(Character.toChars(cp)), 0, false) : -1;
        if (expected >= 0) expected += begin;
        equal(s.indexOf(cp, begin, end), expected);
    }

    public static void main(String[] args) throws Exception {
        // Equality is used during native-library and timezone initialization.
        // Exercise these consumers before warming up the string-search corpus.
        if (System.getProperty(new String("java.vm.info".toCharArray())) == null)
            throw new AssertionError("VM property lookup");
        java.time.ZoneId.of("America/New_York").getRules();
        int[] sizes = {0, 1, 2, 15, 31, 127, 128, 129, 255, 256, 257, 1024, 4096};
        String[] needles = {"", "a", "aa", "ab", "abc", "b", "\0", "\u00ff", "\u0100", "\ud800", "\udc00", "\ud83d\ude00", "a".repeat(64), "a".repeat(65)};
        int[] codepoints = {-1, 0, 'a', 'b', 255, 256, 0xd800, 0xdc00, 0x1f600, 0x10ffff, 0x110000};
        for (int size : sizes) {
            for (String prefix : new String[]{"", "\u0100", "\u00ff", "\ud800"}) {
                String s = prefix + "a".repeat(size) + "b\0\u00ff\u0100\ud83d\ude00";
                for (int from : new int[]{Integer.MIN_VALUE, -1, 0, 1, 127, 255, size, size + 1, Integer.MAX_VALUE}) {
                    for (String t : needles) check(s, t, from);
                    for (int cp : codepoints) character(s, cp, from);
                }
            }
        }
        // Distinct arrays with equal contents, early/late mismatch, and coders.
        for (String unit : new String[]{"a", "\u0401"}) {
            for (int size : sizes) {
                String first = unit.repeat(size);
                String same = new String(first.toCharArray());
                if (!first.equals(same)) throw new AssertionError("equal content");
                if (size != 0) {
                    char[] changed = same.toCharArray();
                    changed[0]++;
                    if (first.equals(new String(changed))) throw new AssertionError("early mismatch");
                    changed[0]--;
                    for (int index : new int[]{1, 7, 8, 15, 16, 31, 32, 63, 64, 65, 127, 128, 255, 256, size - 1}) {
                        if (index >= size) continue;
                        changed[index]++;
                        if (first.equals(new String(changed))) throw new AssertionError("prefix/late mismatch " + index);
                        changed[index]--;
                    }
                    changed[0] += 256; // Same low byte, different UTF-16 high byte.
                    if (first.equals(new String(changed))) throw new AssertionError("high-byte mismatch");
                }
            }
        }
        if ("a".repeat(4096).equals("\u0401".repeat(4096))) throw new AssertionError("coder mismatch");
        // Odd-byte matches that straddle code units must not become Java matches.
        String crossed = "\u0102\u0304".repeat(1024);
        check(crossed, "\u0401", 0);
        check(crossed, "\u0203", crossed.length());
        // Periodic data can produce thousands of odd-byte matches. Check both
        // no-match scans and an aligned match beyond the first false match.
        String periodic = "\u0401".repeat(4096);
        for (int count : new int[]{1, 2, 4, 64, 65}) {
            String target = "\u0104".repeat(count);
            check(periodic, target, periodic.length());
            check(periodic + target, target, 0);
            check(target + periodic, target, periodic.length());
        }
        // Exercise compiled paths with variable inputs.
        Random random = new Random(0x5a17);
        for (int trial = 0; trial < 5000; trial++) {
            char[] chars = new char[random.nextInt(800)];
            for (int i = 0; i < chars.length; i++) {
                int value = random.nextInt(12);
                chars[i] = (char)(value < 8 ? 'a' + value : value == 8 ? 0 : value == 9 ? 255 : value == 10 ? 256 : 0xd800);
            }
            String s = new String(chars);
            int start = random.nextInt(chars.length + 1);
            int end = Math.min(chars.length, start + random.nextInt(80));
            String t = trial % 3 == 0 ? needles[random.nextInt(needles.length)] : s.substring(start, end);
            int from = random.nextInt(chars.length + 21) - 10;
            check(s, t, from);
            character(s, codepoints[random.nextInt(codepoints.length)], from);
        }
        // Search boundaries and leaf memory dependencies on builder writes.
        for (String filler : new String[]{"a", "\u0400"}) {
            StringBuilder mutable = new StringBuilder(filler.repeat(1024));
            String t = filler.equals("a") ? "ba" : "\u0420\u0400";
            char first = t.charAt(0);
            for (int trial = 0; trial < 20_000; trial++) {
                int index = 31 + trial % 3;
                mutable.setCharAt(index, first);
                equal(mutable.indexOf(t), index);
                equal(mutable.indexOf(t, 1), index);
                equal(mutable.lastIndexOf(t), index);
                mutable.setCharAt(index, filler.charAt(0));
                equal(mutable.indexOf(t), -1);
                equal(mutable.lastIndexOf(t), -1);
            }
        }
        // Heap addresses passed to leaf calls remain valid under concurrent GC.
        AtomicBoolean done = new AtomicBoolean();
        Thread collector = new Thread(() -> { while (!done.get()) { System.gc(); Thread.yield(); } });
        collector.start();
        try {
            String s = "a".repeat(8192) + "b";
            for (int i = 0; i < 5000; i++) {
                equal(s.indexOf("ab"), 8191);
                equal(s.lastIndexOf('b'), 8192);
                equal(s.lastIndexOf("zz"), -1);
                equal(s.lastIndexOf('z'), -1);
            }
        } finally {
            done.set(true);
            collector.join();
        }
        System.out.println("StringZilla search checks passed");
    }
}
