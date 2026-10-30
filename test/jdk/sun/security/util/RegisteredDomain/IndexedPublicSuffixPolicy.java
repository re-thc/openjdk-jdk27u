/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Public suffix loading requires no cryptographic provider
 * @modules java.base/sun.security.util
 * @run main/othervm -Djdk.crypto.disabledAlgorithms=MessageDigest.SHA-256 IndexedPublicSuffixPolicy
 */

import java.nio.file.Files;
import java.nio.file.Path;
import java.security.Security;
import sun.security.util.RegisteredDomain;

public class IndexedPublicSuffixPolicy {
    public static void main(String[] args) throws Exception {
        String originalHome = System.getProperty("java.home");
        Path home = null;
        // An optional image supports focused patch-module testing.
        if (args.length != 0) {
            byte[] image = Files.readAllBytes(Path.of(args[0]));
            home = Files.createTempDirectory(Path.of("."), "psl-policy-").toAbsolutePath();
            Files.createDirectories(home.resolve("lib/security"));
            Files.write(home.resolve("lib/security/public_suffix_list.dat"), image);
        }
        try {
            // Provider removal is confined to this test's fresh JVM.
            for (var provider : Security.getProviders()) {
                Security.removeProvider(provider.getName());
            }
            if (home != null) {
                System.setProperty("java.home", home.toString());
            }
            var result = RegisteredDomain.from("example.com").orElseThrow();
            if (!result.name().equals("example.com") || !result.publicSuffix().equals("com")
                    || result.type() != RegisteredDomain.Type.ICANN) {
                throw new AssertionError("Incorrect domain under restricted crypto policy");
            }
            System.out.println("Provider-independent public suffix loading passed");
        } finally {
            System.setProperty("java.home", originalHome);
            if (home != null) {
                Files.delete(home.resolve("lib/security/public_suffix_list.dat"));
                Files.delete(home.resolve("lib/security"));
                Files.delete(home.resolve("lib"));
                Files.delete(home);
            }
        }
    }
}
