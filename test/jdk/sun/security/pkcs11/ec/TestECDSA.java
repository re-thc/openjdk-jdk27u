/*
 * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 6405536 8042967
 * @summary basic test of SHA1withECDSA and NONEwithECDSA signing/verifying
 * @author Andreas Sterbenz
 * @library /test/lib ..
 * @key randomness
 * @modules jdk.crypto.cryptoki
 * @run main/othervm TestECDSA
 */

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.MessageDigest;
import java.security.PrivateKey;
import java.security.Provider;
import java.security.PublicKey;
import java.security.Signature;
import java.security.interfaces.ECPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Random;
import jdk.test.lib.security.Providers;

public class TestECDSA extends PKCS11Test {

    // values of the keys we use for the tests

    // keypair using NIST P-521
    private final static String pub521 =
"30:81:9b:30:10:06:07:2a:86:48:ce:3d:02:01:06:05:2b:81:04:00:23:03:81:86:00:04:01:6c:e1:03:96:a4:ad:1e:18:b0:c3:ab:63:e6:6a:f6:e5:33:e8:75:e5:7e:33:ce:fd:3a:48:03:08:5a:32:04:f2:f7:00:46:e5:7e:c3:92:bb:bc:5e:c7:d2:e6:01:f3:17:d9:31:2d:07:fc:a1:93:57:28:b8:3a:7f:46:00:f9:bc:b2:01:35:45:9f:3f:0c:bf:6f:3e:29:a7:92:be:c0:83:c0:90:1c:fe:3c:2f:fd:2e:d6:12:0d:45:d3:d3:19:c2:5a:5b:26:37:2d:8e:ba:1c:9e:fb:3a:b6:02:7a:1c:45:ec:72:c8:4b:7d:1f:65:11:78:43:8f:70:92:27:24:ba:c4:af:e5";
    private final static String priv521 =
"30:60:02:01:00:30:10:06:07:2a:86:48:ce:3d:02:01:06:05:2b:81:04:00:23:04:49:30:47:02:01:01:04:42:01:e7:a7:5d:13:f8:4d:5a:5d:64:10:e6:a1:e0:01:a3:b0:92:e0:72:55:f5:87:62:7e:30:f2:b1:f2:a0:1e:ef:30:65:9c:88:16:53:71:2d:05:a3:d8:4d:bc:c9:50:84:2c:d1:b5:9d:6e:84:57:60:ee:46:a1:26:f9:8b:2c:d5:86:4d";

    // data for test 1, original and SHA-1 hashed
    private final static byte[] data1Raw = b("0102030405060708090a0b0c0d0e0f10111213");
    private final static byte[] data1SHA = b("00:e2:5f:c9:1c:8f:d6:8c:6a:dc:c6:bd:f0:46:60:5e:a2:cd:8d:ad");

    // valid signatures of data1.
    private final static byte[] sig521 = b("30:81:87:02:42:01:32:a5:be:dd:fb:c3:07:66:01:48:0a:12:dd:ae:e7:4d:cf:c2:69:ba:37:bc:fb:47:f3:5b:0f:9e:80:2c:c4:c4:40:6f:82:a1:25:39:65:4f:37:9c:b2:59:e0:4c:d6:a2:63:27:b4:fd:fd:ca:72:c8:de:c9:38:8b:02:87:bf:13:d8:02:41:0b:03:0f:3f:f9:cc:93:cb:f5:30:4d:d2:23:f3:cb:3d:b8:ee:8b:76:96:b9:4b:91:2e:b3:8e:26:47:a9:56:89:01:3a:5e:92:79:8f:00:f0:1c:a9:32:f7:70:e2:18:71:35:2c:4d:b7:68:84:2f:56:49:86:eb:96:5d:82:31:a2:de");

    // data for test 2 (invalid signatures)
    private final static byte[] data2Raw = {};
    private final static byte[] data2SHA = b("da:39:a3:ee:5e:6b:4b:0d:32:55:bf:ef:95:60:18:90:af:d8:07:09");

    private static void verify(Provider provider, String alg, PublicKey key,
            byte[] data, byte[] sig, boolean result) throws Exception {
        Signature s = Signature.getInstance(alg, provider);
        s.initVerify(key);
        boolean r;
        s.update(data);
        r = s.verify(sig);
        if (r != result) {
            throw new Exception("Result mismatch, actual: " + r);
        }
        s.update(data);
        r = s.verify(sig);
        if (r != result) {
            throw new Exception("Result mismatch, actual: " + r);
        }
        System.out.println("Passed");
    }

    private static void sign(Provider provider, String alg, PrivateKey key, byte[] data) throws Exception {
        Signature s = Signature.getInstance(alg, provider);
        s.initSign(key);
        s.update(data);
        byte[] sig = s.sign();
        System.out.println(toString(sig));
    }

    public static void main(String[] args) throws Exception {
        main(new TestECDSA(), args);
    }

