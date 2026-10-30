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
 * @summary Initializing an SSLContext and creating an SSLEngine should not
 *          load the security providers that are not used, which happens when
 *          an algorithm that no provider supports is looked up
 * @requires os.family != "windows"
 * @library /test/lib
 * @run main NoUnusedProviderLoad
 */

import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLEngine;
import java.util.List;

import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class NoUnusedProviderLoad {

    // classes of the providers that come after SunJCE in java.security
    private static final List<String> PROVIDER_CLASSES = List.of(
            "org.jcp.xml.dsig.internal.dom.XMLDSigRI",
            "sun.security.jgss.SunProvider",
            "com.sun.security.sasl.Provider",
            "sun.security.smartcardio.SunPCSC",
            "sun.security.provider.certpath.ldap.JdkLDAP",
            "sun.security.pkcs11.SunPKCS11");

    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            // SUN, SunRsaSign, SunEC, SunJSSE and SunJCE are enough for the
            // default TLS configuration
            SSLContext ctx = SSLContext.getInstance("TLS");
            ctx.init(null, null, null);
            SSLEngine engine = ctx.createSSLEngine();
            if (engine.getEnabledProtocols().length == 0
                    || engine.getEnabledCipherSuites().length == 0
                    || engine.getSSLParameters().getNamedGroups().length == 0) {
                throw new RuntimeException("Nothing enabled");
            }
            System.out.println("Done");
            return;
        }

        ProcessBuilder pb = ProcessTools.createTestJavaProcessBuilder(
                "-Xlog:class+load", "NoUnusedProviderLoad", "run");
        OutputAnalyzer out = ProcessTools.executeProcess(pb);
        out.shouldHaveExitValue(0);
        out.shouldContain("Done");
        for (String provider : PROVIDER_CLASSES) {
            out.shouldNotContain(provider + " source:");
        }
    }
}
