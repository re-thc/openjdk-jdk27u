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
 *          load what only the unused ciphers, the Ed25519 and Ed448
 *          signatures, and PKCS#9 attributes need
 * @library /test/lib
 * @run main NoUnusedTableLoad
 */

import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLEngine;
import javax.security.auth.x500.X500Principal;
import java.util.List;

import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class NoUnusedTableLoad {

    // Ciphers that no default cipher suite uses, the parameters of
    // Ed25519 and Ed448, and the attributes of PKCS#9
    private static final List<String> CLASSES = List.of(
            "com.sun.crypto.provider.DESCipher",
            "com.sun.crypto.provider.DESedeCipher",
            "com.sun.crypto.provider.ARCFOURCipher",
            "sun.security.ec.ed.EdDSAParameters",
            "sun.security.pkcs.PKCS9Attribute");

    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            SSLContext ctx = SSLContext.getInstance("TLS");
            ctx.init(null, null, null);
            SSLEngine engine = ctx.createSSLEngine();
            if (engine.getEnabledProtocols().length == 0
                    || engine.getEnabledCipherSuites().length == 0
                    || engine.getSSLParameters().getSignatureSchemes()
                            .length == 0) {
                throw new RuntimeException("Nothing enabled");
            }
            // converting a name to a string uses the keywords of attributes
            String name = new X500Principal("CN=localhost, O=Example, C=US")
                    .getName();
            if (!name.equals("CN=localhost,O=Example,C=US")) {
                throw new RuntimeException("Unexpected name " + name);
            }
            System.out.println("Done");
            return;
        }

        ProcessBuilder pb = ProcessTools.createTestJavaProcessBuilder(
                "-Xlog:class+load", "NoUnusedTableLoad", "run");
        OutputAnalyzer out = ProcessTools.executeProcess(pb);
        out.shouldHaveExitValue(0);
        out.shouldContain("Done");
        for (String c : CLASSES) {
            out.shouldNotContain(c + " source:");
        }
    }
}
