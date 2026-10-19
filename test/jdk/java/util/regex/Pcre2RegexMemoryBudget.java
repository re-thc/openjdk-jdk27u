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
 *
 */

/*
 * @test
 * @summary Native regex engines and caches have a process-wide fail-open budget
 * @modules java.base/java.util.regex:open java.base/jdk.internal.util.regex
 * @run main/othervm/timeout=300 Pcre2RegexMemoryBudget
 * @run main/othervm/timeout=300 -XX:-UsePcre2RegexIntrinsics Pcre2RegexMemoryBudget
 */

import java.lang.ref.Reference;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import jdk.internal.util.regex.Pcre2Regex;

public class Pcre2RegexMemoryBudget {
    public static void main(String[] args) throws Exception {
        if (!Pcre2Regex.ENABLED) {
            System.out.println("PCRE2 regex backend unavailable; Java fallback configuration");
            return;
        }
        List<Pcre2Regex> retained = new ArrayList<>();
        Pcre2Regex engine;
        while ((engine = Pcre2Regex.compile("a{16}(?:x" + retained.size() + ")?", 0)) != null) {
            retained.add(engine);
            if (retained.size() == 16384) throw new AssertionError("native budget never exhausted");
        }
        if (retained.isEmpty()) throw new AssertionError("first native allocation failed");
        Pcre2Regex first = retained.getFirst();
        int[] state = new int[first.groupCount * 2 + 4];
        int miss = first.match("x".repeat(8192), state, 0, 8192, 0, 0, false, true);
        int hit = first.match("a".repeat(8192), state, 0, 8192, 0, 0, false, true);
        // Existing match data remains reusable, but heap growth can require
        // Java when the global budget is exhausted. Never fabricate a miss.
        if (miss != 0 && miss != -1 || hit != 1 && hit != -1)
            throw new AssertionError("incorrect result after budget exhaustion");
        // A deferred handle cannot allocate under pressure, but each operation
        // remains correct on the Java sibling without excluding future peers.
        Pattern pattern = Pattern.compile("(?=error)(error)([0-9]+)");
        var field = Pattern.class.getDeclaredField("pcre2Regex");
        field.setAccessible(true);
        Object owner = field.get(pattern);
        if (owner == null) throw new AssertionError("deferred preparation missing");
        for (int i = 0; i < 12; i++) {
            var matcher = pattern.matcher("x".repeat(2048));
            if (matcher.find() || !matcher.hitEnd()) throw new AssertionError("Java miss fallback");
        }
        var matcher = pattern.matcher("error" + "3".repeat(4091));
        for (int i = 0; i < 12; i++) {
            if (!matcher.reset().find() || !matcher.group(1).equals("error") || matcher.end(2) != 4096)
                throw new AssertionError("Java hit fallback");
        }
        if (field.get(pattern) != owner || Pcre2Regex.nativeMemoryStats()[0] > 64L * 1024 * 1024)
            throw new AssertionError("resource failure demoted Pattern or exceeded native budget");
        Reference.reachabilityFence(retained);
        System.out.println("Budget exhausted with " + retained.size() + " retained engines; Java fallback OK");
        retained.clear();
        // Cleaner timing is asynchronous. Check eventual capacity recovery,
        // without assuming a particular collection or callback order.
        long deadline = System.nanoTime() + 20_000_000_000L;
        do {
            System.gc();
            Thread.sleep(20);
            engine = Pcre2Regex.compile("error[0-9]+(?:x)?", 0);
            if (engine != null) {
                System.out.println("Native budget capacity restored after cleanup");
                Reference.reachabilityFence(first);
                return;
            }
        } while (System.nanoTime() < deadline);
        throw new AssertionError("native budget not released by Cleaner");
    }
}
