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
 * @summary First header values preserve absence, filtering, order and immutability
 * @run main HttpHeadersFirstValue
 */

import java.net.URI;
import java.net.http.HttpHeaders;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.Random;

public class HttpHeadersFirstValue {
    public static void main(String[] args) {
        Random random = new Random(0x48545450);
        for (int iteration = 0; iteration < 60_000; iteration++) {
            var input = new ArrayList<String>();
            var expected = new ArrayList<String>();
            boolean filter = random.nextBoolean();
            for (int n = random.nextInt(8); n > 0; n--) {
                String value = switch (random.nextInt(5)) {
                    case 0 -> "";
                    case 1 -> "first,second";
                    case 2 -> "reject";
                    default -> Integer.toString(random.nextInt());
                };
                input.add(" \t" + value + "\t ");
                if (!filter || !value.equals("reject")) {
                    expected.add(value);
                }
            }
            var map = new HashMap<String, List<String>>();
            map.put(" X-Values ", input);
            map.put("X-Empty", List.of());
            HttpHeaders headers = HttpHeaders.of(map,
                    (name, value) -> !filter || !value.equals("reject"));
            input.clear();
            map.clear();
            Optional<String> first = expected.isEmpty()
                    ? Optional.empty() : Optional.of(expected.get(0));
            for (String name : List.of("X-Values", "x-values", "X-vAlUeS")) {
                equal(first, headers.firstValue(name));
                equal(expected, headers.allValues(name));
            }
            for (String name : List.of("missing", "X-Empty", "")) {
                equal(Optional.empty(), headers.firstValue(name));
            }
            expect(NullPointerException.class, () -> headers.firstValue(null));
            expect(UnsupportedOperationException.class,
                    () -> headers.allValues("X-Values").add("new"));
            expect(UnsupportedOperationException.class,
                    () -> headers.map().put("new", List.of("new")));
        }

        HttpHeaders requestHeaders = HttpRequest.newBuilder(URI.create("http://localhost/"))
                .header("X-Order", "one").header("x-order", "two")
                .header("X-ORDER", "three").build().headers();
        equal(Optional.of("one"), requestHeaders.firstValue("x-order"));
        equal(List.of("one", "two", "three"), requestHeaders.allValues("X-Order"));
    }

    private static void equal(Object expected, Object actual) {
        if (!expected.equals(actual)) {
            throw new AssertionError("Expected " + expected + ", got " + actual);
        }
    }

    private static void expect(Class<? extends Throwable> type, Runnable action) {
        try {
            action.run();
        } catch (Throwable t) {
            if (type.isInstance(t)) {
                return;
            }
            throw new AssertionError("Expected " + type, t);
        }
        throw new AssertionError("Expected " + type);
    }
}
