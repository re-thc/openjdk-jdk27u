/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Application and URLClassLoader callers of exploded directory resources
 * @library /test/lib
 * @modules java.base/sun.net.www
 *          java.base/sun.net.www.protocol.file
 * @run main FileLoaderCallers
 */

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.jar.Attributes;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;
import java.util.jar.Manifest;

import jdk.test.lib.process.ProcessTools;
import sun.net.www.ParseUtil;

@SuppressWarnings("deprecation")
public class FileLoaderCallers {
    private static final String NORMAL = "fileloader.fixture.Normal";
    private static final String SEALED = "fileloader.fixture.Sealed";
    private static final String JAR_CLASS = "fileloader.sealed.JarClass";
    private static final String EXPLODED = "fileloader.sealed.Exploded";
    private static final String AFTER_CLOSE = "fileloader.after.Close";
    private static final byte[] DATA = "public file resource".getBytes(StandardCharsets.UTF_8);
    // The default charset can be UTF-8 while Unix filenames use ASCII.
    private static final Charset FILE_NAME_CHARSET =
            Charset.forName(System.getProperty("sun.jnu.encoding"));

    private static List<String> classes() {
        List<String> names = new ArrayList<>(List.of(NORMAL, "fileloader.fixture.Other",
                "fileloader.names.sp ace", "fileloader.names.literal%20",
                "fileloader.names.non\u00e9"));
        if (File.separatorChar == '/') {
            names.addAll(List.of("fileloader.names.colon:name", "fileloader.names.question?name",
                    "fileloader.names.hash#name", "fileloader.names.back\\slash"));
        }
        names.removeIf(name -> !FILE_NAME_CHARSET.newEncoder().canEncode(name));
        return names;
    }

    private static List<String> resources() {
        List<String> names = new ArrayList<>(List.of("fileloader/plain.txt",
                "fileloader/sp ace.txt", "fileloader/literal%20.txt", "fileloader/non\u00e9.txt"));
        if (File.separatorChar == '/') {
            names.addAll(List.of("fileloader/colon:name.txt", "fileloader/question?name.txt",
                    "fileloader/hash#name.txt", "fileloader/back\\slash.txt"));
        }
        names.removeIf(name -> !FILE_NAME_CHARSET.newEncoder().canEncode(name));
        return names;
    }

    public static void main(String[] args) throws Exception {
        System.out.println("Filesystem charset: " + FILE_NAME_CHARSET.name());
        if (args.length > 0) {
            verify(ClassLoader.getSystemClassLoader(), Path.of(args[0]).toUri().toURL(),
                    Path.of(args[1]).toUri().toURL());
            System.out.println("Application exploded classes and resources verified");
            return;
        }
        Path root = Files.createTempDirectory(Path.of("."), "fileloader-callers-").toRealPath();
        try {
            Path dir = Files.createDirectories(root.resolve("late"));
            for (String cn : classes()) writeClass(dir, cn);
            writeClass(dir, EXPLODED);
            writeClass(dir, AFTER_CLOSE);
            for (String name : resources()) {
                Path file = dir.resolve(name);
                Files.createDirectories(file.getParent());
                Files.write(file, DATA);
            }
            Path jar = root.resolve("sealed.jar");
            Manifest manifest = new Manifest();
            manifest.getMainAttributes().put(Attributes.Name.MANIFEST_VERSION, "1.0");
            manifest.getMainAttributes().put(Attributes.Name.SEALED, "true");
            manifest.getMainAttributes().put(Attributes.Name.IMPLEMENTATION_TITLE, "jar fixture");
            try (var out = new JarOutputStream(Files.newOutputStream(jar), manifest)) {
                for (String cn : List.of(SEALED, JAR_CLASS)) {
                    out.putNextEntry(new JarEntry(cn.replace('.', '/') + ".class"));
                    out.write(classBytes(cn));
                    out.closeEntry();
                }
            }
            // Existing empty and nonexistent entries both precede the late hit.
            Path empty = Files.createDirectory(root.resolve("empty"));
            Path missing = root.resolve("missing");
            URL[] urls = {directoryURL(missing), directoryURL(empty), dir.toUri().toURL(),
                    jar.toUri().toURL()};
            try (URLClassLoader loader = new URLClassLoader(urls, ClassLoader.getPlatformClassLoader())) {
                verify(loader, dir.toUri().toURL(), jar.toUri().toURL());
                closeAndConcurrency(loader);
            }
            // A /./ base must keep the original URL as the code source.
            URL dotted = new URL(dir.toUri().toURL() + "./");
            try (var loader = new URLClassLoader(new URL[] {dotted}, ClassLoader.getPlatformClassLoader())) {
                Class<?> c = loader.loadClass(NORMAL);
                check(c.getProtectionDomain().getCodeSource().getLocation().toExternalForm()
                        .equals(dotted.toExternalForm()), "dotted code source");
                check(loader.getResource("fileloader/plain.txt") != null, "/./ resource");
            }
            RejectingHandler rejecting = new RejectingHandler();
            URL custom = new URL(null, dir.toUri().toURL().toExternalForm(), rejecting);
            try (var loader = new URLClassLoader(new URL[] {custom}, ClassLoader.getPlatformClassLoader())) {
                expectMissing(loader, NORMAL);
                check(loader.getResource("fileloader/plain.txt") == null, "custom handler resource");
                // These still exercise UTF-8 URL parsing when the filesystem
                // cannot represent the non-ASCII class/resource filenames.
                expectMissing(loader, "fileloader.names.non\u00e9");
                check(loader.getResource("fileloader/non\u00e9.txt") == null, "non-ASCII rejection");
                check(rejecting.rejections >= 4, "custom parse rejection before class/byte access");
            }

            String cp = String.join(File.pathSeparator, missing.toString(), empty.toString(),
                    dir.toString(), jar.toString(), System.getProperty("test.classes"));
            ProcessTools.executeProcess(ProcessTools.createTestJavaProcessBuilder(
                    "--add-exports=java.base/sun.net.www=ALL-UNNAMED",
                    "--add-exports=java.base/sun.net.www.protocol.file=ALL-UNNAMED",
                    "-cp", cp, "FileLoaderCallers", dir.toString(), jar.toString()))
                    .shouldHaveExitValue(0)
                    .shouldContain("Application exploded classes and resources verified");
        } finally {
            try (var files = Files.walk(root)) {
                for (Path p : files.sorted(java.util.Comparator.reverseOrder()).toList()) {
                    Files.deleteIfExists(p);
                }
            }
        }
    }

