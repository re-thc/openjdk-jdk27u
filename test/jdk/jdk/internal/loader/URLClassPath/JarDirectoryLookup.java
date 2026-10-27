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
 * @summary Test finding resources in JAR files on the class path, which
 *          are looked up by directory once the JAR file has missed enough
 * @run main JarDirectoryLookup
 */

import java.io.IOException;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.jar.Attributes;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;
import java.util.jar.Manifest;

public class JarDirectoryLookup {

    private static final int MISSES = 100;

    public static void main(String[] args) throws Exception {
        Path plain = Path.of("plain.jar");
        createJar(plain, false,
                  "a.txt", "dir/", "dir/b.txt", "dir/sub/c.txt", "dup/same.txt", "p/q/R.txt");
        // directory entries only, so that the root and "x" have no entries of their own
        Path dirs = Path.of("dirs.jar");
        createJar(dirs, false,
                  "onlydir/", "x/y/");
        Path mr = Path.of("mr.jar");
        createJar(mr, true,
                  "m/Base.txt", "dup/same.txt",
                  "META-INF/versions/9/m/Base.txt", "META-INF/versions/9/m/Ver.txt",
                  "META-INF/versions/9/n/o/New.txt",
                  "META-INF/versions/9/v9.txt");

        try (var loader = new URLClassLoader(urls(plain, dirs, mr), null)) {
            for (int round = 0; round < 3; round++) {
                // the first round looks up before any JAR file has missed
                find(loader, "a.txt", "plain.jar!/a.txt");
                find(loader, "dir/b.txt", "plain.jar!/dir/b.txt");
                find(loader, "dir/sub/c.txt", "plain.jar!/dir/sub/c.txt");
                find(loader, "p/q/R.txt", "plain.jar!/p/q/R.txt");
                // a directory entry is found with and without the trailing '/'
                find(loader, "dir", "plain.jar!/dir");
                find(loader, "dir/", "plain.jar!/dir/");
                find(loader, "onlydir", "dirs.jar!/onlydir");
                find(loader, "onlydir/", "dirs.jar!/onlydir/");
                find(loader, "x/y", "dirs.jar!/x/y");
                find(loader, "x/y/", "dirs.jar!/x/y/");
                find(loader, "dir/sub", null);
                find(loader, "p", null);
                find(loader, "x", null);
                find(loader, "x/y/z", null);
                find(loader, "dir/nope.txt", null);
                find(loader, "nope/b.txt", null);
                find(loader, "b.txt", null);
                find(loader, "", null);
                // multi-release JAR file: versioned entries have their unversioned names
                find(loader, "m/Base.txt", "mr.jar!/META-INF/versions/9/m/Base.txt");
                find(loader, "m/Ver.txt", "mr.jar!/META-INF/versions/9/m/Ver.txt");
                find(loader, "n/o/New.txt", "mr.jar!/META-INF/versions/9/n/o/New.txt");
                find(loader, "v9.txt", "mr.jar!/META-INF/versions/9/v9.txt");
                find(loader, "n/o", null);
                find(loader, "META-INF/versions/9/m/Ver.txt",
                     "mr.jar!/META-INF/versions/9/m/Ver.txt");
                findAll(loader, "dup/same.txt", "plain.jar!/dup/same.txt", "mr.jar!/dup/same.txt");
                findAll(loader, "m/Base.txt", "mr.jar!/META-INF/versions/9/m/Base.txt");
                findAll(loader, "dir", "plain.jar!/dir");
                findAll(loader, "nope/b.txt");

                for (int i = 0; i < MISSES; i++) {
                    find(loader, "missing/" + i + "/Missing.class", null);
                    find(loader, "dir/missing" + i, null);
                }
            }
        }
    }

    private static void find(URLClassLoader loader, String name, String expected) {
        URL url = loader.findResource(name);
        String found = url == null ? null : url.toString();
        boolean ok = expected == null ? found == null : found != null && found.endsWith(expected);
        if (!ok) {
            throw new AssertionError("findResource(\"" + name + "\") is " + found
                                     + ", expected " + expected);
        }
    }

    private static void findAll(URLClassLoader loader, String name, String... expected)
            throws IOException {
        List<URL> urls = Collections.list(loader.findResources(name));
        List<URL> all = Collections.list(loader.getResources(name));
        if (!urls.equals(all) || urls.size() != expected.length) {
            throw new AssertionError("findResources(\"" + name + "\") is " + urls
                                     + ", getResources is " + all);
        }
        for (int i = 0; i < expected.length; i++) {
            if (!urls.get(i).toString().endsWith(expected[i])) {
                throw new AssertionError("findResources(\"" + name + "\") is " + urls
                                         + ", expected " + List.of(expected));
            }
        }
    }

    private static URL[] urls(Path... jars) throws IOException {
        List<URL> urls = new ArrayList<>();
        for (Path jar : jars) {
            urls.add(jar.toUri().toURL());
        }
        return urls.toArray(new URL[0]);
    }

    private static void createJar(Path jar, boolean multiRelease, String... entries)
            throws IOException {
        Manifest man = new Manifest();
        Attributes attrs = man.getMainAttributes();
        attrs.put(Attributes.Name.MANIFEST_VERSION, "1.0");
        if (multiRelease) {
            attrs.putValue("Multi-Release", "true");
        }
        try (var out = new JarOutputStream(Files.newOutputStream(jar), man)) {
            for (String name : entries) {
                out.putNextEntry(new JarEntry(name));
                if (!name.endsWith("/")) {
                    out.write(name.getBytes());
                }
                out.closeEntry();
            }
        }
    }
}
