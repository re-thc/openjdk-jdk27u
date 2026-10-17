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
 * @summary The SunPKCS11 Blowfish ciphers get their CBC parameters from
 *          SunJCE, and extractable token keys can be kept in PKCS12 key
 *          stores, although SunJCE no longer implements Blowfish itself
 * @library /test/lib ..
 * @modules jdk.crypto.cryptoki
 * @run main/othervm TestBlowfishRetained
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.security.AlgorithmParameters;
import java.security.KeyStore;
import java.security.NoSuchAlgorithmException;
import java.security.Provider;
import java.security.SecureRandom;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;

import jtreg.SkippedException;

public class TestBlowfishRetained extends PKCS11Test {

    private static final char[] PASSWORD = "changeit".toCharArray();

    public static void main(String[] args) throws Exception {
        main(new TestBlowfishRetained(), args);
    }

    @Override
    public void main(Provider p) throws Exception {
        Cipher enc;
        KeyGenerator kg;
        try {
            enc = Cipher.getInstance("Blowfish/CBC/PKCS5Padding", p);
            kg = KeyGenerator.getInstance("Blowfish", p);
        } catch (NoSuchAlgorithmException e) {
            throw new SkippedException("No Blowfish in " + p.getName());
        }
        kg.init(128);
        SecretKey key = kg.generateKey();
        byte[] data = new byte[100];
        new SecureRandom().nextBytes(data);

        // CBC parameters: P11Cipher makes them with the SunJCE Blowfish
        // AlgorithmParameters, and they decode into an equal IV
        enc.init(Cipher.ENCRYPT_MODE, key);
        byte[] ct = enc.doFinal(data);
        AlgorithmParameters params = enc.getParameters();
        check(params.getAlgorithm().equals("Blowfish"),
                "algorithm " + params.getAlgorithm());
        byte[] iv = params.getParameterSpec(IvParameterSpec.class).getIV();
        check(Arrays.equals(iv, enc.getIV()), "IV of the parameters");
        AlgorithmParameters decoded = AlgorithmParameters.getInstance(
                "Blowfish", params.getProvider());
        decoded.init(params.getEncoded());
        Cipher dec = Cipher.getInstance("Blowfish/CBC/PKCS5Padding", p);
        dec.init(Cipher.DECRYPT_MODE, key, decoded);
        check(Arrays.equals(dec.doFinal(ct), data), "decryption");

        // An extractable token key in a PKCS12 key store
        byte[] encoded = key.getEncoded();
        if (encoded == null) {
            throw new SkippedException("Blowfish keys of " + p.getName() +
                    " are not extractable");
        }
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
        check(Arrays.equals(stored.getEncoded(), encoded), "stored key");
        dec.init(Cipher.DECRYPT_MODE, stored, new IvParameterSpec(iv));
        check(Arrays.equals(dec.doFinal(ct), data), "decryption with the "
                + "stored key");
        System.out.println("Passed with " + p.getName());
    }

    private static void check(boolean ok, String what) {
        if (!ok) {
            throw new RuntimeException("Wrong " + what);
        }
    }
}
