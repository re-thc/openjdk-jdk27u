/*
 * Copyright (c) 2011, 2021, Oracle and/or its affiliates. All rights reserved.
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
// SunJSSE does not support dynamic system properties, no way to re-use
// system properties in samevm/agentvm mode.
//

/*
 * @test
 * @bug 7113275 8164846
 * @summary compatibility issue with MD2 trust anchor and old X509TrustManager
 * @library /javax/net/ssl/templates
 * @run main/othervm TrustTrustedCert PKIX TLSv1.2 true
 * @run main/othervm TrustTrustedCert PKIX TLSv1.2 false
 * @run main/othervm TrustTrustedCert SunX509 TLSv1.2 false
 */

import java.net.*;
import java.io.*;
import javax.net.ssl.*;
import java.security.*;
import java.security.cert.*;
import java.security.spec.*;
import java.security.interfaces.*;
import java.util.Base64;

public class TrustTrustedCert extends SSLSocketTemplate {

    /*
     * Certificates and key used in the test.
     */

    // It's a trust anchor signed with MD2 hash function.
    static String trustedCertStr =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIIDPDCCAiSgAwIBAgIIfIIvn/gghGcwDQYJKoZIhvcNAQECBQAwOzELMAkGA1UE\n" +
        "BhMCVVMxDTALBgNVBAoTBEphdmExHTAbBgNVBAsTFFN1bkpTU0UgVGVzdCBTZXJp\n" +
        "dmNlMCAXDTI2MDEwMTAwMDAwMFoYDzIxMjUxMjA4MDAwMDAwWjA7MQswCQYDVQQG\n" +
        "EwJVUzENMAsGA1UEChMESmF2YTEdMBsGA1UECxMUU3VuSlNTRSBUZXN0IFNlcml2\n" +
        "Y2UwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC9VmmppzgzY+DvUSbb\n" +
        "YiUha35mS9yU4Chr+Rv91u9azhG+ReYEwxOoOvsyKBmdR9JnYWoQ2eO5LOUO64bD\n" +
        "+ne+pavmhCRGju5RwPXSdRA6f/iyEb41NFNSfL1xwAhJeREjyc9YFQO1/AwkUY5H\n" +
        "ySjWL32Gef4ol9sZo2biOQLTz70inIhuMPDaKAxa6ddQ4wNxz4XbJ/p1hSEGT2nR\n" +
        "uaYTZfts/jpyaoyPbSq0hhpWBqlJUtEITGeehN1Etx0AfyrvqFPgvYJbu8au3rUq\n" +
        "+06kJZR8Xyo4xre3VsP40Dp5WgBdGW4PWXQ8u2XfJ2E0oMf2swLZfEVy6+OZTg43\n" +
        "SFVTAgMBAAGjQjBAMB0GA1UdDgQWBBTKUkku+L0gNoVrwBVylMrLfDISOTAOBgNV\n" +
        "HQ8BAf8EBAMCAQYwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQIFAAOCAQEA\n" +
        "ARp+uYZPdO6n41jXgFAo4h8T95lKW/Xc7NmypSfeftqmIRWOvWyaKTMLR0GClkzc\n" +
        "n8lvWY8jSUCtMaZSVGCfeXE7SHcxgNrRC6Jp8sy5VohU7SnfRcBXrZeU6EtSlW60\n" +
        "be5DgsEadii5tnBkx7zC3BjpOewwQKUgGasuP3+i1xYF3qXKO/q+y2ctZRJJr851\n" +
        "TBmzpI8wrXUFwqAGXpWvkFYWLx4rzaiGluEh2pYiK6uRrRoRdh64aF8+fqcYL9XX\n" +
        "Zn952EREB1/0TZjAmNEeJlCDZRJTgdaFMV0yA77Bxx1wiCNMZ7U3/FKl7soxEd2m\n" +
        "+3BFqsZ4TChUC39QK+346A==\n" +
        "-----END CERTIFICATE-----";

