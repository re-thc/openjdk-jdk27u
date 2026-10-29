/*
 * Copyright (c) 1997, 2025, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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

package com.sun.crypto.provider;

import java.security.Provider;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;
import static sun.security.util.SecurityConstants.PROVIDER_VER;
import static sun.security.util.SecurityProviderConstants.*;

/*
 * The "SunJCE" Cryptographic Service Provider.
 *
 * @author Jan Luehe
 * @author Sharon Liu
 */

/**
 * Defines the "SunJCE" provider.
 *
 * Supported algorithms and their names:
 *
 * - RSA encryption (PKCS#1 v1.5 and raw)
 *
 * - DES
 *
 * - DES-EDE
 *
 * - AES
 *
 * - ARCFOUR (RC4 compatible)
 *
 * - ChaCha20 (Stream cipher only and in AEAD mode with Poly1305)
 *
 * - Cipher modes ECB, CBC, CFB, OFB, CTR, and CTS for all block ciphers
 *   and mode GCM for AES cipher
 *
 * - Cipher padding ISO10126Padding for non-PKCS#5 block ciphers and
 *   NoPadding and PKCS5Padding for all block ciphers
 *
 * - Password-based Encryption (PBE)
 *
 * - Diffie-Hellman Key Agreement
 *
 * - HMAC-MD5, HMAC-SHA1, HMAC with SHA2 family and SHA3 family of digests
 *
 * - DHKEM
 *
 * - ML-KEM
 *
 * - HKDF-SHA256, HKDF-SHA384, and HKDF-SHA512
 */

@SuppressWarnings("serial") // Serial version compatibility is not maintained.
public final class SunJCE extends Provider {

    private static final String info = "SunJCE Provider " +
    "(implements RSA, DES, Triple DES, AES, ARCFOUR, PBE, "
    + "Diffie-Hellman, HMAC, ChaCha20, DHKEM, ML-KEM, and HKDF)";

    /* Are we debugging? -- for developers */
    static final boolean debug = false;

    // Instance of this provider, so we don't have to call the provider list
    // to find ourselves or run the risk of not being in the list.
    private static volatile SunJCE instance;

    // lazy initialize SecureRandom to avoid potential recursion if Sun
    // provider has not been installed yet
    private static class SecureRandomHolder {
        static final SecureRandom RANDOM = new SecureRandom();
    }
    static SecureRandom getRandom() { return SecureRandomHolder.RANDOM; }

    // ps: putService
    private void ps(String type, String algo, String cn) {
        putService(new Provider.Service(this, type, algo, cn, null, null));
    }

    private void ps(String type, String algo, String cn, List<String> als,
            HashMap<String, String> attrs) {
        putService(new Provider.Service(this, type, algo, cn, als,
                   attrs));
    }

    // psA: putService with default aliases
    private void psA(String type, String algo, String cn,
            HashMap<String, String> attrs) {
        putService(new Provider.Service(this, type, algo, cn, getAliases(algo),
                   attrs));
    }

    public SunJCE() {
        /* We are the "SunJCE" provider */
        super("SunJCE", PROVIDER_VER, info);

        putEntries();

        if (instance == null) {
            instance = this;
        }
    }

