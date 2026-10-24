/*
 * Copyright (c) 2004, 2026, Oracle and/or its affiliates. All rights reserved.
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

package sun.security.jgss.krb5;

import org.ietf.jgss.*;

import java.security.GeneralSecurityException;

import sun.security.krb5.*;
import sun.security.krb5.internal.crypto.Aes128Sha2;
import sun.security.krb5.internal.crypto.Aes256Sha2;
import sun.security.krb5.internal.crypto.Aes128;
import sun.security.krb5.internal.crypto.Aes256;
import sun.security.util.ByteArrays;

class CipherHelper {

    private static final int AES_IV_SIZE = 16;

    private static final byte[] ZERO_IV_AES = new byte[AES_IV_SIZE];

    private final int etype;
    private final byte[] keybytes;

    CipherHelper(EncryptionKey key) throws GSSException {
        etype = key.getEType();
        keybytes = key.getBytes();

        switch (etype) {
        case EncryptedData.ETYPE_AES128_CTS_HMAC_SHA1_96:
        case EncryptedData.ETYPE_AES256_CTS_HMAC_SHA1_96:
        case EncryptedData.ETYPE_AES128_CTS_HMAC_SHA256_128:
        case EncryptedData.ETYPE_AES256_CTS_HMAC_SHA384_192:
            break;

        default:
            throw new GSSException(GSSException.FAILURE, -1,
                "Unsupported encryption type: " + etype);
        }
    }

    int getEType() {
        return etype;
    }

    // calculate Checksum for the new GSS tokens
    byte[] calculateChecksum(byte[] header, byte[] data, int start, int len,
        int key_usage) throws GSSException {

        // total length
        int total = ((header != null ? header.length : 0) + len);

        // get_mic("plaintext-data" | "header")
        byte[] buf = new byte[total];

        // data
        System.arraycopy(data, start, buf, 0, len);

        // token header
        if (header != null) {
            System.arraycopy(header, 0, buf, len, header.length);
        }

        // Krb5Token.debug("\nAES calculate checksum on: " +
        //              Krb5Token.getHexBytes(buf));
        switch (etype) {
        case EncryptedData.ETYPE_AES128_CTS_HMAC_SHA1_96:
            try {
                byte[] answer = Aes128.calculateChecksum(keybytes, key_usage,
                                        buf, 0, total);
                // Krb5Token.debug("\nAES128 checksum: " +
                //                      Krb5Token.getHexBytes(answer));
                return answer;
            } catch (GeneralSecurityException e) {
                GSSException ge = new GSSException(GSSException.FAILURE, -1,
                    "Could not use AES128 signing algorithm - " +
                    e.getMessage());
                ge.initCause(e);
                throw ge;
            }

        case EncryptedData.ETYPE_AES256_CTS_HMAC_SHA1_96:
            try {
                byte[] answer = Aes256.calculateChecksum(keybytes, key_usage,
                                        buf, 0, total);
                // Krb5Token.debug("\nAES256 checksum: " +
                //              Krb5Token.getHexBytes(answer));
                return answer;
            } catch (GeneralSecurityException e) {
                GSSException ge = new GSSException(GSSException.FAILURE, -1,
                    "Could not use AES256 signing algorithm - " +
                    e.getMessage());
                ge.initCause(e);
                throw ge;
            }

        case EncryptedData.ETYPE_AES128_CTS_HMAC_SHA256_128:
            try {
                byte[] answer = Aes128Sha2.calculateChecksum(keybytes, key_usage,
                        buf, 0, total);
                return answer;
            } catch (GeneralSecurityException e) {
                GSSException ge = new GSSException(GSSException.FAILURE, -1,
                        "Could not use AES128 signing algorithm - " +
                                e.getMessage());
                ge.initCause(e);
                throw ge;
            }

        case EncryptedData.ETYPE_AES256_CTS_HMAC_SHA384_192:
            try {
                return Aes256Sha2.calculateChecksum(keybytes, key_usage,
                        buf, 0, total);
            } catch (GeneralSecurityException e) {
                GSSException ge = new GSSException(GSSException.FAILURE, -1,
                        "Could not use AES256 signing algorithm - " +
                                e.getMessage());
                ge.initCause(e);
                throw ge;
            }

        default:
            throw new GSSException(GSSException.FAILURE, -1,
                "Unsupported encryption type: " + etype);
        }
    }

    int getChecksumLength() throws GSSException {
        switch (etype) {
        case EncryptedData.ETYPE_AES128_CTS_HMAC_SHA1_96:
            return Aes128.getChecksumLength();
        case EncryptedData.ETYPE_AES256_CTS_HMAC_SHA1_96:
            return Aes256.getChecksumLength();

        case EncryptedData.ETYPE_AES128_CTS_HMAC_SHA256_128:
            return Aes128Sha2.getChecksumLength();
        case EncryptedData.ETYPE_AES256_CTS_HMAC_SHA384_192:
            return Aes256Sha2.getChecksumLength();

        default:
            throw new GSSException(GSSException.FAILURE, -1,
                "Unsupported encryption type: " + etype);
        }
    }

    // decrypt data in the new GSS tokens
    void decryptData(WrapToken_v2 token, byte[] ciphertext, int cStart,
                int cLen, byte[] plaintext, int pStart, int key_usage)
            throws GSSException {

        byte[] decrypted;
        switch (etype) {
            case EncryptedData.ETYPE_AES128_CTS_HMAC_SHA1_96:
                decrypted = aes128Decrypt(ciphertext, cStart, cLen, key_usage);
                break;
            case EncryptedData.ETYPE_AES256_CTS_HMAC_SHA1_96:
                decrypted = aes256Decrypt(ciphertext, cStart, cLen, key_usage);
                break;
            case EncryptedData.ETYPE_AES128_CTS_HMAC_SHA256_128:
                decrypted = aes128Sha2Decrypt(ciphertext, cStart, cLen, key_usage);
                break;
            case EncryptedData.ETYPE_AES256_CTS_HMAC_SHA384_192:
                decrypted = aes256Sha2Decrypt(ciphertext, cStart, cLen, key_usage);
                break;
            default:
                throw new GSSException(GSSException.FAILURE, -1,
                        "Unsupported etype: " + etype);
        }
        byte[] outerHeader = token.getTokenHeader().clone();
        outerHeader[MessageToken_v2.TOKEN_RRC_POS] = 0;
        outerHeader[MessageToken_v2.TOKEN_RRC_POS + 1] = 0;
        int len = decrypted.length - WrapToken_v2.CONFOUNDER_SIZE -
                WrapToken_v2.TOKEN_HEADER_SIZE - token.getEc();
        if (len < 0) {
            throw new GSSException(GSSException.DEFECTIVE_TOKEN);
        }
        if (!ByteArrays.isEqual(
                outerHeader,
                0, WrapToken_v2.TOKEN_HEADER_SIZE,
                decrypted,
                decrypted.length - WrapToken_v2.TOKEN_HEADER_SIZE, decrypted.length)) {
            throw new GSSException(GSSException.DEFECTIVE_TOKEN);
        }
        System.arraycopy(decrypted, WrapToken_v2.CONFOUNDER_SIZE,
                plaintext, pStart, len);
    }

    /*
     * Encrypt data in the new GSS tokens
     *
     * Wrap Tokens (with confidentiality)
     * { Encrypt(16-byte confounder | plaintext | 16-byte token_header) |
     *           12-byte HMAC }
     * where HMAC is on {16-byte confounder | plaintext | 16-byte token_header}
     * HMAC is not encrypted; it is appended at the end.
     */
    byte[] encryptData(WrapToken_v2 token, byte[] confounder, byte[] tokenHeader,
            byte[] plaintext, int start, int len, int key_usage)
            throws GSSException {

        switch (etype) {
            case EncryptedData.ETYPE_AES128_CTS_HMAC_SHA1_96:
                return aes128Encrypt(confounder, tokenHeader,
                            plaintext, start, len, key_usage);
            case EncryptedData.ETYPE_AES256_CTS_HMAC_SHA1_96:
                return aes256Encrypt(confounder, tokenHeader,
                            plaintext, start, len, key_usage);
            case EncryptedData.ETYPE_AES128_CTS_HMAC_SHA256_128:
                return aes128Sha2Encrypt(confounder, tokenHeader,
                        plaintext, start, len, key_usage);
            case EncryptedData.ETYPE_AES256_CTS_HMAC_SHA384_192:
                return aes256Sha2Encrypt(confounder, tokenHeader,
                        plaintext, start, len, key_usage);
            default:
                throw new GSSException(GSSException.FAILURE, -1,
                    "Unsupported etype: " + etype);
        }
    }


    // ---- AES methods
    private byte[] aes128Encrypt(byte[] confounder, byte[] tokenHeader,
        byte[] plaintext, int start, int len, int key_usage)
        throws GSSException {

        // encrypt { AES-plaintext-data | filler | header }
        // AES-plaintext-data { confounder | plaintext }
        // WrapToken = { tokenHeader |
        //      Encrypt (confounder | plaintext | tokenHeader ) | HMAC }

        byte[] all = new byte[confounder.length + len + tokenHeader.length];
        System.arraycopy(confounder, 0, all, 0, confounder.length);
        System.arraycopy(plaintext, start, all, confounder.length, len);
        System.arraycopy(tokenHeader, 0, all, confounder.length+len,
                                tokenHeader.length);

        // Krb5Token.debug("\naes128Encrypt:" + Krb5Token.getHexBytes(all));
        try {
            byte[] answer = Aes128.encryptRaw(keybytes, key_usage,
                                ZERO_IV_AES,
                                all, 0, all.length);
            // Krb5Token.debug("\naes128Encrypt encrypted:" +
            //                  Krb5Token.getHexBytes(answer));
            return answer;
        } catch (Exception e) {
            // GeneralSecurityException, KrbCryptoException
            GSSException ge = new GSSException(GSSException.FAILURE, -1,
                "Could not use AES128 Cipher - " + e.getMessage());
            ge.initCause(e);
            throw ge;
        }
    }

    private byte[] aes128Sha2Encrypt(byte[] confounder, byte[] tokenHeader,
            byte[] plaintext, int start, int len, int key_usage)
            throws GSSException {

        // encrypt { AES-plaintext-data | filler | header }
        // AES-plaintext-data { confounder | plaintext }
        // WrapToken = { tokenHeader |
        //      Encrypt (confounder | plaintext | tokenHeader ) | HMAC }

        byte[] all = new byte[confounder.length + len + tokenHeader.length];
        System.arraycopy(confounder, 0, all, 0, confounder.length);
        System.arraycopy(plaintext, start, all, confounder.length, len);
        System.arraycopy(tokenHeader, 0, all, confounder.length+len,
                tokenHeader.length);

        // Krb5Token.debug("\naes128Sha2Encrypt:" + Krb5Token.getHexBytes(all));
        try {
            byte[] answer = Aes128Sha2.encryptRaw(keybytes, key_usage,
                    ZERO_IV_AES,
                    all, 0, all.length);
            // Krb5Token.debug("\naes128Sha2Encrypt encrypted:" +
            //                  Krb5Token.getHexBytes(answer));
            return answer;
        } catch (Exception e) {
            // GeneralSecurityException, KrbCryptoException
            GSSException ge = new GSSException(GSSException.FAILURE, -1,
                    "Could not use Aes128Sha2 Cipher - " + e.getMessage());
            ge.initCause(e);
            throw ge;
        }
    }

    private byte[] aes128Decrypt(byte[] ciphertext,
            int cStart, int cLen, int key_usage) throws GSSException {

        try {
            return Aes128.decryptRaw(keybytes, key_usage,
                        ZERO_IV_AES, ciphertext, cStart, cLen);
        } catch (GeneralSecurityException e) {
            GSSException ge = new GSSException(GSSException.FAILURE, -1,
                "Could not use AES128 Cipher - " + e.getMessage());
            ge.initCause(e);
            throw ge;
        }
    }

    private byte[] aes128Sha2Decrypt(byte[] ciphertext,
            int cStart, int cLen, int key_usage) throws GSSException {

        try {
            return Aes128Sha2.decryptRaw(keybytes, key_usage,
                    ZERO_IV_AES, ciphertext, cStart, cLen);
        } catch (GeneralSecurityException e) {
            GSSException ge = new GSSException(GSSException.FAILURE, -1,
                    "Could not use AES128Sha2 Cipher - " + e.getMessage());
            ge.initCause(e);
            throw ge;
        }
    }

    private byte[] aes256Encrypt(byte[] confounder, byte[] tokenHeader,
        byte[] plaintext, int start, int len, int key_usage)
        throws GSSException {

        // encrypt { AES-plaintext-data | filler | header }
        // AES-plaintext-data { confounder | plaintext }
        // WrapToken = { tokenHeader |
        //       Encrypt (confounder | plaintext | tokenHeader ) | HMAC }

        byte[] all = new byte[confounder.length + len + tokenHeader.length];
        System.arraycopy(confounder, 0, all, 0, confounder.length);
        System.arraycopy(plaintext, start, all, confounder.length, len);
        System.arraycopy(tokenHeader, 0, all, confounder.length+len,
                                tokenHeader.length);

        // Krb5Token.debug("\naes256Encrypt:" + Krb5Token.getHexBytes(all));

        try {
            byte[] answer = Aes256.encryptRaw(keybytes, key_usage,
                                ZERO_IV_AES, all, 0, all.length);
            // Krb5Token.debug("\naes256Encrypt encrypted:" +
            //  Krb5Token.getHexBytes(answer));
            return answer;
        } catch (Exception e) {
            // GeneralSecurityException, KrbCryptoException
            GSSException ge = new GSSException(GSSException.FAILURE, -1,
                "Could not use AES256 Cipher - " + e.getMessage());
            ge.initCause(e);
            throw ge;
        }
    }

    private byte[] aes256Sha2Encrypt(byte[] confounder, byte[] tokenHeader,
            byte[] plaintext, int start, int len, int key_usage)
            throws GSSException {

        // encrypt { AES-plaintext-data | filler | header }
        // AES-plaintext-data { confounder | plaintext }
        // WrapToken = { tokenHeader |
        //       Encrypt (confounder | plaintext | tokenHeader ) | HMAC }

        byte[] all = new byte[confounder.length + len + tokenHeader.length];
        System.arraycopy(confounder, 0, all, 0, confounder.length);
        System.arraycopy(plaintext, start, all, confounder.length, len);
        System.arraycopy(tokenHeader, 0, all, confounder.length+len,
                tokenHeader.length);

        // Krb5Token.debug("\naes256Sha2Encrypt:" + Krb5Token.getHexBytes(all));

        try {
            byte[] answer = Aes256Sha2.encryptRaw(keybytes, key_usage,
                    ZERO_IV_AES, all, 0, all.length);
            // Krb5Token.debug("\naes256Sha2Encrypt encrypted:" +
            //  Krb5Token.getHexBytes(answer));
            return answer;
        } catch (Exception e) {
            // GeneralSecurityException, KrbCryptoException
            GSSException ge = new GSSException(GSSException.FAILURE, -1,
                    "Could not use Aes256Sha2 Cipher - " + e.getMessage());
            ge.initCause(e);
            throw ge;
        }
    }

    private byte[] aes256Decrypt(byte[] ciphertext,
            int cStart, int cLen, int key_usage) throws GSSException {

        try {
            return Aes256.decryptRaw(keybytes, key_usage,
                        ZERO_IV_AES, ciphertext, cStart, cLen);
        } catch (GeneralSecurityException e) {
            GSSException ge = new GSSException(GSSException.FAILURE, -1,
                "Could not use AES128 Cipher - " + e.getMessage());
            ge.initCause(e);
            throw ge;
        }
    }

    private byte[] aes256Sha2Decrypt(byte[] ciphertext,
            int cStart, int cLen, int key_usage) throws GSSException {

        try {
            return Aes256Sha2.decryptRaw(keybytes, key_usage,
                    ZERO_IV_AES, ciphertext, cStart, cLen);
        } catch (GeneralSecurityException e) {
            GSSException ge = new GSSException(GSSException.FAILURE, -1,
                    "Could not use AES256Sha2 Cipher - " + e.getMessage());
            ge.initCause(e);
            throw ge;
        }
    }
}
