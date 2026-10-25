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
 * @summary SunJCE keeps the Blowfish AlgorithmParameters and PKCS12 keeps
 *          Blowfish secret keys for SunPKCS11, without a Blowfish cipher
 * @run main BlowfishSecretKey
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.security.AlgorithmParameters;
import java.security.KeyStore;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class BlowfishSecretKey {

    private static final char[] PASSWORD = "changeit".toCharArray();

    public static void main(String[] args) throws Exception {
        // The parameters that SunPKCS11 asks SunJCE for
        byte[] iv = {1, 2, 3, 4, 5, 6, 7, 8};
        AlgorithmParameters params =
                AlgorithmParameters.getInstance("Blowfish", "SunJCE");
        params.init(new IvParameterSpec(iv));
        AlgorithmParameters decoded =
                AlgorithmParameters.getInstance("Blowfish", "SunJCE");
        decoded.init(params.getEncoded());
        check(Arrays.equals(decoded.getParameterSpec(IvParameterSpec.class)
                .getIV(), iv), "decoded IV");

        // A Blowfish key, as an extractable SunPKCS11 key is stored
        SecretKey key = new SecretKeySpec(new byte[16], "Blowfish");
        KeyStore ks = KeyStore.getInstance("PKCS12");
        ks.load(null, null);
        ks.setEntry("bf", new KeyStore.SecretKeyEntry(key),
                new KeyStore.PasswordProtection(PASSWORD));
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        ks.store(out, PASSWORD);
        ks = KeyStore.getInstance("PKCS12");
        ks.load(new ByteArrayInputStream(out.toByteArray()), PASSWORD);
        SecretKey stored = (SecretKey) ks.getKey("bf", PASSWORD);
        check(stored.getAlgorithm().equals("Blowfish"),
                "stored algorithm " + stored.getAlgorithm());
        check(Arrays.equals(stored.getEncoded(), key.getEncoded()),
                "stored key");

        // SunJCE has no Blowfish cipher or key generator
        try {
            Cipher.getInstance("Blowfish", "SunJCE");
            throw new RuntimeException("Blowfish cipher in SunJCE");
        } catch (NoSuchAlgorithmException expected) {
        }
        try {
            KeyGenerator.getInstance("Blowfish", "SunJCE");
            throw new RuntimeException("Blowfish key generator in SunJCE");
        } catch (NoSuchAlgorithmException expected) {
        }
    }

    private static void check(boolean ok, String what) {
        if (!ok) {
            throw new RuntimeException("Wrong " + what);
        }
    }
}
