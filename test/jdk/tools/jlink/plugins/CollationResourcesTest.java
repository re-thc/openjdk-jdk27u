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
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

/*
 * @test
 * @summary Locale filtering keeps only collation payloads for surviving bundles
 * @modules jdk.jlink/jdk.tools.jlink.internal
 *          jdk.jlink/jdk.tools.jlink.internal.plugins
 *          jdk.jlink/jdk.tools.jlink.plugin
 * @run main CollationResourcesTest
 */

import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Set;
import jdk.tools.jlink.internal.ResourcePoolManager;
import jdk.tools.jlink.internal.plugins.IncludeLocalesPlugin;
import jdk.tools.jlink.plugin.ResourcePool;
import jdk.tools.jlink.plugin.ResourcePoolEntry;

public class CollationResourcesTest {
    private static final String PREFIX = "/jdk.localedata/sun/text/resources/ext/";
    private static final String JAPANESE = "1".repeat(64);
    private static final String THAI = "2".repeat(64);
    private static final String SHARED = "3".repeat(64);
    private static final String TRADITIONAL = "4".repeat(64);

    public static void main(String[] args) throws Exception {
        byte[] clazz;
        try (var in = Object.class.getResourceAsStream("Object.class")) {
            clazz = in.readAllBytes();
        }
        ResourcePoolManager input = new ResourcePoolManager();
        // The plugin requires these packages, and infers locale tags from paths.
        for (String pkg : Set.of("sun/text/resources/cldr/ext", "sun/text/resources/ext",
                                 "sun/util/resources/cldr/ext", "sun/util/resources/cldr/provider",
                                 "sun/util/resources/ext", "sun/util/resources/provider")) {
            input.add(ResourcePoolEntry.create("/jdk.localedata/" + pkg + "/FormatData_ja.class", clazz));
        }
        for (String locale : Set.of("ja", "th", "sv")) {
            input.add(ResourcePoolEntry.create(PREFIX + "CollationData_" + locale + ".class", clazz));
        }
        String index = "sun/text/resources/ext/CollationData_ja.class\t" + JAPANESE + "," + SHARED + "\n"
                + "sun/text/resources/ext/CollationData_th.class\t" + THAI + "," + SHARED + "\n"
                + "sun/text/resources/ext/CollationData_sv.class\t" + TRADITIONAL + "\n";
        input.add(ResourcePoolEntry.create(PREFIX + "collation-index.txt", index.getBytes(StandardCharsets.UTF_8)));
        for (String digest : Set.of(JAPANESE, THAI, SHARED, TRADITIONAL)) {
            input.add(ResourcePoolEntry.create(PREFIX + "collation-" + digest + ".bin", new byte[] {1, 2, 3}));
        }
        check(input, "ja", Set.of(JAPANESE, SHARED));
        check(input, "th", Set.of(THAI, SHARED));
        check(input, "sv", Set.of(TRADITIONAL));
        check(input, "ja,th", Set.of(JAPANESE, THAI, SHARED));
        check(input, "*", Set.of(JAPANESE, THAI, SHARED, TRADITIONAL));
        System.out.println("PASS locale filtering, shared payloads and alternate collation");
    }

    private static void check(ResourcePoolManager input, String locales, Set<String> expected) {
        IncludeLocalesPlugin plugin = new IncludeLocalesPlugin();
        plugin.configure(Map.of("include-locales", locales));
        plugin.previsit(input.resourcePool(), input.getStringTable());
        ResourcePool output = plugin.transform(input.resourcePool(), new ResourcePoolManager().resourcePoolBuilder());
        for (String digest : Set.of(JAPANESE, THAI, SHARED, TRADITIONAL)) {
            boolean actual = output.findEntry(PREFIX + "collation-" + digest + ".bin").isPresent();
            if (actual != expected.contains(digest)) {
                throw new AssertionError(locales + ": wrong payload selection " + digest);
            }
        }
        if (output.findEntry(PREFIX + "collation-index.txt").isPresent()) {
            throw new AssertionError("Filtered image retained unused generation index");
        }
    }
}
