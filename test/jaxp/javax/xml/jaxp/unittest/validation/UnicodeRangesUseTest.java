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
 */

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.RegularExpression;
import java.io.StringReader;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import javax.xml.XMLConstants;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import org.xml.sax.SAXException;

/*
 * @test
 * @summary Exercise lazy and concurrent first use of XML Unicode categories,
 *          schema facets, subtraction, supplementary boundaries and surrogates
 * @modules java.xml/com.sun.org.apache.xerces.internal.impl.xpath.regex:+open
 * @run main/othervm UnicodeRangesUseTest
 */
public class UnicodeRangesUseTest {
    public static void main(String[] args) throws Exception {
        validate(schema("[a-z]+"), "literal", true);
        Class<?> token = Class.forName(
                "com.sun.org.apache.xerces.internal.impl.xpath.regex.Token");
        Field categories = token.getDeclaredField("categories");
        categories.setAccessible(true);
        if (categories.get(null) != null) {
            throw new AssertionError("Literal schema initialized Unicode categories");
        }

        String[][] cases = {
            {"\\w+", "Hello123"}, {"\\d+", "\u0660\u0661"}, {"\\s+", " \t"},
            {"\\i\\c*", "name-1"}, {"\\p{Lu}+", "ABC"}, {"\\p{L}+", "\u03b1\u4e00"},
            {"[\\p{L}-[A-Z]]+", "abc"}, {"\\P{L}+", "123"},
            {"\\p{Cn}", "\uD800\uDC00"}, {"\\w", "\uD835\uDC00"},
            {"\\p{Pi}", "\u2018"}, {"\\p{Pf}", "\u2019"}
        };
        CountDownLatch ready = new CountDownLatch(cases.length);
        CountDownLatch start = new CountDownLatch(1);
        try (var pool = Executors.newFixedThreadPool(cases.length)) {
            List<Future<?>> futures = new ArrayList<>();
            for (String[] c : cases) {
                futures.add(pool.submit(() -> {
                    ready.countDown();
                    start.await();
                    validate(schema(c[0]), c[1], true);
                    return null;
                }));
            }
            ready.await();
            start.countDown();
            for (Future<?> future : futures) {
                future.get();
            }
        }

        // The historical algorithm classifies only BMP characters. Cn includes
        // all supplementary code points; aggregate C does not. Test the boundary
        // explicitly, including assigned supplementary characters and noncharacters.
        for (int cp : new int[] {0, 0x41, 0x378, 0x1c89, 0xab, 0xbb, 0x2018,
                0x2019, 0xd7ff, 0xd800, 0xdbff, 0xdc00, 0xdfff, 0xe000,
                0xfffd, 0xfffe, 0xffff, 0x10000, 0x1d400, 0x2fa1f, 0x10fffd, 0x10ffff}) {
            String input = new String(Character.toChars(cp));
            int type = Character.getType(cp);
            boolean cn = cp > 0xffff || type == Character.UNASSIGNED;
            boolean other = cp <= 0xffff && (type == Character.UNASSIGNED
                    || type == Character.CONTROL || type == Character.FORMAT
                    || type == Character.PRIVATE_USE || type == Character.SURROGATE);
            match("\\p{Cn}", input, cn);
            match("\\P{Cn}", input, !cn);
            match("\\p{C}", input, other);
            match("\\P{C}", input, !other);
            match("[\\p{C}-[\\p{Cn}]]", input, other && !cn);
        }
        for (String input : new String[] {"\uD800", "\uDC00", "\uDC00\uD800"}) {
            match("\\p{Cs}+", input, true);
            validate(schema("\\p{Cs}+"), input, false);
        }
        validate(schema("\\w+"), "word_123", false);
        validate(schema("[\\p{L}-[A-Z]]+"), "ABC", false);
        for (String malformed : new String[] {"\\p{Bogus}", "\\p{", "[\\p{L}-[", "\\"}) {
            try {
                new RegularExpression(malformed, "X");
                throw new AssertionError("Accepted malformed regex: " + malformed);
            } catch (ParseException expected) { }
        }
    }

    private static void match(String pattern, String input, boolean expected) {
        if (new RegularExpression(pattern, "X").matches(input) != expected) {
            throw new AssertionError("Unexpected match for " + pattern + ": "
                    + input.codePoints().mapToObj(Integer::toHexString).toList());
        }
    }

    private static Schema schema(String pattern) throws SAXException {
        String xsd = "<xs:schema xmlns:xs='http://www.w3.org/2001/XMLSchema'>"
                + "<xs:element name='v'><xs:simpleType><xs:restriction base='xs:string'>"
                + "<xs:pattern value='" + pattern + "'/></xs:restriction>"
                + "</xs:simpleType></xs:element></xs:schema>";
        return SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI)
                .newSchema(new StreamSource(new StringReader(xsd)));
    }

    private static void validate(Schema schema, String value, boolean expected) throws Exception {
        try {
            schema.newValidator().validate(new StreamSource(new StringReader("<v>" + value + "</v>")));
            if (!expected) {
                throw new AssertionError("Accepted invalid value");
            }
        } catch (SAXException e) {
            if (expected) {
                throw e;
            }
        }
    }
}
