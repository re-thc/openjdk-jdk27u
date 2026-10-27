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
 * @bug 6852744 8133489
 * @summary PIT b61: PKI test suite fails because self signed certificates
 *          are being rejected
 * @enablePreview
 * @modules java.base/sun.security.util
 * @run main/othervm -Djava.security.debug=certpath KeyUsageMatters subca
 * @run main/othervm -Djava.security.debug=certpath KeyUsageMatters subci
 * @run main/othervm -Djava.security.debug=certpath KeyUsageMatters alice
 * @author Xuelei Fan
 */

import java.security.BinaryEncodable;
import java.security.PEMDecoder;
import java.util.*;
import java.security.Security;
import java.security.cert.*;

import sun.security.util.DerInputStream;

/**
 * KeyUsage extension plays a important rule during looking for the issuer
 * of a certificate or CRL. A certificate issuer should have the keyCertSign
 * bit set, and a CRL issuer should have the cRLSign bit set.
 *
 * Sometime, a delegated CRL issuer would also have the keyCertSign bit set,
 * as would be troublesome to find the proper CRL issuer during certificate
 * path build if the delegated CRL issuer is a self-issued certificate, for
 * it is hard to identify it from its issuer by the "issuer" field only.
 *
 * The fix of 6852744 should addresses above issue, and allow a delegated CRL
 * issuer to have keyCertSign bit set.
 *
 * In the test case, the delegated CRL issuers have cRLSign bit set only, and
 * the CAs have the keyCertSign bit set only, it is expected to work before
 * and after the bug fix of 6852744.
 */
public final class KeyUsageMatters {

    private static final PEMDecoder PEM_DECODER = PEMDecoder.of();

    // the trust anchor
    static String selfSignedCertStr =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIICPjCCAaegAwIBAgIBADANBgkqhkiG9w0BAQsFADAfMQswCQYDVQQGEwJVUzEQ\n" +
        "MA4GA1UEChMHRXhhbXBsZTAeFw0wOTA0MjcwMjI0MzJaFw0zMDA0MDcwMjI0MzJa\n" +
        "MB8xCzAJBgNVBAYTAlVTMRAwDgYDVQQKEwdFeGFtcGxlMIGfMA0GCSqGSIb3DQEB\n" +
        "AQUAA4GNADCBiQKBgQC4OTag24sTxL2tXTNuvpmUEtdxrYAZoFsslFQ60T+WD9wQ\n" +
        "Jeiw87FSPsR2vxRuv0j8DNm2a4h7LNNIFcLurfNldbz5pvgZ7VqdbbUMPE9qP85n\n" +
        "jgDl4woyRTSUeRI4A7O0CO6NpES21dtbdhroWQrEkHxpnrDPxsxrz5gf2m3gqwID\n" +
        "AQABo4GJMIGGMB0GA1UdDgQWBBSCJd0hpl5PdAD9IZS+Hzng4lXLGzBHBgNVHSME\n" +
        "QDA+gBSCJd0hpl5PdAD9IZS+Hzng4lXLG6EjpCEwHzELMAkGA1UEBhMCVVMxEDAO\n" +
        "BgNVBAoTB0V4YW1wbGWCAQAwDwYDVR0TAQH/BAUwAwEB/zALBgNVHQ8EBAMCAgQw\n" +
        "DQYJKoZIhvcNAQELBQADgYEAiNtGz20VgRPqPt/qplrPF9IeSzfmrnwPtqAVseaP\n" +
        "nKfd2FANh8oYMmz6PzVUHtRi0tfQSurEL+UzHnBQCyKZlCWiLqfdp4oOcX/MBN9H\n" +
        "RuD6Q0RpflyFdJlxFs6Bqj/NAoVVfXWiP6mO5zxv0EyfPXDJdKIiTciY5fxH9Ns5\n" +
        "GpY=\n" +
        "-----END CERTIFICATE-----";

