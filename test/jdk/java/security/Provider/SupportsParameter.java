/*
 * Copyright (c) 2003, 2024, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 4911081 8130181
 * @library /test/lib
 * @summary verify that Provider.Service.supportsParameter() works
 * @author Andreas Sterbenz
 */

import java.security.*;
import java.security.Provider.Service;

import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import jdk.test.lib.security.SecurityUtils;

public class SupportsParameter {

    public static void main(String[] args) throws Exception {
        String kpgAlgorithm = "EC";
        KeyPairGenerator kpg = KeyPairGenerator.getInstance(kpgAlgorithm);
        kpg.initialize(SecurityUtils.getTestKeySize(kpgAlgorithm));
        KeyPair kp = kpg.generateKeyPair();
        PublicKey ecPublicKey = kp.getPublic();
        PrivateKey ecPrivateKey = kp.getPrivate();

        PublicKey myPublicKey = new MyPublicKey();
        PrivateKey myPrivateKey = new MyPrivateKey();
        SecretKey mySecretKey = new MySecretKey();

        Provider p = new MyProvider();
        Service s;

        // none specified, always true
        s = p.getService("Signature", "ECDSA0");
        checkSupports(s, null, true);
        checkSupports(s, ecPublicKey, true);
        checkSupports(s, ecPrivateKey, true);
        checkSupports(s, myPublicKey, true);
        checkSupports(s, myPrivateKey, true);
        checkSupports(s, mySecretKey, true);

        // ECPublic/PrivateKey specified as classes
        s = p.getService("Signature", "ECDSA");
        checkSupports(s, ecPublicKey, true);
        checkSupports(s, ecPrivateKey, true);
        checkSupports(s, myPublicKey, false);
        checkSupports(s, myPrivateKey, false);
        checkSupports(s, mySecretKey, false);

        // X.509/PKCS#8 specified as formats
        s = p.getService("Signature", "ECDSA2");
        checkSupports(s, ecPublicKey, true);
        checkSupports(s, ecPrivateKey, true);
        checkSupports(s, myPublicKey, false);
        checkSupports(s, myPrivateKey, false);
        checkSupports(s, mySecretKey, false);

        // MyPublic/PrivateKey + ECPublicKey specified as classes
        s = p.getService("Signature", "ECDSA3");
        checkSupports(s, ecPublicKey, true);
        checkSupports(s, ecPrivateKey, false);
        checkSupports(s, myPublicKey, true);
        checkSupports(s, myPrivateKey, true);
        checkSupports(s, mySecretKey, false);

        // MyPublic/PrivateKey + ECPublicKey specified as classes
        s = p.getService("Cipher", "DES");
        checkSupports(s, ecPublicKey, false);
        checkSupports(s, ecPrivateKey, false);
        checkSupports(s, myPublicKey, false);
        checkSupports(s, myPrivateKey, false);
        checkSupports(s, mySecretKey, true);
        Key secretKeySpec = new SecretKeySpec(new byte[8], "DES");
        checkSupports(s, secretKeySpec, true);

    }

    private static void checkSupports(Service s, Key key, boolean r) throws Exception {
        if (s.supportsParameter(key) != r) {
            throw new Exception("Result mismatch");
        }
        System.out.println("Passed");
    }

    private static class MyProvider extends Provider {
        MyProvider() {
            super("MyProvider", "1.0", "MyProvider");

            put("Signature.ECDSA0", "foo.ECDSA0");

            put("Signature.ECDSA", "foo.ECDSA");
            put("Signature.ECDSA SupportedKeyClasses",
                "java.security.interfaces.ECPublicKey" +
                "|java.security.interfaces.ECPrivateKey");

            put("Signature.ECDSA2", "foo.ECDSA2");
            put("Signature.ECDSA2 SupportedKeyFormats", "X.509|PKCS#8");

            put("Signature.ECDSA3", "foo.ECDSA3");
            put("Signature.ECDSA3 SupportedKeyClasses",
                "SupportsParameter$MyPrivateKey" +
                "|SupportsParameter$MyPublicKey" +
                "|java.security.interfaces.ECPublicKey");

            put("Cipher.DES", "foo.DES");
            put("Cipher.DES SupportedKeyFormats", "RAW");
            put("Cipher.DES SupportedKeyClasses", "SupportsParameter$MySecretKey");
        }
    }

    private static class MyKey implements Key {
        public String getAlgorithm() { return "FOO"; }

        public String getFormat() { return null; }

        public byte[] getEncoded() { return null; }
    }

    private static class MyPrivateKey extends MyKey implements PrivateKey { }

    private static class MyPublicKey extends MyKey implements PublicKey {}

    private static class MySecretKey extends MyKey implements SecretKey {
        public String getAlgorithm() { return "DES"; }
    }

}
