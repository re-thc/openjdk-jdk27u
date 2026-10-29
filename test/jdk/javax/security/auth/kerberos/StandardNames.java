/*
 * Copyright (c) 2014, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 8035986
 * @summary KerberosKey algorithm names are not specified
 * @modules java.security.jgss/sun.security.krb5
 */

import sun.security.krb5.EncryptedData;

import javax.crypto.Cipher;
import javax.security.auth.kerberos.KerberosKey;
import javax.security.auth.kerberos.KerberosPrincipal;
import java.util.Locale;

public class StandardNames {
    static KerberosPrincipal kp = new KerberosPrincipal("user@REALM");
    static char[] pass = "secret".toCharArray();
    static byte[] keyBytes = new byte[1];

    public static void main(String[] args) throws Exception {
        for (EncType e: EncType.values()) {
            if (e == EncType.e18) {
                if (Cipher.getMaxAllowedKeyLength("AES") < 256) {
                    System.out.println("Skipping aes256-cts-hmac-sha1-96");
                    continue;
                }
            }
            checkByName(e.name, e);
            checkByName(e.name.toUpperCase(Locale.US), e);
            for (String n: e.oldnames) {
                checkByName(n, e);
                checkByName(n.toLowerCase(Locale.US), e);
            }
            checkByEType(e.etype, e.name);
        }
        checkByEType(EncryptedData.ETYPE_DES_CBC_CRC, "des-cbc-crc");
        checkByEType(EncryptedData.ETYPE_DES_CBC_MD5, "des-cbc-md5");
        checkByEType(EncryptedData.ETYPE_DES3_CBC_HMAC_SHA1_KD, "des3-cbc-sha1-kd");
        checkByEType(EncryptedData.ETYPE_ARCFOUR_HMAC, "rc4-hmac");
        checkByEType(100, "unknown");
        checkByEType(-1, "private");

        // Keys cannot be derived from passwords for these
        for (String n : new String[] {"unsupported", "des-cbc-crc",
                "des-cbc-md5", "DES", "des3-cbc-sha1-kd", "DESede",
                "rc4-hmac", "ArcFourHmac"}) {
            checkUnsupported(n);
        }
    }

    private static void checkUnsupported(String n) throws Exception {
        System.out.println("Unsupported " + n);
        try {
            new KerberosKey(kp, pass, n);
            throw new Exception(n);
        } catch (IllegalArgumentException iae) {
            // Expected
        }
    }

    private static void checkByName(String n, EncType e) throws Exception {
        System.out.println("CheckByName " + n);
        KerberosKey k = new KerberosKey(kp, pass, n);
        if (!k.getAlgorithm().equals(e.name)) throw new Exception(n);
        if (k.getKeyType() != e.etype) throw new Exception(n);
        if (k.getVersionNumber() != 0) throw new Exception(n);
    }

    private static void checkByEType(int i, String n) throws Exception {
        System.out.println("CheckByInt " + i);
        KerberosKey k = new KerberosKey(kp, keyBytes, i, 13);
        if (!k.getAlgorithm().equals(n)) throw new Exception("" + i);
        if (k.getKeyType() != i) throw new Exception("" + i);
        if (k.getVersionNumber() != 13) throw new Exception("" + i);
    }
}

enum EncType {
    e0("none", EncryptedData.ETYPE_NULL),
    e17("aes128-cts-hmac-sha1-96", EncryptedData.ETYPE_AES128_CTS_HMAC_SHA1_96, "AES128"),
    e18("aes256-cts-hmac-sha1-96", EncryptedData.ETYPE_AES256_CTS_HMAC_SHA1_96, "AES256"),
    ;

    final String name;
    final int etype;
    final String[] oldnames;

    EncType(String name, int etype, String... oldnames) {
        this.name = name;
        this.etype = etype;
        this.oldnames = oldnames;
    }
}