    // the sub-ca
    static String subCaCertStr =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIICUDCCAbmgAwIBAgIBAzANBgkqhkiG9w0BAQsFADAfMQswCQYDVQQGEwJVUzEQ\n" +
        "MA4GA1UEChMHRXhhbXBsZTAeFw0wOTA0MjcwMjI0MzRaFw0yOTAxMTIwMjI0MzRa\n" +
        "MDExCzAJBgNVBAYTAlVTMRAwDgYDVQQKEwdFeGFtcGxlMRAwDgYDVQQLEwdDbGFz\n" +
        "cy0xMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCiAJnAQW2ad3ZMKUhSJVZj\n" +
        "8pBqxTcHSTwAVguQkDglsN/OIwUpvR5Jgp3lpRWUEt6idEp0FZzORpvtjt3pr5MG\n" +
        "Eg2CDptekC5BSPS+fIAIKlncB3HwOiFFhH6b3wTydDCdEd2fvsi4QMOSVrIYMeA8\n" +
        "P/mCz6kRhfUQPE0CMmOUewIDAQABo4GJMIGGMB0GA1UdDgQWBBT0/nNP8WpyxmYr\n" +
        "IBp4tN8y08jw2jBHBgNVHSMEQDA+gBSCJd0hpl5PdAD9IZS+Hzng4lXLG6EjpCEw\n" +
        "HzELMAkGA1UEBhMCVVMxEDAOBgNVBAoTB0V4YW1wbGWCAQAwDwYDVR0TAQH/BAUw\n" +
        "AwEB/zALBgNVHQ8EBAMCAgQwDQYJKoZIhvcNAQELBQADgYEAaRhuBkn2EHB189Og\n" +
        "jv6t9juoQlXjgcBymq0Vm5ok2bC/XzGWv3U6vfV3S8dzb4qSs7yuXfZTO2wpsr7s\n" +
        "QhuOcq+GNbng9d5F7Se/+K9g+3UmJsfGHKJr7gRe+yXyBlj3qIpohUITMhEkAu9Y\n" +
        "Ogau3imRT8pz6tSL0KXOeQ3My30=\n" +
        "-----END CERTIFICATE-----";

    // a delegated CRL issuer, it's a self-issued certificate of trust anchor
    static String topCrlIssuerCertStr =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIICKzCCAZSgAwIBAgIBAjANBgkqhkiG9w0BAQsFADAfMQswCQYDVQQGEwJVUzEQ\n" +
        "MA4GA1UEChMHRXhhbXBsZTAeFw0wOTA0MjcwMjI0MzNaFw0yOTAxMTIwMjI0MzNa\n" +
        "MB8xCzAJBgNVBAYTAlVTMRAwDgYDVQQKEwdFeGFtcGxlMIGfMA0GCSqGSIb3DQEB\n" +
        "AQUAA4GNADCBiQKBgQDMJeBMBybHykI/YpwUJ4O9euqDSLb1kpWpceBS8TVqvgBC\n" +
        "SgUJWtFZL0i6bdvF6mMdlbuBkGzhXqHiVAi96/zRLbUC9F8SMEJ6MuD+YhQ0ZFTQ\n" +
        "atKy8zf8O9XzztelLJ26Gqb7QPV133WY3haAqHtCXOhEKkCN16NOYNC37DTaJwID\n" +
        "AQABo3cwdTAdBgNVHQ4EFgQULXSWzXzUOIpOJpzbSCpW42IJUugwRwYDVR0jBEAw\n" +
        "PoAUgiXdIaZeT3QA/SGUvh854OJVyxuhI6QhMB8xCzAJBgNVBAYTAlVTMRAwDgYD\n" +
        "VQQKEwdFeGFtcGxlggEAMAsGA1UdDwQEAwIBAjANBgkqhkiG9w0BAQsFAAOBgQAO\n" +
        "g7JK2Ots2cZL1LRdkDHwYhljGid7wZKz4qioxW14shbA7iqditbz6MnRU7tdD4Jw\n" +
        "Vpy4orCNUttAWDZ0ARqOCqytW/HMQWIRasqMTeO1SzOuub6SbJiZ0fuEdGDKu9oc\n" +
        "l/cr3rQdhSSrN73phSjETL5lr7TniB8Js7/taiHQlQ==\n" +
        "-----END CERTIFICATE-----";

    // a delegated CRL issuer, it's a self-issued certificate of sub-ca
    static String subCrlIssuerCertStr =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIICPTCCAaagAwIBAgIBBDANBgkqhkiG9w0BAQsFADAfMQswCQYDVQQGEwJVUzEQ\n" +
        "MA4GA1UEChMHRXhhbXBsZTAeFw0wOTA0MjcwMjI0MzRaFw0yOTAxMTIwMjI0MzRa\n" +
        "MDExCzAJBgNVBAYTAlVTMRAwDgYDVQQKEwdFeGFtcGxlMRAwDgYDVQQLEwdDbGFz\n" +
        "cy0xMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDWUtDQx2MB/7arDiquMJyd\n" +
        "LWwSg6p8sg5z6wKrC1v47MT4DBhFX+0RUgTMUdQgYpgxGpczn+6y4zfV76064S0N\n" +
        "4L/IQ+SunTW1w4yRGjB+xkyyJmWAqijG1nr+Dgkv5nxPI+9Er5lHcoVWVMEcvvRm\n" +
        "6jIBQdldVlSgv+VgUnFm5wIDAQABo3cwdTAdBgNVHQ4EFgQUkV3Qqtk7gIot9n60\n" +
        "jX6dloxrfMEwRwYDVR0jBEAwPoAUgiXdIaZeT3QA/SGUvh854OJVyxuhI6QhMB8x\n" +
        "CzAJBgNVBAYTAlVTMRAwDgYDVQQKEwdFeGFtcGxlggEAMAsGA1UdDwQEAwIBAjAN\n" +
        "BgkqhkiG9w0BAQsFAAOBgQBzA3zWKBgt72Wz5haEfAQ0B+Gei35/FwOFx8sCJfnN\n" +
        "IRNToTgAAjlvnJyI62M1xbkw8+SYuPBg5C8h0symZ2acle/62Z0Mrw6y2bQy/MP5\n" +
        "8519gStUoQw/RVHU6FhzhlB/23jo11mvkiFtpTodc0WxkMqzsw/r8p/Bx7susaoh\n" +
        "Og==\n" +
        "-----END CERTIFICATE-----";

