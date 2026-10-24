/*
 * Copyright (c) 2017, 2019, Oracle and/or its affiliates. All rights reserved.
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

/**
 * @test
 * @bug 8175029
 * @library /test/lib
 * @summary check that default implementation of
 *          X509CRL.verify(PublicKey, Provider) works on custom X509CRL impl.
 */

import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.Principal;
import java.security.Provider;
import java.security.PublicKey;
import java.security.SignatureException;
import java.security.cert.Certificate;
import java.security.cert.CRLException;
import java.security.cert.X509Certificate;
import java.security.cert.X509CRL;
import java.security.cert.X509CRLEntry;
import java.util.Date;
import java.util.Set;
import jdk.test.lib.security.CertUtils;

public class VerifyDefault {
    private static final String TEST_CRL =
        "-----BEGIN X509 CRL-----\n" +
        "MIIBGzCBhQIBATANBgkqhkiG9w0BAQsFADAfMQswCQYDVQQGEwJVUzEQMA4GA1UE\n" +
        "ChMHRXhhbXBsZRcNMDkwNDI3MDIzODA0WhcNMjgwNjI2MDIzODA0WjAiMCACAQUX\n" +
        "DTA5MDQyNzAyMzgwMFowDDAKBgNVHRUEAwoBBKAOMAwwCgYDVR0UBAMCAQIwDQYJ\n" +
        "KoZIhvcNAQELBQADgYEADHJapV3SCvy8dVf1tIHwIFK4ZR+e4p6ovD/LSHC3+anC\n" +
        "evGH//Xy6T/y5cTtAmyNZyGvcLORflc1KoEP9Ihma2KukRLyZrYpjXQhBfPYMW69\n" +
        "gZeDB6a00u/aERDjAgIvJgoP2Kn9gZ6w/Jq704SQXknWAhx8ZeuGMyNiOWVk04s=\n" +
        "-----END X509 CRL-----";

    private static final String TEST_CERT =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIICKzCCAZSgAwIBAgIBAjANBgkqhkiG9w0BAQsFADAfMQswCQYDVQQGEwJVUzEQ\n" +
        "MA4GA1UEChMHRXhhbXBsZTAeFw0wOTA0MjcwMjI0MzNaFw0yOTAxMTIwMjI0MzNa\n" +
        "MB8xCzAJBgNVBAYTAlVTMRAwDgYDVQQKEwdFeGFtcGxlMIGfMA0GCSqGSIb3DQEB\n" +
        "AQUAA4GNADCBiQKBgQDYhkfcUGN84m1xVmqK5s/Lmb5fQk6fbZ4++GRxbhW0r9Rk\n" +
        "4Hep+ufYxz9oJStBUq8OEs/4q4eZflqn42GiYMSV7W2iI2Gjl90OQhmK3c7iVL84\n" +
        "q9e274Yh/geyNcPvtJY5LfFKDdZQXVvGm3GX9KxokPdqtpM7mqrSmRTvFS/zwQID\n" +
        "AQABo3cwdTAdBgNVHQ4EFgQUJJt2oH/EIhzGBehksSVvTybNaSIwRwYDVR0jBEAw\n" +
        "PoAUDcBdzmGnq/sVv1uneWWC9SJdvYyhI6QhMB8xCzAJBgNVBAYTAlVTMRAwDgYD\n" +
        "VQQKEwdFeGFtcGxlggEAMAsGA1UdDwQEAwIBAjANBgkqhkiG9w0BAQsFAAOBgQAh\n" +
        "aUPwargGgLC9ZD4QYVUzCbXA+AjDa1XPF2T4hpjdCrkStS+grCAu5OzdUCjwlx7U\n" +
        "/8JMwFILFoVViFEWZ8xUzAGArs+qBkjjhCNnmB14IEHnTDKl2zAz2f/snzPWk8DE\n" +
        "zKtqmy8nCDs1vwqwpYAiiu2Ee0PuS+yjgePXpDLLmw==\n" +
        "-----END CERTIFICATE-----";

    private static class TestX509CRL extends X509CRL {
        private final X509CRL crl;
        TestX509CRL(X509CRL crl) {
            this.crl = crl;
        }
        public Set<String> getCriticalExtensionOIDs() {
           return crl.getCriticalExtensionOIDs();
        }
        public byte[] getExtensionValue(String oid) {
            return crl.getExtensionValue(oid);
        }
        public Set<String> getNonCriticalExtensionOIDs() {
            return crl.getNonCriticalExtensionOIDs();
        }
        public boolean hasUnsupportedCriticalExtension() {
            return crl.hasUnsupportedCriticalExtension();
        }
        public Set<? extends X509CRLEntry> getRevokedCertificates() {
            return crl.getRevokedCertificates();
        }
        public X509CRLEntry getRevokedCertificate(BigInteger serialNumber) {
            return crl.getRevokedCertificate(serialNumber);
        }
        public boolean isRevoked(Certificate cert) {
            return crl.isRevoked(cert);
        }
        public Date getNextUpdate() { return crl.getNextUpdate(); }
        public Date getThisUpdate() { return crl.getThisUpdate(); }
        public int getVersion() { return crl.getVersion(); }
        public Principal getIssuerDN() { return crl.getIssuerDN(); }
        public byte[] getTBSCertList() throws CRLException {
            return crl.getTBSCertList();
        }
        public byte[] getSignature() { return crl.getSignature(); }
        public String getSigAlgName() { return crl.getSigAlgName(); }
        public String getSigAlgOID() { return crl.getSigAlgOID(); }
        public byte[] getSigAlgParams() { return crl.getSigAlgParams(); }
        public byte[] getEncoded() throws CRLException {
            return crl.getEncoded();
        }
        public void verify(PublicKey key) throws CRLException,
            InvalidKeyException, NoSuchAlgorithmException,
            NoSuchProviderException, SignatureException {
            crl.verify(key);
        }
        public void verify(PublicKey key, String sigProvider) throws
            CRLException, InvalidKeyException, NoSuchAlgorithmException,
            NoSuchProviderException, SignatureException {
            crl.verify(key, sigProvider);
        }
        public String toString() { return crl.toString(); }
    }

    public static void main(String[] args) throws Exception {
        X509Certificate cert = CertUtils.getCertFromString(TEST_CERT);
        X509CRL crl = CertUtils.getCRLFromString(TEST_CRL);
        new TestX509CRL(crl).verify(cert.getPublicKey(), (Provider)null);
    }
}
