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
 * @summary Test that a resource of a JAR file is not found if the jar
 *          handler of the class loader cannot make its URL, also with a
 *          subclass of the built-in jar handler
 * @modules java.base/sun.net.www.protocol.jar
 * @run main JarHandlerURLs
 */

import java.io.IOException;
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.net.URL;
import java.net.URLClassLoader;
import java.net.URLConnection;
import java.net.URLStreamHandler;
import java.net.URLStreamHandlerFactory;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;

public class JarHandlerURLs {

    // A jar handler that cannot make URLs for names with "Bad"
    private static class Handler extends URLStreamHandler {
        @Override
        protected URLConnection openConnection(URL u) throws IOException {
            throw new IOException("Not supported");
        }

        @Override
        protected void parseURL(URL u, String spec, int start, int limit) {
            String name = spec.substring(start, limit);
            if (name.contains("Bad")) {
                throw new IllegalArgumentException("Bad name: " + name);
            }
            setURL(u, "jar", "", -1, null, null, u.getFile() + name, null, null);
        }
    }

    // A subclass of the built-in jar handler that cannot make URLs for names with "Bad"
    private static class BuiltinHandler extends sun.net.www.protocol.jar.Handler {
        @Override
        protected void parseURL(URL u, String spec, int start, int limit) {
            String name = spec.substring(start, limit);
            if (name.contains("Bad")) {
                throw new IllegalArgumentException("Bad name: " + name);
            }
            super.parseURL(u, spec, start, limit);
        }
    }

    public static void main(String[] args) throws Exception {
        Path jar = Path.of("handler.jar");
        try (JarOutputStream out = new JarOutputStream(Files.newOutputStream(jar))) {
            for (String cn : new String[] { "p.Good", "p.Bad" }) {
                out.putNextEntry(new JarEntry(cn.replace('.', '/') + ".class"));
                out.write(ClassFile.of().build(ClassDesc.of(cn), cb -> {}));
                out.closeEntry();
            }
        }

        test(jar, new Handler());
        test(jar, new BuiltinHandler());
    }

    private static void test(Path jar, URLStreamHandler handler) throws Exception {
        URLStreamHandlerFactory factory = p -> "jar".equals(p) ? handler : null;
        URL[] urls = { jar.toUri().toURL() };
        try (URLClassLoader loader = new URLClassLoader(urls, null, factory)) {
            for (int i = 0; i < 2; i++) {
                loader.loadClass("p.Good");
                if (loader.getResource("p/Good.class") == null) {
                    throw new RuntimeException("p/Good.class not found");
                }
                try {
                    loader.loadClass("p.Bad");
                    throw new RuntimeException("p.Bad should not be found");
                } catch (ClassNotFoundException expected) {
                }
                if (loader.getResource("p/Bad.class") != null
                        || loader.getResources("p/Bad.class").hasMoreElements()) {
                    throw new RuntimeException("p/Bad.class should not be found");
                }
                // make the JAR file miss more lookups than it has entries
                for (int j = 0; j < 10; j++) {
                    if (loader.getResource("p/Missing" + j + ".class") != null) {
                        throw new RuntimeException("Unexpected resource");
                    }
                }
            }
        }
    }
}
