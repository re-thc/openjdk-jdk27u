/*
 * Copyright (c) 2012, 2025, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 7068321
 * @summary Support TLS Server Name Indication (SNI) Extension in JSSE Server
 * @enablePreview
 * @run main/othervm SSLSocketSNISensitive PKIX www.example.com
 * @run main/othervm SSLSocketSNISensitive SunX509 www.example.com
 * @run main/othervm SSLSocketSNISensitive PKIX www.example.net
 * @run main/othervm SSLSocketSNISensitive SunX509 www.example.net
 * @run main/othervm SSLSocketSNISensitive PKIX www.invalid.com
 * @run main/othervm SSLSocketSNISensitive SunX509 www.invalid.com
 */

import java.io.InputStream;
import java.io.OutputStream;
import java.security.PEMDecoder;
import java.security.PEMEncoder;
import java.security.interfaces.RSAPrivateKey;
import java.security.spec.PKCS8EncodedKeySpec;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SNIHostName;
import javax.net.ssl.SNIServerName;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLServerSocket;
import javax.net.ssl.SSLServerSocketFactory;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManagerFactory;
import java.security.Security;
import java.security.KeyStore;
import java.security.KeyFactory;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class SSLSocketSNISensitive {

    /*
     * =============================================================
     * Set the various variables needed for the tests, then
     * specify what tests to run on each side.
     */

    /*
     * Should we run the client or server in a separate thread?
     * Both sides can throw exceptions, but do you have a preference
     * as to which side should be the main thread.
     */
    static boolean separateServerThread = false;

    /*
     * Where do we find the keystores?
     */
    // Certificates and key used in the test.
    static String trustedCertStr =
            "-----BEGIN CERTIFICATE-----\n" +
            "MIIDUzCCAjugAwIBAgIBADANBgkqhkiG9w0BAQsFADA7MQswCQYDVQQGEwJVUzEN\n" +
            "MAsGA1UECgwESmF2YTEdMBsGA1UECwwUU3VuSlNTRSBUZXN0IFNlcml2Y2UwIBcN\n" +
            "MjYxMDE0MTkyNjAxWhgPMjEyNjA5MjAxOTI2MDFaMDsxCzAJBgNVBAYTAlVTMQ0w\n" +
            "CwYDVQQKDARKYXZhMR0wGwYDVQQLDBRTdW5KU1NFIFRlc3QgU2VyaXZjZTCCASIw\n" +
            "DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOFN5r53DtWjUqT72SyJx+32vfBx\n" +
            "bwFD5zEfc9Y5091pSqmNfmUDXdWXZK0C2+rhyiFXcG6Ms3T5JZUmGEa6Np3sJciS\n" +
            "PpQih3Noc54LjjXQGpVmHKDx3Z2fEhti/grZxAdiT2kxa3G/6Qs/uN9o/hYFS09M\n" +
            "NAKuLqndt13hstGmIAZW2iZH9ZtuM6kquPqKKEZ/GWJWNq2siXV63uEyRbm2vmi6\n" +
            "ap2WRpAjT5jx4WjwMcFDmAcfGryvgDM45wULrN8mR/iV1IiWNtZCzaStOBHjpUGF\n" +
            "MhSKIPh7NxYzYr9lHTbJbeD52NJ8+qGjrCG8qYH3PiSyOPmDPDKHbuGUbG0CAwEA\n" +
            "AaNgMF4wHQYDVR0OBBYEFFmXdvMswk7dqB7IT6+ARJ0OQ2/xMB8GA1UdIwQYMBaA\n" +
            "FFmXdvMswk7dqB7IT6+ARJ0OQ2/xMA8GA1UdEwEB/wQFMAMBAf8wCwYDVR0PBAQD\n" +
            "AgEGMA0GCSqGSIb3DQEBCwUAA4IBAQCZuKFb5wPFVVy7eDeCmmSU+7NJhUD1qzzd\n" +
            "M1JbgQIBB53SA2iI7JozHG3ZwEV0axG4/Xwtas58d25RGbZsqVNx1p6F5wcRnbRH\n" +
            "k5uA9ScFrF4JDB23jeCsfU6DV4LjOK87UnvFVtYjzgkNK5h9Hk5kyEUYSb4UvUI0\n" +
            "FW4pvKIAvwBt4OJOy/xym52kmxWq1bPGjWeai+nFDV0JV7dJNsHyFXWhgIIjdZlt\n" +
            "N/lMtk49pXu/+xJPhfHKi5ILtvHDIgejQCdwXshkHPeUQtKoOy8A5UzRk7WiSOsL\n" +
            "E3Z00nY3qR2pHokwIrIwJzzQXRncMZ9Mo9b6kxqpzr9uyqExZo7v\n" +
            "-----END CERTIFICATE-----";

    // web server certificate, www.example.com
    static String targetCertStr_A =
            "-----BEGIN CERTIFICATE-----\n" +
            "MIIDXDCCAkSgAwIBAgIBAjANBgkqhkiG9w0BAQsFADA7MQswCQYDVQQGEwJVUzEN\n" +
            "MAsGA1UECgwESmF2YTEdMBsGA1UECwwUU3VuSlNTRSBUZXN0IFNlcml2Y2UwIBcN\n" +
            "MjYxMDE0MTkyNjAxWhgPMjEyNjA5MjAxOTI2MDFaMFUxCzAJBgNVBAYTAlVTMQ0w\n" +
            "CwYDVQQKDARKYXZhMR0wGwYDVQQLDBRTdW5KU1NFIFRlc3QgU2VyaXZjZTEYMBYG\n" +
            "A1UEAwwPd3d3LmV4YW1wbGUuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB\n" +
            "CgKCAQEAk4/TGXj1vF8pJreGVkKY1ic+YErlZ9nSQLbl6saDZNzSZKK6Phhr3NnF\n" +
            "xVf0wNE7qRIQ9LsmSHLhyZ9znZggoZVYaqYkzeHlF0iccqDrIp0ZmKKIWB/XjdSO\n" +
            "8C2JU65U0vCBEwjQMcmN8YCp/S2IQhdpb15kZiXo58KWm5yzBFH4PgMMnDGxzGsd\n" +
            "da/Qf22BalcTmidZ4AuJPF2uHbjRZ2VXO3H9bPe6rzdCn8YgCQEvSuMjThOjAO1I\n" +
            "MeiYfaS3o0+m77rOSbXy4CSHpbfxkQeVRWdbre9rJfRSZbZvy6WxntpNr8WUuxYf\n" +
            "Ew2rz9WtEbLQbQFKvgpNSodvC86VnwIDAQABo08wTTALBgNVHQ8EBAMCA+gwHQYD\n" +
            "VR0OBBYEFHuDnwIGYeVuYGDksUjY8Ma3EjApMB8GA1UdIwQYMBaAFFmXdvMswk7d\n" +
            "qB7IT6+ARJ0OQ2/xMA0GCSqGSIb3DQEBCwUAA4IBAQAZXYQToP5v6Bi6YcM3+KmG\n" +
            "yyl0PwYl6CFRxn6Ri2cGshldbCLdNwsj/PFZaM/ImL5xVsudoGF061XNHs2CPMdv\n" +
            "UEtxUjuyt6DvveV9hcQmfjlPDrwX4Nb0WucvulkMZlCCXHplf7Ku55lpP4Pt8m0l\n" +
            "qlqt12/8zaB6k0MWwMVds4aQ49FmmtrQQwbTk24pOl594OliwFC1NWn1UE/k+2VE\n" +
            "f/ePYhC7p4R9TPmEWvcBBgpC2ZLKUf74wiLKjwyDmPJ53WZNxqfA8vo8JqvyZc/B\n" +
            "aqcnv1x+/UJGyTg9OYLJWi7EiN/0wjdiS0LkwzGlI3ileZbtYPQcA2TiYlNYzav9\n" +
            "-----END CERTIFICATE-----";

    // Private key in the format of PKCS#8
    static String targetPrivateKey_A =
            "-----BEGIN PRIVATE KEY-----\n" +
            "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCTj9MZePW8Xykm\n" +
            "t4ZWQpjWJz5gSuVn2dJAtuXqxoNk3NJkoro+GGvc2cXFV/TA0TupEhD0uyZIcuHJ\n" +
            "n3OdmCChlVhqpiTN4eUXSJxyoOsinRmYoohYH9eN1I7wLYlTrlTS8IETCNAxyY3x\n" +
            "gKn9LYhCF2lvXmRmJejnwpabnLMEUfg+AwycMbHMax11r9B/bYFqVxOaJ1ngC4k8\n" +
            "Xa4duNFnZVc7cf1s97qvN0KfxiAJAS9K4yNOE6MA7Ugx6Jh9pLejT6bvus5JtfLg\n" +
            "JIelt/GRB5VFZ1ut72sl9FJltm/LpbGe2k2vxZS7Fh8TDavP1a0RstBtAUq+Ck1K\n" +
            "h28LzpWfAgMBAAECggEABljiaK8WSuMA/yRXx/AXaObJPRUbpwrsi1ISs7WUQ0to\n" +
            "VWHWhwM/6IEJi8KLyZt2aIBZcF14eRdP9P9B1t6LUMf+xJ+e56g21XiPGjMnyhZd\n" +
            "2n3rRXchK32gJF6hEJNoHKaxtqLjabDUxTWWmkhSGx2ssFisEuTAju+E0O69mIrp\n" +
            "W+jpHrVuy9A8KwFuDaJOwZIUxiU4RMJgYfvG5tpptSEyrrQHr+8SOpxOi7q76+eU\n" +
            "b/uvu2mnhs0QxzvJPfgmiA8bubCTe+8RKMFC+KatVrya8L2KpXU+KnKfKmrtHkvC\n" +
            "6HxAG5gl21mnfR0MjNMSbEALFKb+IF4EOjcN8NBR+QKBgQDHKg9l9mVPsdtDn71l\n" +
            "sZc+dER/1dyHIPqU4ONefwrMvOhkgjEKlFm/GgHrn46ErG0Wt4hdp9okQfaljIUY\n" +
            "Ph9zkeC5qtPaPQ1yFA6Esj8oj6XAonDcvaqatF/xPx1QNHakoLvbGXljBoLoNrBA\n" +
            "NAckZupR4P7NQ0CRWbiKBaAQlQKBgQC9q/J3u3PLmve97zqyz/vSi+1+lkBAW9cv\n" +
            "Wkhf6KnKOW9vJUF1QYb+EE0eVKW0ASz+MFudgFIcWtWeK0kfSGJwdNCR1uaqQ3V1\n" +
            "R7vzVto6TTctme2+JNv1y69LiKrIezl5w3CUM6b3LU8eoo83T+wGgPeYjADI6Xms\n" +
            "qcRv42B8YwKBgDhTve0hZX/HlnKmr+Md+d9w9JqO+oLBIf2PKN7l4UEMQFGEvKf4\n" +
            "UvWIPnjMNHtzZJrjJ08NlNViToZ9mnrDvxNpc3wvQyFa2P2ljIGdA93N2pwDlRXp\n" +
            "EmIUl3ncVscDP3bJ+rc5mioWgll4dhqCXG7AKI8lqgqVdaJmFJn8g0uNAoGAGLut\n" +
            "WJOnG+vPVoM1ok+gxOneRF2Pb1UKkHAzc95BFc+7ikDPclzjH4o8pDHhkcF9foAL\n" +
            "0lQDYRMvO/rlBCFKROPWts3RMm6tiGecSLUQq/2ZrmaeK+dej4TKDQ17R71Z11j2\n" +
            "+zxpD15nLNWB23KekpKKtue6yng3l55jsTtzP4UCgYAgJCLXXfKJu1Khbu6p3133\n" +
            "WIELTLKnOmoXYYdsd/4uEtYX7WXajbz/6Jk0KWVMl8gc67PidVv0aDYSI5zG+hbb\n" +
            "qpSZmoQFzg4BRvz3XMWeOsK8Ko5XqPUhwh40w9xlpJch3CefKMzRJJZ3MzK+9R+e\n" +
            "UoYJwvwRvBh5zlG/vwMSEA==\n" +
            "-----END PRIVATE KEY-----";

    // web server certificate, www.example.net
    static String targetCertStr_B =
            "-----BEGIN CERTIFICATE-----\n" +
            "MIIDXDCCAkSgAwIBAgIBBDANBgkqhkiG9w0BAQsFADA7MQswCQYDVQQGEwJVUzEN\n" +
            "MAsGA1UECgwESmF2YTEdMBsGA1UECwwUU3VuSlNTRSBUZXN0IFNlcml2Y2UwIBcN\n" +
            "MjYxMDE0MTkyNjAyWhgPMjEyNjA5MjAxOTI2MDJaMFUxCzAJBgNVBAYTAlVTMQ0w\n" +
            "CwYDVQQKDARKYXZhMR0wGwYDVQQLDBRTdW5KU1NFIFRlc3QgU2VyaXZjZTEYMBYG\n" +
            "A1UEAwwPd3d3LmV4YW1wbGUubmV0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB\n" +
            "CgKCAQEA3jX8Y172GvqDiSapyE8msYsJUEz4YxugvvcQS7PrtGKH12NejeIWE8C7\n" +
            "10HYDExsi9QS4GgoHbDS+czRc4f5BkFrJDBMXSHJ2lzH6SkP0msvW+0Ehyfsp1Vu\n" +
            "yW8il53P63Qk39aDQL9NxaeiRJv4NUt09MhfAWgO2m3zDmsuexIvIW7w61jfGEn5\n" +
            "idThJhQ+CRNni/6o2YaV73VesP5xu/XHA+z71glXLUks8xqrmSVOpkNT6coCQPJ+\n" +
            "51xq8AEVcYjeJxeO/qPWZG/ssuqZYOTxYB00E7paWel1jz9TBaghV+JzbYC6t7Uc\n" +
            "21Gl22qfK1fMfHmLCLOuX6soFmGz+QIDAQABo08wTTALBgNVHQ8EBAMCA+gwHQYD\n" +
            "VR0OBBYEFBgOus7Snwo+eXDt4VnmwCmB2hPqMB8GA1UdIwQYMBaAFFmXdvMswk7d\n" +
            "qB7IT6+ARJ0OQ2/xMA0GCSqGSIb3DQEBCwUAA4IBAQDEPHygt77Fsv5iv+cTs3WZ\n" +
            "sP03+IoTkCMKhEsk4fYwFg2UEdwwd0dE1rxymHy7nCyazB0fBLyHiBuYt1cxuNGb\n" +
            "+woR2DTnmikzjOTQoqE9yuLv9VHrm3mMKZ2hq0bjDYkbfGqLSLTFPVgCLsm9p3DW\n" +
            "iTKIKMrpUzEyxBbCq8uQeHXwbDlHBzXw/Zd8I9Yn6vNEEYb19g95jGmbKBZNEqyJ\n" +
            "5PzweRpsFnDFJgOzIIKhg+0V5buOZZnRWs/A8d15mgYOSDru3X+1OT4AM2Dn6Mo7\n" +
            "xDRbo8WHYfgWgdL4U/fCTF0VojAuzAZqo+S8+aQd87e+zs9/dp7uNeL25eXj/der\n" +
            "-----END CERTIFICATE-----";

    static String targetPrivateKey_B =
            "-----BEGIN PRIVATE KEY-----\n" +
            "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDeNfxjXvYa+oOJ\n" +
            "JqnITyaxiwlQTPhjG6C+9xBLs+u0YofXY16N4hYTwLvXQdgMTGyL1BLgaCgdsNL5\n" +
            "zNFzh/kGQWskMExdIcnaXMfpKQ/Say9b7QSHJ+ynVW7JbyKXnc/rdCTf1oNAv03F\n" +
            "p6JEm/g1S3T0yF8BaA7abfMOay57Ei8hbvDrWN8YSfmJ1OEmFD4JE2eL/qjZhpXv\n" +
            "dV6w/nG79ccD7PvWCVctSSzzGquZJU6mQ1PpygJA8n7nXGrwARVxiN4nF47+o9Zk\n" +
            "b+yy6plg5PFgHTQTulpZ6XWPP1MFqCFX4nNtgLq3tRzbUaXbap8rV8x8eYsIs65f\n" +
            "qygWYbP5AgMBAAECggEACXtxeLNHRzsKoxVuSBwjwSgqTpRQqR7Q5JumxPdsuhBv\n" +
            "5+xxAkonU2wPCyffia7QY8S5+K9/i4maU/FXvFlaDAuwmb7urOHrOvebyqkagfBa\n" +
            "LGilBjg/uTURFDFueKlrg1c8CsoDMdK4BXsAydkdMpEBinLrP73qaST196O+1dHw\n" +
            "qxx7/tVxV5r34LnJ73ZBeUWkLk2d1rrFnuJFicWGXzQytst+O2fxAfRdZHlK3/nM\n" +
            "zsIfPi6LLpTTxM8d9dWwe5f0LVOy7ZIAEPmEpetEmBWQB8SY83HF4ECNHa4ErhnY\n" +
            "fNqO+wpnDYf6x/mMZXxA9ESXwOwBllbkfSeqG2bXLQKBgQDyspUgaqeIEtkCWJSf\n" +
            "HbSmxjy+Jq7lBl+iNqah20oxzLJSqEHryxgXcqpThaB6xAs0FMYl5zKm4/B3X1t3\n" +
            "cKuAQBGAFyW/bNY2iHxlKY4YCiESOTHmv9w5dLcYw1v7nwHe2R9AUDNyRcr+n4Gw\n" +
            "yxlpqZolAOnHGZ5TuY88pIGxgwKBgQDqY/GRgzc6Zsr1uBnqXp95IgB44oBlamlS\n" +
            "qWuifFZVzQMXX2cCcv0l2d/rrViQUgdNk/w8nEBE8WSanS2bZ2tp1RlumvMpG3xM\n" +
            "FZYMBxul7C4jid78/Q7x3CG95iEduFP3cRm8+S6NvyJsTYp2hCDyFfeBX5KJxkk3\n" +
            "yUO72z330wKBgQDLK2KZu48544VVaHAqb8S+ZG+PQ3Tf9yDx+8ws7RXEcLbLaV2e\n" +
            "Feu6HVynBNNeUmWKmOVz74LAoUq5s9MvPtvjRj8gOsB36pW9Gy7/xPTV/QzIY6b5\n" +
            "o52pX6KzkT+cefUn6B04Sqt2uyR/WWpJZQyGHtwSpBwQd8rKDinxu0lzHwKBgCQx\n" +
            "mrPllzmldeHLs/TE98s0vO3ty/XdILZrAvvsR0ioh7msObPfHcgihLlX4z0l7YrF\n" +
            "N0YEusfqnqZhbxF4PtXw2iSCONo4LFFzY+AnmNVeSyGhwJVAXnZqj6tLRgHY3N5w\n" +
            "0JClydKJmT8wGhmC/bNkQPvxTieIPvYmVhdEG6WRAoGAJ3tdb7j8sR7xh8pnDBz9\n" +
            "9jVWcaOql5OHstM0pzgv4OyQ8PhquuIPD0zZHzrxD+fG5teKflO4VJHwWz+tLXzZ\n" +
            "xIvpToTOCmiTCX2eRP6P3Dq37aZ5z98bGXBGpGuWVJRmK4hBiwj5wQGBHBvpSzU5\n" +
            "KmpMOTpwyIrg2SL4TkUFgDo=\n" +
            "-----END PRIVATE KEY-----";

    // web server certificate, www.invalid.com
    static String targetCertStr_C =
            "-----BEGIN CERTIFICATE-----\n" +
            "MIIDXDCCAkSgAwIBAgIBAzANBgkqhkiG9w0BAQsFADA7MQswCQYDVQQGEwJVUzEN\n" +
            "MAsGA1UECgwESmF2YTEdMBsGA1UECwwUU3VuSlNTRSBUZXN0IFNlcml2Y2UwIBcN\n" +
            "MjYxMDE0MTkyNjAyWhgPMjEyNjA5MjAxOTI2MDJaMFUxCzAJBgNVBAYTAlVTMQ0w\n" +
            "CwYDVQQKDARKYXZhMR0wGwYDVQQLDBRTdW5KU1NFIFRlc3QgU2VyaXZjZTEYMBYG\n" +
            "A1UEAwwPd3d3LmludmFsaWQuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB\n" +
            "CgKCAQEAgPLRP0NB1FYpl+X/tLa+oiuup3I6Z/enkwh03CD8DFi4wCJpsywa+4CZ\n" +
            "gBAdTG55BgX0NGNTmtQCaypmPsZTeqeaKfikAoPBiK2irTMB9NpQ1ygIC70DAhdF\n" +
            "hR8o02dZH31Xc9lG0f6l8qUE7jzsiXPX1XSaOycPmqxi7euyFcL+nq9jQ6KIGI7H\n" +
            "75xLCYjgQrTMu3/rWqdVDDCmymXI82dyqooqM/zJqlGO5fQEg/4OnJcRFWx5edB4\n" +
            "4YbXSLxfpqi0zjrA857Z9y+/ZYUEZ/3e2Buzj0yqdckzkpsiEFuPLUliwbaVDcof\n" +
            "JKdDWHFGcCJIb8SdGKd8/nwivrjdWQIDAQABo08wTTALBgNVHQ8EBAMCA+gwHQYD\n" +
            "VR0OBBYEFCIouaaBbWQVsUllcSIxjlQ76lV5MB8GA1UdIwQYMBaAFFmXdvMswk7d\n" +
            "qB7IT6+ARJ0OQ2/xMA0GCSqGSIb3DQEBCwUAA4IBAQCFayYSEbIdUi+xw08orYmc\n" +
            "iZWkjuz9bbpQnK44TU2hpHPrItxth+H9fveZ6GbeKgR3NFo3zqxhz6wXXGF5uxet\n" +
            "UuEorWnuoSduKrVsG+gQb7l9POcaR+oN+fJdUuOadpJj+AmxZIK5SrZ0eOehKZY5\n" +
            "G5UHqH031ItkR3n3AMHqUBo260IRGRMoHdvXY+gSxxGBiE2cq2k0ZSoibkD3PMwx\n" +
            "Itw95AvZ215Ilbg6vBOG3H3bdQTtlN8kNZ4BrmCwYnL5J8wV2p13Bybrl4yFiBmK\n" +
            "AQqalmzaT8eYb30GONV4K+KkY+WMbnVwmth8JHaJ2L/Hw8hR7IqzPQQ7iwRVF063\n" +
            "-----END CERTIFICATE-----";

    static String targetPrivateKey_C =
            "-----BEGIN PRIVATE KEY-----\n" +
            "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCA8tE/Q0HUVimX\n" +
            "5f+0tr6iK66ncjpn96eTCHTcIPwMWLjAImmzLBr7gJmAEB1MbnkGBfQ0Y1Oa1AJr\n" +
            "KmY+xlN6p5op+KQCg8GIraKtMwH02lDXKAgLvQMCF0WFHyjTZ1kffVdz2UbR/qXy\n" +
            "pQTuPOyJc9fVdJo7Jw+arGLt67IVwv6er2NDoogYjsfvnEsJiOBCtMy7f+tap1UM\n" +
            "MKbKZcjzZ3Kqiioz/MmqUY7l9ASD/g6clxEVbHl50HjhhtdIvF+mqLTOOsDzntn3\n" +
            "L79lhQRn/d7YG7OPTKp1yTOSmyIQW48tSWLBtpUNyh8kp0NYcUZwIkhvxJ0Yp3z+\n" +
            "fCK+uN1ZAgMBAAECggEALPgBHwXOhEVUFgQAq737N0TykLSWR8GnL/CICGh8XbXn\n" +
            "ICIgKHreIg1T+sQj4463J/GVm1t0QY9kFIlhxMyXOjQO4Eo0sCfQq2CaVbpvGTu1\n" +
            "a4MrYySUUvtYpDccnrTw8LlecSk5uGwM5VTFJmwatUiv4WHbk3toxrENgxlqLoom\n" +
            "Viekp/9rfffPeMeRchwqrJMERbGtqM+QB0AeYb6ejEXNA/mwtJNXrfEmPN8VmLS8\n" +
            "LB31IIcbmEygbx7VgsGNTsPyCsLVYBopEh7LaNOTr9HlS6j2T2WM/vrZ47Gx3xS+\n" +
            "Qso+Quxg9d4uxAv/bs475kLtNbyfuUmZaFVvXXUbPQKBgQC2IPgD3REu/cT0HFFc\n" +
            "saG8+zQkQv6RR9Fl9IQ30q2i53wUofdTllStjTafyShjuR2G4HA/cAI/5Uqtsin2\n" +
            "CXsFGbsHCRio80C3bDI+VkH6rr5hFRg7P6u0PrP1AVVnTCkUxdPi5qKI72oSICUi\n" +
            "7XJVL+N8LRltPSvoUaqPs2oYcwKBgQC1P/cTPM80uwE77rk/ZdSDTDAli33aaOQP\n" +
            "bpeR7XtHYdD8UWrU7sYuiUaSQWtT0juBqmhgPcTcyT5Vf5fKUrjVqF5AYkYruior\n" +
            "2+taPbOaUEPnNqOcmTLlVyc+9vARnFNk6h/x+z2VBr1IAs7zAtdOH+BPzzAPUb1j\n" +
            "7clYUXocAwKBgBJaSCO7hxvBHrOqlthMXgv5FEwDJDvnjMZFWX12kWC1Ct/ZYl7d\n" +
            "6zKB5Fs9ngBOixcoTqdV1iQyKtBN/8R3OBpPeXVACWgc+wyArp9xebyVF0IZKhPu\n" +
            "WpMTLncl50E9f3ZEaRGYRBCgb4PcEWHvo3HKHZZJxSIo49/JOvK4FZzZAoGBAJlU\n" +
            "CF8k1SEFhfC+bcX9Df8Yp65LR+dJTozjgKN5ZA2p6RJaieaiK9NYW/QEFZhuQ9rY\n" +
            "Xr3z4yLnt6y6aJ1Gx4gvi7QprrT1IxHBVGMdyV8kwZzKczRZwV2UEeZJHiO3vDCl\n" +
            "gurBIIJ+lgdiINIhOCSmAKtjWYPMIUx07xygqI0jAoGBAKWbAbyFoRLw8mw1Z6Tn\n" +
            "QkwNcK0NyWX8sxyQOwbezrxnRtTc9qhy92tIEo6+r82idU71jX/h63/0i7baQIsv\n" +
            "8GCuajJZVMsjd26meXn2TnQhK+WHPE72HyZWlDVjeL0aSej13pL0uNt4M0G+9/IV\n" +
            "QPVr3m56Zda2DXW3lZ5QVh3G\n" +
            "-----END PRIVATE KEY-----";

    // This is a certificate for client
    static String targetCertStr_D =
            "-----BEGIN CERTIFICATE-----\n" +
            "MIIDWzCCAkOgAwIBAgIBBTANBgkqhkiG9w0BAQsFADA7MQswCQYDVQQGEwJVUzEN\n" +
            "MAsGA1UECgwESmF2YTEdMBsGA1UECwwUU3VuSlNTRSBUZXN0IFNlcml2Y2UwIBcN\n" +
            "MjYxMDE0MTkyNjAzWhgPMjEyNjA5MjAxOTI2MDNaMFQxCzAJBgNVBAYTAlVTMQ0w\n" +
            "CwYDVQQKDARKYXZhMR0wGwYDVQQLDBRTdW5KU1NFIFRlc3QgU2VyaXZjZTEXMBUG\n" +
            "A1UEAwwOSW50ZXJPcCBUZXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK\n" +
            "AoIBAQDC3q8hQo+iPw7u3MkZzKXQmtRkglXE3VeH0xrkMM/JxoNQT9DMicuJYpUr\n" +
            "DPEnIY10kI7iFWhdQJbzQqLV2AU6ZEIuu1gNDT5MpcsHtJNqzb7ZSiikgWZpyWG5\n" +
            "gcD+JmNFwZjiL93XLjfMfjwzrmqWTo/yfc1sC+DXbEX64dL6tVvQxAoDOWK5txPi\n" +
            "Ag0y56S8hFFcbxLWfm/U1fIHedCPG0D3qto5tCnDcVgoMEuuxH0Mx1naGXFUiH9M\n" +
            "QHAwnfQ1122CWw63B4wrOFtdOhC8t6Rc0xAvCG23C8IJUI8aicd77+KnoAKiK+KL\n" +
            "WwotY7SeS3huvKcyPc7aFP/bsr8NAgMBAAGjTzBNMAsGA1UdDwQEAwID6DAdBgNV\n" +
            "HQ4EFgQUfXcwkXap/ysMUmgAbgnW4SAWcv8wHwYDVR0jBBgwFoAUWZd28yzCTt2o\n" +
            "HshPr4BEnQ5Db/EwDQYJKoZIhvcNAQELBQADggEBADw5CGSHDk1WSeWYNknlYtVq\n" +
            "pzeJYIQvnkTO7fivN8urNQD1cQBw2CWUOnueG97dz7ahzogfTR/8zvwCz9eMvO6R\n" +
            "Q/7SHf4laBVrMcqGb1yYRrebQNGbyZwilQ4aJ0GfTEMaBNPQjK6Wo8CtwSqiZBm2\n" +
            "8AyTN3C6wgIGX4ie84dsH6obTsC8qUCcHOQ8HYWWbwoxyhHD8Ecd/gWjjcbQ7NvX\n" +
            "qT/WW1t+0uqnql9b/yLaegrb1p/FqnwPJaoa0ea4AsXCn0MA4A/GzNk7sstxnvt3\n" +
            "M+TzDgVqm0JX8rIns39d1ndKMn2Ey/po4Q6mE5wB5ZIGn+ZwJv/brwOJpaZKBog=\n" +
            "-----END CERTIFICATE-----";

    static String targetPrivateKey_D =
            "-----BEGIN PRIVATE KEY-----\n" +
            "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDC3q8hQo+iPw7u\n" +
            "3MkZzKXQmtRkglXE3VeH0xrkMM/JxoNQT9DMicuJYpUrDPEnIY10kI7iFWhdQJbz\n" +
            "QqLV2AU6ZEIuu1gNDT5MpcsHtJNqzb7ZSiikgWZpyWG5gcD+JmNFwZjiL93XLjfM\n" +
            "fjwzrmqWTo/yfc1sC+DXbEX64dL6tVvQxAoDOWK5txPiAg0y56S8hFFcbxLWfm/U\n" +
            "1fIHedCPG0D3qto5tCnDcVgoMEuuxH0Mx1naGXFUiH9MQHAwnfQ1122CWw63B4wr\n" +
            "OFtdOhC8t6Rc0xAvCG23C8IJUI8aicd77+KnoAKiK+KLWwotY7SeS3huvKcyPc7a\n" +
            "FP/bsr8NAgMBAAECggEAFn5XhG/R85OdeNNHFUbK7GQ1gwU2ZZslE4+5yWrxo+QE\n" +
            "W/yykyw5WyTkJ2F+4++atpX0dZgCAXhHVFILSMLUK6l5/Y9GJSTeXZY/ntE9uPTX\n" +
            "Lu7BTT0wjKJ1uNDc7Zk8bpy1CzAk8RsrzrDS6HudYGHgz3KtB71BRAHX/BMdZC81\n" +
            "D4Tt9Ss9/8Kddkv1BFTOgCaLiaxJxAgeWETUhWCmOFlNqWNDANJHuUSokdFloLXJ\n" +
            "S0SJHo4fxJ345EoWg+PcWTfFlX4dMuCkOZwR7+0oC/GTNqvdshWB2RiJB8rvIlyH\n" +
            "CAHVcTOwAjy5fhx+GGmgYs9iYpoSF+jp0RpkCuCYAwKBgQDnHKK+71ehVJg8K9SV\n" +
            "QHzv2WeTwC1NoOPS/Ug2m725re21W0mThM4RAHTg99mQKJs1h7Rwl+363iPcGe2D\n" +
            "WCUj/foKpXllaI5jVeIjRsPBqescSon6EKumN2ntu7Lme826UHavLU28DJeym4tk\n" +
            "XG09y8J8SuH3aVMQ+clG215qawKBgQDX2urmjk4ywBSnl87oIASDWH5Aj63+y6zF\n" +
            "vg9Zd55M70h4kxfhEwMDHPp/PPOGP9fNR4XyDGIDsz31CB0lwVoBJ63efzKkPIDq\n" +
            "tzhDREBPqBhEfoodsesZXJJGcskYhveb9y1Teo3LaAVwYX6AdB5f+fNSsaplFmr0\n" +
            "8iPJHJlKZwKBgQDYAEeLNJ8uRaZS9pQlOrSKZyMLUJ4G48yKsfcAMudL12dIDR3j\n" +
            "JkiCU27ppDxPI+SMT10xro3Z3iyd1g3KqGNuFD3SHX4sbWBHL0m/tq/XHTyEoJX8\n" +
            "hgAnxbrXWoqGKEfLTtDeQPVaQFq3r/DDyC7BhuMqz8IKPwJH521bMEQ6KQKBgHIL\n" +
            "pkR+N2608bTCjn0yPXAwFzSBNUsDzZsEmhOJEchQPJgID3vJkbPZYbhMOdZacOhy\n" +
            "u6BxTm/qCfgme0/xYl5t2n1N8zG3Dd31Q/K2YswzYe7+dHbQBAj4UgiKqRkeZkCv\n" +
            "TfFnNPedVBJWUIIJ1+qZoyez2vVh7MzSCno9c/hNAoGAWEon8f1BPnrRD6zfxK2U\n" +
            "jQvxRmiLDuCjGwLPOgPY9ENBFsFf+alRfoHWVL6DoPvEPU01Dq7WfhIcSIgmI/95\n" +
            "0rSoc+W2yTUrF0l3oT2GNnnMmpgYZuB4GKJDzXFt1hlIlm4AFiWrGdnN12738ekU\n" +
            "/PUUVpRdYXKAfAeE2SmLSZc=\n" +
            "-----END PRIVATE KEY-----";

    static String[] serverCerts = {targetCertStr_A,
                                targetCertStr_B, targetCertStr_C};
    static String[] serverKeys  = {targetPrivateKey_A,
                                targetPrivateKey_B, targetPrivateKey_C};
    static String[] clientCerts = {targetCertStr_D};
    static String[] clientKeys  = {targetPrivateKey_D};

    static char[] passphrase = "passphrase".toCharArray();

    /*
     * Is the server ready to serve?
     */
    volatile static boolean serverReady = false;

    /*
     * Turn on SSL debugging?
     */
    static boolean debug = Boolean.getBoolean("test.debug");

    /*
     * Define the server side of the test.
     *
     * If the server prematurely exits, serverReady will be set to true
     * to avoid infinite hangs.
     */
    void doServerSide() throws Exception {
        SSLContext context = generateSSLContext(false);
        SSLServerSocketFactory sslssf = context.getServerSocketFactory();
        SSLServerSocket sslServerSocket =
            (SSLServerSocket)sslssf.createServerSocket(serverPort);
        serverPort = sslServerSocket.getLocalPort();

        /*
         * Signal Client, we're ready for his connect.
         */
        serverReady = true;

        SSLSocket sslSocket = (SSLSocket)sslServerSocket.accept();
        try {
            sslSocket.setSoTimeout(5000);
            sslSocket.setSoLinger(true, 5);

            InputStream sslIS = sslSocket.getInputStream();
            OutputStream sslOS = sslSocket.getOutputStream();

            sslIS.read();
            sslOS.write('A');
            sslOS.flush();

            SSLSession session = sslSocket.getSession();
            checkCertificate(session.getLocalCertificates(),
                                                clientRequestedHostname);
        } finally {
            sslSocket.close();
            sslServerSocket.close();
        }
    }

    /*
     * Define the client side of the test.
     *
     * If the server prematurely exits, serverReady will be set to true
     * to avoid infinite hangs.
     */
    void doClientSide() throws Exception {

        /*
         * Wait for server to get started.
         */
        while (!serverReady) {
            Thread.sleep(50);
        }

        SSLContext context = generateSSLContext(true);
        SSLSocketFactory sslsf = context.getSocketFactory();

        SSLSocket sslSocket =
            (SSLSocket)sslsf.createSocket("localhost", serverPort);

        SNIHostName serverName = new SNIHostName(clientRequestedHostname);
        List<SNIServerName> serverNames = new ArrayList<>(1);
        serverNames.add(serverName);
        SSLParameters params = sslSocket.getSSLParameters();
        params.setServerNames(serverNames);
        sslSocket.setSSLParameters(params);

        try {
            sslSocket.setSoTimeout(5000);
            sslSocket.setSoLinger(true, 5);

            InputStream sslIS = sslSocket.getInputStream();
            OutputStream sslOS = sslSocket.getOutputStream();

            sslOS.write('B');
            sslOS.flush();
            sslIS.read();

            SSLSession session = sslSocket.getSession();
            checkCertificate(session.getPeerCertificates(),
                                                clientRequestedHostname);
        } finally {
            sslSocket.close();
        }
    }

    private static void checkCertificate(Certificate[] certs,
            String hostname) throws Exception {
        if (certs != null && certs.length != 0) {
            X509Certificate x509Cert = (X509Certificate)certs[0];

            String subject = x509Cert.getSubjectX500Principal().getName();

            if (!subject.contains(hostname)) {
                throw new Exception(
                        "Not the expected certificate: " + subject);
            }
        }
    }

    /*
     * =============================================================
     * The remainder is just support stuff
     */
    private static String tmAlgorithm;             // trust manager
    private static String clientRequestedHostname; // server name indication

    private static void parseArguments(String[] args) {
        tmAlgorithm = args[0];
        clientRequestedHostname = args[1];
    }

    private static SSLContext generateSSLContext(boolean isClient)
            throws Exception {

        final PEMDecoder pemDecoder = PEMDecoder.of();

        // create a key store
        KeyStore ks = KeyStore.getInstance("PKCS12");
        ks.load(null, null);

        // generate certificate from cert string
        Certificate trusedCert = pemDecoder.decode(trustedCertStr, X509Certificate.class);

        // import the trused cert
        ks.setCertificateEntry("RSA Export Signer", trusedCert);

        String[] certStrs = null;
        String[] keyStrs = null;
        if (isClient) {
            certStrs = clientCerts;
            keyStrs = clientKeys;
        } else {
            certStrs = serverCerts;
            keyStrs = serverKeys;
        }

        for (int i = 0; i < certStrs.length; i++) {
            // generate the private key.
            String keySpecStr = keyStrs[i];
            PKCS8EncodedKeySpec priKeySpec = pemDecoder.decode(keySpecStr, PKCS8EncodedKeySpec.class);
            KeyFactory kf = KeyFactory.getInstance("RSA");
            RSAPrivateKey priKey =
                    (RSAPrivateKey)kf.generatePrivate(priKeySpec);

            // generate certificate chain
            String keyCertStr = certStrs[i];
            Certificate keyCert = pemDecoder.decode(keyCertStr, X509Certificate.class);

            Certificate[] chain = new Certificate[2];
            chain[0] = keyCert;
            chain[1] = trusedCert;

            // import the key entry.
            ks.setKeyEntry("key-entry-" + i, priKey, passphrase, chain);
        }

        // create SSL context
        TrustManagerFactory tmf = TrustManagerFactory.getInstance(tmAlgorithm);
        tmf.init(ks);

        SSLContext ctx = SSLContext.getInstance("TLSv1.2");
        KeyManagerFactory kmf = KeyManagerFactory.getInstance("NewSunX509");
        kmf.init(ks, passphrase);

        ctx.init(kmf.getKeyManagers(), tmf.getTrustManagers(), null);
        ks = null;

        return ctx;
    }

    // use any free port by default
    volatile int serverPort = 0;

    volatile Exception serverException = null;
    volatile Exception clientException = null;

    public static void main(String[] args) throws Exception {
        Security.setProperty("jdk.certpath.disabledAlgorithms",
                "MD2, RSA keySize < 1024");
        Security.setProperty("jdk.tls.disabledAlgorithms",
                "SSLv3, RC4, DH keySize < 768");

        if (debug)
            System.setProperty("javax.net.debug", "all");

        /*
         * Get the customized arguments.
         */
        parseArguments(args);

        /*
         * Start the tests.
         */
        new SSLSocketSNISensitive();
    }

    Thread clientThread = null;
    Thread serverThread = null;

    /*
     * Primary constructor, used to drive remainder of the test.
     *
     * Fork off the other side, then do your work.
     */
    SSLSocketSNISensitive() throws Exception {
        try {
            if (separateServerThread) {
                startServer(true);
                startClient(false);
            } else {
                startClient(true);
                startServer(false);
            }
        } catch (Exception e) {
            // swallow for now.  Show later
        }

        /*
         * Wait for other side to close down.
         */
        if (separateServerThread) {
            serverThread.join();
        } else {
            clientThread.join();
        }

        /*
         * When we get here, the test is pretty much over.
         * Which side threw the error?
         */
        Exception local;
        Exception remote;
        String whichRemote;

        if (separateServerThread) {
            remote = serverException;
            local = clientException;
            whichRemote = "server";
        } else {
            remote = clientException;
            local = serverException;
            whichRemote = "client";
        }

        /*
         * If both failed, return the curthread's exception, but also
         * print the remote side Exception
         */
        if ((local != null) && (remote != null)) {
            System.out.println(whichRemote + " also threw:");
            remote.printStackTrace();
            System.out.println();
            throw local;
        }

        if (remote != null) {
            throw remote;
        }

        if (local != null) {
            throw local;
        }
    }

    void startServer(boolean newThread) throws Exception {
        if (newThread) {
            serverThread = new Thread(() -> {
                try {
                    doServerSide();
                } catch (Exception e) {
                    /*
                     * Our server thread just died.
                     *
                     * Release the client, if not active already...
                     */
                    System.err.println("Server died, because of " + e);
                    serverReady = true;
                    serverException = e;
                }
            });
            serverThread.start();
        } else {
            try {
                doServerSide();
            } catch (Exception e) {
                serverException = e;
            } finally {
                serverReady = true;
            }
        }
    }

    void startClient(boolean newThread) throws Exception {
        if (newThread) {
            clientThread = new Thread(() -> {
                try {
                    doClientSide();
                } catch (Exception e) {
                    /*
                     * Our client thread just died.
                     */
                    System.err.println("Client died, because of " + e);
                    clientException = e;
                }
            });
            clientThread.start();
        } else {
            try {
                doClientSide();
            } catch (Exception e) {
                clientException = e;
            }
        }
    }
}
