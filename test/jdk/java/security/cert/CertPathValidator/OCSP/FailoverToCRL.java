/*
 * Copyright (c) 2009, 2026, Oracle and/or its affiliates. All rights reserved.
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

//
// Security properties, once set, cannot revert to unset.  To avoid
// conflicts with tests running in the same VM isolate this test by
// running it in otherVM mode.
//

/**
 * @test
 * @bug 6383095
 * @summary CRL revoked certificate failures masked by OCSP failures
 * @run main/othervm FailoverToCRL
 * @enablePreview
 * @author Xuelei Fan
 */

/*
 * Note that the certificate validity is from Mar 16 14:55:35 2009 GMT to
 * Dec 1 14:55:35 2028 GMT, please update it with newer certificate if
 * expires.
 */

/*
 * Certificates used in the test.
 *
 * end entity certificate:
 * Data:
 *     Version: 3 (0x2)
 *     Serial Number: 25 (0x19)
 *     Signature Algorithm: md5WithRSAEncryption
 *     Issuer: C=US, ST=Some-State, L=Some-City, O=Some-Org
 *     Validity
 *         Not Before: Mar 16 14:55:35 2009 GMT
 *         Not After : Dec  1 14:55:35 2028 GMT
 *     Subject: C=US, ST=Some-State, L=Some-City, O=Some-Org, OU=SSL-Client,
 *              CN=localhost
 *     Subject Public Key Info:
 *         Public Key Algorithm: rsaEncryption
 *         RSA Public Key: (1024 bit)
 *             Modulus (1024 bit):
 *                 00:bb:f0:40:36:ac:26:54:4e:f4:a3:5a:00:2f:69:
 *                 21:6f:b9:7a:3a:93:ec:a2:f6:e1:8e:c7:63:d8:2f:
 *                 12:30:99:2e:b0:f2:8f:f8:27:2d:24:78:28:84:f7:
 *                 01:bf:8d:44:79:dd:3b:d2:55:f3:ce:3c:b2:5b:21:
 *                 7d:ef:fd:33:4a:b1:a3:ff:c6:c8:9b:b9:0f:7c:41:
 *                 35:97:f9:db:3a:05:60:05:15:af:59:17:92:a3:10:
 *                 ad:16:1c:e4:07:53:af:a8:76:a2:56:2a:92:d3:f9:
 *                 28:e0:78:cf:5e:1f:48:ab:5c:19:dd:e1:67:43:ba:
 *                 75:8d:f5:82:ac:43:92:44:1b
 *             Exponent: 65537 (0x10001)
 *     X509v3 extensions:
 *         X509v3 Basic Constraints:
 *             CA:FALSE
 *         X509v3 Key Usage:
 *             Digital Signature, Non Repudiation, Key Encipherment
 *         X509v3 Subject Key Identifier:
 *             CD:BB:C8:85:AA:91:BD:FD:1D:BE:CD:67:7C:FF:B3:E9:4C:A8:22:E6
 *         X509v3 Authority Key Identifier:
 *             keyid:FA:B9:51:BF:4C:E7:D9:86:98:33:F9:E7:CB:1E:F1:33:49:F7:A8:14
 * Signature Algorithm: md5WithRSAEncryption
 *
 *
 * trusted certificate authority:
 * Data:
 *     Version: 3 (0x2)
 *     Serial Number: 0 (0x0)
 *     Signature Algorithm: md5WithRSAEncryption
 *     Issuer: C=US, ST=Some-State, L=Some-City, O=Some-Org
 *     Validity
 *         Not Before: Dec  8 02:43:36 2008 GMT
 *         Not After : Aug 25 02:43:36 2028 GMT
 *     Subject: C=US, ST=Some-State, L=Some-City, O=Some-Org
 *     Subject Public Key Info:
 *         Public Key Algorithm: rsaEncryption
 *         RSA Public Key: (1024 bit)
 *             Modulus (1024 bit):
 *                 00:cb:c4:38:20:07:be:88:a7:93:b0:a1:43:51:2d:
 *                 d7:8e:85:af:54:dd:ad:a2:7b:23:5b:cf:99:13:53:
 *                 99:45:7d:ee:6d:ba:2d:bf:e3:ad:6e:3d:9f:1a:f9:
 *                 03:97:e0:17:55:ae:11:26:57:de:01:29:8e:05:3f:
 *                 21:f7:e7:36:e8:2e:37:d7:48:ac:53:d6:60:0e:c7:
 *                 50:6d:f6:c5:85:f7:8b:a6:c5:91:35:72:3c:94:ee:
 *                 f1:17:f0:71:e3:ec:1b:ce:ca:4e:40:42:b0:6d:ee:
 *                 6a:0e:d6:e5:ad:3c:0f:c9:ba:82:4f:78:f8:89:97:
 *                 89:2a:95:12:4c:d8:09:2a:e9
 *             Exponent: 65537 (0x10001)
 *     X509v3 extensions:
 *         X509v3 Subject Key Identifier:
 *             FA:B9:51:BF:4C:E7:D9:86:98:33:F9:E7:CB:1E:F1:33:49:F7:A8:14
 *         X509v3 Authority Key Identifier:
 *             keyid:FA:B9:51:BF:4C:E7:D9:86:98:33:F9:E7:CB:1E:F1:33:49:F7:A8:14
 *             DirName:/C=US/ST=Some-State/L=Some-City/O=Some-Org
 *         X509v3 Basic Constraints:
 *             CA:TRUE
 * Signature Algorithm: md5WithRSAEncryption
 *
 * CRL:
 * Certificate Revocation List (CRL):
 *    Version 2 (0x1)
 *    Signature Algorithm: md5WithRSAEncryption
 *    Issuer: /C=US/ST=Some-State/L=Some-City/O=Some-Org
 *    Last Update: Mar 16 16:27:14 2009 GMT
 *    Next Update: May 15 16:27:14 2028 GMT
 *    CRL extensions:
 *       X509v3 CRL Number:
 *              2
 * Revoked Certificates:
 *    Serial Number: 19
 *        Revocation Date: Mar 16 16:22:08 2009 GMT
 *        CRL entry extensions:
 *            X509v3 CRL Reason Code:
 *                Superseded
 *    Signature Algorithm: md5WithRSAEncryption
 */

