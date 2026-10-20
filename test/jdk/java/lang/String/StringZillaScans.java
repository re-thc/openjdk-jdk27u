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
 * @summary Latin1 line and whitespace scans preserve public String behavior
 * @run main/othervm -Xint StringZillaScans
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 StringZillaScans
 * @run main/othervm -Xbatch -XX:-TieredCompilation StringZillaScans
 * @run main/othervm -Xcomp -XX:-TieredCompilation StringZillaScans
 * @run main/othervm -Xbatch -XX:-CompactStrings StringZillaScans
 * @run main/othervm -Xbatch -XX:-UseStringZillaIntrinsics StringZillaScans
 * @run main/othervm -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_stringzillaScanLatin1 StringZillaScans
 * @run main/othervm -Xmx32m -XX:+UseSerialGC StringZillaScans gc
 */

/*
 * @test id=limitedAVX
 * @summary Latin1 scan fallback and AVX2 paths
 * @requires (os.arch == "amd64" | os.arch == "x86_64")
 * @run main/othervm -Xbatch -XX:UseAVX=0 StringZillaScans
 * @run main/othervm -Xbatch -XX:UseAVX=2 StringZillaScans
 */

import java.util.ArrayList;
import java.util.List;
import java.util.Spliterator;
import java.util.concurrent.atomic.AtomicInteger;

public class StringZillaScans {
    private static volatile boolean running;
    private static void equal(Object actual, Object expected) {
        if (!actual.equals(expected)) {
            throw new AssertionError("Mismatch: " + actual + " != " + expected);
        }
    }

    private static boolean white(char ch, boolean trim) {
        return trim ? ch <= 0x20 : Character.isWhitespace(ch);
    }

    private static void check(String s) {
        for (boolean trim : new boolean[]{true, false}) {
            int left = 0, right = s.length();
            while (left < right && white(s.charAt(left), trim)) left++;
            while (right > left && white(s.charAt(right - 1), trim)) right--;
            String actual = trim ? s.trim() : s.strip();
            equal(actual, s.substring(left, right));
            if (left == 0 && right == s.length() && (trim || !s.isEmpty()) && actual != s) {
                throw new AssertionError("Unchanged string identity");
            }
            if (!trim) {
                String leading = s.stripLeading();
                equal(leading, s.substring(left));
                // Trailing-only scan must retain leading whitespace.
                int end = s.length();
                while (end > 0 && white(s.charAt(end - 1), false)) end--;
                String trailing = s.stripTrailing();
                equal(trailing, s.substring(0, end));
                if ((left == 0 && leading != s) || (end == s.length() && trailing != s)) {
                    throw new AssertionError("Unchanged directional identity");
                }
                equal(s.isBlank(), left == s.length());
            }
        }
    }

    private static List<String> referenceLines(String s) {
        var lines = new ArrayList<String>();
        for (int start = 0, i = 0; i < s.length();) {
            while (i < s.length() && s.charAt(i) != '\r' && s.charAt(i) != '\n') i++;
            lines.add(s.substring(start, i));
            if (i < s.length()) {
                char ch = s.charAt(i++);
                if (ch == '\r' && i < s.length() && s.charAt(i) == '\n') i++;
            }
            start = i;
        }
        return lines;
    }

    private static void split(Spliterator<String> sp, List<String> output, int depth) {
        var prefix = depth > 0 ? sp.trySplit() : null;
        if (prefix != null) split(prefix, output, depth - 1);
        if (depth > 0 && prefix != null) split(sp, output, depth - 1);
        else sp.forEachRemaining(output::add);
    }

