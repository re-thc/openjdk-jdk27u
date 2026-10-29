/*
 * Copyright (c) 2005, 2019, Oracle and/or its affiliates. All rights reserved.
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

package sun.security.krb5.internal.crypto;

import sun.security.krb5.Checksum;
import sun.security.krb5.KrbCryptoException;
import sun.security.krb5.internal.*;

import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import static java.nio.charset.StandardCharsets.ISO_8859_1;

/**
 * This class encapsulates the checksum type for HMAC RC4 as defined
 * in RFC 4757. The rc4-hmac encryption type is not supported, but this
 * checksum is still required by S4U2self (MS-SFU 2.2.1), which uses it
 * regardless of the key type.
 *
 * @author Seema Malkani
 */

public class HmacMd5ArcFourCksumType extends CksumType {

    // "signaturekey" including the terminating zero byte
    private static final byte[] SIGNATURE_KEY =
            "signaturekey\0".getBytes(ISO_8859_1);

    public HmacMd5ArcFourCksumType() {
    }

    public int confounderSize() {
        return 8;
    }

    public int cksumType() {
        return Checksum.CKSUMTYPE_HMAC_MD5_ARCFOUR;
    }

    public boolean isKeyed() {
        return true;
    }

    public int cksumSize() {
        return 16;  // bytes
    }

    public int keyType() {
        return Krb5.KEYTYPE_ARCFOUR_HMAC;
    }

    public int keySize() {
        return 16;   // bytes
    }

    /**
     * Calculates keyed checksum.
     * @param data the data used to generate the checksum.
     * @param size length of the data.
     * @param key the key used to encrypt the checksum.
     * @return keyed checksum.
     */
    public byte[] calculateChecksum(byte[] data, int size, byte[] key,
        int usage) throws KrbCryptoException {

         try {
             return calculateChecksum(key, usage, data, 0, size);
         } catch (GeneralSecurityException e) {
             KrbCryptoException ke = new KrbCryptoException(e.getMessage());
             ke.initCause(e);
             throw ke;
         }
    }

    /**
     * Verifies keyed checksum.
     * @param data the data.
     * @param size the length of data.
     * @param key the key used to encrypt the checksum.
     * @param checksum the checksum.
     * @return true if verification is successful.
     */
    public boolean verifyChecksum(byte[] data, int size,
        byte[] key, byte[] checksum, int usage) throws KrbCryptoException {

         try {
             byte[] newCksum = calculateChecksum(key, usage, data, 0, size);

             return isChecksumEqual(checksum, newCksum);
         } catch (GeneralSecurityException e) {
             KrbCryptoException ke = new KrbCryptoException(e.getMessage());
             ke.initCause(e);
             throw ke;
         }
     }

    /*
     * Ksign = HMAC-MD5(key, "signaturekey\0")
     * checksum = HMAC-MD5(Ksign, MD5(T(usage) | data))
     */
    private static byte[] calculateChecksum(byte[] baseKey, int usage,
        byte[] input, int start, int len) throws GeneralSecurityException {

        if (!KeyUsage.isValid(usage)) {
            throw new GeneralSecurityException("Invalid key usage number: "
                                                + usage);
        }

        byte[] ksign;
        try {
            ksign = getHmac(baseKey, SIGNATURE_KEY);
        } catch (Exception e) {
            throw new GeneralSecurityException("Calculate Checksum Failed!", e);
        }

        MessageDigest md5 = MessageDigest.getInstance("MD5");
        md5.update(getSalt(usage));
        md5.update(input, start, len);
        return getHmac(ksign, md5.digest());
    }

    private static byte[] getHmac(byte[] key, byte[] msg)
        throws GeneralSecurityException {

        Mac m = Mac.getInstance("HmacMD5");
        m.init(new SecretKeySpec(key, "HmacMD5"));
        return m.doFinal(msg);
    }

    // The key usage number as a 4-byte little-endian integer, with the
    // RFC 4757 usage translation applied
    private static byte[] getSalt(int usage) {
        int msUsage = switch (usage) {
            case 3, 9 -> 8;
            case 23 -> 13;
            default -> usage;
        };
        return new byte[] {
                (byte) msUsage,
                (byte) (msUsage >> 8),
                (byte) (msUsage >> 16),
                (byte) (msUsage >> 24)};
    }
}
