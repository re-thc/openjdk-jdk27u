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
 * @summary CLDR metadata holders initialize independently and safely under contention
 * @modules java.base/sun.util.cldr:+open java.base/jdk.internal.misc
 * @run main/othervm DeferredCLDRMetadata zone
 * @run main/othervm DeferredCLDRMetadata script
 * @run main/othervm DeferredCLDRMetadata parent
 */

import java.text.NumberFormat;
import java.util.Arrays;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import jdk.internal.misc.Unsafe;
import sun.util.cldr.CLDRBaseLocaleDataMetaInfo;
import sun.util.cldr.CLDRLocaleProviderAdapter;

public class DeferredCLDRMetadata {
    private static final Unsafe UNSAFE = Unsafe.getUnsafe();

    private static void uninitialized(String holder, boolean expected) throws Exception {
        Class<?> type = Class.forName("sun.util.cldr.CLDRBaseLocaleDataMetaInfo$" + holder,
                                     false, null);
        if (UNSAFE.shouldBeInitialized(type) != expected) throw new AssertionError(holder);
    }

    public static void main(String[] args) throws Exception {
        var metadata = new CLDRBaseLocaleDataMetaInfo();
        NumberFormat.getNumberInstance(Locale.US).format(12345.5);
        uninitialized("ParentLocalesHolder", true);
        uninitialized("TZCanonicalIDHolder", true);
        uninitialized("LikelyScriptHolder", true);
        var script = CLDRBaseLocaleDataMetaInfo.class.getDeclaredMethod("likelyScriptMap");
        script.setAccessible(true);
        boolean zones = args[0].equals("zone");
        boolean parents = args[0].equals("parent");
        CountDownLatch start = new CountDownLatch(1);
        try (var executor = java.util.concurrent.Executors.newFixedThreadPool(8)) {
            var futures = new java.util.ArrayList<java.util.concurrent.Future<?>>();
            for (int i = 0; i < 8; i++) {
                futures.add(executor.submit(() -> {
                    start.await();
                    if (zones) {
                        if (!"America/New_York".equals(metadata.tzCanonicalIDs().get("US/Eastern"))) {
                            throw new AssertionError("canonical zone");
                        }
                    } else if (parents) {
                        if (Arrays.binarySearch(metadata.parentLocales().get(Locale.forLanguageTag("en-001")),
                                                "en-GB") < 0) throw new AssertionError("irregular parent");
                    } else {
                        var map = (Map<?, ?>) script.invoke(metadata);
                        if (!map.get("Latn").toString().contains(" en ")) throw new AssertionError("likely script");
                    }
                    return null;
                }));
            }
            start.countDown();
            for (var future : futures) future.get();
        }
        uninitialized("ParentLocalesHolder", !parents);
        uninitialized("TZCanonicalIDHolder", !zones);
        uninitialized("LikelyScriptHolder", zones || parents);
        // Every generated parent array must remain sorted for binary search.
        for (var children : metadata.parentLocales().values()) {
            String[] sorted = children.clone();
            Arrays.sort(sorted);
            if (!Arrays.equals(children, sorted)) throw new AssertionError("unsorted parent array");
        }
        var adapter = new CLDRLocaleProviderAdapter();
        for (String tag : new String[] {"en-GB", "es-AR", "zh-Hant-MO", "az-Arab",
                                      "ru-Latn", "nb", "no", "nb-NO", "nn-NO",
                                      "en-US-u-ca-buddhist", "zh-Hant-MO-u-nu-latn"}) {
            var candidates = adapter.getCandidateLocales("", Locale.forLanguageTag(tag));
            if (!candidates.getLast().equals(Locale.ROOT)) throw new AssertionError(tag);
        }
    }
}
