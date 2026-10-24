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
 * @summary Complete serializer operations with generated entity tables
 * @modules java.xml/com.sun.org.apache.xml.internal.serializer
 * @run main/othervm transform.CharInfoTransformTest
 */
package transform;

import com.sun.org.apache.xml.internal.serializer.OutputPropertiesFactory;
import com.sun.org.apache.xml.internal.serializer.SerializerFactory;
import java.io.ByteArrayOutputStream;
import java.io.StringReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HexFormat;
import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.w3c.dom.Document;

public class CharInfoTransformTest {
    public static void main(String[] args) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        int operations = assertEscaping(digest);
        StringBuilder text = new StringBuilder();
        for (int c = 0; c < 65536; c++) {
            if ((c >= 32 || c == 9 || c == 10 || c == 13)
                    && (c < 0xd800 || c > 0xdfff) && c < 0xfffe) text.append((char) c);
        }
        // Include supplementary characters next to entity and whitespace cases.
        text.append("\ud83d\ude00<&\"\t\n\r");
        Document doc = DocumentBuilderFactory.newDefaultInstance().newDocumentBuilder().newDocument();
        var root = doc.createElement("html");
        doc.appendChild(root);
        var body = doc.createElement("body");
        root.appendChild(body);
        body.setAttribute("title", text.toString());
        body.appendChild(doc.createTextNode(text.toString()));
        for (boolean configuredProvider : new boolean[] {false, true}) {
            TransformerFactory factory = configuredProvider ? TransformerFactory.newInstance()
                    : TransformerFactory.newDefaultInstance();
            factory.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true);
            factory.setAttribute(XMLConstants.ACCESS_EXTERNAL_DTD, "");
            factory.setAttribute(XMLConstants.ACCESS_EXTERNAL_STYLESHEET, "");
            for (String method : new String[] {"xml", "html", "text"}) {
                for (String encoding : new String[] {"UTF-8", "US-ASCII"}) {
                    if (method.equals("text") && encoding.equals("US-ASCII")) continue;
                    for (boolean stylesheet : new boolean[] {false, true}) {
                        Transformer reused = transformer(factory, stylesheet, method, encoding);
                        byte[] first = serialize(reused, doc);
                        digest.update(first);
                        operations++;
                        for (int i = 0; i < 2; i++) {
                            byte[] again = serialize(reused, doc);
                            if (!Arrays.equals(first, again)) throw new AssertionError("reused transformer");
                            digest.update(again);
                            operations++;
                            byte[] fresh = serialize(transformer(factory, stylesheet, method, encoding), doc);
                            if (!Arrays.equals(first, fresh)) throw new AssertionError("repeated construction");
                            digest.update(fresh);
                            operations++;
                        }
                    }
                }
            }
        }
        // Exercise the user-visible entity override property through the old
        // resource path, for both serializer methods.
        Path custom = Files.createTempFile("serializer-custom", ".entities");
        try {
            Files.writeString(custom, "custom 65\namp 38\nlt 60\ngt 62\nquot 34\n");
            for (String method : new String[] {"xml", "html"}) {
                var properties = OutputPropertiesFactory.getDefaultMethodProperties(method);
                properties.setProperty(OutputPropertiesFactory.S_KEY_ENTITIES, custom.toUri().toString());
                var serializer = SerializerFactory.getSerializer(properties);
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                serializer.setOutputStream(bytes);
                serializer.asDOMSerializer().serialize(doc);
                byte[] out = bytes.toByteArray();
                if (!new String(out, java.nio.charset.StandardCharsets.UTF_8).contains("&custom;")) {
                    throw new AssertionError("custom resource was not used");
                }
                digest.update(out);
                operations++;
            }
        } finally { Files.delete(custom); }
        System.out.println("PASS complete_operations=" + operations + " sha256="
                + HexFormat.of().formatHex(digest.digest()));
    }

    private static int assertEscaping(MessageDigest digest) throws Exception {
        Document doc = DocumentBuilderFactory.newDefaultInstance().newDocumentBuilder().newDocument();
        var root = doc.createElement("p");
        doc.appendChild(root);
        root.setAttribute("a", "\"&<>\t\n\r");
        root.appendChild(doc.createTextNode("\"&<>\t\n\r\u00a0"));
        String[] expected = {
            "<p a=\"&quot;&amp;&lt;&gt;&#9;&#10;&#13;\">\"&amp;&lt;&gt;\t\n&#13;\u00a0</p>",
            "<p a=\"&quot;&amp;<>\t\n\r\">\"&amp;&lt;&gt;\t\n&#13;&nbsp;</p>"
        };
        int index = 0;
        for (String method : new String[] {"xml", "html"}) {
            byte[] bytes = serialize(transformer(TransformerFactory.newDefaultInstance(), false,
                    method, "UTF-8"), doc);
            String actual = new String(bytes, java.nio.charset.StandardCharsets.UTF_8)
                    .replace("\r\n", "\n");
            if (!actual.equals(expected[index++])) {
                throw new AssertionError(method + " escaping: " + actual);
            }
            digest.update(bytes);
        }
        return index;
    }

    private static Transformer transformer(TransformerFactory factory, boolean stylesheet,
                                           String method, String encoding) throws Exception {
        Transformer t = stylesheet ? factory.newTransformer(new StreamSource(new StringReader("""
                <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
                  <xsl:template match="@*|node()">
                    <xsl:copy><xsl:apply-templates select="@*|node()"/></xsl:copy>
                  </xsl:template>
                </xsl:stylesheet>
                """))) : factory.newTransformer();
        t.setOutputProperty(OutputKeys.METHOD, method);
        t.setOutputProperty(OutputKeys.ENCODING, encoding);
        t.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
        return t;
    }

    private static byte[] serialize(Transformer t, Document doc) throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        t.transform(new DOMSource(doc), new StreamResult(out));
        return out.toByteArray();
    }
}
