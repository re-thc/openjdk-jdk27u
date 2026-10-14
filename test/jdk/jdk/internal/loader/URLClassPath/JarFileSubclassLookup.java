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
 * @summary Test that resources supplied by a JarFile subclass from a custom
 *          JarURLConnection, which are not entries of its ZIP file, are still
 *          found once the JAR file has missed many lookups
 * @run main JarFileSubclassLookup
 */

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.net.JarURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLClassLoader;
import java.net.URLConnection;
import java.net.URLStreamHandler;
import java.net.URLStreamHandlerFactory;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.jar.JarOutputStream;
import java.util.zip.CRC32;
import java.util.zip.ZipEntry;

public class JarFileSubclassLookup {

    // Names that are not in the JAR file, to make the loader miss
    private static final int MISSES = 100;

    // Entries of the JarFile subclass, in directories the ZIP file has no entries in
    private static final String ROOT_RESOURCE = "root.txt";
    private static final String DIR_RESOURCE = "synthetic/dir.txt";
    private static final String EARLY_CLASS = "synthetic.Early";
    private static final String LATE_CLASS = "synthetic.Late";

    // A JarFile with entries in addition to the ones of its ZIP file
    private static class SyntheticJarFile extends JarFile {
        private final Map<String, byte[]> synthetic;

        SyntheticJarFile(Path file, Map<String, byte[]> synthetic) throws IOException {
            super(file.toFile());
            this.synthetic = synthetic;
        }

        @Override
        public ZipEntry getEntry(String name) {
            byte[] bytes = synthetic.get(name);
            if (bytes == null) {
                return super.getEntry(name);
            }
            JarEntry entry = new JarEntry(name);
            CRC32 crc = new CRC32();
            crc.update(bytes);
            entry.setCrc(crc.getValue());
            entry.setSize(bytes.length);
            return entry;
        }

        @Override
        public JarEntry getJarEntry(String name) {
            return (JarEntry) getEntry(name);
        }

        @Override
        public InputStream getInputStream(ZipEntry entry) throws IOException {
            byte[] bytes = synthetic.get(entry.getName());
            if (bytes == null) {
                return super.getInputStream(entry);
            }
            return new ByteArrayInputStream(bytes);
        }
    }

    // A connection that supplies the JarFile subclass
    private static class SyntheticConnection extends JarURLConnection {
        private final JarFile jarFile;

        SyntheticConnection(URL url, JarFile jarFile) throws IOException {
            super(url);
            this.jarFile = jarFile;
        }

        @Override
        public void connect() {
        }

        @Override
        public JarFile getJarFile() {
            return jarFile;
        }
    }

    public static void main(String[] args) throws Exception {
        Path jar = Path.of("real.jar");
        createJar(jar, "real.Real");

        Map<String, byte[]> synthetic = Map.of(
                ROOT_RESOURCE, "root".getBytes(),
                DIR_RESOURCE, "dir".getBytes(),
                classFileName(EARLY_CLASS), classBytes(EARLY_CLASS),
                classFileName(LATE_CLASS), classBytes(LATE_CLASS));

        // The URL is not a file URL, so the JAR file comes from the connection
        URL url = URI.create("http://synthetic.invalid/real.jar").toURL();
        URLStreamHandler handler = new URLStreamHandler() {
            @Override
            protected URLConnection openConnection(URL u) throws IOException {
                return new SyntheticConnection(u, new SyntheticJarFile(jar, synthetic));
            }
        };
        URLStreamHandlerFactory factory = protocol -> "jar".equals(protocol) ? handler : null;

        try (var loader = new URLClassLoader(new URL[] { url }, null, factory)) {
            // before the JAR file has missed any lookup
            checkFound(loader, ROOT_RESOURCE);
            checkFound(loader, DIR_RESOURCE);
            checkFound(loader, "real/Real.class");
            loader.loadClass(EARLY_CLASS);
            loader.loadClass("real.Real");

            // more lookups than the JAR file has entries, so that it
            // would be looked up by the directories of its ZIP file
            for (int i = 0; i < MISSES; i++) {
                checkMissing(loader, "missing/" + i + "/Missing.class");
                checkMissing(loader, "real/Missing" + i + ".class");
                checkMissing(loader, "Missing" + i);
            }

            checkFound(loader, ROOT_RESOURCE);
            checkFound(loader, DIR_RESOURCE);
            checkFound(loader, "real/Real.class");
            checkFound(loader, classFileName(LATE_CLASS));
            Class<?> late = loader.loadClass(LATE_CLASS);
            if (late.getClassLoader() != loader) {
                throw new AssertionError(late + " is loaded by " + late.getClassLoader());
            }
            checkMissing(loader, "synthetic/Missing.class");
            checkMissing(loader, "synthetic");
        }
    }

    // Checks that the resource is found by all the ways to look it up
    private static void checkFound(URLClassLoader loader, String name) throws IOException {
        URL url = loader.findResource(name);
        if (url == null || !url.toString().endsWith("real.jar!/" + name)) {
            throw new AssertionError("findResource(\"" + name + "\") is " + url);
        }
        if (loader.getResource(name) == null) {
            throw new AssertionError("getResource(\"" + name + "\") is null");
        }
        List<URL> found = Collections.list(loader.findResources(name));
        if (found.size() != 1 || !found.get(0).equals(url)) {
            throw new AssertionError("findResources(\"" + name + "\") is " + found);
        }
        found = Collections.list(loader.getResources(name));
        if (found.size() != 1 || !found.get(0).equals(url)) {
            throw new AssertionError("getResources(\"" + name + "\") is " + found);
        }
    }

    private static void checkMissing(URLClassLoader loader, String name) throws IOException {
        if (loader.findResource(name) != null || loader.getResource(name) != null
                || loader.findResources(name).hasMoreElements()) {
            throw new AssertionError(name + " is found");
        }
    }

    private static String classFileName(String className) {
        return className.replace('.', '/') + ".class";
    }

    private static byte[] classBytes(String className) {
        return ClassFile.of().build(ClassDesc.of(className), cb -> { });
    }

    private static void createJar(Path jar, String... classes) throws IOException {
        try (var out = new JarOutputStream(Files.newOutputStream(jar))) {
            for (String name : classes) {
                out.putNextEntry(new JarEntry(classFileName(name)));
                out.write(classBytes(name));
                out.closeEntry();
            }
        }
    }
}
