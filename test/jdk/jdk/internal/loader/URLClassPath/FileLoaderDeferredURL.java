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
 * @summary File resources preserve eager parsing semantics when their URL is deferred
 * @modules java.base/jdk.internal.loader
 *          java.base/sun.net.www
 *          java.base/sun.net.www.protocol.file
 * @run main/othervm --add-opens java.base/jdk.internal.loader=ALL-UNNAMED FileLoaderDeferredURL
 */

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandler;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.Executors;

import jdk.internal.loader.Resource;
import jdk.internal.loader.URLClassPath;
import sun.net.www.ParseUtil;

@SuppressWarnings("deprecation")
public class FileLoaderDeferredURL {
    // For differential runs against the original revision; normal jtreg runs
    // assert deferral as well as the observable behavior.
    private static final boolean EXPECT_DEFERRED =
            Boolean.parseBoolean(System.getProperty("fileloader.expectDeferred", "true"));
    private static final byte[] DATA = "file resource data".getBytes(StandardCharsets.UTF_8);
    private static final Charset FILE_NAME_CHARSET =
            Charset.forName(System.getProperty("sun.jnu.encoding"));
    private static int comparisons;

    public static void main(String[] args) throws Exception {
        System.out.println("Filesystem charset: " + FILE_NAME_CHARSET.name());
        Path root = Files.createTempDirectory(Path.of("."), "fileloader-").toRealPath();
        try {
            Path dir = Files.createDirectories(root.resolve("base"));
            Files.createDirectories(dir.resolve("sub"));
            for (String name : List.of("plain.bin", "sp ace", "non-\u00e9", "literal%20",
                    "100%", "a..b", ".hidden", "under_$-score", "sub/nested.bin")) {
                if (FILE_NAME_CHARSET.newEncoder().canEncode(name)) {
                    Files.write(dir.resolve(name), DATA);
                }
            }
            // These are legal Unix filenames but some cannot exist on Windows.
            if (File.separatorChar == '/') {
                for (String name : List.of("colon:name", "q?name", "h#name", "back\\slash")) {
                    Files.write(dir.resolve(name), DATA);
                }
            }
            Files.write(root.resolve("outside.bin"), DATA);
            URL base = dir.toUri().toURL();
            List<URL> bases = new ArrayList<>(List.of(base,
                    new URL(base + "./"), new URL(base + "sub/../"),
                    new URL(base + "/"), new URL(base + "#non-\u00e9"),
                    new URL(base + "?query/"),
                    new URL("file", "localhost", base.getPath()),
                    new URL("file", "", 81, base.getPath()),
                    new URL("file://user@localhost" + base.getPath()),
                    new URL(base.toString().replace("/base/", "/%62ase/"))));
            for (String special : List.of("space base", "\u00e9-base", "percent%base")) {
                if (!FILE_NAME_CHARSET.newEncoder().canEncode(special)) {
                    continue;
                }
                Path other = Files.createDirectory(root.resolve(special));
                Files.write(other.resolve("plain.bin"), DATA);
                bases.add(other.toUri().toURL());
            }
            List<String> names = List.of("plain.bin", "missing.bin", "sub/nested.bin",
                    "sub/missing.bin", "sp ace", "sp%20ace", "non-\u00e9", "literal%20",
                    "100%", "colon:name", "file:plain.bin", "http:plain.bin", "q?name",
                    "h#name", "", "/plain.bin", base.getPath() + "plain.bin", ".", "..",
                    "./plain.bin", "sub/../plain.bin", "../outside.bin",
                    "sub/../../outside.bin", "a..b", ".hidden", "under_$-score", "sub/",
                    "sub//nested.bin", "sub/./nested.bin", "back\\slash", "..\\outside.bin",
                    "C:/plain.bin", "C:\\plain.bin", "C:plain.bin", "\\\\server\\share\\file",
                    "//server/share/file", "plain.bin/", "\u0000invalid", "%2e%2e/outside.bin");
            for (URL b : bases) {
                for (String name : names) {
                    compare(b, name);
                }
            }
            for (String windows : List.of("file:/C:/normal/base/", "file:/C|/base/",
                    "file://server/share/base/", "file:////server/share/base/")) {
                compare(new URL(windows), "plain.bin");
                assertBaseIneligible(new URL(windows));
            }
            lazyAndLifecycle(base, dir);
            rejectingHandlers(base);
            symlinks(root, dir, base);
            System.out.println("FileLoader differential comparisons: " + comparisons);
            System.out.println("Native filesystem: " + System.getProperty("os.name")
                    + "; Windows drive/UNC native coverage requires a Windows run");
        } finally {
            removeTree(root);
        }
    }

