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

package jdk.internal.net.http;

import java.lang.reflect.InvocationTargetException;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;

public class FilterFactoryTest {
    private static int initialized;
    private static final AtomicInteger attempts = new AtomicInteger();
    private static final RuntimeException FAILURE = new RuntimeException("constructor");

    public static void main(String[] args) throws Exception {
        FilterFactory lazy = new FilterFactory();
        lazy.addFilter(LazyFilter.class);
        check(initialized == 0, "initialized during registration");
        lazy.getFilterChain();
        lazy.getFilterChain();
        check(initialized == 1, "initialization count");

        FilterFactory retry = new FilterFactory();
        retry.addFilter(RetryFilter.class);
        check(attempts.get() == 0, "constructed during registration");
        for (int i = 0; i < 2; i++) {
            try {
                retry.getFilterChain();
                throw new AssertionError("expected constructor failure");
            } catch (InternalError e) {
                check(e.getCause() instanceof InvocationTargetException, "exception wrapper");
                check(e.getCause().getCause() == FAILURE, "constructor cause");
            }
        }
        check(retry.getFilterChain().getFirst() instanceof RetryFilter, "failed to retry");
        check(retry.getFilterChain().getFirst() instanceof RetryFilter, "cached failure");
        check(attempts.get() == 4, "construction count");
        try {
            retry.getFilterChain();
            throw new AssertionError("expected failure after success");
        } catch (InternalError e) {
            check(e.getCause() instanceof InvocationTargetException, "cached exception wrapper");
            check(e.getCause().getCause() == FAILURE, "cached constructor cause");
        }
        check(retry.getFilterChain().getFirst() instanceof RetryFilter, "retry after cached failure");
        check(attempts.get() == 6, "cached construction count");

        FilterFactory invalid = new FilterFactory();
        invalid.addFilter(NoPublicConstructor.class);
        for (int i = 0; i < 2; i++) {
            try {
                invalid.getFilterChain();
                throw new AssertionError("expected lookup failure");
            } catch (InternalError e) {
                check(e.getCause() instanceof NoSuchMethodException, "lookup cause");
            }
        }

        FilterFactory factory = new FilterFactory();
        factory.addFilter(RedirectFilter.class);
        factory.addFilter(AuthenticationFilter.class);
        factory.addFilter(CookieFilter.class);
        var seen = Collections.synchronizedSet(
                Collections.newSetFromMap(new IdentityHashMap<HeaderFilter, Boolean>()));
        try (var executor = Executors.newFixedThreadPool(8)) {
            var tasks = new java.util.ArrayList<java.util.concurrent.Callable<Void>>();
            for (int t = 0; t < 8; t++) {
                tasks.add(() -> {
                    for (int i = 0; i < 1_000; i++) {
                        List<HeaderFilter> chain = factory.getFilterChain();
                        check(chain.size() == 3, "chain size");
                        check(chain.get(0).getClass() == RedirectFilter.class, "redirect order");
                        check(chain.get(1).getClass() == AuthenticationFilter.class, "auth order");
                        check(chain.get(2).getClass() == CookieFilter.class, "cookie order");
                        for (HeaderFilter filter : chain) {
                            check(seen.add(filter), "reused filter instance");
                        }
                        chain.clear();
                    }
                    return null;
                });
            }
            for (var future : executor.invokeAll(tasks)) {
                future.get();
            }
        }
        check(seen.size() == 24_000, "instance count");
        check(new FilterFactory().getFilterChain().isEmpty(), "factory isolation");
    }

    private static void check(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }

    public static class LazyFilter implements HeaderFilter {
        static { initialized++; }
        public LazyFilter() { }
        public void request(HttpRequestImpl r, MultiExchange<?> e) { }
        public HttpRequestImpl response(Response r) { return null; }
    }

    public static class RetryFilter extends LazyFilter {
        public RetryFilter() {
            int attempt = attempts.incrementAndGet();
            if (attempt <= 2 || attempt == 5) {
                throw FAILURE;
            }
        }
    }

    public static class NoPublicConstructor extends LazyFilter {
        private NoPublicConstructor() { }
    }
}
