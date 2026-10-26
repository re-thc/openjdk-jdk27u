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

import com.sun.org.apache.xerces.internal.impl.xpath.regex.Match;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.RegularExpression;
import java.io.StringReader;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.security.MessageDigest;
import java.text.CharacterIterator;
import java.text.StringCharacterIterator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HexFormat;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import javax.xml.XMLConstants;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.SchemaFactory;
import jdk.internal.misc.Unsafe;

/*
 * @test
 * @summary Compare generated Xerces case closures with the old algorithm,
 *          including ordering, match types, lazy concurrent use and consumers
 * @modules java.base/jdk.internal.misc
 *          java.xml/com.sun.org.apache.xerces.internal.impl.xpath.regex:+open
 * @run main/othervm CaseInsensitiveMapTest
 */
public class CaseInsensitiveMapTest {
    private static final String MAP_NAME =
            "com.sun.org.apache.xerces.internal.impl.xpath.regex.CaseInsensitiveMap";

    public static void main(String[] args) throws Exception {
        // This mode permits the same complete consumer corpus to be compared
        // with an unmodified baseline VM in a separate process.
        if (args.length != 0 && args[0].equals("corpus")) {
            corpus();
            return;
        }
        Class<?> map = Class.forName(MAP_NAME, false, null);
        if (!Unsafe.getUnsafe().shouldBeInitialized(map)) {
            throw new AssertionError("Case map already initialized before first use");
        }
        caseSensitiveControls();
        if (!Unsafe.getUnsafe().shouldBeInitialized(map)) {
            throw new AssertionError("Case-sensitive consumers initialized case map");
        }
        concurrentFirstUse();
        if (Unsafe.getUnsafe().shouldBeInitialized(map)) {
            throw new AssertionError("Ignore-case consumers did not initialize case map");
        }

        Method get = map.getDeclaredMethod("get", int.class);
        get.setAccessible(true);
        int[][] snapshot = new int[0x10000][];
        int[][] identities = new int[0x10000][];
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        int mappings = 0;
        int elements = 0;
        for (int cp = 0; cp < snapshot.length; cp++) {
            int[] actual = (int[]) get.invoke(null, cp);
            int[] expected = OriginalCaseInsensitiveMap.get(cp);
            if (!Arrays.equals(actual, expected)) {
                throw new AssertionError("Closure differs at U+" + Integer.toHexString(cp)
                        + ": " + Arrays.toString(actual) + " vs " + Arrays.toString(expected));
            }
            if (get.invoke(null, cp) != actual) {
                throw new AssertionError("Lookup does not return the shared array");
            }
            identities[cp] = actual;
            snapshot[cp] = actual == null ? null : actual.clone();
            putInt(digest, cp);
            putInt(digest, actual == null ? -1 : actual.length);
            if (actual != null) {
                mappings++;
                elements += actual.length;
                for (int value : actual) {
                    putInt(digest, value);
                }
            }
        }
        for (int cp : new int[] {0x10000, 0x10400, 0x10ffff, 0x110000, Integer.MAX_VALUE}) {
            if (get.invoke(null, cp) != null || OriginalCaseInsensitiveMap.get(cp) != null) {
                throw new AssertionError("Non-BMP lookup returned a closure: " + cp);
            }
        }
        for (int cp : new int[] {-1, -256, -65536, Integer.MIN_VALUE}) {
            try {
                get.invoke(null, cp);
                throw new AssertionError("Negative lookup accepted: " + cp);
            } catch (InvocationTargetException e) {
                if (!(e.getCause() instanceof ArrayIndexOutOfBoundsException)) {
                    throw e;
                }
            }
            try {
                OriginalCaseInsensitiveMap.get(cp);
                throw new AssertionError("Negative oracle lookup accepted: " + cp);
            } catch (ArrayIndexOutOfBoundsException expected) { }
        }
        var tableField = map.getDeclaredField("caseInsensitiveMap");
        tableField.setAccessible(true);
        if (!Modifier.isFinal(tableField.getModifiers())) {
            throw new AssertionError("Outer table is not final");
        }
        int[][][] table = (int[][][]) tableField.get(null);
        if (table.length != 256) {
            throw new AssertionError("Expected 256 pages");
        }
        int pages = 0;
        for (int[][] page : table) {
            if (page != null) {
                pages++;
                if (page.length != 256 || Arrays.stream(page).allMatch(a -> a == null)) {
                    throw new AssertionError("Empty or incorrectly sized allocated page");
                }
            }
        }
        System.out.println("BMP closures: " + mappings + " mappings, " + elements
                + " payload elements, " + pages + " nonempty pages; SHA-256 "
                + HexFormat.of().formatHex(digest.digest()));
        corpus();
        concurrentRepeatedUse();
        reentrantMatch();
        for (int cp = 0; cp < snapshot.length; cp++) {
            int[] actual = (int[]) get.invoke(null, cp);
            if (actual != identities[cp] || !Arrays.equals(actual, snapshot[cp])) {
                throw new AssertionError("Consumer mutated shared closure at U+"
                        + Integer.toHexString(cp));
            }
        }
    }

