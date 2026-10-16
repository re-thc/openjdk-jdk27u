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
 * @summary Test that the number of class path entries to skip is kept for
 *          a limited number of directories, and that lookups stay correct
 *          when the limit is reached
 * @modules java.base/java.net:open java.base/jdk.internal.loader:open
 * @run main SkippedDirectories
 */

import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.reflect.Field;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;

public class SkippedDirectories {

    private static final int LIMIT = 4096;

    private static class Loader extends URLClassLoader {
        Loader(URL... urls) {
            super(urls, null);
        }

        void add(URL url) {
            addURL(url);
        }
    }

    public static void main(String[] args) throws Exception {
        Path a = jar("a.jar", "a.A");
        Path b = jar("b.jar", "b.B");
        Path c = jar("c.jar", "m1.X", "m" + (2 * LIMIT) + ".X");
        try (Loader loader = new Loader(a.toUri().toURL(), b.toUri().toURL())) {
            // more misses than the JAR files have entries, so that they can be skipped
            for (int i = 0; i < 4; i++) {
                missing(loader, "a.Missing" + i);
            }
            for (int i = 0; i < 2 * LIMIT + 1; i++) {
                missing(loader, "m" + i + ".X");
            }
            int size = skippedDirectories(loader).size();
            // one thread looks up, so the limit is exact
            if (size != LIMIT) {
                throw new RuntimeException(size + " directories kept, expected " + LIMIT);
            }

            // the lookups are the same for directories that are kept or not
            found(loader, "a.A", a);
            found(loader, "b.B", b);
            loader.add(c.toUri().toURL());
            found(loader, "m1.X", c);
            found(loader, "m" + (2 * LIMIT) + ".X", c);
            missing(loader, "m2.X");
        }
    }

    private static Map<?, ?> skippedDirectories(URLClassLoader loader) throws Exception {
        Field ucp = URLClassLoader.class.getDeclaredField("ucp");
        ucp.setAccessible(true);
        Object path = ucp.get(loader);
        Field skipped = path.getClass().getDeclaredField("skippedLoaders");
        skipped.setAccessible(true);
        return (Map<?, ?>) skipped.get(path);
    }

    private static void found(Loader loader, String name, Path expected) throws Exception {
        Class<?> c = loader.loadClass(name);
        Path actual = Path.of(c.getProtectionDomain().getCodeSource().getLocation().toURI());
        if (!actual.equals(expected.toAbsolutePath())) {
            throw new RuntimeException(name + " loaded from " + actual + ", expected " + expected);
        }
    }

    private static void missing(Loader loader, String name) {
        try {
            loader.loadClass(name);
            throw new RuntimeException(name + " should not be found");
        } catch (ClassNotFoundException expected) {
        }
    }

    private static Path jar(String name, String... classes) throws Exception {
        Path path = Path.of(name);
        try (JarOutputStream out = new JarOutputStream(Files.newOutputStream(path))) {
            for (String cn : classes) {
                out.putNextEntry(new JarEntry(cn.replace('.', '/') + ".class"));
                out.write(ClassFile.of().build(ClassDesc.of(cn), cb -> {}));
                out.closeEntry();
            }
        }
        return path;
    }
}
