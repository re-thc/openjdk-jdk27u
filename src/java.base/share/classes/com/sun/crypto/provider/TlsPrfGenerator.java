/*
 * Copyright (c) 2005, 2025, Oracle and/or its affiliates. All rights reserved.
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

import java.util.Arrays;

import java.security.*;
import java.security.spec.AlgorithmParameterSpec;

import static java.nio.charset.StandardCharsets.UTF_8;

import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;

import sun.security.internal.spec.TlsPrfParameterSpec;

/**
 * KeyGenerator implementation for the TLS PRF function.
 * <p>
 * This class duplicates the HMAC functionality (RFC 2104) with
 * performance optimizations (e.g. XOR'ing keys with padding doesn't
 * need to be redone for each HMAC operation).
 *
 * @author  Andreas Sterbenz
 * @since   1.6
 */
abstract class TlsPrfGenerator extends KeyGeneratorSpi {

    // magic constants and utility functions, also used by other files
    // in this package

    private static final byte[] B0 = new byte[0];

    static final byte[] LABEL_MASTER_SECRET = // "master secret"
        { 109, 97, 115, 116, 101, 114, 32, 115, 101, 99, 114, 101, 116 };

    static final byte[] LABEL_EXTENDED_MASTER_SECRET =
                                            // "extended master secret"
        { 101, 120, 116, 101, 110, 100, 101, 100, 32, 109, 97, 115, 116,
          101, 114, 32, 115, 101, 99, 114, 101, 116 };

    static final byte[] LABEL_KEY_EXPANSION = // "key expansion"
        { 107, 101, 121, 32, 101, 120, 112, 97, 110, 115, 105, 111, 110 };

    /*
     * TLS HMAC "inner" and "outer" padding.  This isn't a function
     * of the digest algorithm.
     */
    private static final byte[] HMAC_ipad64  = genPad((byte)0x36, 64);
    private static final byte[] HMAC_ipad128 = genPad((byte)0x36, 128);
    private static final byte[] HMAC_opad64  = genPad((byte)0x5c, 64);
    private static final byte[] HMAC_opad128 = genPad((byte)0x5c, 128);

    static byte[] genPad(byte b, int count) {
        byte[] padding = new byte[count];
        Arrays.fill(padding, b);
        return padding;
    }

    static byte[] concat(byte[] b1, byte[] b2) {
        int n1 = b1.length;
        int n2 = b2.length;
        byte[] b = new byte[n1 + n2];
        System.arraycopy(b1, 0, b, 0, n1);
        System.arraycopy(b2, 0, b, n1, n2);
        return b;
    }


    // PRF implementation

    private static final String MSG = "TlsPrfGenerator must be "
        + "initialized using a TlsPrfParameterSpec";

    @SuppressWarnings("deprecation")
    private TlsPrfParameterSpec spec;

    public TlsPrfGenerator() {
    }

    protected void engineInit(SecureRandom random) {
        throw new InvalidParameterException(MSG);
    }

    @SuppressWarnings("deprecation")
    protected void engineInit(AlgorithmParameterSpec params,
            SecureRandom random) throws InvalidAlgorithmParameterException {
        if (!(params instanceof TlsPrfParameterSpec)) {
            throw new InvalidAlgorithmParameterException(MSG);
        }
        this.spec = (TlsPrfParameterSpec)params;
        SecretKey key = spec.getSecret();
        if ((key != null) && (!"RAW".equals(key.getFormat()))) {
            throw new InvalidAlgorithmParameterException(
                "Key encoding format must be RAW");
        }
    }

    protected void engineInit(int keysize, SecureRandom random) {
        throw new InvalidParameterException(MSG);
    }

    protected SecretKey engineGenerateKey0() {
        if (spec == null) {
            throw new IllegalStateException(
                "TlsPrfGenerator must be initialized");
        }
        SecretKey key = spec.getSecret();
        byte[] secret = (key == null) ? null : key.getEncoded();
        try {
            byte[] labelBytes = spec.getLabel().getBytes(UTF_8);
            int n = spec.getOutputLength();
            byte[] prfBytes = doTLS12PRF(secret, labelBytes, spec.getSeed(), n,
                    spec.getPRFHashAlg(), spec.getPRFHashLength(),
                    spec.getPRFBlockSize());
            try {
                return new SecretKeySpec(prfBytes, spec.getKeyAlg());
            } finally {
                Arrays.fill(prfBytes, (byte)0);
            }
        } catch (GeneralSecurityException e) {
            throw new ProviderException("Could not generate PRF", e);
        } finally {
            if (secret != null) {
                Arrays.fill(secret, (byte) 0);
            }
        }
    }

