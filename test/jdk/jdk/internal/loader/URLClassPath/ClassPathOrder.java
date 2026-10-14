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
 * @summary Test that classes and resources are found in class path order,
 *          before and after the class path entries have missed enough
 *          lookups to be skipped, with Class-Path attributes, directories,
 *          jar: URLs, multi-release JAR files, URLs added after lookups,
 *          a closed loader, a JAR file replaced while it is open and
 *          directories with the same hash code
 * @run main ClassPathOrder
 */

import java.io.IOException;
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.net.URI;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.jar.Attributes;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;
import java.util.jar.Manifest;

public class ClassPathOrder {

    // More than the entries of any JAR file, so that all have missed enough
    private static final int MISSES = 50;

    private static class Loader extends URLClassLoader {
        Loader(URL... urls) {
            super(urls, ClassLoader.getPlatformClassLoader());
        }

        void add(URL url) {
            addURL(url);
        }
    }

    public static void main(String[] args) throws Exception {
        Path dir = Path.of("cp").toAbsolutePath();
        Files.createDirectories(dir);

        // a.jar names c.jar in its Class-Path attribute, so c.jar is searched
        // right after a.jar
        Path a = jar(dir.resolve("a.jar"), "c.jar", false,
                     "p/C.class", "p/r.txt");
        Path c = jar(dir.resolve("c.jar"), null, false,
                     "p/C.class", "q/D.class", "p/r.txt");
        Path d = dir.resolve("dirent");
        file(d, "p/r.txt");
        file(d, "q/E.class");
        Path b = jar(dir.resolve("b.jar"), null, true,
                     "META-INF/versions/9/v/V.class", "p/r.txt");
        // added with a jar: URL
        Path e = jar(dir.resolve("e.jar"), null, false,
                     "w/W.class", "q/D.class", "p/r.txt");
        // added after the lookups
        Path f = jar(dir.resolve("f.jar"), null, false,
                     "z/Z.class", "p/r.txt");

        URL[] urls = {
            a.toUri().toURL(),
            d.toUri().toURL(),
            b.toUri().toURL(),
            URI.create("jar:" + e.toUri() + "!/").toURL()
        };
        for (boolean missFirst : new boolean[] { false, true }) {
            Loader loader = new Loader(urls);
            if (missFirst) {
                miss(loader);
            }
            checkClass(loader, "p.C", a);
            checkClass(loader, "q.D", c);
            checkClass(loader, "q.E", d);
            checkClass(loader, "v.V", b);
            checkClass(loader, "w.W", e);
            checkResources(loader, "p/r.txt", a, c, d, b, e);
            checkResources(loader, "v/V.class", b);
            checkResources(loader, "z/Z.class");
            checkMissing(loader, "z.Z");

            loader.add(f.toUri().toURL());
            checkClass(loader, "z.Z", f);
            checkResources(loader, "z/Z.class", f);
            checkResources(loader, "p/r.txt", a, c, d, b, e, f);

            loader.close();
            checkMissing(loader, "p.C2");
            if (loader.getResource("p/r.txt") != null) {
                throw new RuntimeException("Resource found after close");
            }
        }

        // "Aa" and "BB" have the same hash code, so the JAR file with one of
        // them cannot be skipped for the other but must not find it
        Path h1 = jar(dir.resolve("h1.jar"), null, false, "Aa/C.class", "Aa/r.txt");
        Path h2 = jar(dir.resolve("h2.jar"), null, false, "BB/C.class", "BB/r.txt");
        try (Loader loader = new Loader(h1.toUri().toURL(), h2.toUri().toURL())) {
            miss(loader);
            for (int i = 0; i < MISSES; i++) {
                checkMissing(loader, "Aa.Missing" + i);
                checkMissing(loader, "BB.Missing" + i);
            }
            checkClass(loader, "BB.C", h2);
            checkClass(loader, "Aa.C", h1);
            checkResources(loader, "BB/r.txt", h2);
            checkResources(loader, "Aa/r.txt", h1);
            checkResources(loader, "BB/C.class", h2);
        }

        // A JAR file replaced while it is open keeps the entries it had
        if (!System.getProperty("os.name").startsWith("Windows")) {
            Path g = jar(dir.resolve("g.jar"), null, false, "u/U.class");
            Path g2 = jar(dir.resolve("g2.jar"), null, false, "u/U2.class");
            try (Loader loader = new Loader(g.toUri().toURL())) {
                miss(loader);
                Files.move(g2, g, StandardCopyOption.REPLACE_EXISTING,
                           StandardCopyOption.ATOMIC_MOVE);
                checkClass(loader, "u.U", g);
                checkMissing(loader, "u.U2");
            }
            try (Loader loader = new Loader(g.toUri().toURL())) {
                miss(loader);
                checkMissing(loader, "u.U");
                checkClass(loader, "u.U2", g);
            }
        }
    }

