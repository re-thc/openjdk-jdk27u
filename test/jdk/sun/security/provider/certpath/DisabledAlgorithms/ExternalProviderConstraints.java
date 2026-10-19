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
 * @summary External provider aliases cannot bypass weak certificate algorithm policy
 * @enablePreview
 * @modules java.base/sun.security.provider.certpath
 *          java.base/sun.security.util java.base/sun.security.x509
 * @build CPBuilder CPBuilderWithMD5
 * @run main/othervm ExternalProviderConstraints MD2 canonical
 * @run main/othervm ExternalProviderConstraints MD2 oid
 * @run main/othervm ExternalProviderConstraints MD2 alias
 * @run main/othervm ExternalProviderConstraints MD5 canonical
 * @run main/othervm ExternalProviderConstraints MD5 oid
 * @run main/othervm ExternalProviderConstraints MD5 alias
 */

import java.security.CryptoPrimitive;
import java.security.PEMDecoder;
import java.security.Provider;
import java.security.Security;
import java.security.cert.CertPathValidatorException;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.Set;

import sun.security.provider.certpath.AlgorithmChecker;
import sun.security.util.DisabledAlgorithmConstraints;
import sun.security.x509.AlgorithmId;

public class ExternalProviderConstraints {
    public static void main(String[] args) throws Exception {
        String digest = args[0];
        String algorithm = digest + "withRSA";
        String oid = "1.2.840.113549.1.1." + (digest.equals("MD2") ? "2" : "4");
        String serviceName = switch (args[1]) {
            case "canonical" -> algorithm;
            case "oid" -> oid;
            case "alias" -> "ExternalDigestwithRSA";
            default -> throw new IllegalArgumentException(args[1]);
        };
        Provider provider = new Provider("ExternalSignature", "1", "OID policy test") {};
        // Only service metadata is needed: AlgorithmChecker checks policy
        // before signature verification and must not trust a provider's name.
        provider.put("Signature." + serviceName, "UnusedSignatureSpi");
        if (!serviceName.equals(oid)) {
            provider.put("Alg.Alias.Signature." + oid, serviceName);
            provider.put("Alg.Alias.Signature.OID." + oid, serviceName);
        }
        Security.addProvider(provider);
        try {
            if (provider.getService("Signature", oid) == null) {
                throw new AssertionError("External signature service not registered");
            }
            for (String property : new String[] {
                    "jdk.certpath.disabledAlgorithms", "jdk.jar.disabledAlgorithms"}) {
                if (Arrays.stream(Security.getProperty(property).split(","))
                        .map(String::strip).noneMatch(digest::equals)) {
                    throw new AssertionError(property + " does not prohibit " + digest);
                }
            }
            String pem = digest.equals("MD2")
                    ? CPBuilder.intermediate_MD2withRSA_1024_1024
                    : CPBuilderWithMD5.intermediate_MD5withRSA_1024_1024;
            X509Certificate cert = PEMDecoder.of().decode(pem, X509Certificate.class);
            if (!cert.getSigAlgName().equals(algorithm)) {
                throw new AssertionError("OID lost its policy name: " + cert.getSigAlgName());
            }
            String digestOid = "1.2.840.113549.2." + (digest.equals("MD2") ? "2" : "5");
            if (!AlgorithmId.get(digestOid).getName().equals(digest)) {
                throw new AssertionError("Digest OID lost its policy name");
            }
            AlgorithmChecker checker = new AlgorithmChecker(
                    DisabledAlgorithmConstraints.certPathConstraints(), "generic");
            checker.init(false);
            try {
                checker.check(cert, Set.of());
                throw new AssertionError("External provider bypassed " + digest + " policy");
            } catch (CertPathValidatorException expected) {
                if (expected.getReason() !=
                        CertPathValidatorException.BasicReason.ALGORITHM_CONSTRAINED) {
                    throw expected;
                }
            }
            // Check the JAR policy itself; ordinary JAR verification restricts
            // its provider list, so this does not claim an external JAR bypass.
            if (DisabledAlgorithmConstraints.jarConstraints().permits(
                    EnumSet.of(CryptoPrimitive.SIGNATURE), algorithm, null)) {
                throw new AssertionError("JAR policy permits " + algorithm);
            }
        } finally {
            Security.removeProvider(provider.getName());
        }
    }
}
