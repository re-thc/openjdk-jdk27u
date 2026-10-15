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
 * @summary The data of nameprep should be read when a label that is not ASCII
 *          is converted, not when the IDN class is used for ASCII names such
 *          as the host name of an SNIHostName
 * @library /test/lib
 * @run main NamePrepOnDemand
 */

import java.net.IDN;
import javax.net.ssl.SNIHostName;

import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class NamePrepOnDemand {

    private static final String STRING_PREP =
            "jdk.internal.icu.text.StringPrep source:";

    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            check(IDN.toASCII("www.example.com"), "www.example.com");
            check(IDN.toUnicode("www.example.com"), "www.example.com");
            check(IDN.toASCII("www.example.com", IDN.USE_STD3_ASCII_RULES),
                    "www.example.com");
            check(new SNIHostName("localhost").getAsciiName(), "localhost");
            System.out.println("ASCII done");

            check(IDN.toASCII("b\u00fccher.example"), "xn--bcher-kva.example");
            check(IDN.toUnicode("xn--bcher-kva.example"), "b\u00fccher.example");
            // the mapping of nameprep changes the case
            check(IDN.toASCII("B\u00dcCHER.example"),
                    "xn--bcher-kva.example");
            System.out.println("Non-ASCII done");
            return;
        }

        ProcessBuilder pb = ProcessTools.createTestJavaProcessBuilder(
                "-Xlog:class+load", "NamePrepOnDemand", "run");
        OutputAnalyzer out = ProcessTools.executeProcess(pb);
        out.shouldHaveExitValue(0);
        String stdout = out.getStdout();
        int ascii = stdout.indexOf("ASCII done");
        int nonAscii = stdout.indexOf("Non-ASCII done");
        int prep = stdout.indexOf(STRING_PREP);
        if (ascii < 0 || nonAscii < 0) {
            throw new RuntimeException("The conversions did not finish");
        }
        if (prep < 0) {
            throw new RuntimeException(
                    "The data of nameprep was not used for a Unicode label");
        }
        if (prep < ascii) {
            throw new RuntimeException(
                    "The data of nameprep was read for ASCII names");
        }
    }

    private static void check(String actual, String expected) {
        if (!expected.equals(actual)) {
            throw new RuntimeException("Expected " + expected + ", got "
                    + actual);
        }
    }
}
