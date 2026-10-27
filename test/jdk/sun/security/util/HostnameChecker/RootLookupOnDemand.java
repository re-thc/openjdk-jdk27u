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
 * @summary Whether the root of a chain is a CA of the JDK, which is found by
 *          reading all the CA certificates of the JDK, should be looked up
 *          when a wildcard in a name needs it, and not for any other name
 * @library /test/lib
 * @modules java.base/sun.security.util
 * @run main RootLookupOnDemand
 */

import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.lib.security.CertUtils;
import sun.security.util.HostnameChecker;

public class RootLookupOnDemand {

    private static final String ANCHORS =
            "sun.security.util.AnchorCertificates source:";

    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            HostnameChecker checker =
                    HostnameChecker.getInstance(HostnameChecker.TYPE_TLS);
            X509Certificate root = CertUtils.getCertFromFile("cert1.crt");

            // cert1 has the CNs foo1.com and foo2.com, of which foo1.com is
            // the most specific, and cert4 has the DNS names f*.bar.com and
            // altfoo.b*.com
            checker.match("foo1.com", CertUtils.getCertFromFile("cert1.crt"),
                    root);
            checker.match("foo.bar.com", CertUtils.getCertFromFile("cert4.crt"),
                    null);
            checker.match("2001:db8:3c4d:15::1a2f:1a2b",
                    CertUtils.getCertFromFile("cert5.crt"), root);
            try {
                checker.match("foo3.com", CertUtils.getCertFromFile(
                        "cert1.crt"), root);
                throw new RuntimeException("foo3.com should not match");
            } catch (CertificateException expected) {
                // not found among the names
            }
            System.out.println("No lookup done");

            checker.match("foo.bar.com", CertUtils.getCertFromFile("cert4.crt"),
                    root);
            System.out.println("Wildcard done");
            return;
        }

        ProcessBuilder pb = ProcessTools.createTestJavaProcessBuilder(
                "--add-exports", "java.base/sun.security.util=ALL-UNNAMED",
                "-Dtest.src=" + System.getProperty("test.src", "."),
                "-Xlog:class+load", "RootLookupOnDemand", "run");
        OutputAnalyzer out = ProcessTools.executeProcess(pb);
        out.shouldHaveExitValue(0);
        String stdout = out.getStdout();
        int plain = stdout.indexOf("No lookup done");
        int wildcard = stdout.indexOf("Wildcard done");
        int anchors = stdout.indexOf(ANCHORS);
        if (plain < 0 || wildcard < 0) {
            throw new RuntimeException("The checks did not finish");
        }
        if (anchors < 0) {
            throw new RuntimeException(
                    "The CAs of the JDK were not used for a wildcard");
        }
        if (anchors < plain) {
            throw new RuntimeException(
                    "The CAs of the JDK were read without a wildcard");
        }
    }
}
