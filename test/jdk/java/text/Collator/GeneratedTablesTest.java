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
 */

/*
 * @test
 * @summary Check typed collation snapshots against the runtime builder
 * @modules java.base/java.text:open
 * @run main/othervm GeneratedTablesTest
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.NotSerializableException;
import java.io.ObjectOutputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.text.CollationElementIterator;
import java.text.Collator;
import java.text.RuleBasedCollator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.text.spi.CollatorProvider;

public class GeneratedTablesTest {
    private static final String[] CORPUS = {
        "", "a", "A", "b", "c", "ch", "cH", "CH", "ll", "lL", "ae", "\u00e6",
        "\u00e1", "a\u0301", "a\u0301\u0323", "\u00e9", "e\u0301", "\u00df", "ss",
        "\u0e40\u0e01", "\u0e01\u0e40", "\u0e01\u0e49", "\u0ec0\u0e81",
        "\uac00", "\u1100\u1161", "\u3042", "\u30a2", "\u4e00", "\u9fff",
        "\ud800\udc00", "\ud83d\ude00", "\ud839\udec0", "\ud800", "\udc00", "x\ud800y"
    };
    private static final Class<?> TABLES;
    private static final Method GET_TABLES;
    private static final Method WRITE;
    private static final Method READ;
    private static final Method RESOURCE_NAME;
    private static final Method ORDER;
    private static final Constructor<?> FROM_TABLES;
    private static final Field CACHE;
    private static long checks;
    private static long boundedBackwardTraversals;

    static {
        try {
            TABLES = Class.forName("java.text.RBCollationTables");
            GET_TABLES = RuleBasedCollator.class.getDeclaredMethod("getTables");
            WRITE = TABLES.getDeclaredMethod("writeTo", DataOutputStream.class);
            READ = TABLES.getDeclaredMethod("readFrom", DataInputStream.class, String.class);
            RESOURCE_NAME = TABLES.getDeclaredMethod("resourceName", String.class);
            ORDER = TABLES.getDeclaredMethod("getUnicodeOrder", int.class);
            FROM_TABLES = RuleBasedCollator.class.getDeclaredConstructor(TABLES);
            CACHE = TABLES.getDeclaredField("BUILT_IN");
            for (var accessible : List.of(GET_TABLES, WRITE, READ, RESOURCE_NAME, ORDER,
                                         FROM_TABLES, CACHE)) accessible.setAccessible(true);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length > 0 && args[0].equals("--base-only")) {
            require(ModuleLayer.boot().findModule("jdk.localedata").isEmpty(), "minimal module graph");
            RuleBasedCollator root = (RuleBasedCollator) Collator.getInstance(Locale.ROOT);
            require(cache().get(root.getRules()) == GET_TABLES.invoke(root), "root uses base payload");
            RuleBasedCollator fallback = (RuleBasedCollator) Collator.getInstance(Locale.JAPAN);
            require(root.getRules().equals(fallback.getRules()), "locale without data retains root fallback");
            compare(new RuleBasedCollator(root.getRules()), root, "minimal-root");
            require(cache().size() == 1, "minimal image loads only root tables");
            System.out.println("PASS java.base-only generated root and locale fallback");
            return;
        }
        if (args.length > 0 && args[0].equals("--spi")) {
            RuleBasedCollator c = (RuleBasedCollator) Collator.getInstance(Locale.US);
            require(c.getRules().equals("< z < y < x"), "SPI selected before built-in provider");
            require(c.compare("z", "x") < 0 && cache().isEmpty(), "SPI did not load built-in tables");
            System.out.println("PASS SPI selection and custom builder");
            return;
        }
        boolean generated = args.length > 0 && args[0].equals("--require-generated");
        if (generated) concurrentFirstUse();
        var originals = new HashMap<String, RuleBasedCollator>();
        var snapshots = new HashMap<String, RuleBasedCollator>();
        Locale[] locales = Collator.getAvailableLocales();
        for (Locale locale : locales) {
            RuleBasedCollator actual = (RuleBasedCollator) Collator.getInstance(locale);
            String rules = actual.getRules();
            RuleBasedCollator expected = originals.get(rules);
            if (expected == null) {
                expected = new RuleBasedCollator(rules);
                originals.put(rules, expected);
                byte[] bytes = encode(GET_TABLES.invoke(expected));
                Object restored = decode(bytes, rules);
                require(Arrays.equals(bytes, encode(restored)), "exact state round trip");
                snapshots.put(rules, (RuleBasedCollator) FROM_TABLES.newInstance(restored));
                // Probe every plane/block boundary; the exact byte round trip also
                // covers all backing arrays, including supplementary aliases.
                Object original = GET_TABLES.invoke(expected);
                for (int plane = 0; plane <= 16; plane++) {
                    for (int offset = 0; offset <= 0xffff; offset += 127) {
                        int c = (plane << 16) + offset;
                        require(ORDER.invoke(original, c).equals(ORDER.invoke(restored, c)),
                                "mapping probe");
                    }
                }
                malformed(bytes, rules);
            }
            if (generated) {
                require(cache().get(rules) == GET_TABLES.invoke(actual), "provider used generated table: " + locale);
                require(GET_TABLES.invoke(expected) != GET_TABLES.invoke(actual), "custom constructor uses builder");
            } else {
                actual = snapshots.get(rules);
            }
            compare(expected, actual, locale.toLanguageTag());
        }
        for (Locale locale : List.of(Locale.forLanguageTag("sv-u-co-trad"),
                                     Locale.forLanguageTag("sv-u-co-search"),
                                     Locale.forLanguageTag("qaa-ZZ"),
                                     Locale.forLanguageTag("th-TH-u-co-standard"))) {
            RuleBasedCollator actual = (RuleBasedCollator) Collator.getInstance(locale);
            RuleBasedCollator expected = new RuleBasedCollator(actual.getRules());
            if (generated) {
                require(cache().get(actual.getRules()) == GET_TABLES.invoke(actual),
                        "extension/fallback generated table " + locale);
            }
            compare(expected, actual, locale.toLanguageTag());
        }
        RuleBasedCollator root = (RuleBasedCollator) Collator.getInstance(Locale.ROOT);
        RuleBasedCollator clone = (RuleBasedCollator) root.clone();
        require(GET_TABLES.invoke(root) == GET_TABLES.invoke(clone), "clone shares tables");
        clone.setStrength(Collator.PRIMARY);
        clone.setDecomposition(Collator.FULL_DECOMPOSITION);
        require(root.getStrength() == Collator.TERTIARY && root.getDecomposition() == Collator.NO_DECOMPOSITION,
                "clone settings independent");
        for (RuleBasedCollator collator : List.of(root, new RuleBasedCollator("< z < y < x"))) {
            try (var out = new ObjectOutputStream(new ByteArrayOutputStream())) {
                out.writeObject(collator);
                throw new AssertionError("Changed non-serializable collator contract");
            } catch (NotSerializableException expected) { checks++; }
        }
        if (args.length > 0 && args[0].equals("--require-fallback")) {
            require(cache().isEmpty(), "missing resources retain the runtime builder");
        }
        System.out.printf(Locale.ROOT,
                          "PASS locales=%d unique=%d checks=%d generated=%s boundedBackwardTraversals=%d%n",
                          locales.length, originals.size(), checks, generated, boundedBackwardTraversals);
    }

    /** Installed by the source-only harness for a separate fresh-VM SPI control. */
    public static final class Provider extends CollatorProvider {
        public Locale[] getAvailableLocales() { return new Locale[] {Locale.US}; }

        public Collator getInstance(Locale locale) {
            if (!locale.equals(Locale.US)) throw new IllegalArgumentException();
            try {
                return new RuleBasedCollator("< z < y < x");
            } catch (java.text.ParseException e) {
                throw new AssertionError(e);
            }
        }
    }

    private static void concurrentFirstUse() throws Exception {
        require(cache().isEmpty(), "no eager table loads");
        Locale[] locales = {Locale.ROOT, Locale.forLanguageTag("th"), Locale.JAPAN, Locale.CHINA};
        var start = new CountDownLatch(1);
        try (var executor = Executors.newFixedThreadPool(12)) {
            var futures = new ArrayList<Future<RuleBasedCollator>>();
            for (int i = 0; i < 12; i++) {
                Locale locale = locales[i % locales.length];
                futures.add(executor.submit(() -> {
                    start.await();
                    RuleBasedCollator c = (RuleBasedCollator) Collator.getInstance(locale);
                    String[] words = Arrays.copyOf(CORPUS, 12);
                    Arrays.sort(words, c);
                    for (String word : words) c.getCollationKey(word).toByteArray();
                    return c;
                }));
            }
            start.countDown();
            for (Future<RuleBasedCollator> future : futures) {
                RuleBasedCollator c = future.get();
                require(cache().get(c.getRules()) == GET_TABLES.invoke(c), "concurrent table sharing");
            }
        }
        require(cache().size() <= locales.length, "first use does not load all locales");
    }

    private static void compare(RuleBasedCollator expected, RuleBasedCollator actual, String locale) {
        require(expected.getRules().equals(actual.getRules()), "rules " + locale);
        for (int strength = 0; strength <= 3; strength++) {
            for (int decomposition = 0; decomposition <= 2; decomposition++) {
                expected.setStrength(strength);
                actual.setStrength(strength);
                expected.setDecomposition(decomposition);
                actual.setDecomposition(decomposition);
                for (int i = 0; i < CORPUS.length; i++) {
                    String s = CORPUS[i];
                    String t = CORPUS[(i * 7 + 3) % CORPUS.length];
                    require(expected.compare(s, t) == actual.compare(s, t), "compare " + locale);
                    require(Arrays.equals(expected.getCollationKey(s).toByteArray(),
                                          actual.getCollationKey(s).toByteArray()), "key " + locale);
                    require(elements(expected, s).equals(elements(actual, s)), "elements/offsets " + locale);
                }
            }
        }
    }

    private static List<Integer> elements(RuleBasedCollator c, String s) {
        CollationElementIterator iterator = c.getCollationElementIterator(s);
        var result = new ArrayList<Integer>();
        for (int order; (order = iterator.next()) != CollationElementIterator.NULLORDER;) {
            result.add(order);
            result.add(iterator.getOffset());
            result.add(iterator.getMaxExpansion(order));
        }
        int backward = 0;
        for (int order; (order = iterator.previous()) != CollationElementIterator.NULLORDER;) {
            result.add(order);
            result.add(iterator.getOffset());
            // Some existing builder tables repeat backwards at the start of
            // Thai text. Compare a bounded prefix in both implementations.
            if (++backward == 256) {
                result.add(Integer.MIN_VALUE);
                boundedBackwardTraversals++;
                break;
            }
        }
        for (int offset = 0; offset <= s.length(); offset++) {
            iterator.setOffset(offset);
            result.add(iterator.getOffset());
            result.add(iterator.next());
        }
        return result;
    }

    private static void malformed(byte[] bytes, String rules) throws Exception {
        reject(bytes, rules + " ");
        for (int end : new int[] {0, 4, 8, 12, bytes.length / 2, bytes.length - 1}) {
            reject(Arrays.copyOf(bytes, end), rules);
        }
        byte[] bad = bytes.clone();
        ByteBuffer.wrap(bad).putInt(0);
        reject(bad, rules);
        bad = bytes.clone();
        ByteBuffer.wrap(bad).putInt(4, 999);
        reject(bad, rules);
        bad = bytes.clone();
        ByteBuffer.wrap(bad).putInt(8, Integer.MAX_VALUE);
        reject(bad, rules);
        reject(Arrays.copyOf(bytes, bytes.length + 1), rules);
    }

    private static void reject(byte[] bytes, String rules) throws Exception {
        try {
            decode(bytes, rules);
            throw new AssertionError("Accepted malformed or stale resource");
        } catch (InvocationTargetException e) {
            require(e.getCause() instanceof IOException, "decoder rejects with IOException");
        }
    }

    private static byte[] encode(Object tables) throws Exception {
        var bytes = new ByteArrayOutputStream();
        try (var out = new DataOutputStream(bytes)) { WRITE.invoke(tables, out); }
        return bytes.toByteArray();
    }

    private static Object decode(byte[] bytes, String rules) throws Exception {
        try (var in = new DataInputStream(new ByteArrayInputStream(bytes))) {
            return READ.invoke(null, in, rules);
        }
    }

    private static Map<String, Object> cache() throws Exception {
        var copy = new HashMap<String, Object>();
        Map<?, ?> raw = (Map<?, ?>) CACHE.get(null);
        synchronized (raw) {
            for (var entry : raw.entrySet()) {
                Object value = entry.getValue();
                if (value instanceof java.lang.ref.Reference<?> reference) value = reference.get();
                if (value != null) copy.put((String) entry.getKey(), value);
            }
        }
        return copy;
    }

    private static void require(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }
}
