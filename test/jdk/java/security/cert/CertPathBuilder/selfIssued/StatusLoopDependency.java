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
 * @bug 6852744
 * @summary PIT b61: PKI test suite fails because self signed certificates
 *          are being rejected
 * @modules java.base/sun.security.util
 * @enablePreview
 * @run main/othervm StatusLoopDependency subca
 * @run main/othervm StatusLoopDependency subci
 * @run main/othervm StatusLoopDependency alice
 */

import java.security.BinaryEncodable;
import java.security.PEMDecoder;
import java.security.Security;
import java.security.cert.CertPathBuilder;
import java.security.cert.CertStore;
import java.security.cert.Certificate;
import java.security.cert.CollectionCertStoreParameters;
import java.security.cert.PKIXBuilderParameters;
import java.security.cert.PKIXCertPathBuilderResult;
import java.security.cert.TrustAnchor;
import java.security.cert.X509CRL;
import java.security.cert.X509CertSelector;
import java.security.cert.X509Certificate;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

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
 * In the test case, the delegated CRL issuers have keyCertSign bit set, and
 * the CAs have the cRLSign bit set also. If we cannot identify the delegated
 * CRL issuer from its issuer, there is a potential loop to find the correct
 * CRL.
 *
 * And when revocation enabled, needs to check the status of the delegated
 * CRL issuers. If the delegated CRL issuer issues itself status, there is
 * a potential loop to verify the CRL and check the status of delegated CRL
 * issuer.
 *
 * The fix of 6852744 should addresses above issues.
 */
public final class StatusLoopDependency {

    // the trust anchor
    static String selfSignedCertStr =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIICPjCCAaegAwIBAgIBADANBgkqhkiG9w0BAQsFADAfMQswCQYDVQQGEwJVUzEQ\n" +
        "MA4GA1UEChMHRXhhbXBsZTAeFw0wOTA2MjgxMzMyMThaFw0zMDA2MDgxMzMyMTha\n" +
        "MB8xCzAJBgNVBAYTAlVTMRAwDgYDVQQKEwdFeGFtcGxlMIGfMA0GCSqGSIb3DQEB\n" +
        "AQUAA4GNADCBiQKBgQDInJhXi0655bPXAVkz1n5I6fAcZejzPnOPuwq3hU3OxFw8\n" +
        "81Uf6o9oKI1h4w4XAD8u1cUNOgiX+wPwojronlp68bIfO6FVhNf287pLtLhNJo+7\n" +
        "m6Qxw3ymFvEKy+PVj20CHSggdKHxUa4MBZBmHMFNBuxfYmjwzn+yTMmCCXOvSwID\n" +
        "AQABo4GJMIGGMB0GA1UdDgQWBBSQ52Dpau+gtL+Kc31dusYnKj16ZTBHBgNVHSME\n" +
        "QDA+gBSQ52Dpau+gtL+Kc31dusYnKj16ZaEjpCEwHzELMAkGA1UEBhMCVVMxEDAO\n" +
        "BgNVBAoTB0V4YW1wbGWCAQAwDwYDVR0TAQH/BAUwAwEB/zALBgNVHQ8EBAMCAQYw\n" +
        "DQYJKoZIhvcNAQELBQADgYEAmo7qVWUTRzBIF73s2apbP8gZsnwsmL3YqBBn4742\n" +
        "Z23UY8HEccZpB3LPZQFbsRuJh5dD5M3jmJr2vIoRDcI98fCYQmb1QKkgDfECfrKK\n" +
        "Ex8cuSBHSJ/bkbz0pSHWFXaWtd7kr/qcG8WEgUyXABRSx0dYXz9nL9+gJRMe4W6O\n" +
        "Mz4=\n" +
        "-----END CERTIFICATE-----";