    private static void lines(String s) {
        List<String> expected = referenceLines(s);
        equal(s.lines().toList(), expected);
        equal(s.lines().parallel().toList(), expected);
        var sp = s.lines().spliterator();
        int characteristics = Spliterator.ORDERED | Spliterator.IMMUTABLE | Spliterator.NONNULL;
        equal(sp.characteristics(), characteristics);
        equal(sp.estimateSize(), (long)s.length() + 1);
        var actual = new ArrayList<String>();
        sp.tryAdvance(actual::add);
        split(sp, actual, 8);
        equal(actual, expected);
        for (boolean advance : new boolean[]{true, false}) {
            try {
                if (advance) sp.tryAdvance(null);
                else sp.forEachRemaining(null);
                throw new AssertionError("Missing null consumer exception");
            } catch (NullPointerException ok) { }
        }
        var calls = new AtomicInteger();
        var stream = s.lines().peek(x -> calls.incrementAndGet());
        equal(calls.get(), 0);
        stream.findFirst();
        equal(calls.get(), expected.isEmpty() ? 0 : 1);
        if (!expected.isEmpty()) {
            var throwing = s.lines().spliterator();
            try {
                throwing.tryAdvance(x -> { throw new UnsupportedOperationException(); });
                throw new AssertionError("Consumer exception lost");
            } catch (UnsupportedOperationException ok) { }
            var remaining = new ArrayList<String>();
            throwing.forEachRemaining(remaining::add);
            equal(remaining, expected.subList(1, expected.size()));
        }
    }

    private static void concurrentGC() throws Exception {
        String blank = " \t\u001c\n".repeat(65537);
        String text = "x".repeat(131089) + "\r\n" + "y".repeat(131089);
        running = true;
        Thread allocator = new Thread(() -> {
            byte[][] retained = new byte[8][];
            int cursor = 0;
            while (running) {
                retained[cursor++ & 7] = new byte[256 * 1024];
                if ((cursor & 31) == 0) System.gc();
            }
        });
        allocator.start();
        try {
            for (int i = 0; i < 2000; i++) {
                equal(blank.isBlank(), true);
                equal(blank.trim(), "");
                equal(blank.stripTrailing(), "");
                equal(text.lines().count(), 2L);
            }
        } finally {
            running = false;
            allocator.join();
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            concurrentGC();
            return;
        }
        for (int ch = 0; ch < 256; ch++) {
            String c = String.valueOf((char)ch);
            for (int n : new int[]{0, 1, 7, 8, 9, 263, 264, 265, 521}) {
                String pad = c.repeat(n);
                check(pad);
                check(pad + "X" + pad);
                check(" ".repeat(n) + c + "\t".repeat(n));
            }
        }
        for (int n : new int[]{0, 1, 7, 8, 9, 31, 32, 255, 256, 263, 264, 265,
                              65527, 65528, 65535, 65536, 65537, 65544, 131089}) {
            for (String c : new String[]{" ", "\0", "\t", "\u001c", "\u0085", "\u00a0", "x",
                                         "\u1680", "\u2000", "\u2028", "\u3000", "\ufeff", "\ud800", "\ud83d\ude00"}) {
                String pad = c.repeat(n);
                check(pad);
                check(pad + "X" + pad);
                check("X" + pad);
                check(pad + "X");
            }
            for (String separator : new String[]{"\r", "\n", "\r\n"}) {
                String pad = "x".repeat(n);
                lines(pad);
                lines(separator + pad + separator + separator + "\u00a0" + separator);
                lines(pad + separator + "tail");
                lines(pad + "\u0100" + separator + "\ud83d\ude00");
            }
        }
        for (String s : new String[]{"", "\n", "\r", "\r\n", "\n\r", "\r\n\r\n", "a\rb\nc\r\nd",
                                     "\u000b\u000c\u0085\u2028\u2029", "\r\r\n\n"}) lines(s);
        // Warm all public producers so compiled tiers execute the same checks.
        String pad = " ".repeat(1024);
        for (int i = 0; i < 12000; i++) {
            check(pad + (char)(33 + (i & 63)) + pad);
            equal((pad + "\r\nx").lines().count(), 2L);
        }
    }
}