    // the target EE certificate
    static String targetCertStr =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIICNzCCAaCgAwIBAgIBAjANBgkqhkiG9w0BAQsFADAxMQswCQYDVQQGEwJVUzEQ\n" +
        "MA4GA1UEChMHRXhhbXBsZTEQMA4GA1UECxMHQ2xhc3MtMTAeFw0wOTA0MjcwMjI0\n" +
        "MzZaFw0yOTAxMTIwMjI0MzZaMEExCzAJBgNVBAYTAlVTMRAwDgYDVQQKEwdFeGFt\n" +
        "cGxlMRAwDgYDVQQLEwdDbGFzcy0xMQ4wDAYDVQQDEwVBbGljZTCBnzANBgkqhkiG\n" +
        "9w0BAQEFAAOBjQAwgYkCgYEAvYSaU3oiE4Pxp/aUIXwMqOwSiWkZ+O3aTu13hRtK\n" +
        "ZyR+Wtj63IuvaigAC4uC+zBypF93ThjwCzVR2qKDQaQzV8CLleO96gStt7Y+i3G2\n" +
        "V3IUGgrVCqeK7N6nNYu0wW84sibcPqG/TIy0UoaQMqgB21xtRF+1DUVlFh4Z89X/\n" +
        "pskCAwEAAaNPME0wCwYDVR0PBAQDAgPoMB0GA1UdDgQWBBSynMEdcal/e9TmvlNE\n" +
        "4suXGA4+hjAfBgNVHSMEGDAWgBT0/nNP8WpyxmYrIBp4tN8y08jw2jANBgkqhkiG\n" +
        "9w0BAQsFAAOBgQB/20TSi986AXeUpKdoMcIiRkG1pXsT3gOIFbiOacywXnYHhA/Z\n" +
        "cuc5yJl9/dZO5F8ie/04/BMDPXWR8vyiH5cc6r56tQsP+aSEHTGm2/0aCmFuvBiY\n" +
        "VDhai8bsSFLH9clmbICBRpxOEIPHA/66OB+Gr7R9HlcAkDJmVk/1NuLSAQ==\n" +
        "-----END CERTIFICATE-----";

    // CRL issued by the delegated CRL issuer, topCrlIssuerCertStr
    static String topCrlStr =
        "-----BEGIN X509 CRL-----\n" +
        "MIIBGzCBhQIBATANBgkqhkiG9w0BAQsFADAfMQswCQYDVQQGEwJVUzEQMA4GA1UE\n" +
        "ChMHRXhhbXBsZRcNMDkwNDI3MDIzODA0WhcNMjgwNjI2MDIzODA0WjAiMCACAQUX\n" +
        "DTA5MDQyNzAyMzgwMFowDDAKBgNVHRUEAwoBBKAOMAwwCgYDVR0UBAMCAQIwDQYJ\n" +
        "KoZIhvcNAQELBQADgYEAmrUjV9zHIIcBOhXTVCShmPOqoNu5n/yEnGybE6wJOJpw\n" +
        "Q5SkmlojZouseWGbvqUzA7mjDDCzd0q/9tXhoFNrWWatUPGt7lMkVGU+CKm1DccV\n" +
        "ZCU079ckAhULMj1qyqCbRaKVw3vDgH6v6XFNITNEdRoq38Pk1Lo+8yFxMlZAnxw=\n" +
        "-----END X509 CRL-----";