    static byte[] doTLS12PRF(byte[] secret, byte[] labelBytes,
            byte[] seed, int outputLength,
            String prfHash, int prfHashLength, int prfBlockSize)
            throws NoSuchAlgorithmException, DigestException {
        if (prfHash == null) {
            throw new NoSuchAlgorithmException("Unspecified PRF algorithm");
        }
        MessageDigest prfMD = MessageDigest.getInstance(prfHash);
        return doTLS12PRF(secret, labelBytes, seed, outputLength,
            prfMD, prfHashLength, prfBlockSize);
    }

    static byte[] doTLS12PRF(byte[] secret, byte[] labelBytes,
            byte[] seed, int outputLength,
            MessageDigest mdPRF, int mdPRFLen, int mdPRFBlockSize)
            throws DigestException {

        if (secret == null) {
            secret = B0;
        }

        // If we have a long secret, digest it first.
        if (secret.length > mdPRFBlockSize) {
            secret = mdPRF.digest(secret);
        }

        byte[] output = new byte[outputLength];
        byte [] ipad;
        byte [] opad;

        switch (mdPRFBlockSize) {
        case 64:
            ipad = HMAC_ipad64.clone();
            opad = HMAC_opad64.clone();
            break;
        case 128:
            ipad = HMAC_ipad128.clone();
            opad = HMAC_opad128.clone();
            break;
        default:
            throw new DigestException("Unexpected block size.");
        }

        // P_HASH(Secret, label + seed)
        expand(mdPRF, mdPRFLen, secret, 0, secret.length, labelBytes,
            seed, output, ipad, opad);

        return output;
    }



    /*
     * @param digest the MessageDigest to produce the HMAC
     * @param hmacSize the HMAC size
     * @param secret the secret
     * @param secOff the offset into the secret
     * @param secLen the secret length
     * @param label the label
     * @param seed the seed
     * @param output the output array
     */
    private static void expand(MessageDigest digest, int hmacSize,
            byte[] secret, int secOff, int secLen, byte[] label, byte[] seed,
            byte[] output, byte[] pad1, byte[] pad2) throws DigestException {
        /*
         * modify the padding used, by XORing the key into our copy of that
         * padding.  That's to avoid doing that for each HMAC computation.
         */
        for (int i = 0; i < secLen; i++) {
            pad1[i] ^= secret[i + secOff];
            pad2[i] ^= secret[i + secOff];
        }

        byte[] tmp = new byte[hmacSize];
        byte[] aBytes = null;

        /*
         * compute:
         *
         *     P_hash(secret, seed) = HMAC_hash(secret, A(1) + seed) +
         *                            HMAC_hash(secret, A(2) + seed) +
         *                            HMAC_hash(secret, A(3) + seed) + ...
         * A() is defined as:
         *
         *     A(0) = seed
         *     A(i) = HMAC_hash(secret, A(i-1))
         */
        int remaining = output.length;
        int ofs = 0;
        while (remaining > 0) {
            /*
             * compute A() ...
             */
            // inner digest
            digest.update(pad1);
            if (aBytes == null) {
                digest.update(label);
                digest.update(seed);
            } else {
                digest.update(aBytes);
            }
            digest.digest(tmp, 0, hmacSize);

            // outer digest
            digest.update(pad2);
            digest.update(tmp);
            if (aBytes == null) {
                aBytes = new byte[hmacSize];
            }
            digest.digest(aBytes, 0, hmacSize);

            /*
             * compute HMAC_hash() ...
             */
            // inner digest
            digest.update(pad1);
            digest.update(aBytes);
            digest.update(label);
            digest.update(seed);
            digest.digest(tmp, 0, hmacSize);

            // outer digest
            digest.update(pad2);
            digest.update(tmp);
            digest.digest(tmp, 0, hmacSize);

            digest.reset();

            int k = Math.min(hmacSize, remaining);
            for (int i = 0; i < k; i++) {
                output[ofs++] ^= tmp[i];
            }
            remaining -= k;
        }
        Arrays.fill(tmp, (byte)0);
    }

    /**
     * A KeyGenerator implementation that supports TLS 1.2.
     */
    public static class V12 extends TlsPrfGenerator {
        protected SecretKey engineGenerateKey() {
            return engineGenerateKey0();
        }
    }
}
