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
 * @summary Generated serializer entities preserve the resource representation
 * @modules java.xml/com.sun.org.apache.xml.internal.serializer:open
 * @run main/othervm transform.CharInfoGeneratedTest
 */
package transform;

import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLClassLoader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HexFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.PropertyResourceBundle;

public class CharInfoGeneratedTest {
    private static final String PREFIX = "com.sun.org.apache.xml.internal.serializer.";
    private static final Class<?> TYPE;
    private static final Constructor<?> CTOR;
    private static final MessageDigest DIGEST;
    private static long observations;
    static {
        try {
            TYPE = Class.forName(PREFIX + "CharInfo");
            CTOR = TYPE.getDeclaredConstructor(String.class, String.class, boolean.class);
            CTOR.setAccessible(true);
            DIGEST = MessageDigest.getInstance("SHA-256");
        } catch (Exception e) { throw new ExceptionInInitializerError(e); }
    }

    public static void main(String[] args) throws Exception {
        Path dir = Files.createTempDirectory("charinfo-generated");
        ClassLoader savedLoader = Thread.currentThread().getContextClassLoader();
        Locale savedLocale = Locale.getDefault();
        try {
            // Build a legacy text resource in the exact PropertyResourceBundle
            // enumeration order. This preserves duplicate aliases and map order.
            for (String kind : new String[] {"XML", "HTML"}) {
                StringBuilder text = new StringBuilder();
                try (InputStream in = TYPE.getResourceAsStream(kind + "Entities.properties")) {
                    var bundle = new PropertyResourceBundle(Objects.requireNonNull(in));
                    var keys = bundle.getKeys();
                    while (keys.hasMoreElements()) {
                        String name = keys.nextElement();
                        text.append(name).append(' ').append(bundle.getString(name)).append('\n');
                    }
                }
                Path resource = dir.resolve(kind + ".entities");
                Files.writeString(resource, text);
                String expectGenerated = System.getProperty("charinfo.expectGenerated");
                if (expectGenerated != null) {
                    equal(call("useBundledData", new Class<?>[] {String.class}, null,
                            PREFIX + kind + "Entities"), Boolean.valueOf(expectGenerated), "selected data path");
                }
                for (String method : new String[] {"xml", "html", "text", "", "unknown", null}) {
                    Object actual = create(PREFIX + kind + "Entities", method, true);
                    Object expected = create(resource.toUri().toString(), method, false);
                    compare(actual, expected);
                    equal(listMap(actual), listMap(expected), "map iteration order");
                    for (String field : new String[] {"isSpecialAttrASCII", "isSpecialTextASCII",
                            "isCleanTextASCII", "array_of_bits"}) {
                        Object a = field(actual, field), b = field(expected, field);
                        boolean same = a instanceof boolean[] ? Arrays.equals((boolean[]) a, (boolean[]) b)
                                : Arrays.equals((int[]) a, (int[]) b);
                        if (!same) throw new AssertionError(field);
                        if (a == b) throw new AssertionError("shared mutable " + field);
                    }
                    equal(field(actual, "onlyQuotAmpLtGt"), field(expected, "onlyQuotAmpLtGt"), "only flag");
                    equal(field(actual, "firstWordNotUsed"), field(expected, "firstWordNotUsed"), "last word");
                    // Existing mutation semantics, including the ASCII attribute
                    // cache's behavior, must remain unchanged after construction.
                    for (char ch : new char[] {9, 10, 34, 'A', 0x100, 0xffff}) {
                        call("defineChar2StringMapping", new Class<?>[] {String.class, char.class},
                                actual, "&changed;", ch);
                        call("defineChar2StringMapping", new Class<?>[] {String.class, char.class},
                                expected, "&changed;", ch);
                    }
                    compare(actual, expected);
                    Object fresh = create(PREFIX + kind + "Entities", method, true);
                    equal(output(fresh, 'A'), null, "mutation isolation");
                }
            }
            // A public factory request with a bundled name must still consult
            // its context loader; aliases, overrides and null loaders use the
            // legacy path. No custom resource is added to the internal cache.
            Locale.setDefault(Locale.ROOT);
            Path bundleDir = Files.createDirectories(dir.resolve("custom"));
            Files.writeString(bundleDir.resolve("Entities.properties"),
                    "alpha=65\nbeta=65\nalpha=66\nquot=34\n");
            try (var loader = new URLClassLoader(new java.net.URL[] {dir.toUri().toURL()}, null)) {
                Thread.currentThread().setContextClassLoader(loader);
                Path builtins = Files.createDirectories(dir.resolve(
                        "com/sun/org/apache/xml/internal/serializer"));
                for (String kind : new String[] {"XML", "HTML"}) {
                    Files.writeString(builtins.resolve(kind + "Entities.properties"), "override=69\n");
                    Object overridden = call("getCharInfo", new Class<?>[] {String.class, String.class},
                            null, PREFIX + kind + "Entities", "xml");
                    equal(output(overridden, 'E'), "&override;", "bundled-name context loader override");
                    Object internal = create(PREFIX + kind + "Entities", "xml", true);
                    equal(output(internal, 'E'), null, "internal resource ignores context loader");
                }
                Object custom = call("getCharInfo", new Class<?>[] {String.class, String.class},
                        null, "custom.Entities", "xml");
                equal(output(custom, 'A'), "&beta;", "custom alias");
                equal(output(custom, 'B'), "&alpha;", "duplicate property");
                Files.writeString(bundleDir.resolve("Entities_fr.properties"), "locale=67\n");
                Locale.setDefault(Locale.FRENCH);
                Object localized = call("getCharInfo", new Class<?>[] {String.class, String.class},
                        null, "custom.Entities", "html");
                equal(output(localized, 'C'), "&locale;", "locale fallback");
                equal(output(localized, 'B'), "&alpha;", "locale parent");
                java.util.ResourceBundle.clearCache(loader);
                Files.writeString(bundleDir.resolve("Entities.properties"), "changed=68\n");
                Object changed = call("getCharInfo", new Class<?>[] {String.class, String.class},
                        null, "custom.Entities", "html");
                equal(output(changed, 'D'), "&changed;", "resource cache invalidation");
            }
            Locale.setDefault(savedLocale);
            Path custom = dir.resolve("custom.entities");
            Files.writeString(custom, "# comment\n\nfirst 65\nsecond 65\nlarge 65535\n");
            Thread.currentThread().setContextClassLoader(null);
            Object customInfo = create(custom.toUri().toString(), "xml", false);
            equal(output(customInfo, 'A'), "&second;", "last alias wins");
            equal(output(customInfo, (char) 65535), "&large;", "last BMP");
            for (String contents : List.of("broken nope\n", "broken 9999999999999999999\n")) {
                Files.writeString(custom, contents);
                fails(custom.toUri().toString(), false);
            }
            fails(dir.resolve("missing.entities").toUri().toString(), false);
            fails("unknown.internal.resource", true);
            // Internal cache remains keyed by resource alone, including its
            // existing first-method behavior; generated tables add no new cache.
            @SuppressWarnings("unchecked")
            Map<String, Object> cache = (Map<String, Object>) field(null, "m_getCharInfoCache");
            cache.clear();
            Object first = call("getCharInfoInternal", new Class<?>[] {String.class, String.class},
                    null, PREFIX + "XMLEntities", "html");
            Object second = call("getCharInfoInternal", new Class<?>[] {String.class, String.class},
                    null, PREFIX + "XMLEntities", "xml");
            if (first != second) throw new AssertionError("cache identity");
            equal(call("isSpecialAttrChar", new Class<?>[] {int.class}, first, 9), false, "first method");
            cache.clear();
            System.out.println("PASS observations=" + observations + " sha256="
                    + HexFormat.of().formatHex(DIGEST.digest()));
        } finally {
            Thread.currentThread().setContextClassLoader(savedLoader);
            Locale.setDefault(savedLocale);
            try (var files = Files.walk(dir)) {
                for (Path p : files.sorted(java.util.Comparator.reverseOrder()).toList()) Files.delete(p);
            }
        }
    }

