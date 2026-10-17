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
 *
 * @bug 6720721
 * @summary CRL check with circular depency support needed
 * @enablePreview
 * @run main/othervm CircularCRLTwoLevelRevoked
 * @author Xuelei Fan
 */

import java.security.BinaryEncodable;
import java.security.PEMDecoder;
import java.security.Security;
import java.security.cert.CertPath;
import java.security.cert.CertPathValidator;
import java.security.cert.CertPathValidatorException;
import java.security.cert.CertPathValidatorException.BasicReason;
import java.security.cert.CertStore;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.CollectionCertStoreParameters;
import java.security.cert.PKIXParameters;
import java.security.cert.TrustAnchor;
import java.security.cert.X509CRL;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class CircularCRLTwoLevelRevoked {

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

    // a revoked certificate
    static String targetCertStr =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIICNzCCAaCgAwIBAgIBBDANBgkqhkiG9w0BAQsFADAxMQswCQYDVQQGEwJVUzEQ\n" +
        "MA4GA1UEChMHRXhhbXBsZTEQMA4GA1UECxMHQ2xhc3MtMTAeFw0wOTA0MjcwMjI0\n" +
        "MzhaFw0yOTAxMTIwMjI0MzhaMEExCzAJBgNVBAYTAlVTMRAwDgYDVQQKEwdFeGFt\n" +
        "cGxlMRAwDgYDVQQLEwdDbGFzcy0xMQ4wDAYDVQQDEwVTdXNhbjCBnzANBgkqhkiG\n" +
        "9w0BAQEFAAOBjQAwgYkCgYEAyPKlfep+EIIUOpZF3xtYUhAx79qEqe2RPRcH2YeR\n" +
        "1ogM8+AZMdcXoiuDl4CFLzQwRv1DSKUZAPdPbROLVDsUn+IGvgn2jnE7ZQEUtQQJ\n" +
        "+rorcasE7bo5MBPuno/0oQRi/4MZn6lX3qB13ZUHAvZH96oCF6C3Ro19LAwav1Lo\n" +
        "FRcCAwEAAaNPME0wCwYDVR0PBAQDAgPoMB0GA1UdDgQWBBTCUH1tqQk96Pocr8Is\n" +
        "tDKMoIRQljAfBgNVHSMEGDAWgBT0/nNP8WpyxmYrIBp4tN8y08jw2jANBgkqhkiG\n" +
        "9w0BAQsFAAOBgQBN78+Zq8dZcmR1qAlSPCqFnx+F18SgIXKlFDWz0I9GsD/s+AzH\n" +
        "n14t2j7xjLOdBsEWZykAGCwKQ9/g5HdMI/81DgFJ1HN0JNWNnyOiPifgGUzb8Ei9\n" +
        "MswbCUH2PfxlEUCK/VbH/Uy7dMfr45sutVdL0O6NEHN8VxJHA3waNURIAA==\n" +
        "-----END CERTIFICATE-----";

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

    static String topCrlStr =
        "-----BEGIN X509 CRL-----\n" +
        "MIIBGzCBhQIBATANBgkqhkiG9w0BAQsFADAfMQswCQYDVQQGEwJVUzEQMA4GA1UE\n" +
        "ChMHRXhhbXBsZRcNMDkwNDI3MDIzODA0WhcNMjgwNjI2MDIzODA0WjAiMCACAQUX\n" +
        "DTA5MDQyNzAyMzgwMFowDDAKBgNVHRUEAwoBBKAOMAwwCgYDVR0UBAMCAQIwDQYJ\n" +
        "KoZIhvcNAQELBQADgYEAmrUjV9zHIIcBOhXTVCShmPOqoNu5n/yEnGybE6wJOJpw\n" +
        "Q5SkmlojZouseWGbvqUzA7mjDDCzd0q/9tXhoFNrWWatUPGt7lMkVGU+CKm1DccV\n" +
        "ZCU079ckAhULMj1qyqCbRaKVw3vDgH6v6XFNITNEdRoq38Pk1Lo+8yFxMlZAnxw=\n" +
        "-----END X509 CRL-----";

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

    private static final PEMDecoder pemDecoder = PEMDecoder.of();

    private static CertPath generateCertificatePath()
            throws CertificateException {
        // generate certificate from cert strings
        CertificateFactory cf = CertificateFactory.getInstance("X.509");

        Certificate targetCert = pemDecoder.decode(targetCertStr, X509Certificate.class);
        Certificate subCaCert = pemDecoder.decode(subCaCertStr, X509Certificate.class);
        Certificate selfSignedCert = pemDecoder.decode(selfSignedCertStr, X509Certificate.class);

        // generate certification path
        List<Certificate> list = Arrays.asList(targetCert, subCaCert, selfSignedCert);

        return cf.generateCertPath(list);
    }

    private static Set<TrustAnchor> generateTrustAnchors()
            throws CertificateException {
        // generate certificate from cert string
        final X509Certificate selfSignedCert = pemDecoder.decode(selfSignedCertStr, X509Certificate.class);

        // generate a trust anchor
        TrustAnchor anchor =
            new TrustAnchor(selfSignedCert, null);

        return Collections.singleton(anchor);
    }

    private static CertStore generateCertificateStore() throws Exception {
        Collection<BinaryEncodable> entries = new HashSet<>();

        // generate CRL from CRL string
        CertificateFactory cf = CertificateFactory.getInstance("X.509");

        BinaryEncodable mixes = pemDecoder.decode(topCrlStr, X509CRL.class);
        entries.add(mixes);

        mixes = pemDecoder.decode(subCrlStr, X509CRL.class);
        entries.add(mixes);

        // intermediate certs
        mixes = pemDecoder.decode(topCrlIssuerCertStr, X509Certificate.class);
        entries.add(mixes);

        mixes = pemDecoder.decode(subCrlIssuerCertStr, X509Certificate.class);
        entries.add(mixes);

        return CertStore.getInstance("Collection",
                new CollectionCertStoreParameters(entries));
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

        // set the validation time
        params.setDate(new Date(109, 5, 1));   // 2009-05-01

        // disable OCSP checker
        Security.setProperty("ocsp.enable", "false");

        // enable CRL checker
        System.setProperty("com.sun.security.enableCRLDP", "true");

        CertPathValidator validator = CertPathValidator.getInstance("PKIX");

        try {
            validator.validate(path, params);
            throw new Exception("unexpected status, should be REVOKED");
        } catch (CertPathValidatorException cpve) {
            if (cpve.getReason() != BasicReason.REVOKED) {
                throw new Exception(
                    "unexpect exception, should be a REVOKED CPVE", cpve);
            }
        }
    }
}