    @Override
    protected boolean skipTest(Provider provider) {
        if (provider.getService("Signature", "SHA1withECDSA") == null) {
            System.out.println("ECDSA not supported, skipping");
            return true;
        }

        if (isBadNSSVersion(provider)) {
            return true;
        }

        return false;
    }

    @Override
    public void main(Provider provider) throws Exception {
        long start = System.currentTimeMillis();

        /*
         * PKCS11Test.main will remove this provider if needed
         */
        Providers.setAt(provider, 1);

        if (false) {
            KeyPairGenerator kpg = KeyPairGenerator.getInstance("EC", provider);
            kpg.initialize(521);
            KeyPair kp = kpg.generateKeyPair();
            PrivateKey priv = kp.getPrivate();
            ECPublicKey pub = (ECPublicKey)kp.getPublic();
            System.out.println("Keys for " + pub.getParams());
            System.out.println("public key:");
            System.out.println(toString(pub.getEncoded()));
            System.out.println("private key:");
            System.out.println(toString(priv.getEncoded()));
            return;
        }

        test(provider, pub521, priv521, sig521);

        long stop = System.currentTimeMillis();
        System.out.println("All tests passed (" + (stop - start) + " ms).");
    }

    private void test(Provider provider, String pub, String priv, byte[] sig) throws Exception {

        KeyFactory kf = KeyFactory.getInstance("EC", provider);
        X509EncodedKeySpec pubSpec = new X509EncodedKeySpec(parse(pub));
        PKCS8EncodedKeySpec privSpec = new PKCS8EncodedKeySpec(parse(priv));

        PrivateKey privateKey = kf.generatePrivate(privSpec);
        PublicKey publicKey = kf.generatePublic(pubSpec);

        if (false) {
            sign(provider, "SHA1withECDSA", privateKey, data1Raw);
//          sign(provider, "NONEwithECDSA", privateKey, data1SHA);
            return;
        }

        // verify known-good and known-bad signatures using SHA1withECDSA and NONEwithECDSA
        verify(provider, "SHA1withECDSA", publicKey, data1Raw, sig, true);
        verify(provider, "SHA1withECDSA", publicKey, data2Raw, sig, false);

        verify(provider, "NONEwithECDSA", publicKey, data1SHA, sig, true);
        verify(provider, "NONEwithECDSA", publicKey, data2SHA, sig, false);

        System.out.println("Testing with default signature format: ASN.1");
        testSigning(provider, privateKey, publicKey, false);

        System.out.println("Testing with IEEE P1363 signature format");
        testSigning(provider, privateKey, publicKey, true);
    }

    private void testSigning(Provider provider,
                             PrivateKey privateKey,
                             PublicKey publicKey,
                             boolean p1363Format) throws Exception {
        byte[] data = new byte[2048];
        new Random().nextBytes(data);

        // sign random data using SHA1withECDSA and verify using
        // SHA1withECDSA and NONEwithECDSA
        Signature s;
        if (p1363Format) {
            s = Signature.getInstance("SHA1withECDSAinP1363Format", provider);
        } else {
            s = Signature.getInstance("SHA1withECDSA", provider);
        }
        s.initSign(privateKey);
        s.update(data);
        byte[] s1 = s.sign();

        s.initVerify(publicKey);
        s.update(data);
        if (!s.verify(s1)) {
            throw new Exception("Sign/verify 1 failed");
        }

        if (p1363Format) {
            s = Signature.getInstance("NONEwithECDSAinP1363Format", provider);
        } else {
            s = Signature.getInstance("NONEwithECDSA", provider);
        }
        MessageDigest md = MessageDigest.getInstance("SHA-1");
        byte[] digest = md.digest(data);
        s.initVerify(publicKey);
        s.update(digest);
        if (!s.verify(s1)) {
            throw new Exception("Sign/verify 2 failed");
        }

        // sign random data using NONEwithECDSA and verify using
        // SHA1withECDSA and NONEwithECDSA
        s.initSign(privateKey);
        s.update(digest);
        byte[] s2 = s.sign();

        s.initVerify(publicKey);
        s.update(digest);
        if (!s.verify(s2)) {
            throw new Exception("Sign/verify 3 failed");
        }

        if (p1363Format) {
            s = Signature.getInstance("SHA1withECDSAinP1363Format", provider);
        } else {
            s = Signature.getInstance("SHA1withECDSA", provider);
        }
        s.initVerify(publicKey);
        s.update(data);
        if (!s.verify(s2)) {
            throw new Exception("Sign/verify 4 failed");
        }

/*
        // XXX session release bug in P11Signature
        // test behavior if data of incorrect length is passed
        s = Signature.getInstance("NONEwithECDSA", provider);
        s.initSign(privateKey);
        s.update(new byte[8]);
        s.update(new byte[640]);
        try {
            s.sign();
            throw new Exception("No error NONEwithECDSA signing long data");
        } catch (SignatureException e) {
            System.out.println("OK: " + e);
        }
        System.out.println("sign/verify test ok");
/**/
    }

    private static byte[] b(String s) {
        return parse(s);
    }

}