    void putEntries() {
        // reuse attribute map and reset before each reuse
        HashMap<String, String> attrs = new HashMap<>(3);
        attrs.put("SupportedKeyClasses",
                "java.security.interfaces.RSAPublicKey" +
                "|java.security.interfaces.RSAPrivateKey");
        ps("Signature", "NONEwithRSA",
                "com.sun.crypto.provider.RSACipherAdaptor", null, attrs);
        // continue adding cipher specific attributes
        attrs.put("SupportedModes", "ECB");
        attrs.put("SupportedPaddings", "NOPADDING|PKCS1PADDING|OAEPPADDING"
                + "|OAEPWITHMD5ANDMGF1PADDING"
                + "|OAEPWITHSHA1ANDMGF1PADDING"
                + "|OAEPWITHSHA-1ANDMGF1PADDING"
                + "|OAEPWITHSHA-224ANDMGF1PADDING"
                + "|OAEPWITHSHA-256ANDMGF1PADDING"
                + "|OAEPWITHSHA-384ANDMGF1PADDING"
                + "|OAEPWITHSHA-512ANDMGF1PADDING"
                + "|OAEPWITHSHA-512/224ANDMGF1PADDING"
                + "|OAEPWITHSHA-512/256ANDMGF1PADDING");
        ps("Cipher", "RSA",
                "com.sun.crypto.provider.RSACipher", null, attrs);

        // common block cipher modes, pads
        final String BLOCK_MODES = "ECB|CBC|CTR|CTS|CFB|OFB" +
            "|CFB8|CFB16|CFB24|CFB32|CFB40|CFB48|CFB56|CFB64" +
            "|OFB8|OFB16|OFB24|OFB32|OFB40|OFB48|OFB56|OFB64";
        final String BLOCK_MODES128 = BLOCK_MODES +
            "|CFB72|CFB80|CFB88|CFB96|CFB104|CFB112|CFB120|CFB128" +
            "|OFB72|OFB80|OFB88|OFB96|OFB104|OFB112|OFB120|OFB128";
        final String BLOCK_PADS = "NOPADDING|PKCS5PADDING|ISO10126PADDING";

        attrs.clear();
        attrs.put("SupportedModes", BLOCK_MODES);
        attrs.put("SupportedPaddings", BLOCK_PADS);
        attrs.put("SupportedKeyFormats", "RAW");
        ps("Cipher", "DES",
                "com.sun.crypto.provider.DESCipher", null, attrs);
        psA("Cipher", "DESede", "com.sun.crypto.provider.DESedeCipher",
                attrs);

        attrs.clear();
        attrs.put("SupportedModes", BLOCK_MODES128);
        attrs.put("SupportedPaddings", BLOCK_PADS);
        attrs.put("SupportedKeyFormats", "RAW");
        psA("Cipher", "AES",
                "com.sun.crypto.provider.AESCipher$General", attrs);

        attrs.clear();
        attrs.put("SupportedKeyFormats", "RAW");
        psA("Cipher", "AES/KW/NoPadding",
                "com.sun.crypto.provider.KeyWrapCipher$AES_KW_NoPadding",
                attrs);
        ps("Cipher", "AES/KW/PKCS5Padding",
                "com.sun.crypto.provider.KeyWrapCipher$AES_KW_PKCS5Padding",
                null, attrs);
        psA("Cipher", "AES/KWP/NoPadding",
                "com.sun.crypto.provider.KeyWrapCipher$AES_KWP_NoPadding",
                attrs);

        psA("Cipher", "AES_128/ECB/NoPadding",
                "com.sun.crypto.provider.AESCipher$AES128_ECB_NoPadding",
                attrs);
        psA("Cipher", "AES_128/CBC/NoPadding",
                "com.sun.crypto.provider.AESCipher$AES128_CBC_NoPadding",
                attrs);
        psA("Cipher", "AES_128/OFB/NoPadding",
                "com.sun.crypto.provider.AESCipher$AES128_OFB_NoPadding",
                attrs);
        psA("Cipher", "AES_128/CFB/NoPadding",
                "com.sun.crypto.provider.AESCipher$AES128_CFB_NoPadding",
                attrs);
        psA("Cipher", "AES_128/KW/NoPadding",
                "com.sun.crypto.provider.KeyWrapCipher$AES128_KW_NoPadding",
                attrs);
        ps("Cipher", "AES_128/KW/PKCS5Padding",
                "com.sun.crypto.provider.KeyWrapCipher$AES128_KW_PKCS5Padding",
                null, attrs);
        psA("Cipher", "AES_128/KWP/NoPadding",
                "com.sun.crypto.provider.KeyWrapCipher$AES128_KWP_NoPadding",
                attrs);

        psA("Cipher", "AES_192/ECB/NoPadding",
                "com.sun.crypto.provider.AESCipher$AES192_ECB_NoPadding",
                attrs);
        psA("Cipher", "AES_192/CBC/NoPadding",
                "com.sun.crypto.provider.AESCipher$AES192_CBC_NoPadding",
                attrs);
        psA("Cipher", "AES_192/OFB/NoPadding",
                "com.sun.crypto.provider.AESCipher$AES192_OFB_NoPadding",
                attrs);
        psA("Cipher", "AES_192/CFB/NoPadding",
                "com.sun.crypto.provider.AESCipher$AES192_CFB_NoPadding",
                attrs);
        psA("Cipher", "AES_192/KW/NoPadding",
                "com.sun.crypto.provider.KeyWrapCipher$AES192_KW_NoPadding",
                attrs);
        ps("Cipher", "AES_192/KW/PKCS5Padding",
                "com.sun.crypto.provider.KeyWrapCipher$AES192_KW_PKCS5Padding",
                null, attrs);
        psA("Cipher", "AES_192/KWP/NoPadding",
                "com.sun.crypto.provider.KeyWrapCipher$AES192_KWP_NoPadding",
                attrs);

        psA("Cipher", "AES_256/ECB/NoPadding",
                "com.sun.crypto.provider.AESCipher$AES256_ECB_NoPadding",
                attrs);
        psA("Cipher", "AES_256/CBC/NoPadding",
                "com.sun.crypto.provider.AESCipher$AES256_CBC_NoPadding",
                attrs);
        psA("Cipher", "AES_256/OFB/NoPadding",
                "com.sun.crypto.provider.AESCipher$AES256_OFB_NoPadding",
                attrs);
        psA("Cipher", "AES_256/CFB/NoPadding",
                "com.sun.crypto.provider.AESCipher$AES256_CFB_NoPadding",
                attrs);
        psA("Cipher", "AES_256/KW/NoPadding",
                "com.sun.crypto.provider.KeyWrapCipher$AES256_KW_NoPadding",
                attrs);
        ps("Cipher", "AES_256/KW/PKCS5Padding",
                "com.sun.crypto.provider.KeyWrapCipher$AES256_KW_PKCS5Padding",
                null, attrs);
        psA("Cipher", "AES_256/KWP/NoPadding",
                "com.sun.crypto.provider.KeyWrapCipher$AES256_KWP_NoPadding",
                attrs);

        attrs.clear();
        attrs.put("SupportedModes", "GCM");
        attrs.put("SupportedKeyFormats", "RAW");

        ps("Cipher", "AES/GCM/NoPadding",
                "com.sun.crypto.provider.GaloisCounterMode$AESGCM", null,
                attrs);
        psA("Cipher", "AES_128/GCM/NoPadding",
                "com.sun.crypto.provider.GaloisCounterMode$AES128",
                attrs);
        psA("Cipher", "AES_192/GCM/NoPadding",
                "com.sun.crypto.provider.GaloisCounterMode$AES192",
                attrs);
        psA("Cipher", "AES_256/GCM/NoPadding",
                "com.sun.crypto.provider.GaloisCounterMode$AES256",
                attrs);

        // used by SASL DIGEST-MD5
        attrs.clear();
        attrs.put("SupportedModes", "ECB");
        attrs.put("SupportedPaddings", "NOPADDING");
        attrs.put("SupportedKeyFormats", "RAW");
        psA("Cipher", "ARCFOUR",
                "com.sun.crypto.provider.ARCFOURCipher", attrs);

        attrs.clear();
        attrs.put("SupportedKeyFormats", "RAW");
        ps("Cipher",  "ChaCha20",
                "com.sun.crypto.provider.ChaCha20Cipher$ChaCha20Only",
                null, attrs);
        psA("Cipher",  "ChaCha20-Poly1305",
                "com.sun.crypto.provider.ChaCha20Cipher$ChaCha20Poly1305",
                attrs);

        // PBES1
        psA("Cipher", "PBEWithSHA1AndDESede",
                "com.sun.crypto.provider.PKCS12PBECipherCore$PBEWithSHA1AndDESede",
                null);

        // PBES2
        ps("Cipher", "PBEWithHmacSHA1AndAES_128",
                "com.sun.crypto.provider.PBES2Core$HmacSHA1AndAES_128");

        ps("Cipher", "PBEWithHmacSHA224AndAES_128",
                "com.sun.crypto.provider.PBES2Core$HmacSHA224AndAES_128");

        ps("Cipher", "PBEWithHmacSHA256AndAES_128",
                "com.sun.crypto.provider.PBES2Core$HmacSHA256AndAES_128");

        ps("Cipher", "PBEWithHmacSHA384AndAES_128",
                "com.sun.crypto.provider.PBES2Core$HmacSHA384AndAES_128");

        ps("Cipher", "PBEWithHmacSHA512AndAES_128",
                "com.sun.crypto.provider.PBES2Core$HmacSHA512AndAES_128");

        ps("Cipher", "PBEWithHmacSHA512/224AndAES_128",
                "com.sun.crypto.provider.PBES2Core$HmacSHA512_224AndAES_128");

        ps("Cipher", "PBEWithHmacSHA512/256AndAES_128",
                "com.sun.crypto.provider.PBES2Core$HmacSHA512_256AndAES_128");


        ps("Cipher", "PBEWithHmacSHA1AndAES_256",
                "com.sun.crypto.provider.PBES2Core$HmacSHA1AndAES_256");

        ps("Cipher", "PBEWithHmacSHA224AndAES_256",
                "com.sun.crypto.provider.PBES2Core$HmacSHA224AndAES_256");

        ps("Cipher", "PBEWithHmacSHA256AndAES_256",
                "com.sun.crypto.provider.PBES2Core$HmacSHA256AndAES_256");

        ps("Cipher", "PBEWithHmacSHA384AndAES_256",
                "com.sun.crypto.provider.PBES2Core$HmacSHA384AndAES_256");

        ps("Cipher", "PBEWithHmacSHA512AndAES_256",
                "com.sun.crypto.provider.PBES2Core$HmacSHA512AndAES_256");

        ps("Cipher", "PBEWithHmacSHA512/224AndAES_256",
                "com.sun.crypto.provider.PBES2Core$HmacSHA512_224AndAES_256");

        ps("Cipher", "PBEWithHmacSHA512/256AndAES_256",
                "com.sun.crypto.provider.PBES2Core$HmacSHA512_256AndAES_256");

        ps("Cipher", "HPKE", "com.sun.crypto.provider.HPKE");

        /*
         * Key(pair) Generator engines
         */
        ps("KeyGenerator", "DES",
                "com.sun.crypto.provider.DESKeyGenerator");
        psA("KeyGenerator", "DESede",
                "com.sun.crypto.provider.DESedeKeyGenerator",
                null);
        psA("KeyGenerator", "AES",
                "com.sun.crypto.provider.AESKeyGenerator",
                null);
        psA("KeyGenerator", "ARCFOUR",
                "com.sun.crypto.provider.KeyGeneratorCore$ARCFOURKeyGenerator",
                null);
        ps("KeyGenerator", "ChaCha20",
                "com.sun.crypto.provider.KeyGeneratorCore$ChaCha20KeyGenerator");
        ps("KeyGenerator", "HmacMD5",
                "com.sun.crypto.provider.HmacMD5KeyGenerator");

        psA("KeyGenerator", "HmacSHA1",
                "com.sun.crypto.provider.HmacSHA1KeyGenerator", null);
        psA("KeyGenerator", "HmacSHA224",
                "com.sun.crypto.provider.KeyGeneratorCore$HmacKG$SHA224",
                null);
        psA("KeyGenerator", "HmacSHA256",
                "com.sun.crypto.provider.KeyGeneratorCore$HmacKG$SHA256",
                null);
        psA("KeyGenerator", "HmacSHA384",
                "com.sun.crypto.provider.KeyGeneratorCore$HmacKG$SHA384",
                null);
        psA("KeyGenerator", "HmacSHA512",
                "com.sun.crypto.provider.KeyGeneratorCore$HmacKG$SHA512",
                null);
        psA("KeyGenerator", "HmacSHA512/224",
                "com.sun.crypto.provider.KeyGeneratorCore$HmacKG$SHA512_224",
                null);
        psA("KeyGenerator", "HmacSHA512/256",
                "com.sun.crypto.provider.KeyGeneratorCore$HmacKG$SHA512_256",
                null);

        psA("KeyGenerator", "HmacSHA3-224",
                "com.sun.crypto.provider.KeyGeneratorCore$HmacKG$SHA3_224",
                null);
        psA("KeyGenerator", "HmacSHA3-256",
                "com.sun.crypto.provider.KeyGeneratorCore$HmacKG$SHA3_256",
                null);
        psA("KeyGenerator", "HmacSHA3-384",
                "com.sun.crypto.provider.KeyGeneratorCore$HmacKG$SHA3_384",
                null);
        psA("KeyGenerator", "HmacSHA3-512",
                "com.sun.crypto.provider.KeyGeneratorCore$HmacKG$SHA3_512",
                null);

        psA("KeyPairGenerator", "DiffieHellman",
                "com.sun.crypto.provider.DHKeyPairGenerator",
                null);

        /*
         * Algorithm parameter generation engines
         */
        psA("AlgorithmParameterGenerator",
                "DiffieHellman", "com.sun.crypto.provider.DHParameterGenerator",
                null);

        /*
         * Key Agreement engines
         */
        attrs.clear();
        attrs.put("SupportedKeyClasses", "javax.crypto.interfaces.DHPublicKey" +
                        "|javax.crypto.interfaces.DHPrivateKey");
        psA("KeyAgreement", "DiffieHellman",
                "com.sun.crypto.provider.DHKeyAgreement",
                attrs);

        /*
         * Key Derivation engines
         */
        ps("KDF", "HKDF-SHA256",
                "com.sun.crypto.provider.HKDFKeyDerivation$HKDFSHA256");
        ps("KDF", "HKDF-SHA384",
                "com.sun.crypto.provider.HKDFKeyDerivation$HKDFSHA384");
        ps("KDF", "HKDF-SHA512",
                "com.sun.crypto.provider.HKDFKeyDerivation$HKDFSHA512");

        /*
         * Algorithm Parameter engines
         */
        psA("AlgorithmParameters", "DiffieHellman",
                "com.sun.crypto.provider.DHParameters", null);

        ps("AlgorithmParameters", "DES",
                "com.sun.crypto.provider.DESParameters");

        psA("AlgorithmParameters", "DESede",
                "com.sun.crypto.provider.DESedeParameters", null);

        psA("AlgorithmParameters", "PBEWithSHA1AndDESede",
                "com.sun.crypto.provider.PBEParameters",
                null);


        psA("AlgorithmParameters", "PBES2",
                "com.sun.crypto.provider.PBES2Parameters$General",
                null);

        ps("AlgorithmParameters", "PBEWithHmacSHA1AndAES_128",
                "com.sun.crypto.provider.PBES2Parameters$HmacSHA1AndAES_128");

        ps("AlgorithmParameters", "PBEWithHmacSHA224AndAES_128",
                "com.sun.crypto.provider.PBES2Parameters$HmacSHA224AndAES_128");

        ps("AlgorithmParameters", "PBEWithHmacSHA256AndAES_128",
                "com.sun.crypto.provider.PBES2Parameters$HmacSHA256AndAES_128");

        ps("AlgorithmParameters", "PBEWithHmacSHA384AndAES_128",
                "com.sun.crypto.provider.PBES2Parameters$HmacSHA384AndAES_128");

        ps("AlgorithmParameters", "PBEWithHmacSHA512AndAES_128",
                "com.sun.crypto.provider.PBES2Parameters$HmacSHA512AndAES_128");

        ps("AlgorithmParameters", "PBEWithHmacSHA512/224AndAES_128",
                "com.sun.crypto.provider.PBES2Parameters$HmacSHA512_224AndAES_128");

        ps("AlgorithmParameters", "PBEWithHmacSHA512/256AndAES_128",
                "com.sun.crypto.provider.PBES2Parameters$HmacSHA512_256AndAES_128");

        ps("AlgorithmParameters", "PBEWithHmacSHA1AndAES_256",
                "com.sun.crypto.provider.PBES2Parameters$HmacSHA1AndAES_256");

        ps("AlgorithmParameters", "PBEWithHmacSHA224AndAES_256",
                "com.sun.crypto.provider.PBES2Parameters$HmacSHA224AndAES_256");

        ps("AlgorithmParameters", "PBEWithHmacSHA256AndAES_256",
                "com.sun.crypto.provider.PBES2Parameters$HmacSHA256AndAES_256");

        ps("AlgorithmParameters", "PBEWithHmacSHA384AndAES_256",
                "com.sun.crypto.provider.PBES2Parameters$HmacSHA384AndAES_256");

        ps("AlgorithmParameters", "PBEWithHmacSHA512AndAES_256",
                "com.sun.crypto.provider.PBES2Parameters$HmacSHA512AndAES_256");

        ps("AlgorithmParameters", "PBEWithHmacSHA512/224AndAES_256",
                "com.sun.crypto.provider.PBES2Parameters$HmacSHA512_224AndAES_256");

        ps("AlgorithmParameters", "PBEWithHmacSHA512/256AndAES_256",
                "com.sun.crypto.provider.PBES2Parameters$HmacSHA512_256AndAES_256");

        // the IV of the SunPKCS11 Blowfish ciphers
        ps("AlgorithmParameters", "Blowfish",
                "com.sun.crypto.provider.BlowfishParameters");

        psA("AlgorithmParameters", "AES",
                "com.sun.crypto.provider.AESParameters", null);

        ps("AlgorithmParameters", "GCM",
                "sun.security.util.GCMParameters");

        psA("AlgorithmParameters", "OAEP",
                "com.sun.crypto.provider.OAEPParameters", null);

        psA("AlgorithmParameters", "ChaCha20-Poly1305",
                "com.sun.crypto.provider.ChaCha20Poly1305Parameters", null);

        /*
         * Key factories
         */
        psA("KeyFactory", "DiffieHellman",
                "com.sun.crypto.provider.DHKeyFactory",
                null);

        /*
         * Secret key factories
         */
        ps("SecretKeyFactory", "DES",
                "com.sun.crypto.provider.DESKeyFactory");

        psA("SecretKeyFactory", "DESede",
                "com.sun.crypto.provider.DESedeKeyFactory", null);

        // Preserve password-key identities used by keytool and PKCS12.
        psA("SecretKeyFactory", "PBEWithMD5AndDES",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithMD5AndDES", null);

        psA("SecretKeyFactory", "PBEWithSHA1AndDESede",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithSHA1AndDESede",
                null);

        ps("SecretKeyFactory", "PBEWithHmacSHA1AndAES_128",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithHmacSHA1AndAES_128");

        ps("SecretKeyFactory", "PBEWithHmacSHA224AndAES_128",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithHmacSHA224AndAES_128");

        ps("SecretKeyFactory", "PBEWithHmacSHA256AndAES_128",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithHmacSHA256AndAES_128");

        ps("SecretKeyFactory", "PBEWithHmacSHA384AndAES_128",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithHmacSHA384AndAES_128");

        ps("SecretKeyFactory", "PBEWithHmacSHA512AndAES_128",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithHmacSHA512AndAES_128");

        ps("SecretKeyFactory", "PBEWithHmacSHA512/224AndAES_128",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithHmacSHA512_224AndAES_128");

        ps("SecretKeyFactory", "PBEWithHmacSHA512/256AndAES_128",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithHmacSHA512_256AndAES_128");

        ps("SecretKeyFactory", "PBEWithHmacSHA1AndAES_256",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithHmacSHA1AndAES_256");

        ps("SecretKeyFactory", "PBEWithHmacSHA224AndAES_256",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithHmacSHA224AndAES_256");

        ps("SecretKeyFactory", "PBEWithHmacSHA256AndAES_256",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithHmacSHA256AndAES_256");

        ps("SecretKeyFactory", "PBEWithHmacSHA384AndAES_256",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithHmacSHA384AndAES_256");

        ps("SecretKeyFactory", "PBEWithHmacSHA512AndAES_256",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithHmacSHA512AndAES_256");

        ps("SecretKeyFactory", "PBEWithHmacSHA512/224AndAES_256",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithHmacSHA512_224AndAES_256");

        ps("SecretKeyFactory", "PBEWithHmacSHA512/256AndAES_256",
                "com.sun.crypto.provider.PBEKeyFactory$PBEWithHmacSHA512_256AndAES_256");

        // PBKDF2
        psA("SecretKeyFactory", "PBKDF2WithHmacSHA1",
                "com.sun.crypto.provider.PBKDF2Core$HmacSHA1",
                null);
        ps("SecretKeyFactory", "PBKDF2WithHmacSHA224",
                "com.sun.crypto.provider.PBKDF2Core$HmacSHA224");
        ps("SecretKeyFactory", "PBKDF2WithHmacSHA256",
                "com.sun.crypto.provider.PBKDF2Core$HmacSHA256");
        ps("SecretKeyFactory", "PBKDF2WithHmacSHA384",
                "com.sun.crypto.provider.PBKDF2Core$HmacSHA384");
        ps("SecretKeyFactory", "PBKDF2WithHmacSHA512",
                "com.sun.crypto.provider.PBKDF2Core$HmacSHA512");
        ps("SecretKeyFactory", "PBKDF2WithHmacSHA512/224",
                "com.sun.crypto.provider.PBKDF2Core$HmacSHA512_224");
        ps("SecretKeyFactory", "PBKDF2WithHmacSHA512/256",
                "com.sun.crypto.provider.PBKDF2Core$HmacSHA512_256");

        /*
         * MAC
         */
        attrs.clear();
        attrs.put("SupportedKeyFormats", "RAW");
        ps("Mac", "HmacMD5", "com.sun.crypto.provider.HmacMD5", null, attrs);
        psA("Mac", "HmacSHA1", "com.sun.crypto.provider.HmacSHA1",
                attrs);
        psA("Mac", "HmacSHA224",
                "com.sun.crypto.provider.HmacCore$HmacSHA224", attrs);
        psA("Mac", "HmacSHA256",
                "com.sun.crypto.provider.HmacCore$HmacSHA256", attrs);
        psA("Mac", "HmacSHA384",
                "com.sun.crypto.provider.HmacCore$HmacSHA384", attrs);
        psA("Mac", "HmacSHA512",
                "com.sun.crypto.provider.HmacCore$HmacSHA512", attrs);
        psA("Mac", "HmacSHA512/224",
                "com.sun.crypto.provider.HmacCore$HmacSHA512_224", attrs);
        psA("Mac", "HmacSHA512/256",
                "com.sun.crypto.provider.HmacCore$HmacSHA512_256", attrs);
        psA("Mac", "HmacSHA3-224",
                "com.sun.crypto.provider.HmacCore$HmacSHA3_224", attrs);
        psA("Mac", "HmacSHA3-256",
                "com.sun.crypto.provider.HmacCore$HmacSHA3_256", attrs);
        psA("Mac", "HmacSHA3-384",
                "com.sun.crypto.provider.HmacCore$HmacSHA3_384", attrs);
        psA("Mac", "HmacSHA3-512",
                "com.sun.crypto.provider.HmacCore$HmacSHA3_512", attrs);

        ps("Mac", "HmacPBESHA1",
                "com.sun.crypto.provider.HmacPKCS12PBECore$HmacPKCS12PBE_SHA1",
                null, attrs);
        ps("Mac", "HmacPBESHA224",
                "com.sun.crypto.provider.HmacPKCS12PBECore$HmacPKCS12PBE_SHA224",
                null, attrs);
        ps("Mac", "HmacPBESHA256",
                "com.sun.crypto.provider.HmacPKCS12PBECore$HmacPKCS12PBE_SHA256",
                null, attrs);
        ps("Mac", "HmacPBESHA384",
                "com.sun.crypto.provider.HmacPKCS12PBECore$HmacPKCS12PBE_SHA384",
                null, attrs);
        ps("Mac", "HmacPBESHA512",
                "com.sun.crypto.provider.HmacPKCS12PBECore$HmacPKCS12PBE_SHA512",
                null, attrs);
        ps("Mac", "HmacPBESHA512/224",
                "com.sun.crypto.provider.HmacPKCS12PBECore$HmacPKCS12PBE_SHA512_224",
                null, attrs);
        ps("Mac", "HmacPBESHA512/256",
                "com.sun.crypto.provider.HmacPKCS12PBECore$HmacPKCS12PBE_SHA512_256",
                null, attrs);


        // PBMAC1
        ps("Mac", "PBEWithHmacSHA1",
                "com.sun.crypto.provider.PBMAC1Core$HmacSHA1", null, attrs);
        ps("Mac", "PBEWithHmacSHA224",
                "com.sun.crypto.provider.PBMAC1Core$HmacSHA224", null, attrs);
        ps("Mac", "PBEWithHmacSHA256",
                "com.sun.crypto.provider.PBMAC1Core$HmacSHA256", null, attrs);
        ps("Mac", "PBEWithHmacSHA384",
                "com.sun.crypto.provider.PBMAC1Core$HmacSHA384", null, attrs);
        ps("Mac", "PBEWithHmacSHA512",
                "com.sun.crypto.provider.PBMAC1Core$HmacSHA512", null, attrs);
        ps("Mac", "PBEWithHmacSHA512/224",
                "com.sun.crypto.provider.PBMAC1Core$HmacSHA512_224", null, attrs);
        ps("Mac", "PBEWithHmacSHA512/256",
                "com.sun.crypto.provider.PBMAC1Core$HmacSHA512_256", null, attrs);

        /*
         * KEMs
         */
        attrs.clear();
        attrs.put("ImplementedIn", "Software");
        attrs.put("SupportedKeyClasses", "java.security.interfaces.ECKey" +
                "|java.security.interfaces.XECKey");
        ps("KEM", "DHKEM", "com.sun.crypto.provider.DHKEM", null, attrs);

        attrs.clear();
        attrs.put("ImplementedIn", "Software");
        ps("KEM", "ML-KEM", "com.sun.crypto.provider.ML_KEM_Impls$K", null, attrs);
        psA("KEM", "ML-KEM-512", "com.sun.crypto.provider.ML_KEM_Impls$K2", attrs);
        psA("KEM", "ML-KEM-768", "com.sun.crypto.provider.ML_KEM_Impls$K3", attrs);
        psA("KEM", "ML-KEM-1024", "com.sun.crypto.provider.ML_KEM_Impls$K5",attrs);

        ps("KeyPairGenerator", "ML-KEM", "com.sun.crypto.provider.ML_KEM_Impls$KPG", null, attrs);
        psA("KeyPairGenerator", "ML-KEM-512", "com.sun.crypto.provider.ML_KEM_Impls$KPG2", attrs);
        psA("KeyPairGenerator", "ML-KEM-768", "com.sun.crypto.provider.ML_KEM_Impls$KPG3", attrs);
        psA("KeyPairGenerator", "ML-KEM-1024", "com.sun.crypto.provider.ML_KEM_Impls$KPG5", attrs);

        ps("KeyFactory", "ML-KEM", "com.sun.crypto.provider.ML_KEM_Impls$KF", null, attrs);
        psA("KeyFactory", "ML-KEM-512", "com.sun.crypto.provider.ML_KEM_Impls$KF2", attrs);
        psA("KeyFactory", "ML-KEM-768", "com.sun.crypto.provider.ML_KEM_Impls$KF3", attrs);
        psA("KeyFactory", "ML-KEM-1024", "com.sun.crypto.provider.ML_KEM_Impls$KF5", attrs);

        /*
         * SSL/TLS mechanisms
         *
         * These are strictly internal implementations and may
         * be changed at any time.  These names were chosen
         * because PKCS11/SunPKCS11 does not yet have TLS1.2
         * mechanisms, and it will cause calls to come here.
         */
        ps("KeyGenerator", "SunTls12Prf",
                "com.sun.crypto.provider.TlsPrfGenerator$V12");

        ps("KeyGenerator", "SunTlsMasterSecret",
                "com.sun.crypto.provider.TlsMasterSecretGenerator",
                List.of("SunTls12MasterSecret", "SunTlsExtendedMasterSecret"),
                null);

        ps("KeyGenerator", "SunTlsKeyMaterial",
                "com.sun.crypto.provider.TlsKeyMaterialGenerator",
                List.of("SunTls12KeyMaterial"), null);
    }

    // Return the instance of this class or create one if needed.
    static SunJCE getInstance() {
        if (instance == null) {
            return new SunJCE();
        }
        return instance;
    }
}