    // the sub-ca
    static String subCaCertStr =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIICUDCCAbmgAwIBAgIBAzANBgkqhkiG9w0BAQsFADAfMQswCQYDVQQGEwJVUzEQ\n" +
        "MA4GA1UEChMHRXhhbXBsZTAeFw0wOTA2MjgxMzMyMjRaFw0yOTAzMTUxMzMyMjRa\n" +
        "MDExCzAJBgNVBAYTAlVTMRAwDgYDVQQKEwdFeGFtcGxlMRAwDgYDVQQLEwdDbGFz\n" +
        "cy0xMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDPFv24SK78VI0gWlyIrq/X\n" +
        "srl1431K5hJJxMYZtaQunyPmrYg3oI9KvKFykxnR0N4XDPaIi75p9dXGppVu80BA\n" +
        "+csvIPBwlBQoNmKDQWTziDOqfK4tE+IMuL/Y7pxnH6CDMY7VGpvatty2zcmH+m/v\n" +
        "E/n+HPyeELJQT2rT/3T+7wIDAQABo4GJMIGGMB0GA1UdDgQWBBRidC8Dt3dBzYES\n" +
        "KpR2tR560sZ0+zBHBgNVHSMEQDA+gBSQ52Dpau+gtL+Kc31dusYnKj16ZaEjpCEw\n" +
        "HzELMAkGA1UEBhMCVVMxEDAOBgNVBAoTB0V4YW1wbGWCAQAwDwYDVR0TAQH/BAUw\n" +
        "AwEB/zALBgNVHQ8EBAMCAQYwDQYJKoZIhvcNAQELBQADgYEANReWwbIYoF3COOpe\n" +
        "DahpqM1ZsuZNK9ogrZiVc5bfzF7Gpoq08yEo8b4Z9tN+0VHhO1rnNSmrKknxm8Wu\n" +
        "rKG/I7QHkHUeFWGTL7+eL1u9fcQHvOPIfc1to7Sipp8OYHucvMRDYztlTLiB1qCf\n" +
        "/hUApvp1eDVWNBiTtE8eYLeHViw=\n" +
        "-----END CERTIFICATE-----";

    // a delegated CRL issuer, it's a self-issued certificate of trust anchor
    static String topCrlIssuerCertStr =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIICPjCCAaegAwIBAgIBAjANBgkqhkiG9w0BAQsFADAfMQswCQYDVQQGEwJVUzEQ\n" +
        "MA4GA1UEChMHRXhhbXBsZTAeFw0wOTA2MjgxMzMyMjNaFw0yOTAzMTUxMzMyMjNa\n" +
        "MB8xCzAJBgNVBAYTAlVTMRAwDgYDVQQKEwdFeGFtcGxlMIGfMA0GCSqGSIb3DQEB\n" +
        "AQUAA4GNADCBiQKBgQC99u93trf+WmpfiqunJy/P31ej1l4rESxft2JSGNjKuLFN\n" +
        "/BO3SAugGJSkCARAwXjB0c8eeXhXWhVVWdNpbKepRJTxrjDfnFIavLgtUvmFwn/3\n" +
        "hPXe+RQeA8+AJ99Y+o+10kY8JAZLa2j93C2FdmwOjUbo8aIz85yhbiV1tEDjLwID\n" +
        "AQABo4GJMIGGMB0GA1UdDgQWBBSyFyA3XWLbdL6W6hksmBn7RKsQmDBHBgNVHSME\n" +
        "QDA+gBSQ52Dpau+gtL+Kc31dusYnKj16ZaEjpCEwHzELMAkGA1UEBhMCVVMxEDAO\n" +
        "BgNVBAoTB0V4YW1wbGWCAQAwDwYDVR0TAQH/BAUwAwEB/zALBgNVHQ8EBAMCAQYw\n" +
        "DQYJKoZIhvcNAQELBQADgYEAOuZ5h+NDflyadbO3YZQmmaGJJGxLzSLG4Imajsr8\n" +
        "dKeayydSmn2hFsba3LyNGkVzTrhK8Po3oerUd6jHh6rPYl0OIYs3uObZhF6YLuNo\n" +
        "Y7yEougqilxz6q4ooRmXaGS+rTRzP0Tp5WhUmQtW9rEx1JKgT8SXzF4yCsGXdhR/\n" +
        "KpI=\n" +
        "-----END CERTIFICATE-----";