    // CRL issued by the delegated CRL issuer, subCrlIssuerCertStr
    static String subCrlStr =
        "-----BEGIN X509 CRL-----\n" +
        "MIIBLTCBlwIBATANBgkqhkiG9w0BAQsFADAxMQswCQYDVQQGEwJVUzEQMA4GA1UE\n" +
        "ChMHRXhhbXBsZTEQMA4GA1UECxMHQ2xhc3MtMRcNMDkwNDI3MDIzODA0WhcNMjgw\n" +
        "NjI2MDIzODA0WjAiMCACAQQXDTA5MDQyNzAyMzgwMVowDDAKBgNVHRUEAwoBBKAO\n" +
        "MAwwCgYDVR0UBAMCAQIwDQYJKoZIhvcNAQELBQADgYEAq89//BlKPeaItsEoSr9R\n" +
        "6HCAPHfUbZ0yhr3jacfKNKYjMMZMUtbwDRgfhYPuYrQ1/HZOIhLGWq5RNp1/co48\n" +
        "3G6MtNCORaJJJa8r4pQ2kt/CKtJ94lQ8/bd3E+PjsAlTXeAX1OITbUvtu4ASekbE\n" +
        "F4qxaedfDuETZtej+/YLF54=\n" +
        "-----END X509 CRL-----";

    private static Set<TrustAnchor> generateTrustAnchors()
            throws CertificateException {

        // generate certificate from cert string
        X509Certificate selfSignedCert = PEM_DECODER.decode(selfSignedCertStr, X509Certificate.class);

        // generate a trust anchor
        TrustAnchor anchor =
            new TrustAnchor(selfSignedCert, null);

        return Collections.singleton(anchor);
    }

    private static CertStore generateCertificateStore() throws Exception {
        Collection<BinaryEncodable> entries = new HashSet<>();

        // Decode and add certificates
        entries.add(PEM_DECODER.decode(targetCertStr, X509Certificate.class));
        entries.add(PEM_DECODER.decode(subCaCertStr, X509Certificate.class));
        entries.add(PEM_DECODER.decode(selfSignedCertStr, X509Certificate.class));
        entries.add(PEM_DECODER.decode(topCrlIssuerCertStr, X509Certificate.class));
        entries.add(PEM_DECODER.decode(subCrlIssuerCertStr, X509Certificate.class));

        // Decode and add CRLs
        entries.add(PEM_DECODER.decode(topCrlStr, X509CRL.class));
        entries.add(PEM_DECODER.decode(subCrlStr, X509CRL.class));
        return CertStore.getInstance("Collection",
                            new CollectionCertStoreParameters(entries));
    }

    private static X509CertSelector generateSelector(String name)
                throws Exception {
        X509CertSelector selector = new X509CertSelector();

        // generate certificate from certificate string
        String cert;
        if (name.equals("subca")) {
            cert = subCaCertStr;
        } else if (name.equals("subci")) {
            cert = subCrlIssuerCertStr;
        } else {
            cert = targetCertStr;
        }

        X509Certificate target = PEM_DECODER.decode(cert, X509Certificate.class);
        byte[] extVal = target.getExtensionValue("2.5.29.14");
        if (extVal != null) {
            DerInputStream in = new DerInputStream(extVal);
            byte[] subjectKID = in.getOctetString();
            selector.setSubjectKeyIdentifier(subjectKID);
        } else {
            // unlikely to happen.
            throw new Exception("unexpected certificate: no SKID extension");
        }

        return selector;
    }

    private static boolean match(String name, Certificate cert) {

        // generate certificate from certificate string
       String newCert;
        if (name.equals("subca")) {
            newCert = subCaCertStr;
        } else if (name.equals("subci")) {
            newCert = subCrlIssuerCertStr;
        } else {
            newCert = targetCertStr;
        }
        X509Certificate target = PEM_DECODER.decode(newCert, X509Certificate.class);

        return target.equals(cert);
    }


    public static void main(String[] args) throws Exception {
        Security.setProperty(
                "jdk.certpath.disabledAlgorithms", "MD2, RSA keySize < 1024");

        CertPathBuilder builder = CertPathBuilder.getInstance("PKIX");

        X509CertSelector selector = generateSelector(args[0]);

        Set<TrustAnchor> anchors = generateTrustAnchors();
        CertStore certs = generateCertificateStore();


        PKIXBuilderParameters params =
                new PKIXBuilderParameters(anchors, selector);
        params.addCertStore(certs);
        params.setRevocationEnabled(true);
        params.setDate(new Date(109, 5, 1));   // 2009-05-01
        Security.setProperty("ocsp.enable", "false");
        System.setProperty("com.sun.security.enableCRLDP", "true");

        PKIXCertPathBuilderResult result =
                (PKIXCertPathBuilderResult)builder.build(params);

        if (!match(args[0], result.getCertPath().getCertificates().get(0))) {
            throw new Exception("unexpected certificate");
        }
    }
}