    // Snapshot of the original eager algorithm, including its existing prefix
    // rules and canonicalization. This is an oracle for deliberately odd names,
    // not a proposed replacement containment policy.
    private record Eager(URL url, File file) { }

    private static Eager eager(URL base, String name) {
        try {
            File dir = new File(ParseUtil.decode(base.getFile()
                    .replace('/', File.separatorChar))).getCanonicalFile();
            URL normalized = new URL(base, ".");
            URL url = new URL(base, ParseUtil.encodePath(name, false));
            if (!url.getFile().startsWith(normalized.getFile())) {
                return null;
            }
            File file;
            if (name.contains("..")) {
                file = new File(dir, name.replace('/', File.separatorChar)).getCanonicalFile();
                if (!file.getPath().startsWith(dir.getPath())) {
                    return null;
                }
            } else {
                file = new File(dir, name.replace('/', File.separatorChar));
            }
            return file.exists() ? new Eager(url, file) : null;
        } catch (Exception e) {
            return null;
        }
    }

    private static void compare(URL base, String name) throws Exception {
        Eager expected = eager(base, name);
        URLClassPath path = new URLClassPath(new URL[] {base});
        try {
            Resource actual = path.getResource(name);
            check((actual == null) == (expected == null), "presence " + base + " / " + name);
            if (actual != null) {
                check(actual.getName().equals(name), "name");
                check(actual.getCodeSourceURL() == base, "code source identity");
                check(actual.getCodeSource().getLocation() == base, "CodeSource location");
                check(actual.getContentLength() == (int) expected.file.length(), "length");
                check(actual.getURL().toExternalForm().equals(expected.url.toExternalForm()),
                        "URL " + base + " / " + name);
                if (expected.file.isFile()) {
                    check(Arrays.equals(actual.getBytes(), Files.readAllBytes(expected.file.toPath())),
                            "bytes " + name);
                } else {
                    expectIOException(actual::getInputStream);
                }
            }
            URL found = path.findResource(name);
            check((found == null) == (expected == null), "public resource presence " + name);
            if (found != null) {
                check(found.toExternalForm().equals(expected.url.toExternalForm()), "public URL");
            }
            comparisons++;
        } finally {
            path.closeLoaders();
        }
    }

    private static void assertBaseIneligible(URL base) throws Exception {
        if (!EXPECT_DEFERRED) {
            return;
        }
        URLClassPath path = new URLClassPath(new URL[] {base});
        try {
            path.getResource("missing.bin");
            Field loaders = URLClassPath.class.getDeclaredField("loaders");
            loaders.setAccessible(true);
            for (Object loader : (List<?>) loaders.get(path)) {
                Field eligible = loader.getClass().getDeclaredField("deferResourceURL");
                eligible.setAccessible(true);
                check(!eligible.getBoolean(loader), "ineligible base " + base);
            }
        } finally {
            path.closeLoaders();
        }
    }

    private static Field urlField(Resource resource) {
        for (Field f : resource.getClass().getDeclaredFields()) {
            if (f.getType() == URL.class) {
                f.setAccessible(true);
                return f;
            }
        }
        throw new AssertionError("No resource URL field");
    }

    private static void lazyAndLifecycle(URL base, Path dir) throws Exception {
        URLClassPath path = new URLClassPath(new URL[] {base});
        try {
            Resource resource = path.getResource("plain.bin");
            check(resource != null, "normal resource");
            boolean deferred = EXPECT_DEFERRED && File.separatorChar == '/'
                    && base.getPath().matches("/[a-zA-Z0-9_$/.-]+/");
            Field url = urlField(resource);
            check((url.get(resource) == null) == deferred, "initial URL deferral");
            resource.getCodeSource();
            resource.getContentLength();
            check(Arrays.equals(resource.getBytes(), DATA), "class-definition bytes");
            check((url.get(resource) == null) == deferred, "bytes must not request URL");
            Field cis = Resource.class.getDeclaredField("cis");
            cis.setAccessible(true);
            expectIOException(() -> { ((InputStream) cis.get(resource)).read(); return null; });

            try (var pool = Executors.newFixedThreadPool(8)) {
                List<Callable<URL>> calls = new ArrayList<>();
                for (int i = 0; i < 64; i++) calls.add(resource::getURL);
                URL first = null;
                for (var result : pool.invokeAll(calls)) {
                    URL value = result.get();
                    if (first == null) first = value;
                    check(value == first, "concurrent URL identity");
                }
                check(first.toExternalForm().equals(new URL(base, "plain.bin").toExternalForm()),
                        "concurrent URL value");
            }

            Path mutable = dir.resolve("mutable.bin");
            check(path.getResource("mutable.bin") == null, "initial miss");
            Files.write(mutable, DATA);
            Resource retained = path.getResource("mutable.bin");
            check(retained != null, "created after miss: no negative cache");
            try (InputStream open = retained.getInputStream()) {
                path.closeLoaders();
                check(Arrays.equals(open.readAllBytes(), DATA), "open Resource stream after close");
            }
            check(path.getResource("plain.bin") == null, "new lookup after close");
            Files.write(mutable, new byte[] {1, 2, 3});
            check(retained.getContentLength() == 3, "live length");
            Files.delete(mutable);
            check(retained.getURL().toExternalForm().equals(new URL(base, "mutable.bin").toExternalForm()),
                    "retained URL after close and deletion");
            try {
                retained.getInputStream();
                throw new AssertionError("Expected delayed open failure");
            } catch (FileNotFoundException expected) { }

            // Even fallback Resources must retain the same URL object.
            for (URL b : List.of(new URL(base + "./"), new URL(base + "#ref"))) {
                URLClassPath fallback = new URLClassPath(new URL[] {b});
                try {
                    Resource r = fallback.getResource("plain.bin");
                    check(urlField(r).get(r) != null, "eager unusual base");
                    check(r.getURL() == r.getURL(), "eager URL identity");
                } finally {
                    fallback.closeLoaders();
                }
            }
        } finally {
            path.closeLoaders();
        }
    }

