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
 * @summary The unconfigured SunPKCS11 provider doesn't set up the table of
 *          mechanisms, which a configured provider uses
 * @library /test/lib
 * @modules jdk.crypto.cryptoki/sun.security.pkcs11:+open
 * @run main UnconfiguredProviderLoad
 */

import java.lang.reflect.Field;
import java.security.Provider;
import java.security.Security;
import java.util.List;
import java.util.Map;

import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class UnconfiguredProviderLoad {

    // CKM_SHA256
    private static final int CKM_SHA256 = 0x250;

    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            Provider p = Security.getProvider("SunPKCS11");
            if (p == null || p.isConfigured()) {
                throw new Exception("Expected an unconfigured provider: " + p);
            }
            return;
        }

        OutputAnalyzer out = ProcessTools.executeTestJava(
                "-Xlog:class+load=info", UnconfiguredProviderLoad.class.getName(),
                "check");
        out.shouldHaveExitValue(0);
        out.shouldContain("sun.security.pkcs11.SunPKCS11 ");
        out.shouldNotContain("sun.security.pkcs11.SunPKCS11$DescriptorRegistry");

        // The table is available to a configured provider
        Class<?> c = Class.forName(
                "sun.security.pkcs11.SunPKCS11$DescriptorRegistry");
        Field f = c.getDeclaredField("descriptors");
        f.setAccessible(true);
        Map<?, ?> descriptors = (Map<?, ?>) f.get(null);
        if (!(descriptors.get(CKM_SHA256) instanceof List<?> l) || l.isEmpty()) {
            throw new Exception("No descriptors for CKM_SHA256");
        }
    }
}
