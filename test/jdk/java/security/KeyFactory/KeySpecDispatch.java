/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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
 * @summary The RSA and EC key factories accept the supported key specs
 *          and reject the other ones with the documented messages
 */

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.interfaces.ECPrivateKey;
import java.security.interfaces.ECPublicKey;
import java.security.interfaces.RSAPrivateCrtKey;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.ECPrivateKeySpec;
import java.security.spec.ECPublicKeySpec;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.RSAPrivateCrtKeySpec;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.RSAPublicKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Objects;

public class KeySpecDispatch {

    public static void main(String[] args) throws Exception {
        for (String alg : new String[] {"RSA", "RSASSA-PSS"}) {
            testRSA(alg);
        }
        testEC();
    }

    static void testRSA(String alg) throws Exception {
        KeyPairGenerator kpg = KeyPairGenerator.getInstance(alg);
        kpg.initialize(2048);
        KeyPair kp = kpg.generateKeyPair();
        KeyFactory kf = KeyFactory.getInstance(alg);
        RSAPublicKey pub = (RSAPublicKey) kp.getPublic();
        RSAPrivateCrtKey priv = (RSAPrivateCrtKey) kp.getPrivate();

        // public key
        checkEquals(pub, kf.generatePublic(
                new X509EncodedKeySpec(pub.getEncoded())));
        checkEquals(pub, kf.generatePublic(new RSAPublicKeySpec(
                pub.getModulus(), pub.getPublicExponent(), pub.getParams())));
        checkPublicFromPKCS8(kf, pub, priv);
        checkRejected(alg + " public", () -> kf.generatePublic(null),
                "keySpec must not be null");
        checkRejected(alg + " public", () -> kf.generatePublic(
                new RSAPrivateKeySpec(priv.getModulus(),
                        priv.getPrivateExponent())),
                "java.security.spec.RSAPrivateKeySpec not supported.");

        // private key
        checkEquals(priv, kf.generatePrivate(
                new PKCS8EncodedKeySpec(priv.getEncoded())));
        PrivateKey crt = kf.generatePrivate(new RSAPrivateCrtKeySpec(
                priv.getModulus(), priv.getPublicExponent(),
                priv.getPrivateExponent(), priv.getPrimeP(), priv.getPrimeQ(),
                priv.getPrimeExponentP(), priv.getPrimeExponentQ(),
                priv.getCrtCoefficient(), priv.getParams()));
        if (!(crt instanceof RSAPrivateCrtKey)) {
            throw new RuntimeException("Not a CRT key: " + crt);
        }
        checkEquals(priv, crt);
        PrivateKey plain = kf.generatePrivate(new RSAPrivateKeySpec(
                priv.getModulus(), priv.getPrivateExponent(),
                priv.getParams()));
        if (plain instanceof RSAPrivateCrtKey
                || !(plain instanceof RSAPrivateKey rsa)
                || !rsa.getPrivateExponent().equals(priv.getPrivateExponent())
                || !rsa.getModulus().equals(priv.getModulus())) {
            throw new RuntimeException("Wrong private key: " + plain);
        }
        checkRejected(alg + " private", () -> kf.generatePrivate(null),
                "keySpec must not be null");
        checkRejected(alg + " private", () -> kf.generatePrivate(
                new RSAPublicKeySpec(pub.getModulus(),
                        pub.getPublicExponent())),
                "java.security.spec.RSAPublicKeySpec not supported.");
    }

    static void testEC() throws Exception {
        KeyPairGenerator kpg = KeyPairGenerator.getInstance("EC");
        kpg.initialize(256);
        KeyPair kp = kpg.generateKeyPair();
        KeyFactory kf = KeyFactory.getInstance("EC");
        ECPublicKey pub = (ECPublicKey) kp.getPublic();
        ECPrivateKey priv = (ECPrivateKey) kp.getPrivate();

        // public key
        checkEquals(pub, kf.generatePublic(
                new X509EncodedKeySpec(pub.getEncoded())));
        checkEquals(pub, kf.generatePublic(
                new ECPublicKeySpec(pub.getW(), pub.getParams())));
        checkRejected("EC public", () -> kf.generatePublic(null),
                "keySpec must not be null");
        checkRejected("EC public", () -> kf.generatePublic(
                new ECPrivateKeySpec(priv.getS(), priv.getParams())),
                "java.security.spec.ECPrivateKeySpec not supported.");
        checkPublicFromPKCS8(kf, pub, priv);

        // private key
        checkEquals(priv, kf.generatePrivate(
                new PKCS8EncodedKeySpec(priv.getEncoded())));
        checkEquals(priv, kf.generatePrivate(
                new ECPrivateKeySpec(priv.getS(), priv.getParams())));
        checkRejected("EC private", () -> kf.generatePrivate(null),
                "keySpec must not be null");
        checkRejected("EC private", () -> kf.generatePrivate(
                new ECPublicKeySpec(pub.getW(), pub.getParams())),
                "java.security.spec.ECPublicKeySpec not supported.");
    }

    // The public key is only found if the encoding of the private key has it
    static void checkPublicFromPKCS8(KeyFactory kf, PublicKey pub,
            PrivateKey priv) throws Exception {
        try {
            checkEquals(pub, kf.generatePublic(
                    new PKCS8EncodedKeySpec(priv.getEncoded())));
        } catch (InvalidKeySpecException e) {
            if (!"No public key found.".equals(e.getMessage())) {
                throw e;
            }
        }
    }

    interface Action {
        void run() throws Exception;
    }

    static void checkEquals(PublicKey expected, PublicKey actual) {
        if (!expected.equals(actual)) {
            throw new RuntimeException("Wrong public key: " + actual);
        }
    }

    static void checkEquals(PrivateKey expected, PrivateKey actual) {
        if (!expected.equals(actual)) {
            throw new RuntimeException("Wrong private key: " + actual);
        }
    }

    static void checkRejected(String what, Action action, String message)
            throws Exception {
        try {
            action.run();
        } catch (InvalidKeySpecException e) {
            if (!Objects.equals(message, e.getMessage())) {
                throw new RuntimeException(what + ": wrong message: "
                        + e.getMessage(), e);
            }
            return;
        }
        throw new RuntimeException(what + ": no exception");
    }
}