    private static void caseSensitiveControls() throws Exception {
        for (String pattern : new String[] {"[a-z]+", "\\w+"}) {
            String xsd = "<xs:schema xmlns:xs='http://www.w3.org/2001/XMLSchema'>"
                    + "<xs:element name='v'><xs:simpleType><xs:restriction base='xs:string'>"
                    + "<xs:pattern value='" + pattern + "'/></xs:restriction>"
                    + "</xs:simpleType></xs:element></xs:schema>";
            var schema = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI)
                    .newSchema(new StreamSource(new StringReader(xsd)));
            schema.newValidator().validate(new StreamSource(new StringReader("<v>literal</v>")));
            for (String flags : new String[] {"", "X"}) {
                if (!new RegularExpression(pattern, flags).matches("literal")) {
                    throw new AssertionError("Case-sensitive control failed");
                }
            }
        }
    }

    private static void concurrentFirstUse() throws Exception {
        String[][] pairs = {
            {"[k]", "\u212a"}, {"[s]", "\u017f"}, {"[\u00b5]", "\u039c"},
            {"[\u03a3]", "\u03c2"}, {"[i]", "\u0130"}, {"[i]", "\u0131"},
            {"[\u01c4]", "\u01c5"}, {"[a-z]+", "ABC"}
        };
        CountDownLatch ready = new CountDownLatch(pairs.length);
        CountDownLatch start = new CountDownLatch(1);
        try (var pool = Executors.newFixedThreadPool(pairs.length)) {
            List<Future<?>> futures = new ArrayList<>();
            for (int n = 0; n < pairs.length; n++) {
                String[] pair = pairs[n];
                String flags = n % 2 == 0 ? "i" : "iX";
                futures.add(pool.submit(() -> {
                    ready.countDown();
                    start.await();
                    if (!new RegularExpression(pair[0], flags).matches(pair[1])) {
                        throw new AssertionError("Concurrent first match failed: " + pair[0]);
                    }
                    return null;
                }));
            }
            ready.await();
            start.countDown();
            for (Future<?> f : futures) {
                f.get();
            }
        }
    }

    private static void concurrentRepeatedUse() throws Exception {
        RegularExpression shared = new RegularExpression("([a-z]+)[0-9]*", "i");
        try (var pool = Executors.newFixedThreadPool(8)) {
            List<Future<?>> futures = new ArrayList<>();
            for (int n = 0; n < 8; n++) {
                futures.add(pool.submit(() -> {
                    for (int i = 0; i < 200; i++) {
                        if (!shared.matches("Kelvin123")
                                || !new RegularExpression("[s]", "iX").matches("\u017f")) {
                            throw new AssertionError("Repeated/reentrant consumer failed");
                        }
                    }
                }));
            }
            for (Future<?> f : futures) {
                f.get();
            }
        }
    }

    private static void reentrantMatch() {
        RegularExpression re = new RegularExpression("[a-z]+", "i");
        boolean[] entered = {false};
        CharacterIterator input = new CharacterIterator() {
            private final CharacterIterator delegate = new StringCharacterIterator("Kelvin");
            public char first() { return delegate.first(); }
            public char last() { return delegate.last(); }
            public char current() { return delegate.current(); }
            public char next() { return delegate.next(); }
            public char previous() { return delegate.previous(); }
            public int getBeginIndex() { return delegate.getBeginIndex(); }
            public int getEndIndex() { return delegate.getEndIndex(); }
            public int getIndex() { return delegate.getIndex(); }
            public Object clone() { return delegate.clone(); }
            public char setIndex(int position) {
                if (!entered[0]) {
                    entered[0] = true;
                    if (!re.matches("Kelvin")) {
                        throw new AssertionError("Reentrant match failed");
                    }
                }
                return delegate.setIndex(position);
            }
        };
        if (!re.matches(input) || !entered[0]) {
            throw new AssertionError("Iterator did not exercise reentrant matching");
        }
    }

    private static void corpus() throws Exception {
        String[] patterns = {
            "[a-z]+", "[A-Z]+", "[i]", "[k]", "[s]", "[\u00b5]", "[\u03a3]",
            "[\u01c4-\u01c6]", "[\u1c89]", "[\u00df\u1e9e]", "[\u0390\u1fb3]",
            "[^a-z]", "[a-z-[aeiou]]", "[\\p{L}-[A-Z]]", "\\p{Lu}+", "\\P{L}",
            "[\\u0000-\\uFFFF]", "[\\x{10000}-\\x{10ffff}]", "[\ud800]", "[\udc00]",
            "[\ud800\udc00]", "([a-z]+)\\1", "(?i:[k-s])", "(?i)[a-z]+", "literal",
            "[z-a]", "[", "[a-", "\\", "\\p{Bogus}", "\\p{", "(", "a{2,1}", "\\x{110000}"
        };
        String[] inputs = {
            "", "a", "A", "z", "Z", "Kelvin123", "abcABC", "literal", "Literal", "123",
            "i", "I", "\u0130", "\u0131", "k", "K", "\u212a", "s", "S", "\u017f",
            "\u00b5", "\u039c", "\u03bc", "\u03a3", "\u03c3", "\u03c2", "\u01c4",
            "\u01c5", "\u01c6", "\u00df", "\u1e9e", "\u1c89", "\u1c8a", "\u0390",
            "\u1fb3", "\u0000", "\uffff", "\ud800", "\udc00", "\udc00\ud800",
            "\ud800\udc00", "\ud801\udc00", "\ud801\udc28", "\udbff\udfff"
        };
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        int outcomes = 0;
        for (String flags : new String[] {"", "X", "i", "iX"}) {
            for (String pattern : patterns) {
                update(digest, flags + ":" + pattern);
                RegularExpression re;
                try {
                    re = new RegularExpression(pattern, flags);
                } catch (ParseException e) {
                    update(digest, "parse:" + e.getLocation() + ":" + e.getMessage());
                    outcomes++;
                    continue;
                }
                for (String input : inputs) {
                    Match m = new Match();
                    boolean actual = re.matches(input, m);
                    if (actual != re.matches(input.toCharArray())
                            || actual != re.matches(new StringCharacterIterator(input))) {
                        throw new AssertionError("Input representations disagree");
                    }
                    update(digest, input + ":" + actual);
                    if (actual) {
                        for (int g = 0; g < m.getNumberOfGroups(); g++) {
                            update(digest, m.getBeginning(g) + ":" + m.getEnd(g));
                        }
                    }
                    outcomes++;
                }
            }
        }
        System.out.println("Complete regex corpus: " + outcomes + " outcomes; SHA-256 "
                + HexFormat.of().formatHex(digest.digest()));
    }

    private static void update(MessageDigest digest, String text) {
        // UTF-16 preserves distinct lone-surrogate inputs in the evidence digest.
        putInt(digest, text.length());
        for (int i = 0; i < text.length(); i++) {
            digest.update((byte) (text.charAt(i) >>> 8));
            digest.update((byte) text.charAt(i));
        }
    }

    private static void putInt(MessageDigest digest, int value) {
        digest.update((byte) (value >>> 24));
        digest.update((byte) (value >>> 16));
        digest.update((byte) (value >>> 8));
        digest.update((byte) value);
    }
}