import java.io.*;
import java.security.BinaryEncodable;
import java.security.PEMDecoder;
import java.util.*;
import java.security.Security;
import java.security.cert.*;
import java.security.cert.CertPathValidatorException.BasicReason;
import java.util.Collections;

public class FailoverToCRL {

    static String trusedCertStr =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIICrDCCAhWgAwIBAgIBADANBgkqhkiG9w0BAQsFADBJMQswCQYDVQQGEwJVUzET\n" +
        "MBEGA1UECBMKU29tZS1TdGF0ZTESMBAGA1UEBxMJU29tZS1DaXR5MREwDwYDVQQK\n" +
        "EwhTb21lLU9yZzAeFw0wODEyMDgwMjQzMzZaFw0yODA4MjUwMjQzMzZaMEkxCzAJ\n" +
        "BgNVBAYTAlVTMRMwEQYDVQQIEwpTb21lLVN0YXRlMRIwEAYDVQQHEwlTb21lLUNp\n" +
        "dHkxETAPBgNVBAoTCFNvbWUtT3JnMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKB\n" +
        "gQCPB8yQwuTJhKvCb4xVCOG712TiWBxRLJ2iJmP2uuz8eLe4sV7LICv7EYkU2ODC\n" +
        "li1hlrxA6HqbItm/0W/VT0M3SCaWbSjutuIZNyjmaCk3og/FVYZM8xh6GyzmGR5p\n" +
        "jVpRYhl4mk4R0IW647HAiF2MMVvtqo72z1bykE3Boqy5SwIDAQABo4GjMIGgMB0G\n" +
        "A1UdDgQWBBSUgySo03byPePzUVSisLY4v7EsezBxBgNVHSMEajBogBSUgySo03by\n" +
        "PePzUVSisLY4v7Ese6FNpEswSTELMAkGA1UEBhMCVVMxEzARBgNVBAgTClNvbWUt\n" +
        "U3RhdGUxEjAQBgNVBAcTCVNvbWUtQ2l0eTERMA8GA1UEChMIU29tZS1PcmeCAQAw\n" +
        "DAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQsFAAOBgQAquRAsSeSG7IbEfn56le89\n" +
        "spUIZ4Ukzybcvi13wHXG2LE8AB97Ba9U8er9tbJmL2i3HUcApDl3yT3Z/mNjoi1E\n" +
        "/FKXb1tFanLztRB5dJeK9rXUU8gdeD6Mphxi3svS6qBDbfBoD2Kv2fqWdNGojBiQ\n" +
        "VDmfIoGDfpnQnCvloB0+ZA==\n" +
        "-----END CERTIFICATE-----";

    static String targetCertStr =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIICizCCAfSgAwIBAgIBGTANBgkqhkiG9w0BAQsFADBJMQswCQYDVQQGEwJVUzET\n" +
        "MBEGA1UECBMKU29tZS1TdGF0ZTESMBAGA1UEBxMJU29tZS1DaXR5MREwDwYDVQQK\n" +
        "EwhTb21lLU9yZzAeFw0wOTAzMTYxNDU1MzVaFw0yODEyMDExNDU1MzVaMHIxCzAJ\n" +
        "BgNVBAYTAlVTMRMwEQYDVQQIEwpTb21lLVN0YXRlMRIwEAYDVQQHEwlTb21lLUNp\n" +
        "dHkxETAPBgNVBAoTCFNvbWUtT3JnMRMwEQYDVQQLEwpTU0wtQ2xpZW50MRIwEAYD\n" +
        "VQQDEwlsb2NhbGhvc3QwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJiCgLkw\n" +
        "45AL+6LOdPezjHTeMXW61d3ml3zJtSJewlEv1ADTG+Jn2+51YUi5c0Tyb/O2CU2/\n" +
        "jsRhjBFI/n6YGm4OJg99t3RhDtU3Qz+uvqiMRgmCllZD0iDg0kiWgycO3irWx2ML\n" +
        "Vf863frVlhwVhN+iYOhcZr5u2z0hsow7L3w7AgMBAAGjWjBYMAkGA1UdEwQCMAAw\n" +
        "CwYDVR0PBAQDAgXgMB0GA1UdDgQWBBQwV4EHU+5ntWOhyGVQT7cdEduetDAfBgNV\n" +
        "HSMEGDAWgBSUgySo03byPePzUVSisLY4v7EsezANBgkqhkiG9w0BAQsFAAOBgQAe\n" +
        "qRQuSAFX505vbL4blploe+8D0t8rTer3rp5P6nJ+vUxp6rFhYm3aP2tiO3ZYIiub\n" +
        "fHi2PZ87Vb88OFbsbQxFQgKQElQ6fUxs7GUD+N0YJD852+TIzg94P1v3wpV2YKiX\n" +
        "5pSY96k+Ge1D/BOoDecUDdvbpF5i2xtLdTVIfOr14g==\n" +
        "-----END CERTIFICATE-----";

