/*
 * Copyright (c) 2015, 2019, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 8076117
 * @summary EndEntityChecker should not process custom extensions
 *          after PKIX validation
 * @modules java.base/sun.security.validator
 * @run main/othervm -Djdk.security.allowNonCaAnchor EndEntityExtensionCheck
 */

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.security.KeyStore;
import java.security.cert.CertPathValidatorException;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.PKIXBuilderParameters;
import java.security.cert.PKIXCertPathChecker;
import java.security.cert.TrustAnchor;
import java.security.cert.X509Certificate;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import sun.security.validator.TrustStoreUtil;
import sun.security.validator.Validator;


public class EndEntityExtensionCheck {

    /*
     * Owner: CN=TestCA
     * Issuer: CN=TestCA
     */
    private static final String CA =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIIBOjCB4KADAgECAgkA0C5D8Oqi5IowCgYIKoZIzj0EAwMwETEPMA0GA1UEAxMG\n" +
        "VGVzdENBMB4XDTE1MDQwNzIyMzUyMFoXDTI1MDQwNjIyMzUyMFowETEPMA0GA1UE\n" +
        "AxMGVGVzdENBMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE5vwUrN8ZDayM6944\n" +
        "KMFbuWTdz0jS7HU6LeMEq0btazLxxJCehrc3tN9S9R+fBP0LL5Sar/LGTYp7hplA\n" +
        "8yQc86MhMB8wHQYDVR0OBBYEFK3kFZ64tzp+29461ckSriBPX6tWMAoGCCqGSM49\n" +
        "BAMDA0kAMEYCIQCI+fvYywMdoWADaqHrLgItgjU0o2xQk2Sfue+l6ZFZBwIhAI8g\n" +
        "In1uWvjeBb0d5M1lVWvJqlX8M5woQzWcunSpTRww\n" +
        "-----END CERTIFICATE-----";

    /*
     * Owner: CN=TestEE
     * Issuer: CN=TestCA
     * Contains a custom critical extension with OID 1.2.3.4:
     *    #1: ObjectId: 1.2.3.4 Criticality=true
     *    0000: 00 00
     */
    private static final String EE =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIIBaTCCAQ6gAwIBAgIIY9vH4piYGhEwCgYIKoZIzj0EAwMwETEPMA0GA1UEAxMG\n" +
        "VGVzdENBMB4XDTE1MDQwNzIzMDA1OFoXDTE1MDcwNjIzMDA1OFowETEPMA0GA1UE\n" +
        "AxMGVGVzdEVFMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAETyqYEGRbRIDQlzRE\n" +
        "K8h09CkG7xDUFbuckzlpkMan8pcj9PTEmEngSK87m+gJLobSrvvlKOkMu5kwAlC5\n" +
        "8xq13aNQME4wDAYDKgMEAQH/BAIAADAdBgNVHQ4EFgQUi7X4znXp1o7ZxhBBHO/y\n" +
        "0S7lYxIwHwYDVR0jBBgwFoAUreQVnri3On7b3jrVyRKuIE9fq1YwCgYIKoZIzj0E\n" +
        "AwMDSQAwRgIhAPlZtAG/8FJLPQp5MshvThyHDt2VRn0LIw1AcNx+ZtJBAiEArs7Y\n" +
        "YcYO0F1j6vvFp6QZ2UIck6gNlx+fNu/WOMm6zlk=\n" +
        "-----END CERTIFICATE-----";

    public static void main(String[] args) throws Exception {
        X509Certificate[] chain = createChain();

        /* Test 1: Test SimpleValidator
         *  SimpleValidator doesn't check for unsupported critical
         *  extensions in the end entity certificate, and leaves that up
         *  to EndEntityChecker, which should catch such extensions.
         */
        KeyStore ks = KeyStore.getInstance("PKCS12");
        ks.load(null, null);
        ks.setCertificateEntry("testca", chain[chain.length - 1]);

        Validator v = Validator.getInstance(Validator.TYPE_SIMPLE,
                                            Validator.VAR_TLS_CLIENT,
                                            TrustStoreUtil.getTrustedCerts(ks));
        try {
            v.validate(chain);
            throw new Exception("Chain should not have validated " +
                                "successfully.");
        } catch (CertificateException ex) {
            // EE cert has an unsupported critical extension that is not
            // checked by SimpleValidator's extension checks, so this
            // failure is expected
        }

        /* Test 2: Test PKIXValidator without custom checker
         * PKIXValidator accepts PKIXParameters that can contain
         * custom PKIXCertPathCheckers, which would be run against
         * each cert in the chain, including EE certs.
         * Check that if PKIXValidator is not provided a custom
         * PKIXCertPathChecker for an unknown critical extension in
         * the EE cert, chain validation will fail.
         */
        TrustAnchor ta = new TrustAnchor(chain[chain.length - 1], null);
        Set<TrustAnchor> tas = new HashSet<>();
        tas.add(ta);
        PKIXBuilderParameters params = new PKIXBuilderParameters(tas, null);
        params.setDate(new Date(115, 5, 1));   // 2015-05-01
        params.setRevocationEnabled(false);

        v = Validator.getInstance(Validator.TYPE_PKIX,
                                  Validator.VAR_TLS_CLIENT,
                                  params);
        try {
            v.validate(chain);
            throw new Exception("Chain should not have validated " +
                                "successfully.");
        } catch (CertificateException ex) {
            // EE cert has an unsupported critical extension and
            // PKIXValidator was not provided any custom checker
            // for it, so this failure ie expected.
        }

        /* Test 3: Test PKIXValidator with custom checker
         * Check that PKIXValidator will successfully validate a chain
         * containing an EE cert with a critical custom extension, given
         * a corresponding PKIXCertPathChecker for the extension.
         */
        params = new PKIXBuilderParameters(tas, null);
        params.addCertPathChecker(new CustomChecker());
        params.setDate(new Date(115, 5, 1));   // 2015-05-01
        params.setRevocationEnabled(false);

        v = Validator.getInstance(Validator.TYPE_PKIX,
                                  Validator.VAR_TLS_CLIENT,
                                  params);
        v.validate(chain); // This should validate successfully

        System.out.println("Tests passed.");
    }

    public static X509Certificate[] createChain() throws Exception {
        CertificateFactory cf = CertificateFactory.getInstance("X.509");
        X509Certificate ee = (X509Certificate)
            cf.generateCertificate((new ByteArrayInputStream(EE.getBytes())));
        X509Certificate ca = (X509Certificate)
            cf.generateCertificate((new ByteArrayInputStream(CA.getBytes())));

        X509Certificate[] chain = {ee, ca};
        return chain;
    }

    /*
     * A custom PKIXCertPathChecker. Looks for a critical extension
     * in an end entity certificate with the OID 1.2.3.4.
     */
    static class CustomChecker extends PKIXCertPathChecker {

        @Override
        public void init(boolean forward) throws CertPathValidatorException {
            // nothing to do
        }

        @Override
        public boolean isForwardCheckingSupported() {
            return false;
        }

        @Override
        public Set<String> getSupportedExtensions() {
            Set<String> exts = new HashSet<>();
            exts.add("1.2.3.4");
            return exts;
        }

        @Override
        public void check(Certificate cert,
                          Collection<String> unresolvedCritExts)
                throws CertPathValidatorException {
            X509Certificate currCert = (X509Certificate)cert;
            // check that this is an EE cert
            if (currCert.getBasicConstraints() == -1) {
                if (unresolvedCritExts != null &&
                        !unresolvedCritExts.isEmpty()) {
                    unresolvedCritExts.remove("1.2.3.4");
                }
            }
        }

    }
}
