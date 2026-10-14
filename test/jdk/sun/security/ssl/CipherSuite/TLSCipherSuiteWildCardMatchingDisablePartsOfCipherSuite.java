/*
 * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 8341964
 * @summary Add mechanism to disable different parts of TLS cipher suite
 * @run testng/othervm TLSCipherSuiteWildCardMatchingDisablePartsOfCipherSuite
 */

import static org.testng.AssertJUnit.assertTrue;

import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import java.security.Security;
import java.util.List;

public class TLSCipherSuiteWildCardMatchingDisablePartsOfCipherSuite extends
        AbstractDisableCipherSuites {

    private static final String SECURITY_PROPERTY = "jdk.tls.disabledAlgorithms";
    private static final String TEST_ALGORITHMS =
            "TLS_DHE_*,"
                    + " TLS_ECDHE*WITH_AES_256_GCM_*,"
                    + " TLS_*_RSA_WITH_AES_*_SHA,"
                    + " TLS_.*"; // This pattern should not disable anything
    private static final String[] CIPHER_SUITES = new String[] {
            "TLS_DHE_RSA_WITH_AES_256_GCM_SHA384",
            "TLS_DHE_RSA_WITH_AES_128_GCM_SHA256",
            "TLS_DHE_RSA_WITH_AES_256_CBC_SHA256",
            "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
            "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384",
            "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA",
            "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA"
    };
    static final List<Integer> CIPHER_SUITES_IDS = List.of(
            0x009F,
            0x009E,
            0x006B,
            0xC030,
            0xC02C,
            0xC013,
            0xC014
    );

    @BeforeTest
    void setUp() throws Exception {
        Security.setProperty(SECURITY_PROPERTY, TEST_ALGORITHMS);
    }

    @Test
    public void testDefault() throws Exception {
        assertTrue(testDefaultCase(CIPHER_SUITES_IDS));
    }

    @Test
    public void testAddDisabled() throws Exception {
        assertTrue(testEngAddDisabled(CIPHER_SUITES, CIPHER_SUITES_IDS));
    }

    @Test
    public void testOnlyDisabled() throws Exception {
        assertTrue(testEngOnlyDisabled(CIPHER_SUITES));
    }
}
