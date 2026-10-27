/*
 * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 8349849
 * @summary Verify that SunTls12KeyMaterial doesn't crash on TLS 1.0 parameters
 * @library /test/lib ..
 * @modules java.base/sun.security.internal.spec
 * @run main/othervm TestKeyMaterialMisuse
 */

import sun.security.internal.spec.TlsKeyMaterialParameterSpec;
import sun.security.internal.spec.TlsKeyMaterialSpec;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.security.InvalidAlgorithmParameterException;
import java.security.Provider;
import java.security.ProviderException;
import java.util.Arrays;
import java.util.List;

public class TestKeyMaterialMisuse extends PKCS11Test {

    public static void main(String[] args) throws Exception {
        System.out.println("NSS Version: " + getNSSVersion());
        main(new TestKeyMaterialMisuse(), args);
    }

    @Override
    public void main(Provider provider) throws Exception {
        byte[] keyBytes = new byte[48];
        Arrays.fill(keyBytes, (byte)1);
        SecretKey master = new SecretKeySpec(keyBytes, "TlsMasterSecret");
        byte[] cr = "clientRandom".getBytes();
        byte[] sr = "serverRandom".getBytes();
        for (int minor : List.of(1, 3)) {
            try {
                // SunTls12KeyMaterial is deliberately used with TLS 1.0
                String algorithm = "SunTls12KeyMaterial";
                System.out.println("Generating key material for version: " +
                        minor + " using algorithm: " + algorithm);

                KeyGenerator g = KeyGenerator.getInstance(algorithm, provider);
                TlsKeyMaterialParameterSpec spec =
                        new TlsKeyMaterialParameterSpec(
                                master, 3, minor, cr, sr,
                                "AES", 32,
                                12, 32,
                                "SHA-256", 32, 128);
                g.init(spec);
                if (minor != 3) {
                    throw new RuntimeException(
                            "TLS 1.0 parameters should be rejected");
                }
                TlsKeyMaterialSpec km = (TlsKeyMaterialSpec) g.generateKey();
                System.out.println("Success!");
            } catch (InvalidAlgorithmParameterException e) {
                if (minor == 3) {
                    throw e;
                }
                System.out.println("Got expected exception:");
                e.printStackTrace();
            } catch (ProviderException e) {
                System.out.println("Got exception, not crash:");
                e.printStackTrace();
            }
        }
    }

}
