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
 * @summary Test loading classes from JAR files on the class path, which are
 *          looked up in the JAR files that may have them once the others
 *          have missed enough
 * @run main JarClassLookup
 */

import java.io.IOException;
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;

public class JarClassLookup {

    // Each class name given for a JAR file stands for ROUNDS classes, one for
    // each round of loading, as a loader only looks up a class once
    private static final int ROUNDS = 3;

    // Names that are not in any JAR file, to make the loaders miss
    private static final int MISSES = 20;

    private static class Loader extends URLClassLoader {
        Loader(URL... urls) {
            super(urls, null);
        }

        void add(URL url) {
            addURL(url);
        }
    }

    public static void main(String[] args) throws Exception {
        // a JAR file with many entries is not looked up by directory
        Path big = Path.of("big.jar");
        List<String> filler = new ArrayList<>();
        for (int i = 0; i < 200; i++) {
            filler.add("filler.F" + i);
        }
        filler.add("m.Found");
        createJar(big, filler.toArray(new String[0]));
        Path small = Path.of("small.jar");
        createJar(small, "n.X");
        try (var loader = new Loader(url(big), url(small))) {
            for (int round = 0; round < ROUNDS; round++) {
                load(loader, "m.Found", round, big);
                load(loader, "n.X", round, small);
                for (int i = 0; i < MISSES; i++) {
                    missing(loader, "m.Missing" + i);
                    missing(loader, "n.Missing" + i);
                }
                // the JAR file after the big one has missed enough
                load(loader, "m.Found", round, big);
                load(loader, "n.X", round, small);
            }
        }

        Path one = Path.of("one.jar");
        createJar(one, "a.A", "a.b.B", "same.S", "p.Q");
        Path two = Path.of("two.jar");
        createJar(two, "b.A", "same.S", "same.T", "q.R");
        Path three = Path.of("three.jar");
        createJar(three, "c.C", "same.S", "same.T", "p.R", "r.S");
        Path four = Path.of("four.jar");
        createJar(four, "a.A", "a.b.C", "b.D", "c.D", "same.U", "p.S", "r.T", "s.U");

        try (var loader = new Loader(url(one), url(two), url(three))) {
            for (int round = 0; round < ROUNDS; round++) {
                // the first round loads before any JAR file has missed
                load(loader, "a.A", round, one);
                load(loader, "a.b.B", round, one);
                load(loader, "b.A", round, two);
                load(loader, "c.C", round, three);
                // the first JAR file with the class has it
                load(loader, "same.S", round, one);
                load(loader, "same.T", round, two);
                load(loader, "p.Q", round, one);
                load(loader, "p.R", round, three);
                load(loader, "q.R", round, two);
                load(loader, "r.S", round, three);
                // there are no such classes, some even in a package that exists
                for (String name : new String[] { "a.B", "a.b.A", "b.B", "c.A", "same.A",
                                                  "p.A", "q.Q", "r.R", "s.A", "A" }) {
                    missing(loader, name);
                }
                for (int i = 0; i < MISSES; i++) {
                    missing(loader, "missing" + i + ".Missing");
                    missing(loader, "a.Missing" + i);
                    missing(loader, "p.Missing" + i);
                }
            }

            // a JAR file added to the class path is searched after the others
            loader.add(url(four));
            for (int round = 0; round < ROUNDS; round++) {
                load(loader, "a.A", round, one);
                load(loader, "a.b.C", round, four);
                load(loader, "b.D", round, four);
                load(loader, "c.D", round, four);
                load(loader, "same.U", round, four);
                load(loader, "same.S", round, one);
                load(loader, "p.S", round, four);
                load(loader, "r.T", round, four);
                load(loader, "s.U", round, four);
                load(loader, "q.R", round, two);
                load(loader, "r.S", round, three);
                missing(loader, "s.A");
                for (int i = 0; i < MISSES; i++) {
                    missing(loader, "a.Missing" + i);
                    missing(loader, "s.Missing" + i);
                }
            }
        }
    }

    // Checks that the class of the round is loaded from the JAR file
    private static void load(Loader loader, String name, int round, Path jar) throws Exception {
        Class<?> c = loader.loadClass(name + round);
        String location = c.getProtectionDomain().getCodeSource().getLocation().toString();
        if (!location.endsWith("/" + jar.getFileName())) {
            throw new AssertionError(c + " is loaded from " + location + ", expected " + jar);
        }
    }

    private static void missing(Loader loader, String name) {
        try {
            Class<?> c = loader.loadClass(name);
            throw new AssertionError(c + " is loaded from "
                    + c.getProtectionDomain().getCodeSource().getLocation());
        } catch (ClassNotFoundException expected) {
        }
    }

    private static URL url(Path jar) throws IOException {
        return jar.toUri().toURL();
    }

    private static void createJar(Path jar, String... classes) throws IOException {
        try (var out = new JarOutputStream(Files.newOutputStream(jar))) {
            for (String name : classes) {
                for (int round = 0; round < ROUNDS; round++) {
                    String cn = name + round;
                    out.putNextEntry(new JarEntry(cn.replace('.', '/') + ".class"));
                    out.write(ClassFile.of().build(ClassDesc.of(cn), cb -> { }));
                    out.closeEntry();
                }
            }
        }
    }
}