    // The certificate issued by above trust anchor, signed with SHA256
    static String targetCertStr =
        "-----BEGIN CERTIFICATE-----\n" +
        "MIIDhzCCAm+gAwIBAgIJAPka49B71SsXMA0GCSqGSIb3DQEBCwUAMDsxCzAJBgNV\n" +
        "BAYTAlVTMQ0wCwYDVQQKEwRKYXZhMR0wGwYDVQQLExRTdW5KU1NFIFRlc3QgU2Vy\n" +
        "aXZjZTAgFw0yNjAxMDEwMDAwMDBaGA8yMTI1MTIwODAwMDAwMFowTzELMAkGA1UE\n" +
        "BhMCVVMxDTALBgNVBAoTBEphdmExHTAbBgNVBAsTFFN1bkpTU0UgVGVzdCBTZXJp\n" +
        "dmNlMRIwEAYDVQQDEwlsb2NhbGhvc3QwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw\n" +
        "ggEKAoIBAQDRT9Q7TI98OJkOh243vHNuAe6+QC4VBaEjAjjeJchrGcKn3YTFUP0t\n" +
        "9OO3PyGMPyTkFLWd21Nc7MDhhym2WchzGtr7AjD5z4qcOCXn0TKhHlk8CXgwN2Cb\n" +
        "d83cSHE36JZbd8TeQG6mGiuQbRLHlsM240QjO7k34zJfy3c6Oz6YD4AbmK0Gt0Id\n" +
        "HrC4Zob0T27FGCHZr+6Yy42GzAmzdyDTbQSF2LkNJtPGels+SVSj+Aw7pwt0HlC+\n" +
        "nwyucd3T/u4OS/FU0P4kXyazpOd9bkqjyRFgMxzcMDpzsb+/b9q99ZyLfapnw29b\n" +
        "7GBMEA1cC13a0KsioxdTrZIB++tLi6GJAgMBAAGjeDB2MB0GA1UdDgQWBBSvrz2L\n" +
        "DKK2EzH1vBm3UL4gzZlw9DALBgNVHQ8EBAMCBPAwHwYDVR0jBBgwFoAUylJJLvi9\n" +
        "IDaFa8AVcpTKy3wyEjkwJwYDVR0lBCAwHgYIKwYBBQUHAwEGCCsGAQUFBwMCBggr\n" +
        "BgEFBQcDAzANBgkqhkiG9w0BAQsFAAOCAQEAsOj8HfCVcBpA5zx1MlLdohlG6bin\n" +
        "vpE7sI8LbQpWvE65XAWaXqulvoJa1ZaZfThGX/3zbJiuVPSSsZ6S5bXg8pkRxnJq\n" +
        "hGDPhUEg9JXP+5w5ZtKYrDX+h2Z9yFvXFGbdh7olhRS5ieXDW/khsNM7McGKIMG5\n" +
        "hqadZhRLECrL+VmUO6PrNzpm3L9eqIRu2G7IDhLqmBFLBPxzFGJ6p2EaiW0zxVcs\n" +
        "fDUAGwpk0pWZ8Mln7CQVjgEtAICrkf2scq7lHHIeaeYs2kZx2cffwxYMqQvWmlb1\n" +
        "q6qY7+hvPxcRF9B5ODRIrA798NwStWP6bnv2P5bY70oZP6kBS2M8Gmq8ww==\n" +
        "-----END CERTIFICATE-----";

