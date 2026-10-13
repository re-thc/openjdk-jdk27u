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
package validation;

/*
 * @test
 * @summary Verifies the messages reported for invalid regular expressions in
 *          the pattern facet of a schema
 * @library /javax/xml/jaxp/libs /javax/xml/jaxp/unittest
 * @run testng/othervm -Duser.language=en -Duser.country=US validation.InvalidPatternTest
 */
import static javax.xml.XMLConstants.W3C_XML_SCHEMA_NS_URI;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.SchemaFactory;

import org.testng.Assert;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;
import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

public class InvalidPatternTest {

    @DataProvider(name = "patterns")
    public Object[][] patterns() {
        return new Object[][] {
            { "[a-", "Unexpected end of the pattern in a character class." },
            { "a{2,1}", "Invalid quantifier. A min quantity must be <= a max quantity." },
            { "(ab", "')' is expected." },
            { "a**", "Unexpected meta character." },
            { "[z-a]", "The range end code point is less than the start code point." },
        };
    }

    @Test(dataProvider = "patterns")
    public void testInvalidPattern(String pattern, String detail) throws Exception {
        String xsd = "<xs:schema xmlns:xs='" + W3C_XML_SCHEMA_NS_URI + "'>"
                + "<xs:element name='e'><xs:simpleType><xs:restriction base='xs:string'>"
                + "<xs:pattern value='" + pattern + "'/>"
                + "</xs:restriction></xs:simpleType></xs:element></xs:schema>";
        List<String> errors = new ArrayList<>();
        SchemaFactory factory = SchemaFactory.newInstance(W3C_XML_SCHEMA_NS_URI);
        factory.setErrorHandler(new ErrorHandler() {
            @Override
            public void warning(SAXParseException e) { }

            @Override
            public void error(SAXParseException e) {
                errors.add(e.getMessage());
            }

            @Override
            public void fatalError(SAXParseException e) throws SAXException {
                throw e;
            }
        });
        factory.newSchema(new StreamSource(new StringReader(xsd)));
        Assert.assertEquals(errors.size(), 1, errors.toString());
        Assert.assertTrue(errors.get(0).contains(detail), errors.get(0));
    }
}
