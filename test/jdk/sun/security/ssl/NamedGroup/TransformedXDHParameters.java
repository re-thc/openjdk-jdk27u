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
 * @summary Initial class transformation of a JDK provider preserves XDH lookup
 *          and the application's actual named-group constraint decisions
 * @library /test/lib
 * @modules java.instrument java.security.sasl
 * @build CustomXDHParameters ChangingXDHParameters
 * @run driver TransformedXDHParameters
 */

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.Attributes;
import java.util.jar.Manifest;
import javax.tools.ToolProvider;
import jdk.test.lib.process.ProcessTools;
import jdk.test.lib.util.JarUtils;

public class TransformedXDHParameters {
    public static void main(String[] args) throws Exception {
        Path source = Path.of(System.getProperty("test.src"), "transformed");
        Path agentClasses = Files.createDirectories(Path.of("agent-classes"));
        Path helperClasses = Files.createDirectories(Path.of("helper-classes"));
        Path probeClasses = Files.createDirectories(Path.of("probe-classes"));
        String classes = System.getProperty("test.classes");
        compile("-d", agentClasses.toString(), source.resolve("Agent.java").toString());
        compile("-d", helperClasses.toString(), source.resolve("Bridge.java").toString());
        compile("--add-exports", "java.base/jdk.internal.module=ALL-UNNAMED",
                "-cp", classes, "-d", probeClasses.toString(),
                source.resolve("XDHTransformationProbe.java").toString());
        Manifest manifest = new Manifest();
        manifest.getMainAttributes().put(Attributes.Name.MANIFEST_VERSION, "1.0");
        manifest.getMainAttributes().putValue("Premain-Class", "xdhagent.Agent");
        Path agentJar = Path.of("agent.jar").toAbsolutePath();
        Path helperJar = Path.of("helper.jar").toAbsolutePath();
        JarUtils.createJarFile(agentJar, manifest, agentClasses, Path.of("."));
        JarUtils.createJarFile(helperJar, helperClasses);
        String cp = classes + File.pathSeparator + probeClasses;
        List<String> failures = new ArrayList<>();
        for (boolean supplied : new boolean[] {false, true}) {
            for (String mode : new String[] {"lookup", "hello", "mutation", "concurrent"}) {
                if (!supplied && (mode.equals("mutation") || mode.equals("concurrent"))) continue;
                for (String protocol : mode.equals("hello") ?
                        List.of("TLSv1.2", "TLSv1.3") : List.of("TLSv1.3")) {
                    List<String> command = new ArrayList<>(List.of(
                            "--add-modules", "java.instrument,java.security.sasl",
                            "--add-exports", "java.base/jdk.internal.module=ALL-UNNAMED",
                            "-Djdk.tls.client.protocols=" + protocol));
                    if (supplied) command.add("-javaagent:" + agentJar + "=" + helperJar);
                    command.addAll(List.of("-cp", cp, "XDHTransformationProbe",
                            mode, Boolean.toString(supplied)));
                    var result = ProcessTools.executeTestJava(command);
                    String caseName = mode + "-" + supplied + "-" + protocol;
                    Files.writeString(Path.of(caseName + ".stdout"), result.getStdout());
                    Files.writeString(Path.of(caseName + ".stderr"), result.getStderr());
                    System.out.println(caseName + " exit=" + result.getExitValue());
                    System.out.print(result.getStdout());
                    System.err.print(result.getStderr());
                    if (result.getExitValue() != 0) failures.add(mode + "/" + supplied + "/" + protocol);
                }
            }
        }
        if (!failures.isEmpty()) throw new AssertionError("Failed transformation cases: " + failures);
    }

    private static void compile(String... args) {
        int status = ToolProvider.getSystemJavaCompiler().run(null, null, null, args);
        if (status != 0) throw new AssertionError("Fixture compilation failed: " + status);
    }
}
