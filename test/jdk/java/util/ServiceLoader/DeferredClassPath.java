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
 * @summary Module providers precede classpath discovery, including direct next and reload
 * @modules jdk.zipfs
 * @run main/othervm DeferredClassPath
 */

import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.spi.FileSystemProvider;
import java.util.ConcurrentModificationException;
import java.util.Enumeration;
import java.util.ServiceConfigurationError;
import java.util.ServiceLoader;

public class DeferredClassPath {
    public static void main(String[] args) throws Exception {
        Path config = Files.createTempFile(Path.of("."), "providers", ".txt");
        try {
            Files.writeString(config, "not.a.RealProvider\nnot.a.RealProvider\n");
            class Loader extends ClassLoader {
                int searches;
                Loader() { super(ClassLoader.getSystemClassLoader()); }
                @Override
                public Enumeration<URL> getResources(String name) throws java.io.IOException {
                    if (name.equals("META-INF/services/" + FileSystemProvider.class.getName())) {
                        searches++;
                        return java.util.Collections.enumeration(java.util.List.of(config.toUri().toURL()));
                    }
                    return super.getResources(name);
                }
            }
            Loader loader = new Loader();
            var services = ServiceLoader.load(FileSystemProvider.class, loader);
            var iterator = services.iterator();
            if (!iterator.next().getClass().getModule().isNamed() || loader.searches != 0) {
                throw new AssertionError("direct next/module-first");
            }
            var stream = services.stream().iterator();
            if (!stream.hasNext() || !stream.hasNext() || loader.searches != 0) {
                throw new AssertionError("stream independence");
            }
            stream.next();
            boolean error = false;
            try {
                while (iterator.hasNext()) iterator.next();
            } catch (ServiceConfigurationError expected) {
                error = true;
            }
            if (!error || loader.searches == 0) throw new AssertionError("classpath error timing");
            services.reload();
            try {
                iterator.hasNext();
                throw new AssertionError("iterator did not fail fast");
            } catch (ConcurrentModificationException expected) { }
            try {
                stream.hasNext();
                throw new AssertionError("stream did not fail fast");
            } catch (ConcurrentModificationException expected) { }
            if (!services.findFirst().orElseThrow().getClass().getModule().isNamed()) {
                throw new AssertionError("reload");
            }
        } finally {
            Files.delete(config);
        }
    }
}
