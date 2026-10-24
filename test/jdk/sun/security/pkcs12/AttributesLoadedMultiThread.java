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
 * @library /test/lib
 * @modules java.base/sun.security.tools.keytool
 *          java.base/sun.security.x509
 * @summary ensures that reading the attributes of a loaded keystore is
 *          thread safe, when the attributes are first read concurrently
 */
import sun.security.tools.keytool.CertAndKeyGen;
import sun.security.x509.X500Name;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.security.KeyStore;
import java.security.PKCS12Attribute;
import java.security.cert.Certificate;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

public class AttributesLoadedMultiThread {

    static final char[] PASS = "changeit".toCharArray();
    static final int ENTRIES = 20;

    public static void main(String[] args) throws Exception {
        KeyStore ks = KeyStore.getInstance("pkcs12");
        ks.load(null, null);
        CertAndKeyGen cak = new CertAndKeyGen("EC", "SHA256withECDSA");
        cak.generate("secp256r1");
        Certificate cert = cak.getSelfCertificate(new X500Name("CN=A"), 1000);
        Set<KeyStore.Entry.Attribute> extra = Set.of(
                new PKCS12Attribute("1.1.1.1", "b"),
                new PKCS12Attribute("1.1.1.2", "b"),
                new PKCS12Attribute("1.1.1.3", "b"));
        for (int i = 0; i < ENTRIES; i++) {
            ks.setEntry("cert" + i,
                    new KeyStore.TrustedCertificateEntry(cert, extra), null);
        }
        ks.setKeyEntry("key", cak.getPrivateKey(), PASS,
                new Certificate[] {cert});

        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        ks.store(bos, PASS);

        // The attributes of the entries are only read by a keystore that is
        // loaded for it, the threads are the first to read the other one.
        KeyStore reference = KeyStore.getInstance("pkcs12");
        reference.load(new ByteArrayInputStream(bos.toByteArray()), PASS);
        Map<String, Set<KeyStore.Entry.Attribute>> expected = new HashMap<>();
        for (String alias : Collections.list(reference.aliases())) {
            expected.put(alias, reference.getAttributes(alias));
        }
        if (expected.size() != ENTRIES + 1) {
            throw new RuntimeException("Wrong entries: " + expected.keySet());
        }

        KeyStore loaded = KeyStore.getInstance("pkcs12");
        loaded.load(new ByteArrayInputStream(bos.toByteArray()), PASS);

        AtomicBoolean failed = new AtomicBoolean();
        try (ExecutorService executor =
                     Executors.newVirtualThreadPerTaskExecutor()) {
            for (int i = 0; i < 1000; i++) {
                final int n = i;
                executor.submit(() -> check(loaded, expected, n, failed));
            }
            executor.shutdown();
            executor.awaitTermination(1, TimeUnit.MINUTES);
        }

        if (failed.get()) {
            throw new RuntimeException("Wrong attributes");
        }
    }

    static void check(KeyStore ks,
            Map<String, Set<KeyStore.Entry.Attribute>> expected, int n,
            AtomicBoolean failed) {
        try {
            for (int i = 0; i < 10; i++) {
                String alias = (i % 3 == 0)
                        ? "key" : "cert" + ((n + i) % ENTRIES);
                KeyStore.ProtectionParameter pp = alias.equals("key")
                        ? new KeyStore.PasswordProtection(PASS) : null;
                if (!ks.getAttributes(alias).equals(expected.get(alias))
                        || !ks.getEntry(alias, pp).getAttributes()
                                .equals(expected.get(alias))) {
                    failed.set(true);
                }
            }
        } catch (Throwable t) {
            t.printStackTrace();
            failed.set(true);
        }
    }
}
