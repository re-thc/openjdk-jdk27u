/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @run main/othervm/timeout=300 RustRegexMemoryBudget
 * @run main/othervm/timeout=300 -XX:-UseRustRegexIntrinsics RustRegexMemoryBudget
 */

import java.lang.ref.Reference;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import jdk.internal.util.regex.RustRegex;

public class RustRegexMemoryBudget {
    public static void main(String[] args) throws Exception {
        if (!RustRegex.ENABLED) {
            System.out.println("Rust regex backend unavailable; Java fallback configuration");
            return;
        }
        List<RustRegex> retained = new ArrayList<>();
        RustRegex filter;
        while ((filter = RustRegex.compile("a{512}(?:x" + retained.size() + ")?", 0)) != null) {
            retained.add(filter);
            if (retained.size() == 16384) throw new AssertionError("native budget never exhausted");
        }
        if (retained.isEmpty()) throw new AssertionError("first native allocation failed");
        RustRegex first = retained.getFirst();
        int[] state = new int[first.groupCount * 2 + 4];
        int base = first.groupCount * 2;
        state[base+1] = 8192;
        if (first.match("x".repeat(8192), state, false, true) != 0)
            throw new AssertionError("retained engine stopped rejecting after budget exhaustion");
        if (first.match("a".repeat(8192), state, false, true) != 1)
            throw new AssertionError("retained engine lost a match after budget exhaustion");
        // Exhaustion must permanently choose Java for a newly compiled Pattern.
        Pattern pattern = Pattern.compile("error([0-9]+)");
        for (int i = 0; i < 12; i++) {
            var matcher = pattern.matcher("x".repeat(2048));
            if (matcher.find() || !matcher.hitEnd()) throw new AssertionError("Java miss fallback");
        }
        var field = Pattern.class.getDeclaredField("rustRegex");
        field.setAccessible(true);
        if (field.get(pattern) != null) throw new AssertionError("Pattern exceeded native budget");
        var matcher = pattern.matcher("error123" + "x".repeat(2048));
        if (!matcher.find() || !matcher.group(1).equals("123")) throw new AssertionError("Java hit fallback");
        Reference.reachabilityFence(retained);
        System.out.println("Budget exhausted with " + retained.size() + " retained engines; Java fallback OK");
        retained.clear();
        // Cleaner timing is asynchronous. Check eventual capacity recovery,
        // without assuming a particular collection or callback order.
        long deadline = System.nanoTime() + 20_000_000_000L;
        do {
            System.gc();
            Thread.sleep(20);
            filter = RustRegex.compile("error[0-9]+(?:x)?", 0);
            if (filter != null) {
                System.out.println("Native budget capacity restored after cleanup");
                Reference.reachabilityFence(first);
                return;
            }
        } while (System.nanoTime() < deadline);
        throw new AssertionError("native budget not released by Cleaner");
    }
}