    // Private key in the format of PKCS#8.
    static String targetPrivateKey =
        "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDRT9Q7TI98OJkO\n" +
        "h243vHNuAe6+QC4VBaEjAjjeJchrGcKn3YTFUP0t9OO3PyGMPyTkFLWd21Nc7MDh\n" +
        "hym2WchzGtr7AjD5z4qcOCXn0TKhHlk8CXgwN2Cbd83cSHE36JZbd8TeQG6mGiuQ\n" +
        "bRLHlsM240QjO7k34zJfy3c6Oz6YD4AbmK0Gt0IdHrC4Zob0T27FGCHZr+6Yy42G\n" +
        "zAmzdyDTbQSF2LkNJtPGels+SVSj+Aw7pwt0HlC+nwyucd3T/u4OS/FU0P4kXyaz\n" +
        "pOd9bkqjyRFgMxzcMDpzsb+/b9q99ZyLfapnw29b7GBMEA1cC13a0KsioxdTrZIB\n" +
        "++tLi6GJAgMBAAECggEAC1buUgobSekNDbbzlyxr+n07UG5MsNHdwXZI22wjl/3M\n" +
        "yGhdXY0+MiOuxIo0iJMRLhQbJMKxmPqwlmdKsLjbfbTqQSgEvDvsr/rwvsbcHdN1\n" +
        "lSWUL9SINNQAQJtiGtvMbYcnEL1f4TrQumHWXx7BU7NrSRdeuPLjk0IEIxD7mqQ/\n" +
        "MMFuJ2/yLxbred3BeVqQ/ET5XA0OY8Pf/gtR3tS+9e/PA365M7haDx2gIDfZJZ6a\n" +
        "fShaUOWOxYd4uLY5frhTdIZo/2hWXFyUkX/mRFZ9CputbLRu5qltoX370X/Rt/jl\n" +
        "t/duxzTPhLbgHmC+/cR4d+N24N+RB5RaGct/WWwF4wKBgQDXjGXcjJ8t8evHDlpP\n" +
        "MxJlV3aU3PX5JIWkr8npidK4CJx2vRM6+aoj3kn1OoRaD6v1IEfGRZF4dtNsCtVR\n" +
        "dAoDmzgHPMC4BbQtDOg1kpNfHad5KaVTfw/fn9REjSGPV6CxvwsTzT7VhM0raNS3\n" +
        "TjfWwUUYKkKsxlnxyI+PABiYPwKBgQD4l85YlHny/7/njXp5XDhKJu/9LUskOb4o\n" +
        "cKwdDSdBH2hVTlw+oUXVQijh5eu+YEHYCNExsjfulwTAK7V7HDqyzA/gA0YdecYO\n" +
        "A7cyK7FlzYhyS7CtM21pSjaT21ccgxedxFM9+sS4TUUAFx6KZkNFByn2ztBBFSPq\n" +
        "xIm7XiIUNwKBgFlT/gLg5DcOQ0BDWnnoGH+XN7WJvQZ7dEdD8tGuJH3QU8eBpC6U\n" +
        "uUYUIWJX1fHc/M6hih1JR3g9BnGIK8+N33iPIzEcpGGfO4RQDQvmqtyIVZeJAtMP\n" +
        "nWx3uGiQdJALKLWBDv4t2RRz7PNIhp9Q8yM1BYV2PhuMOEpTa+s/hvHRAoGBAOU/\n" +
        "cW4ktnVOPpX11Y0Xa12OnOB4pYPpsCAxD7fWym123ktU8SJcrT6mPXddBdLRh8cH\n" +
        "Eovm00e2gw4JANpgRQ1fvAAUZNOH2gpQiN++hWDhcsQcYvjGpU5kvwIJU0Ma7Wtz\n" +
        "gmR03ncr4sbbizGMbtq4aY2OWWS7bxzwVCey/nBvAoGBAKBINUyBUEnGP70M1l6N\n" +
        "mT5+Sqr3uvcThiDr4TNwyGtvumTK56VHibpIvErD9K6Ix+U3SNpwEwBbeifBqIkq\n" +
        "1W+hnlSvu+I6KvUXO7A3lvaKvDOSINjZs631b60np6sBttJCBo/NTpyyyi5uLwVc\n" +
        "hcDWR6Z4jx59gZdIr6eAY71k\n";

    static char passphrase[] = "passphrase".toCharArray();

    @Override
    protected SSLContext createServerSSLContext() throws Exception {
        return generateSSLContext();
    }

    @Override
    protected void configureServerSocket(SSLServerSocket socket) {
        socket.setNeedClientAuth(true);
    }

    @Override
    protected void runServerApplication(SSLSocket socket) throws Exception {
        InputStream sslIS = socket.getInputStream();
        OutputStream sslOS = socket.getOutputStream();

        try {
            sslIS.read();
            sslOS.write('A');
            sslOS.flush();
        } catch (SSLException | SocketException se) {
            if (!expectFail) {
                throw se;
            }   // Otherwise, ignore.
        }
    }

    @Override
    protected SSLContext createClientSSLContext() throws Exception {
        return generateSSLContext();
    }

    @Override
    protected void runClientApplication(SSLSocket socket) throws Exception {
        // enable the specified TLS protocol
        socket.setEnabledProtocols(new String[] { tlsProtocol });

        InputStream sslIS = socket.getInputStream();
        OutputStream sslOS = socket.getOutputStream();

        try {
            sslOS.write('B');
            sslOS.flush();
            sslIS.read();
        } catch (SSLHandshakeException e) {
            if (expectFail) {
            // focus on the CertPathValidatorException
                Throwable t = e.getCause().getCause();
                if (t == null || !t.toString().contains("SHA256withRSA")) {
                    throw new RuntimeException(
                        "Expected to see SHA256withRSA in exception output", t);
                }
            } else {
                throw e;
            }
        }
    }

    /*
     * =============================================================
     * The remainder is just support stuff
     */
    private static String tmAlgorithm;        // trust manager
    private static String tlsProtocol;        // trust manager
    // set this flag to test context of CertificateException
    private static boolean expectFail;

    private static void parseArguments(String[] args) {
        tmAlgorithm = args[0];
        tlsProtocol = args[1];
        expectFail = Boolean.parseBoolean(args[2]);
    }

