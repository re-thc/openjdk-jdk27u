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
 * @summary Check that the ModuleReader of a system module finds the resources in
 *          META-INF when the module has them and only then, by comparing it with
 *          what the jrt file system has in the module
 * @run main SystemModuleMetaInfTest
 */

import java.lang.module.ModuleFinder;
import java.lang.module.ModuleReader;
import java.lang.module.ModuleReference;
import java.net.URI;
import java.net.URL;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Stream;

public class SystemModuleMetaInfTest {

    private static final String FSP = "META-INF/services/java.nio.file.spi.FileSystemProvider";

    // names to look for, in a module that has them or not
    private static final List<String> NAMES = List.of(
            FSP,
            "META-INF/services/not.a.Service",
            "META-INF/services/",
            "META-INF/services",
            "META-INF/MANIFEST.MF",
            "META-INF/",
            "META-INF",
            "META-INF/preview/META-INF/services/java.nio.file.spi.FileSystemProvider",
            "META-INF/versions/9/x.txt",
            "module-info.class",
            "java/lang/Object.class");

    public static void main(String[] args) throws Exception {
        FileSystem jrt = FileSystems.getFileSystem(URI.create("jrt:/"));
        Set<ModuleReference> modules = ModuleFinder.ofSystem().findAll();
        int withMetaInf = 0;
        boolean javaBase = false;
        for (ModuleReference mref : modules) {
            String name = mref.descriptor().name();
            Path root = jrt.getPath("/modules", name);
            boolean hasMetaInf = Files.isDirectory(root.resolve("META-INF"));
            if (hasMetaInf) {
                withMetaInf++;
            }
            // looking up the names twice, the first lookup may find out about the directory
            try (ModuleReader reader = mref.open()) {
                for (int round = 0; round < 2; round++) {
                    for (String resource : NAMES) {
                        Optional<URI> found = reader.find(resource);
                        // a resource in the file system is a file, and the directories are not resources
                        boolean expected = !resource.endsWith("/")
                                && Files.isRegularFile(root.resolve(resource));
                        if (found.isPresent() != expected) {
                            throw new AssertionError(name + ": find(\"" + resource + "\") is "
                                                     + found + ", expected " + expected);
                        }
                        if (expected && !found.get().equals(URI.create("jrt:/" + name + "/" + resource))) {
                            throw new AssertionError(name + ": find(\"" + resource + "\") is " + found);
                        }
                    }
                }
                // every file in META-INF, if there is a directory
                if (hasMetaInf) {
                    List<Path> files = new ArrayList<>();
                    try (Stream<Path> walk = Files.walk(root.resolve("META-INF"))) {
                        walk.filter(Files::isRegularFile).forEach(files::add);
                    }
                    for (Path file : files) {
                        String resource = root.relativize(file).toString();
                        if (resource.startsWith("META-INF/preview/")) {
                            continue;
                        }
                        if (reader.find(resource).isEmpty()) {
                            throw new AssertionError(name + ": " + resource + " is not found");
                        }
                        try (var in = reader.open(resource).orElseThrow()) {
                            if (!Arrays.equals(in.readAllBytes(), Files.readAllBytes(file))) {
                                throw new AssertionError(name + ": " + resource + " has other content");
                            }
                        }
                    }
                    if (name.equals("java.base")) {
                        javaBase = files.stream().anyMatch(f -> f.endsWith("java.nio.file.spi.FileSystemProvider"));
                    }
                }
            }
        }
        if (!javaBase) {
            throw new AssertionError("java.base has no " + FSP);
        }
        // not all of the modules have a META-INF directory, or a test for it is not needed
        if (withMetaInf == modules.size()) {
            throw new AssertionError("all " + withMetaInf + " modules have META-INF");
        }
        System.out.println(withMetaInf + " of " + modules.size() + " system modules have META-INF");

        // the class loaders find the file that the module has, once more when asked again
        for (int i = 0; i < 2; i++) {
            List<URL> urls = Collections.list(ClassLoader.getSystemResources(FSP));
            if (urls.size() != 1 || !urls.get(0).toString().equals("jrt:/java.base/" + FSP)) {
                throw new AssertionError("getSystemResources: " + urls);
            }
            urls = Collections.list(ClassLoader.getPlatformClassLoader().getResources(FSP));
            if (urls.size() != 1 || !urls.get(0).toString().equals("jrt:/java.base/" + FSP)) {
                throw new AssertionError("getResources of the platform class loader: " + urls);
            }
            urls = Collections.list(ClassLoader.getSystemResources("META-INF/services/not.a.Service"));
            if (!urls.isEmpty()) {
                throw new AssertionError("getSystemResources: " + urls);
            }
        }
    }
}