    private static class RejectingSubclass extends sun.net.www.protocol.file.Handler {
        int calls;
        String lastSpec;
        protected void parseURL(URL u, String spec, int start, int limit) {
            calls++;
            lastSpec = spec;
            if (spec.equals("plain.bin") || spec.equals("missing.bin")
                    || spec.equals("non-%c3%a9")) {
                throw new IllegalArgumentException("reject resource");
            }
            super.parseURL(u, spec, start, limit);
        }
    }

    private static void rejectingHandlers(URL base) throws Exception {
        RejectingSubclass handler = new RejectingSubclass();
        URL custom = new URL(null, base.toExternalForm(), handler);
        URLClassPath path = new URLClassPath(new URL[] {custom});
        try {
            check(path.getResource("plain.bin") == null, "subclass rejects existing resource eagerly");
            int before = handler.calls;
            check(path.getResource("missing.bin") == null, "subclass rejects miss eagerly");
            check(handler.calls == before + 1, "parse still called on miss");
            before = handler.calls;
            check(path.getResource("non-\u00e9") == null, "non-ASCII name rejected eagerly");
            check(handler.calls == before + 1 && handler.lastSpec.equals("non-%c3%a9"),
                    "UTF-8 URL parsing is independent of the filesystem charset");
        } finally {
            path.closeLoaders();
        }
        URLStreamHandler unrelated = new URLStreamHandler() {
            protected URLConnection openConnection(URL u) { throw new AssertionError(); }
            protected void parseURL(URL u, String spec, int start, int limit) {
                if (spec.equals("plain.bin")) throw new IllegalArgumentException("reject");
                super.parseURL(u, spec, start, limit);
            }
        };
        URLClassPath other = new URLClassPath(new URL[] {
                new URL(null, base.toExternalForm(), unrelated)});
        try {
            check(other.getResource("plain.bin") == null, "unrelated handler rejection");
        } finally {
            other.closeLoaders();
        }
    }

    private static void symlinks(Path root, Path dir, URL base) throws Exception {
        Path outside = Files.createDirectory(root.resolve("outside"));
        Files.write(outside.resolve("plain.bin"), DATA);
        try {
            Files.createSymbolicLink(dir.resolve("link"), outside);
            Files.createSymbolicLink(root.resolve("alias"), dir);
        } catch (IOException | UnsupportedOperationException | SecurityException e) {
            System.out.println("Symlink setup unavailable: " + e);
            return;
        }
        compare(base, "link/plain.bin");
        compare(base, "link/../outside.bin");
        compare(root.resolve("alias").toUri().toURL(), "plain.bin");
        URLClassPath path = new URLClassPath(new URL[] {base});
        try {
            check(path.getResource("link/plain.bin") != null, "existing symlink behavior");
        } finally {
            path.closeLoaders();
        }
    }

    private static void removeTree(Path root) throws IOException {
        try (var files = Files.walk(root)) {
            for (Path p : files.sorted(java.util.Comparator.reverseOrder()).toList()) {
                Files.deleteIfExists(p);
            }
        }
    }

    private static void expectIOException(Callable<?> action) throws Exception {
        try {
            Object value = action.call();
            if (value instanceof InputStream in) in.close();
            throw new AssertionError("Expected IOException");
        } catch (IOException expected) { }
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