    static String crlStr =
        "-----BEGIN X509 CRL-----\n" +
        "MIIBRTCBrwIBATANBgkqhkiG9w0BAQsFADBJMQswCQYDVQQGEwJVUzETMBEGA1UE\n" +
        "CBMKU29tZS1TdGF0ZTESMBAGA1UEBxMJU29tZS1DaXR5MREwDwYDVQQKEwhTb21l\n" +
        "LU9yZxcNMDkwMzE2MTYyNzE0WhcNMjgwNTE1MTYyNzE0WjAiMCACARkXDTA5MDMx\n" +
        "NjE2MjIwOFowDDAKBgNVHRUEAwoBBKAOMAwwCgYDVR0UBAMCAQIwDQYJKoZIhvcN\n" +
        "AQELBQADgYEAFONdGE+ArYO6cAKZKmb6+mvppbB/Mvg7gODu9o4p6/+6COEQS/Hh\n" +
        "+58sF/a3Fb8dDSBUWIbqZoW7Jj011b4EFtymNs6nckpqTryixM1R8E8xkLlqUdUN\n" +
        "NwKjYSFBFPRsgLv+y20DYwu7rRIWdOUuYKHb54vDreL0s5LavcVBgRc=\n" +
        "-----END X509 CRL-----";


    private static final PEMDecoder PEM_DECODER = PEMDecoder.of();

    private static CertPath generateCertificatePath()
            throws CertificateException, IOException {
        // generate certificate from cert strings
        CertificateFactory cf = CertificateFactory.getInstance("X.509");

        ByteArrayInputStream is =
                new ByteArrayInputStream(targetCertStr.getBytes());

        // generate certification path
        List<Certificate> list = Collections.singletonList(PEM_DECODER.decode
                (is, X509Certificate.class));

        return cf.generateCertPath(list);
    }

    private static Set<TrustAnchor> generateTrustAnchors() {
        // generate certificate from cert string
        X509Certificate trustedCert = PEM_DECODER.decode(trusedCertStr, X509Certificate.class);

        // generate a trust anchor
        TrustAnchor anchor = new TrustAnchor(trustedCert, null);

        return Collections.singleton(anchor);
    }

    private static CertStore generateCertificateStore() throws Exception {
        // generate CRL from CRL string
        CertificateFactory cf = CertificateFactory.getInstance("X.509");

        ByteArrayInputStream is =
                    new ByteArrayInputStream(crlStr.getBytes());

        // generate a cert store
        Collection<BinaryEncodable> crls = new HashSet<>();

        crls.add(PEM_DECODER.decode(crlStr, X509CRL.class));

        return CertStore.getInstance("Collection",
                            new CollectionCertStoreParameters(crls));
    }

    public static void main(String args[]) throws Exception {
        Security.setProperty(
                "jdk.certpath.disabledAlgorithms", "MD2, RSA keySize < 1024");

        CertPath path = generateCertificatePath();
        Set<TrustAnchor> anchors = generateTrustAnchors();
        CertStore crls = generateCertificateStore();

        PKIXParameters params = new PKIXParameters(anchors);

        // add the CRL store
        params.addCertStore(crls);

        // Activate certificate revocation checking
        params.setRevocationEnabled(true);

        // Activate OCSP
        Security.setProperty("ocsp.enable", "true");
        System.setProperty("com.sun.security.enableCRLDP", "true");

        // Ensure that the ocsp.responderURL property is not set.
        if (Security.getProperty("ocsp.responderURL") != null) {
            throw new
                Exception("The ocsp.responderURL property must not be set");
        }

        CertPathValidator validator = CertPathValidator.getInstance("PKIX");

        try {
            validator.validate(path, params);
        } catch (CertPathValidatorException cpve) {
            if (cpve.getReason() != BasicReason.REVOKED) {
                throw new Exception(
                    "unexpected exception, should be a REVOKED CPVE", cpve);
            }
        }
    }
}