    // a delegated CRL issuer, it's a self-issued certificate of sub-ca
    static String subCrlIssuerCertStr =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIICUDCCAbmgAwIBAgIBBDANBgkqhkiG9w0BAQsFADAfMQswCQYDVQQGEwJVUzEQ\n" +
        "MA4GA1UEChMHRXhhbXBsZTAeFw0wOTA2MjgxMzMyMjdaFw0yOTAzMTUxMzMyMjda\n" +
        "MDExCzAJBgNVBAYTAlVTMRAwDgYDVQQKEwdFeGFtcGxlMRAwDgYDVQQLEwdDbGFz\n" +
        "cy0xMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC+8AcLJtGAVUWvv3ifcyQw\n" +
        "OGqwzcPrBw/XCs6vTMlcdtFzcH1M+Z3/QHN9+5VT1gqeTIZ+b8g9005Og3XKy/HX\n" +
        "obXZeLv20VZsr+jm52ySghEYOVCTJ9OyFOAp5adp6nf0cA66Feh3LsmVhpTEcDOG\n" +
        "GnyntQm0DBYxRoOT/GBlvQIDAQABo4GJMIGGMB0GA1UdDgQWBBSRWhMuZLQoHSDN\n" +
        "xhxr+vdDmfAY8jBHBgNVHSMEQDA+gBSQ52Dpau+gtL+Kc31dusYnKj16ZaEjpCEw\n" +
        "HzELMAkGA1UEBhMCVVMxEDAOBgNVBAoTB0V4YW1wbGWCAQAwDwYDVR0TAQH/BAUw\n" +
        "AwEB/zALBgNVHQ8EBAMCAQYwDQYJKoZIhvcNAQELBQADgYEAugNT7ZjMOnW+gx3R\n" +
        "ZB8hzEsQb9S5sD/TtEtJOK6b2hputqB+Ij0JxTzsSG3uNj5DnUnB0p3k2z3kglOB\n" +
        "iTtucbe4GhQ30J30e6JaYL72cfBoM2s0cC9Z0RsShWaqYjfMONVgD2wTBKi3igSQ\n" +
        "4MiPkqQbE3l3SHblDLCffRc7geA=\n" +
        "-----END CERTIFICATE-----";

    // the target EE certificate
    static String targetCertStr =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIICNzCCAaCgAwIBAgIBAjANBgkqhkiG9w0BAQsFADAxMQswCQYDVQQGEwJVUzEQ\n" +
        "MA4GA1UEChMHRXhhbXBsZTEQMA4GA1UECxMHQ2xhc3MtMTAeFw0wOTA2MjgxMzMy\n" +
        "MzBaFw0yOTAzMTUxMzMyMzBaMEExCzAJBgNVBAYTAlVTMRAwDgYDVQQKEwdFeGFt\n" +
        "cGxlMRAwDgYDVQQLEwdDbGFzcy0xMQ4wDAYDVQQDEwVBbGljZTCBnzANBgkqhkiG\n" +
        "9w0BAQEFAAOBjQAwgYkCgYEA7wnsvR4XEOfVznf40l8ClLod+7L0y2/+smVV+GM/\n" +
        "T1/QF/stajAJxXNy08gK00WKZ6ruTHhR9vh/Z6+EQM2RZDCpU0A7LPa3kLE/XTmS\n" +
        "1MLDu8ntkdlpURpvhdDWem+rl2HU5oZgzV8Jkcov9vXuSjqEDfr45FlPuV40T8+7\n" +
        "cxsCAwEAAaNPME0wCwYDVR0PBAQDAgPoMB0GA1UdDgQWBBSBwsAhi6Z1kriOs3ty\n" +
        "uSIujv9a3DAfBgNVHSMEGDAWgBRidC8Dt3dBzYESKpR2tR560sZ0+zANBgkqhkiG\n" +
        "9w0BAQsFAAOBgQDDqvvubhc+Mpao1pCd8uNFIeNoI0jYMffwtqcOGXI/tH5TGncn\n" +
        "f0oyz3oChDsBJ8gd/ATcWG32qjVbOx7cEsgA8rKMMuXlu2praZnajpVbBsxTgATr\n" +
        "a67GRXoDSOtgG3wpNzwX59UAwKDhGinSTrS4+6o6/NoFl85lgFb/cwZqoQ==\n" +
        "-----END CERTIFICATE-----";

