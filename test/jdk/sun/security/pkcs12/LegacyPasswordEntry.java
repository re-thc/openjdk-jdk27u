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
 */

/*
 * @test
 * @summary Passwords stored by keytool -importpass in older releases, whose
 *          keys are labelled PBEWithMD5AndDES, can still be read; new
 *          "PBE" keys can still be stored
 * @library /test/lib
 */

import jdk.test.lib.Asserts;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.security.KeyStore;
import java.security.Provider;
import java.security.Security;
import java.util.Base64;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

public class LegacyPasswordEntry {

    // "keytool -importpass -alias pass -storepass changeit" with password
    // "secret4u", created by an older release using PBEWithMD5AndDES
    private static final String LEGACY = String.join("",
            "MIIBeQIBAzCCASMGCSqGSIb3DQEHAaCCARQEggEQMIIBDDCCAQgGCSqGSIb3DQEH",
            "AaCB+gSB9zCB9DCB8QYLKoZIhvcNAQwKAQWggaMwgaAGCyqGSIb3DQEMCgECoIGQ",
            "BIGNMIGKMGYGCSqGSIb3DQEFDTBZMDgGCSqGSIb3DQEFDDArBBQjcjciNL101dVW",
            "ie7bTrY9YnNuIAICJxACASAwDAYIKoZIhvcNAgkFADAdBglghkgBZQMEASoEEEQq",
            "zsQB+P5/mSwK6FFj9UkEIOPEZ7TT4Hu21jRRG/tjkLazFBU7BXV0xveQA6moAfmP",
            "MTwwFwYJKoZIhvcNAQkUMQoeCABwAGEAcwBzMCEGCSqGSIb3DQEJFTEUBBJUaW1l",
            "IDE3OTIwMDQ5MTYxODEwTTAxMA0GCWCGSAFlAwQCAQUABCBg/eLD6lRMml+HH84T",
            "TVoGU/OzEX3UuB2jrVbuGq/ATQQUORmgNVRoQQ2vDQUVi7lQQT/f78ACAicQ");

    private static final char[] STOREPASS = "changeit".toCharArray();

    public static void main(String[] args) throws Exception {
        Provider provider = Security.getProvider("SunJCE");
        Asserts.assertEQ(provider.getService("SecretKeyFactory", "PBE").getAlgorithm(),
                "PBEWithMD5AndDES");
        Asserts.assertNull(provider.getService("Cipher", "PBE"));
        Asserts.assertNull(provider.getService("AlgorithmParameters", "PBE"));
        KeyStore ks = KeyStore.getInstance("PKCS12");
        ks.load(new ByteArrayInputStream(
                Base64.getDecoder().decode(LEGACY)), STOREPASS);
        Asserts.assertEQ(ks.getKey("pass", STOREPASS).getAlgorithm(), "PBEWithMD5AndDES");
        Asserts.assertEQ(password(ks.getKey("pass", STOREPASS)), "secret4u");

        SecretKey key = SecretKeyFactory.getInstance("PBE")
                .generateSecret(new PBEKeySpec("newpass".toCharArray()));
        Asserts.assertEQ(key.getAlgorithm(), "PBEWithMD5AndDES");
        ks.setEntry("new", new KeyStore.SecretKeyEntry(key),
                new KeyStore.PasswordProtection(STOREPASS));
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        ks.store(bout, STOREPASS);

        KeyStore ks2 = KeyStore.getInstance("PKCS12");
        ks2.load(new ByteArrayInputStream(bout.toByteArray()), STOREPASS);
        Asserts.assertEQ(password(ks2.getKey("pass", STOREPASS)), "secret4u");
        Asserts.assertEQ(ks2.getKey("pass", STOREPASS).getAlgorithm(), "PBEWithMD5AndDES");
        Asserts.assertEQ(ks2.getKey("new", STOREPASS).getAlgorithm(), "PBEWithMD5AndDES");
        Asserts.assertEQ(password(ks2.getKey("new", STOREPASS)), "newpass");
    }

    private static String password(java.security.Key key) throws Exception {
        PBEKeySpec spec = (PBEKeySpec) SecretKeyFactory
                .getInstance(key.getAlgorithm())
                .getKeySpec((SecretKey) key, PBEKeySpec.class);
        return new String(spec.getPassword());
    }
}