    private static void compare(Object a, Object b) throws Exception {
        Method output = method("getOutputStringForChar", char.class);
        Method attr = method("isSpecialAttrChar", int.class);
        Method text = method("isSpecialTextChar", int.class);
        Method clean = method("isTextASCIIClean", int.class);
        for (int c = 0; c < 65536; c++) {
            for (Method m : new Method[] {output, attr, text}) {
                Object value;
                if (m == output) value = Character.valueOf((char) c);
                else value = Integer.valueOf(c);
                Object av = m.invoke(a, value), bv = m.invoke(b, value);
                equal(av, bv, m.getName() + ":" + c);
                if (av != null) DIGEST.update(av.toString().getBytes(StandardCharsets.UTF_8));
                DIGEST.update((byte) 0);
                observations++;
            }
            if (c < 128) equal(clean.invoke(a, c), clean.invoke(b, c), "ASCII clean " + c);
        }
    }
    private static List<String> listMap(Object info) throws Exception {
        Map<?, ?> map = (Map<?, ?>) field(info, "m_charToString");
        var f = Class.forName(PREFIX + "CharInfo$CharKey").getDeclaredField("m_char");
        f.setAccessible(true);
        var entries = new java.util.ArrayList<String>();
        for (var entry : map.entrySet()) entries.add((int) f.getChar(entry.getKey()) + "=" + entry.getValue());
        return entries;
    }
    private static Object create(String resource, String method, boolean internal) throws Exception {
        try { return CTOR.newInstance(resource, method, internal); }
        catch (InvocationTargetException e) { throw (Exception) e.getCause(); }
    }
    private static Object output(Object info, char c) throws Exception {
        return call("getOutputStringForChar", new Class<?>[] {char.class}, info, c);
    }
    private static void fails(String resource, boolean internal) throws Exception {
        try { create(resource, "xml", internal); }
        catch (RuntimeException expected) { return; }
        throw new AssertionError("Expected resource failure");
    }
    private static Object field(Object target, String name) throws Exception {
        Field f = TYPE.getDeclaredField(name); f.setAccessible(true); return f.get(target);
    }
    private static Method method(String name, Class<?>... types) throws Exception {
        Method m = TYPE.getDeclaredMethod(name, types); m.setAccessible(true); return m;
    }
    private static Object call(String name, Class<?>[] types, Object target, Object... args) throws Exception {
        try { return method(name, types).invoke(target, args); }
        catch (InvocationTargetException e) { throw (Exception) e.getCause(); }
    }
    private static void equal(Object actual, Object expected, String context) {
        if (!Objects.equals(actual, expected)) throw new AssertionError(context + ": " + actual + " != " + expected);
    }
}