    // Makes all entries miss lookups in all directories, including ones they have
    private static void miss(Loader loader) {
        for (int i = 0; i < MISSES; i++) {
            for (String pkg : new String[] { "p", "q", "u", "v", "w", "x", "z" }) {
                checkMissing(loader, pkg + ".Missing" + i);
                if (loader.getResource(pkg + "/missing" + i) != null) {
                    throw new RuntimeException("Unexpected resource");
                }
            }
        }
    }

    private static void checkClass(Loader loader, String name, Path expected)
            throws Exception {
        Class<?> c = loader.loadClass(name);
        URL location = c.getProtectionDomain().getCodeSource().getLocation();
        Path actual = Path.of(location.toURI());
        if (!actual.equals(expected)) {
            throw new RuntimeException(name + " loaded from " + actual
                                       + ", expected " + expected);
        }
    }

    private static void checkMissing(Loader loader, String name) {
        try {
            loader.loadClass(name);
            throw new RuntimeException(name + " should not be found");
        } catch (ClassNotFoundException expected) {
        }
    }

    // Checks that the resource is found in the given entries, in this order
    private static void checkResources(Loader loader, String name, Path... expected)
            throws IOException {
        List<URL> urls = Collections.list(loader.getResources(name));
        List<String> actual = new ArrayList<>();
        for (URL url : urls) {
            actual.add(url.toString());
        }
        boolean ok = actual.size() == expected.length;
        for (int i = 0; ok && i < expected.length; i++) {
            ok = actual.get(i).contains("/" + expected[i].getFileName()
                                        + (isJar(expected[i]) ? "!/" : "/"));
        }
        URL first = loader.getResource(name);
        if (expected.length == 0 ? first != null : !urls.get(0).equals(first)) {
            ok = false;
        }
        if (!ok) {
            throw new RuntimeException(name + " found in " + actual + " and "
                                       + first + ", expected " + List.of(expected));
        }
    }

    private static boolean isJar(Path p) {
        return p.getFileName().toString().endsWith(".jar");
    }

    private static Path jar(Path path, String classPath, boolean multiRelease,
                            String... entries) throws IOException {
        Manifest man = new Manifest();
        Attributes attrs = man.getMainAttributes();
        attrs.put(Attributes.Name.MANIFEST_VERSION, "1.0");
        if (classPath != null) {
            attrs.put(Attributes.Name.CLASS_PATH, classPath);
        }
        if (multiRelease) {
            attrs.put(Attributes.Name.MULTI_RELEASE, "true");
        }
        try (JarOutputStream out = new JarOutputStream(Files.newOutputStream(path), man)) {
            for (String entry : entries) {
                out.putNextEntry(new JarEntry(entry));
                out.write(content(entry));
                out.closeEntry();
            }
        }
        return path;
    }

    private static void file(Path dir, String name) throws IOException {
        Path p = dir.resolve(name);
        Files.createDirectories(p.getParent());
        Files.write(p, content(name));
    }

    private static byte[] content(String entry) {
        if (!entry.endsWith(".class")) {
            return entry.getBytes();
        }
        String name = entry.replaceFirst("^META-INF/versions/[0-9]+/", "");
        name = name.substring(0, name.length() - ".class".length()).replace('/', '.');
        return ClassFile.of().build(ClassDesc.of(name), cb -> {});
    }
}
