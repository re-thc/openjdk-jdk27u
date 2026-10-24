/*
 * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
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

import java.security.*;
import java.security.spec.AlgorithmParameterSpec;
import java.util.Arrays;

import javax.crypto.*;
import javax.crypto.spec.*;

import sun.security.internal.spec.*;

import static com.sun.crypto.provider.TlsPrfGenerator.*;

/**
 * KeyGenerator implementation for the SSL/TLS master secret derivation.
 *
 * @author  Andreas Sterbenz
 * @since   1.6
 */
public final class TlsKeyMaterialGenerator extends KeyGeneratorSpi {

    private static final String MSG = "TlsKeyMaterialGenerator must be "
        + "initialized using a TlsKeyMaterialParameterSpec";

    @SuppressWarnings("deprecation")
    private TlsKeyMaterialParameterSpec spec;

    public TlsKeyMaterialGenerator() {
    }

    protected void engineInit(SecureRandom random) {
        throw new InvalidParameterException(MSG);
    }

    @SuppressWarnings("deprecation")
    protected void engineInit(AlgorithmParameterSpec params,
            SecureRandom random) throws InvalidAlgorithmParameterException {
        if (!(params instanceof TlsKeyMaterialParameterSpec)) {
            throw new InvalidAlgorithmParameterException(MSG);
        }
        this.spec = (TlsKeyMaterialParameterSpec)params;
        if (!"RAW".equals(spec.getMasterSecret().getFormat())) {
            throw new InvalidAlgorithmParameterException(
                "Key format must be RAW");
        }
        int protocolVersion = (spec.getMajorVersion() << 8)
            | spec.getMinorVersion();
        if (protocolVersion != 0x0303) {
            throw new InvalidAlgorithmParameterException(
                "Only TLS 1.2 supported");
        }
    }

    protected void engineInit(int keysize, SecureRandom random) {
        throw new InvalidParameterException(MSG);
    }

    protected SecretKey engineGenerateKey() {
        if (spec == null) {
            throw new IllegalStateException(
                "TlsKeyMaterialGenerator must be initialized");
        }
        byte[] masterSecret = spec.getMasterSecret().getEncoded();
        try {
            return engineGenerateKey0(masterSecret);
        } catch (GeneralSecurityException e) {
            throw new ProviderException(e);
        } finally {
            Arrays.fill(masterSecret, (byte)0);
        }
    }

    @SuppressWarnings("deprecation")
    private SecretKey engineGenerateKey0(byte[] masterSecret) throws GeneralSecurityException {

        byte[] clientRandom = spec.getClientRandom();
        byte[] serverRandom = spec.getServerRandom();

        SecretKey clientMacKey = null;
        SecretKey serverMacKey = null;
        IvParameterSpec clientIv = null;
        IvParameterSpec serverIv = null;

        int macLength = spec.getMacKeyLength();
        int keyLength = spec.getCipherKeyLength();
        int ivLength = spec.getIvLength();

        int keyBlockLen = (macLength + keyLength + ivLength) << 1;

        // generate key block
        byte[] seed = concat(serverRandom, clientRandom);
        byte[] keyBlock = doTLS12PRF(masterSecret, LABEL_KEY_EXPANSION, seed,
                keyBlockLen, spec.getPRFHashAlg(),
                spec.getPRFHashLength(), spec.getPRFBlockSize());

        // partition keyblock into individual secrets

        int ofs = 0;
        if (macLength != 0) {
            // mac keys
            clientMacKey = new SecretKeySpec(keyBlock, ofs, macLength, "Mac");
            ofs += macLength;
            serverMacKey = new SecretKeySpec(keyBlock, ofs, macLength, "Mac");
            ofs += macLength;
        }

        if (keyLength == 0) { // no cipher keys
            return new TlsKeyMaterialSpec(clientMacKey, serverMacKey);
        }

        String alg = spec.getCipherAlgorithm();

        // cipher keys
        byte[] clientKeyBytes = new byte[keyLength];
        System.arraycopy(keyBlock, ofs, clientKeyBytes, 0, keyLength);
        ofs += keyLength;

        byte[] serverKeyBytes = new byte[keyLength];
        System.arraycopy(keyBlock, ofs, serverKeyBytes, 0, keyLength);
        ofs += keyLength;

        SecretKey clientCipherKey;
        SecretKey serverCipherKey;
        try {
            // cipher keys
            clientCipherKey = new SecretKeySpec(clientKeyBytes, alg);
            serverCipherKey = new SecretKeySpec(serverKeyBytes, alg);

            // IV keys if needed.
            if (ivLength != 0) {
                clientIv = new IvParameterSpec(keyBlock, ofs, ivLength);
                ofs += ivLength;
                serverIv = new IvParameterSpec(keyBlock, ofs, ivLength);
                ofs += ivLength;
            }
        } finally {
            Arrays.fill(serverKeyBytes, (byte) 0);
            Arrays.fill(clientKeyBytes, (byte) 0);
            Arrays.fill(keyBlock, (byte) 0);
        }

        return new TlsKeyMaterialSpec(clientMacKey, serverMacKey,
            clientCipherKey, clientIv, serverCipherKey, serverIv);
    }

}
