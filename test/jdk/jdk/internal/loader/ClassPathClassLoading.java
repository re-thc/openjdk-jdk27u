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
 * @summary Test loading classes from JAR files on the class path with the
 *          application class loader: the sealing of packages by the manifest
 *          of the JAR file and the source of the classes logged by the VM
 * @library /test/lib
 * @run main ClassPathClassLoading
 */

import java.io.File;
import java.io.IOException;
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.Attributes;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;
import java.util.jar.Manifest;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class ClassPathClassLoading {

    // The classes that are loaded, in order, and the JAR file with the class
    // or null if loading it fails because a package is sealed
    private static final String[][] CLASSES = {
        { "p.A", "unsealed.jar" },
        { "p.B", null },            // seals the package after it is defined
        { "p.E", "otherentry.jar" },
        { "q.D", "unsealed.jar" },
        { "q.C", null },            // main attribute
        { "r.G", "unsealed.jar" },
        { "r.F", "override.jar" },  // a package is sealed by an entry of the manifest
        { "s.H", "unsealed.jar" },
    };

    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            ClassLoader loader = ClassLoader.getSystemClassLoader();
            for (String[] c : CLASSES) {
                try {
                    loader.loadClass(c[0]);
                    if (c[1] == null) {
                        throw new AssertionError(c[0] + " is loaded");
                    }
                } catch (SecurityException e) {
                    if (c[1] != null || !e.getMessage().startsWith("sealing violation")) {
                        throw e;
                    }
                }
            }
            return;
        }

        createJar("unsealed.jar", null, null, "p.A", "q.D", "r.G", "s.H");
        createJar("entrysealed.jar", null, "p/", "p.B");
        createJar("mainsealed.jar", "true", null, "q.C");
        createJar("otherentry.jar", null, "other/", "p.E");
        // an entry of the manifest overrides the main attributes
        createJar("override.jar", "true", "r/", "r.F");

        String cp = String.join(File.pathSeparator, "unsealed.jar", "entrysealed.jar",
                "mainsealed.jar", "otherentry.jar", "override.jar", System.getProperty("test.classes"));
        OutputAnalyzer output = ProcessTools.executeProcess(ProcessTools.createTestJavaProcessBuilder(
                "-Xlog:class+load=info:stdout:none", "-cp", cp, "ClassPathClassLoading", "test"))
            .shouldHaveExitValue(0);

        Pattern source = Pattern.compile("(\\S+) source: (\\S+)");
        List<String> logged = new ArrayList<>();
        for (String line : output.asLines()) {
            Matcher m = source.matcher(line);
            if (m.matches() && m.group(2).startsWith("file:")) {
                logged.add(m.group(1) + " " + m.group(2));
            }
        }
        List<String> expected = new ArrayList<>();
        for (String[] c : CLASSES) {
            if (c[1] != null) {
                expected.add(c[0] + " " + Path.of(c[1]).toRealPath().toFile().toURI().toURL());
            }
        }
        for (String e : expected) {
            if (!logged.contains(e)) {
                throw new AssertionError("Expected \"" + e + "\" in " + logged);
            }
        }
    }

    // The package entry, if present, overrides the main sealing attribute.
    private static void createJar(String name, String sealed, String entry, String... classes)
            throws IOException {
        Manifest man = new Manifest();
        Attributes main = man.getMainAttributes();
        main.put(Attributes.Name.MANIFEST_VERSION, "1.0");
        if (sealed != null) {
            main.put(Attributes.Name.SEALED, sealed);
        }
        if (entry != null) {
            Attributes attrs = new Attributes();
            attrs.put(Attributes.Name.SEALED, sealed == null ? "true" : "false");
            man.getEntries().put(entry, attrs);
        }
        try (var out = new JarOutputStream(Files.newOutputStream(Path.of(name)), man)) {
            for (String cn : classes) {
                out.putNextEntry(new JarEntry(cn.replace('.', '/') + ".class"));
                out.write(ClassFile.of().build(ClassDesc.of(cn), cb -> { }));
                out.closeEntry();
            }
        }
    }
}