    // CRL issued by the delegated CRL issuer, topCrlIssuerCertStr
    static String topCrlStr =
        "-----BEGIN X509 CRL-----\n" +
        "MIIBGzCBhQIBATANBgkqhkiG9w0BAQsFADAfMQswCQYDVQQGEwJVUzEQMA4GA1UE\n" +
        "ChMHRXhhbXBsZRcNMDkwNjI4MTMzMjM4WhcNMjgwODI3MTMzMjM4WjAiMCACAQUX\n" +
        "DTA5MDYyODEzMzIzN1owDDAKBgNVHRUEAwoBBKAOMAwwCgYDVR0UBAMCAQEwDQYJ\n" +
        "KoZIhvcNAQELBQADgYEAoEX1gnAk5kmzxpIksSHDI8TSkv0GQxBujjY9U9duKIr9\n" +
        "8ierJy9UHr1N6UzJbbOUiaC4ejnnWWHfq0hcrSfT6U/ehlAXFIzoMmVdQNUsC+bt\n" +
        "GVhHToBjiUtOMTs2BW4Z3m7L/mNUFV6Urk3vjNoBxVUXkT1ZiUq6od02xZno9Pg=\n" +
        "-----END X509 CRL-----";

    // CRL issued by the delegated CRL issuer, subCrlIssuerCertStr
    static String subCrlStr =
        "-----BEGIN X509 CRL-----\n" +
        "MIIBLTCBlwIBATANBgkqhkiG9w0BAQsFADAxMQswCQYDVQQGEwJVUzEQMA4GA1UE\n" +
        "ChMHRXhhbXBsZTEQMA4GA1UECxMHQ2xhc3MtMRcNMDkwNjI4MTMzMjQzWhcNMjgw\n" +
        "ODI3MTMzMjQzWjAiMCACAQQXDTA5MDYyODEzMzIzOFowDDAKBgNVHRUEAwoBBKAO\n" +
        "MAwwCgYDVR0UBAMCAQEwDQYJKoZIhvcNAQELBQADgYEAPq8XhL09wgmisVj7Wh1L\n" +
        "Jo2YkrgVx/O4S+bKr15oPQKEz8q1Cqw+x9UO0dBHZ6QrQ7sv1vd+cBoQtauV2OoQ\n" +
        "W4fO3uwUjqS3CZZqBUhNZVYKnW8zeS4c56aefeAjbC5tqoli6U4E8YltqmgNQtsQ\n" +
        "7wU3StK/1PO4DZv/g4tr0HY=\n" +
        "-----END X509 CRL-----";

    private static final PEMDecoder pemDecoder = PEMDecoder.of();

    private static Set<TrustAnchor> generateTrustAnchors() {
        X509Certificate selfSignedCert = pemDecoder.decode(selfSignedCertStr, X509Certificate.class);

        // generate a trust anchor
        TrustAnchor anchor =
            new TrustAnchor(selfSignedCert, null);

        return Collections.singleton(anchor);
    }

    private static CertStore generateCertificateStore() throws Exception {

        Collection<BinaryEncodable> entries = new HashSet<>();

        BinaryEncodable cert = pemDecoder.decode(targetCertStr, X509Certificate.class);
        entries.add(cert);

        cert = pemDecoder.decode(subCaCertStr, X509Certificate.class);
        entries.add(cert);

        cert = pemDecoder.decode(selfSignedCertStr, X509Certificate.class);
        entries.add(cert);

        cert = pemDecoder.decode(topCrlIssuerCertStr, X509Certificate.class);
        entries.add(cert);

        cert = pemDecoder.decode(subCrlIssuerCertStr, X509Certificate.class);
        entries.add(cert);

        // generate CRL from CRL string
        BinaryEncodable mixes = pemDecoder.decode(topCrlStr, X509CRL.class);
        entries.add(mixes);

        mixes = pemDecoder.decode(subCrlStr, X509CRL.class);
        entries.add(mixes);

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

        X509Certificate target = pemDecoder.decode(cert, X509Certificate.class);
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
        X509Certificate target = pemDecoder.decode(newCert, X509Certificate.class);

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
        params.setDate(new Date(109, 7, 1));   // 2009-07-01
        Security.setProperty("ocsp.enable", "false");
        System.setProperty("com.sun.security.enableCRLDP", "true");

        PKIXCertPathBuilderResult result =
                (PKIXCertPathBuilderResult)builder.build(params);

        if (!match(args[0], result.getCertPath().getCertificates().get(0))) {
            throw new Exception("unexpected certificate");
        }
    }
}
