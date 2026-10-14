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
 * @summary Verifies the messages printed by the factory finders when the
 *          system property jaxp.debug is set, and that nothing is printed
 *          otherwise.
 * @library /test/lib
 * @run main common.FactoryFinderDebugTest
 */
package common;

import java.util.List;
import javax.xml.XMLConstants;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.stream.XMLInputFactory;
import javax.xml.transform.TransformerFactory;
import javax.xml.validation.SchemaFactory;
import javax.xml.xpath.XPathFactory;

import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class FactoryFinderDebugTest {

    private static final String PREFIX = "JAXP: ";
    private static final String SAX_IMPL =
            "com.sun.org.apache.xerces.internal.jaxp.SAXParserFactoryImpl";
    private static final String XPATH_IMPL =
            "com.sun.org.apache.xpath.internal.jaxp.XPathFactoryImpl";
    private static final String XPATH_PROPERTY =
            "javax.xml.xpath.XPathFactory:http://java.sun.com/jaxp/xpath/dom";

    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            createFactories();
            return;
        }

        // the default implementations
        OutputAnalyzer output = run("-Djaxp.debug=true");
        output.shouldHaveExitValue(0);
        for (String factory : List.of("javax.xml.parsers.SAXParserFactory",
                "javax.xml.parsers.DocumentBuilderFactory",
                "javax.xml.transform.TransformerFactory",
                "javax.xml.stream.XMLInputFactory",
                "javax.xml.datatype.DatatypeFactory")) {
            output.shouldContain(PREFIX + "find factoryId =" + factory);
        }
        output.shouldContain(PREFIX + "loaded from fallback value: " + SAX_IMPL);
        output.shouldMatch("(?m)^" + PREFIX + "created new instance of class "
                + SAX_IMPL + " using ClassLoader: null$");
        output.shouldContain(PREFIX + "Looking up system property '" + XPATH_PROPERTY + "'");
        output.shouldContain(PREFIX + "The property is undefined.");
        output.shouldContain(PREFIX
                + "attempting to use the platform default W3C DOM XPath lib");
        output.shouldContain(PREFIX + "factory '" + XPATH_IMPL
                + "' was found for http://java.sun.com/jaxp/xpath/dom");
        output.shouldContain(PREFIX + "Looking up system property "
                + "'javax.xml.validation.SchemaFactory:http://www.w3.org/2001/XMLSchema'");
        output.shouldContain(PREFIX
                + "attempting to use the platform default XML Schema validator");
        output.shouldContain(PREFIX
                + "factory 'com.sun.org.apache.xerces.internal.jaxp.validation.XMLSchemaFactory'"
                + " was found for http://www.w3.org/2001/XMLSchema");

        // the implementations named by system properties
        output = run("-Djaxp.debug=true",
                "-Djavax.xml.parsers.SAXParserFactory=" + SAX_IMPL,
                "-D" + XPATH_PROPERTY + "=" + XPATH_IMPL);
        output.shouldHaveExitValue(0);
        output.shouldContain(PREFIX + "found system property, value=" + SAX_IMPL);
        output.shouldNotContain(PREFIX + "loaded from fallback value: " + SAX_IMPL);
        output.shouldContain(PREFIX + "The value is '" + XPATH_IMPL + "'");
        output.shouldContain(PREFIX + "createInstance(" + XPATH_IMPL + ")");
        output.shouldContain(PREFIX + "loaded " + XPATH_IMPL + " from ");
        output.shouldNotContain(PREFIX
                + "attempting to use the platform default W3C DOM XPath lib");

        // no debug output unless requested
        output = run();
        output.shouldHaveExitValue(0);
        output.shouldNotContain(PREFIX);
    }

    private static OutputAnalyzer run(String... options) throws Exception {
        String[] command = new String[options.length + 2];
        System.arraycopy(options, 0, command, 0, options.length);
        command[options.length] = FactoryFinderDebugTest.class.getName();
        command[options.length + 1] = "create";
        return new OutputAnalyzer(ProcessTools.createTestJavaProcessBuilder(command).start());
    }

    private static void createFactories() throws Exception {
        SAXParserFactory.newInstance();
        DocumentBuilderFactory.newInstance();
        TransformerFactory.newInstance();
        XMLInputFactory.newInstance();
        DatatypeFactory.newInstance();
        XPathFactory.newInstance();
        SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
    }
}