    private static URL directoryURL(Path path) throws Exception {
        String url = path.toUri().toURL().toExternalForm();
        return new URL(url.endsWith("/") ? url : url + "/");
    }

    private static void verify(ClassLoader loader, URL base, URL jar) throws Exception {
        for (String cn : classes()) {
            Class<?> type = Class.forName(cn, false, loader);
            check(type.getClassLoader() == loader, "defining loader " + cn);
            check(type.getProtectionDomain().getCodeSource().getLocation().toExternalForm()
                    .equals(base.toExternalForm()), "code source " + cn);
            Package pkg = type.getPackage();
            check(!pkg.isSealed() && pkg.getImplementationTitle() == null
                    && pkg.getSpecificationTitle() == null, "directory package metadata " + cn);
        }
        expectMissing(loader, "fileloader.fixture.Absent");
        expectMissing(loader, "fileloader.names.missing\u00e9");
        expectSealing(loader, SEALED);
        Class<?> sealed = Class.forName(JAR_CLASS, false, loader);
        check(sealed.getPackage().isSealed(jar)
                && "jar fixture".equals(sealed.getPackage().getImplementationTitle()), "jar metadata");
        expectSealing(loader, EXPLODED);
        for (String name : resources()) {
            URL expected = new URL(base, ParseUtil.encodePath(name, false));
            URL url = loader.getResource(name);
            check(url != null && url.toExternalForm().equals(expected.toExternalForm()),
                    "public URL " + name);
            try (InputStream in = loader.getResourceAsStream(name)) {
                check(in != null && Arrays.equals(in.readAllBytes(), DATA), "public bytes " + name);
            }
            var all = loader.getResources(name);
            check(all.hasMoreElements() && all.nextElement().toExternalForm()
                    .equals(expected.toExternalForm()) && !all.hasMoreElements(), "enumeration " + name);
        }
        check(loader.getResource("fileloader/missing.txt") == null, "resource miss");
        check(loader.getResource("fileloader/missing\u00e9.txt") == null, "non-ASCII resource miss");
        check(loader.getResourceAsStream("fileloader/missing.txt") == null, "stream miss");
    }

    private static void closeAndConcurrency(URLClassLoader loader) throws Exception {
        InputStream tracked = loader.getResourceAsStream("fileloader/plain.txt");
        check(tracked != null && tracked.read() >= 0, "tracked public stream");
        CountDownLatch start = new CountDownLatch(1);
        try (var pool = Executors.newFixedThreadPool(5)) {
            List<Callable<Void>> tasks = new ArrayList<>();
            for (int thread = 0; thread < 4; thread++) {
                tasks.add(() -> {
                    start.await();
                    for (int i = 0; i < 100; i++) {
                        URL u = loader.getResource("fileloader/plain.txt");
                        if (u != null) check(u.getPath().endsWith("/fileloader/plain.txt"), "race URL");
                        check(loader.loadClass(NORMAL).getName().equals(NORMAL), "loaded class after close");
                    }
                    return null;
                });
            }
            tasks.add(() -> { start.await(); loader.close(); return null; });
            start.countDown();
            for (var result : pool.invokeAll(tasks)) result.get();
        } finally {
            loader.close();
        }
        try {
            tracked.read();
            throw new AssertionError("URLClassLoader.close must close public resource stream");
        } catch (IOException expected) {
        } finally {
            tracked.close();
        }
        expectMissing(loader, AFTER_CLOSE);
        check(loader.getResource("fileloader/plain.txt") == null, "resource after close");
    }

    private static class RejectingHandler extends sun.net.www.protocol.file.Handler {
        int rejections;
        protected void parseURL(URL u, String spec, int start, int limit) {
            if (spec.equals(NORMAL.replace('.', '/') + ".class")
                    || spec.equals("fileloader/plain.txt")
                    || spec.equals("fileloader/names/non%c3%a9.class")
                    || spec.equals("fileloader/non%c3%a9.txt")) {
                rejections++;
                throw new IllegalArgumentException("reject");
            }
            super.parseURL(u, spec, start, limit);
        }
    }

    private static void expectMissing(ClassLoader loader, String cn) throws Exception {
        try {
            Class.forName(cn, false, loader);
            throw new AssertionError("Expected missing " + cn);
        } catch (ClassNotFoundException expected) { }
    }

    private static void expectSealing(ClassLoader loader, String cn) throws Exception {
        try {
            Class.forName(cn, false, loader);
            throw new AssertionError("Expected sealing failure " + cn);
        } catch (SecurityException expected) {
            check(expected.getMessage().startsWith("sealing violation"), "sealing error");
        }
    }

    private static byte[] classBytes(String cn) {
        return ClassFile.of().build(ClassDesc.of(cn), cb -> { });
    }

    private static void writeClass(Path dir, String cn) throws IOException {
        Path file = dir.resolve(cn.replace('.', '/') + ".class");
        Files.createDirectories(file.getParent());
        Files.write(file, classBytes(cn));
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
