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
 * @summary The canonical form of a name of ASCII characters is made without the
 *          data of the normalizer, which a name with other characters needs
 * @library /test/lib
 * @run main AsciiCanonicalName
 */

import javax.security.auth.x500.X500Principal;

import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class AsciiCanonicalName {

    private static final String NORMALIZER =
            "jdk.internal.icu.text.NormalizerBase source:";

    private static String canonical(String name) {
        return new X500Principal(name).getName(X500Principal.CANONICAL);
    }

    private static void check(String actual, String expected) {
        if (!expected.equals(actual)) {
            throw new RuntimeException("Expected " + expected + ", got "
                    + actual);
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            check(canonical("CN=Foo  Bar, O=Example Corp, C=US"),
                    "cn=foo bar,o=example corp,c=us");
            check(canonical("cn=\"A, B\"+ou=x"), "cn=a\\, b+ou=x");
            if (!new X500Principal("CN=Server, O=Example")
                    .equals(new X500Principal("cn=server,o=EXAMPLE"))) {
                throw new RuntimeException("Names should be equal");
            }
            System.out.println("ASCII done");

            // U+FF21 is a full width A, which the normalization changes to
            // an A, and U+00C5 is an A with a ring, which it decomposes
            check(canonical("CN=\uff21bc"), "cn=abc");
            if (!new X500Principal("CN=\uff21bc")
                    .equals(new X500Principal("CN=abc"))) {
                throw new RuntimeException("Names should be equal");
            }
            check(canonical("CN=\u00c5"), "cn=a\u030a");
            System.out.println("Non-ASCII done");
            return;
        }

        ProcessBuilder pb = ProcessTools.createTestJavaProcessBuilder(
                "-Xlog:class+load", "AsciiCanonicalName", "run");
        OutputAnalyzer out = ProcessTools.executeProcess(pb);
        out.shouldHaveExitValue(0);
        String stdout = out.getStdout();
        int ascii = stdout.indexOf("ASCII done");
        int normalizer = stdout.indexOf(NORMALIZER);
        if (ascii < 0 || stdout.indexOf("Non-ASCII done") < 0) {
            throw new RuntimeException("The names were not all converted");
        }
        if (normalizer < 0) {
            throw new RuntimeException(
                    "The normalizer was not used for a Unicode name");
        }
        if (normalizer < ascii) {
            throw new RuntimeException(
                    "The normalizer was used for names of ASCII characters");
        }
    }
}