    private static SSLContext generateSSLContext() throws Exception {

        // generate certificate from cert string
        CertificateFactory cf = CertificateFactory.getInstance("X.509");

        // create a key store
        KeyStore ks = KeyStore.getInstance("PKCS12");
        ks.load(null, null);

        // import the trused cert
        X509Certificate trusedCert = null;
        ByteArrayInputStream is =
                new ByteArrayInputStream(trustedCertStr.getBytes());
        trusedCert = (X509Certificate)cf.generateCertificate(is);
        is.close();

        ks.setCertificateEntry("Trusted RSA Signer", trusedCert);

        // generate the private key.
        PKCS8EncodedKeySpec priKeySpec = new PKCS8EncodedKeySpec(
                            Base64.getMimeDecoder().decode(targetPrivateKey));
        KeyFactory kf = KeyFactory.getInstance("RSA");
        RSAPrivateKey priKey =
                (RSAPrivateKey)kf.generatePrivate(priKeySpec);

        // generate certificate chain
        is = new ByteArrayInputStream(targetCertStr.getBytes());
        X509Certificate keyCert = (X509Certificate)cf.generateCertificate(is);
        is.close();

        X509Certificate[] chain = new X509Certificate[2];
        chain[0] = keyCert;
        chain[1] = trusedCert;

        // import the key entry and the chain
        ks.setKeyEntry("TheKey", priKey, passphrase, chain);

        // create SSL context
        TrustManagerFactory tmf = TrustManagerFactory.getInstance(tmAlgorithm);
        tmf.init(ks);

        // create the customized KM and TM
        NoneExtendedX509TM myTM =
            new NoneExtendedX509TM(tmf.getTrustManagers()[0]);
        NoneExtendedX509KM myKM =
            new NoneExtendedX509KM("TheKey", chain, priKey);

        SSLContext ctx = SSLContext.getInstance(tlsProtocol);
        // KeyManagerFactory kmf = KeyManagerFactory.getInstance("NewSunX509");
        // kmf.init(ks, passphrase);
        // ctx.init(kmf.getKeyManagers(), tmf.getTrustManagers(), null);
        ctx.init(new KeyManager[]{myKM}, new TrustManager[]{myTM}, null);
        ks = null;

        return ctx;
    }

    static class NoneExtendedX509TM implements X509TrustManager {
        X509TrustManager tm;

        NoneExtendedX509TM(TrustManager tm) {
            this.tm = (X509TrustManager)tm;
        }

        public void checkClientTrusted(X509Certificate chain[], String authType)
                throws CertificateException {
            tm.checkClientTrusted(chain, authType);
        }

        public void checkServerTrusted(X509Certificate chain[], String authType)
                throws CertificateException {
            tm.checkServerTrusted(chain, authType);
        }

        public X509Certificate[] getAcceptedIssuers() {
            return tm.getAcceptedIssuers();
        }
    }

    static class NoneExtendedX509KM implements X509KeyManager {
        private String keyAlias;
        private X509Certificate[] chain;
        private PrivateKey privateKey;

        NoneExtendedX509KM(String keyAlias, X509Certificate[] chain,
                PrivateKey privateKey) {
            this.keyAlias = keyAlias;
            this.chain = chain;
            this.privateKey = privateKey;
        }

        public String[] getClientAliases(String keyType, Principal[] issuers) {
            return new String[] {keyAlias};
        }

        public String chooseClientAlias(String[] keyType, Principal[] issuers,
                Socket socket) {
            return keyAlias;
        }

        public String[] getServerAliases(String keyType, Principal[] issuers) {
            return new String[] {keyAlias};
        }

        public String chooseServerAlias(String keyType, Principal[] issuers,
                Socket socket) {
            return keyAlias;
        }

        public X509Certificate[] getCertificateChain(String alias) {
            return chain;
        }

        public PrivateKey getPrivateKey(String alias) {
            return privateKey;
        }
    }

    public static void main(String[] args) throws Exception {
        /*
         * Get the customized arguments.
         */
        parseArguments(args);

        /*
         * The MD2 trust anchor is used in this test case.
         * if expectFail is set, we're testing exception message
         */
        if (!expectFail) {
            Security.setProperty("jdk.certpath.disabledAlgorithms",
                "MD2, RSA keySize < 1024");
        } else {
            Security.setProperty("jdk.certpath.disabledAlgorithms",
                "MD2, SHA256withRSA, RSA keySize < 1024");
        }
        Security.setProperty("jdk.tls.disabledAlgorithms",
                "SSLv3, RC4, DH keySize < 768");

        /*
         * Start the tests.
         */
        new TrustTrustedCert().run();
    }
}
