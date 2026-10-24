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
 * @summary XDH service discovery preserves ServiceLoader and legacy fallback
 *          when a provider fails initialization
 * @library /test/lib
 * @build CustomXDHParameters ChangingXDHParameters
 * @run driver XDHProviderFallbacks
 */

import java.nio.file.Files;
import java.nio.file.Path;
import java.security.Provider;
import java.security.ProviderException;
import java.security.Security;
import javax.tools.ToolProvider;

import jdk.test.lib.process.ProcessTools;

public class XDHProviderFallbacks {
    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            if (args[0].equals("service")) {
                int n = 1;
                while (Security.getProperty("security.provider." + n) != null) {
                    n++;
                }
                Security.setProperty("security.provider." + n,
                        "UnconfiguredXDH argument");
                ChangingXDHParameters.check("ConfiguredXDH");
            } else {
                ChangingXDHParameters.check("SunSASL");
            }
            System.out.println("Passed " + args[0]);
            return;
        }
        Path services = Files.createDirectories(Path.of("service-providers"));
        Path config = services.resolve("META-INF/services/java.security.Provider");
        Files.createDirectories(config.getParent());
        Files.writeString(config, BrokenProvider.class.getName() + "\n" +
                ChangingXDHParameters.ConfigurableProvider.class.getName() + "\n");
        String classes = System.getProperty("test.classes");
        ProcessTools.executeTestJava("-cp", classes + java.io.File.pathSeparator +
                services, "XDHProviderFallbacks", "service")
                .shouldHaveExitValue(0).shouldContain("Passed service");

        Path patchSource = Files.createDirectories(Path.of("patch-source"));
        Path source = patchSource.resolve("com/sun/security/sasl/Provider.java");
        Files.createDirectories(source.getParent());
        Files.writeString(source, """
                package com.sun.security.sasl;
                public class Provider extends java.security.Provider {
                    public Provider() {
                        super("SunSASL", "1", "Failing provider");
                        throw new java.security.ProviderException("Initialization failed");
                    }
                }
                """);
        Path patch = Files.createDirectories(Path.of("patch-provider"));
        compile("--patch-module", "java.security.sasl=" + patchSource,
                "-d", patch.toString(), source.toString());
        Path legacy = Files.createDirectories(Path.of("legacy-provider"));
        Path legacySource = legacy.resolve("SunSASL.java");
        Files.writeString(legacySource, """
                public class SunSASL extends ChangingXDHParameters.ParametersProvider {
                    public SunSASL() {
                        super("SunSASL", CustomXDHParameters.XDHParameters.class.getName());
                    }
                }
                """);
        compile("-classpath", classes, "-d", legacy.toString(), legacySource.toString());
        ProcessTools.executeTestJava("--patch-module", "java.security.sasl=" + patch,
                "-cp", classes + java.io.File.pathSeparator + legacy,
                "XDHProviderFallbacks", "legacy")
                .shouldHaveExitValue(0).shouldContain("Passed legacy");

        // A patched module can keep both the JDK module and provider class
        // names while supplying entirely different services.
        Files.writeString(source, """
                package com.sun.security.sasl;
                import java.security.*;
                import java.security.spec.*;
                import java.io.IOException;
                public class Provider extends java.security.Provider {
                    public Provider() {
                        super("SunSASL", "1", "Replacement with XDH parameters");
                        putService(new Service(this, "AlgorithmParameters", "XDH",
                                Params.class.getName(), null, null) {
                            public Object newInstance(Object unused) { return new Params(); }
                        });
                    }
                    public static class Params extends AlgorithmParametersSpi {
                        private NamedParameterSpec spec;
                        protected void engineInit(AlgorithmParameterSpec s)
                                throws InvalidParameterSpecException {
                            spec = (NamedParameterSpec) s;
                        }
                        protected void engineInit(byte[] s) throws IOException {
                            throw new IOException();
                        }
                        protected void engineInit(byte[] s, String f) throws IOException {
                            throw new IOException();
                        }
                        protected <T extends AlgorithmParameterSpec> T engineGetParameterSpec(Class<T> c) {
                            return c.cast(spec);
                        }
                        protected byte[] engineGetEncoded() throws IOException { throw new IOException(); }
                        protected byte[] engineGetEncoded(String f) throws IOException { throw new IOException(); }
                        protected String engineToString() { return spec.getName(); }
                    }
                }
                """);
        Path replacement = Files.createDirectories(Path.of("replacement-provider"));
        compile("--patch-module", "java.security.sasl=" + patchSource,
                "-d", replacement.toString(), source.toString());
        ProcessTools.executeTestJava("--patch-module", "java.security.sasl=" + replacement,
                "-cp", classes, "XDHProviderFallbacks", "replacement")
                .shouldHaveExitValue(0).shouldContain("Passed replacement");
    }

    private static void compile(String... args) {
        int exit = ToolProvider.getSystemJavaCompiler().run(null, null, null, args);
        if (exit != 0) {
            throw new AssertionError("Compilation failed: " + exit);
        }
    }

    public static class BrokenProvider extends Provider {
        public BrokenProvider() {
            super("BrokenXDH", "1.0", "Fails to initialize");
            throw new ProviderException("Initialization failed");
        }
    }
}
