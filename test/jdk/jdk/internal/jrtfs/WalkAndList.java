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
 * @summary Walking and listing the jrt file system gives the same tree
 *          whichever way it is done, in any order, and from many threads
 * @run main/othervm -esa WalkAndList
 * @run main/othervm -esa WalkAndList cold
 */

import java.io.IOException;
import java.net.URI;
import java.nio.file.DirectoryStream;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class WalkAndList {

    private static final FileSystem FS = FileSystems.getFileSystem(URI.create("jrt:/"));

    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            // Nothing has looked at the file system yet, so the threads are
            // the first to build and complete its directories
            testColdThreads();
            return;
        }

        // The directories under /packages are not yet looked at by anything
        // here, as when a tool walks the package tree as the first thing it does.
        List<String> packagesWalk = walk("/packages");
        check(packagesWalk.contains("/packages/java.lang/java.base"), "no java.lang link in the walk");

        testPackages();
        testListings();
        testWalkIsListing("/packages", packagesWalk);
        testWalkIsListing("/modules", null);
        testThreads();
    }

    /** The links of the package directories lead to the modules that have the package. */
    private static void testPackages() throws IOException {
        Path packages = FS.getPath("/packages");
        List<Path> pkgDirs = list(packages);
        check(pkgDirs.size() > 100, "packages: " + pkgDirs.size());
        check(pkgDirs.contains(FS.getPath("/packages/java.lang")), "no java.lang package");
        check(new HashSet<>(pkgDirs).size() == pkgDirs.size(), "package directories are repeated");

        int links = 0;
        for (Path pkgDir : pkgDirs) {
            BasicFileAttributes attrs = Files.readAttributes(pkgDir, BasicFileAttributes.class, LinkOption.NOFOLLOW_LINKS);
            check(attrs.isDirectory() && !attrs.isSymbolicLink(), "not a directory: " + pkgDir);
            check(pkgDir.getParent().equals(packages), "parent of " + pkgDir);

            List<Path> pkgLinks = list(pkgDir);
            check(!pkgLinks.isEmpty(), "no modules for " + pkgDir);
            check(new HashSet<>(pkgLinks).size() == pkgLinks.size(), "links are repeated in " + pkgDir);
            for (Path link : pkgLinks) {
                links++;
                String module = link.getFileName().toString();
                check(link.getParent().equals(pkgDir), "parent of " + link);

                attrs = Files.readAttributes(link, BasicFileAttributes.class, LinkOption.NOFOLLOW_LINKS);
                check(attrs.isSymbolicLink() && !attrs.isDirectory(), "not a link: " + link);
                attrs = Files.readAttributes(link, BasicFileAttributes.class);
                check(!attrs.isSymbolicLink() && attrs.isDirectory(), "link does not lead to a directory: " + link);

                Path target = Files.readSymbolicLink(link);
                check(target.toString().equals("/modules/" + module), "target of " + link + ": " + target);
                check(link.toRealPath().equals(target), "real path of " + link);
                check(link.toRealPath(LinkOption.NOFOLLOW_LINKS).equals(link), "real path of " + link + " without links");
                check(Files.isDirectory(link) && Files.isSymbolicLink(link), link.toString());

                // The module has a directory for the package.
                Path dir = target.resolve(pkgDir.getFileName().toString().replace('.', '/'));
                check(Files.isDirectory(dir), "no " + dir + " for " + link);
            }
        }
        check(links >= pkgDirs.size(), "links: " + links);

        check(!Files.exists(FS.getPath("/packages/no.such.package")), "no.such.package");
        check(!Files.exists(FS.getPath("/packages/java.lang/no.such.module")), "no.such.module");
        check(!Files.exists(FS.getPath("/packages/java.lang/java.base/no.such.file")), "no.such.file");
        check(Files.exists(FS.getPath("/packages/java.lang/java.base/java/lang/Object.class")), "Object.class");
    }

    /** All ways to list a directory agree, for the different forms of paths of it. */
    private static void testListings() throws IOException {
        String[] dirs = {
            "/", "/packages", "/modules", "/modules/java.base", "/modules/java.base/java/lang",
            "/packages/java.lang", "/packages/java.lang/java.base", "/packages/java.lang/java.base/java",
            "/packages/./java.lang", "/packages/java.lang/../java.lang/java.base", "packages/java.lang",
        };
        for (String dir : dirs) {
            Path path = FS.getPath(dir);
            List<String> listed = names(list(path));
            check(!listed.isEmpty(), "nothing in " + dir);
            check(listed.equals(names(list(path))), "listing again gives another order: " + dir);

            List<String> streamed = new ArrayList<>();
            try (DirectoryStream<Path> stream = Files.newDirectoryStream(path)) {
                stream.forEach(p -> streamed.add(p.toString()));
            }
            check(listed.equals(streamed), "directory stream differs from list: " + dir);

            List<String> accepted = new ArrayList<>();
            try (DirectoryStream<Path> stream = Files.newDirectoryStream(path, p -> true)) {
                stream.forEach(p -> accepted.add(p.toString()));
            }
            check(listed.equals(accepted), "accepting stream differs from list: " + dir);

            try (DirectoryStream<Path> stream = Files.newDirectoryStream(path, p -> false)) {
                check(!stream.iterator().hasNext(), "rejecting stream is not empty: " + dir);
            }

            // A filter sees every path once, and the paths it accepts are listed in order.
            List<String> seen = new ArrayList<>();
            List<String> half = new ArrayList<>();
            try (DirectoryStream<Path> stream = Files.newDirectoryStream(path, p -> {
                seen.add(p.toString());
                return p.toString().length() % 2 == 0;
            })) {
                stream.forEach(p -> half.add(p.toString()));
            }
            check(listed.equals(seen), "filter does not see the listing: " + dir);
            check(listed.stream().filter(s -> s.length() % 2 == 0).collect(Collectors.toList()).equals(half),
                    "filtered listing: " + dir);

            // Children are named like the directory is.
            for (String child : listed) {
                check(child.startsWith(path.toString().isEmpty() || path.toString().endsWith("/")
                        ? path.toString() : path + "/"), child + " is not in " + dir);
            }
        }
    }

    /** Files.walk is the preorder of the listings, which is also what a file tree walk visits. */
    private static void testWalkIsListing(String root, List<String> walkedBefore) throws IOException {
        List<String> walked = walk(root);
        if (walkedBefore != null) {
            check(walked.equals(walkedBefore), "walking " + root + " again gives another tree");
        }
        List<String> listed = new ArrayList<>();
        listRecursively(FS.getPath(root), listed);
        check(walked.equals(listed), "walk and list differ in " + root + ": " + walked.size() + " and " + listed.size());

        List<String> visited = new ArrayList<>();
        Files.walkFileTree(FS.getPath(root), new SimpleFileVisitor<Path>() {
            @Override
            public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) {
                visited.add(dir.toString());
                return FileVisitResult.CONTINUE;
            }

            @Override
            public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) {
                visited.add(file.toString());
                return FileVisitResult.CONTINUE;
            }
        });
        check(walked.equals(visited), "walk and file tree walk differ in " + root);
    }

    /** The file system is shared, so the same tree is seen from threads that look at it in any order. */
    private static void testThreads() throws Exception {
        List<String> packages = walk("/packages");
        List<String> modules = walk("/modules");
        int threads = 6;
        CyclicBarrier start = new CyclicBarrier(threads);
        ExecutorService executor = Executors.newFixedThreadPool(threads);
        try {
            List<Future<Boolean>> results = new ArrayList<>();
            for (int i = 0; i < threads; i++) {
                final int n = i;
                results.add(executor.submit(() -> {
                    start.await();
                    if (n % 2 == 0) {
                        return walk("/modules").equals(modules) && walk("/packages").equals(packages);
                    }
                    List<String> listed = new ArrayList<>();
                    listRecursively(FS.getPath("/packages"), listed);
                    return listed.equals(packages) && walk("/modules").equals(modules);
                }));
            }
            for (Future<Boolean> result : results) {
                check(result.get(), "a thread saw another tree");
            }
        } finally {
            executor.shutdown();
        }
    }

    /**
     * Threads that look at the file system in different ways and orders,
     * each as the first thing in the VM, see the tree that one thread sees
     * afterwards.
     */
    private static void testColdThreads() throws Exception {
        int threads = 6;
        CyclicBarrier start = new CyclicBarrier(threads);
        ExecutorService executor = Executors.newFixedThreadPool(threads);
        List<Future<List<List<String>>>> results = new ArrayList<>();
        try {
            for (int i = 0; i < threads; i++) {
                final int n = i;
                results.add(executor.submit(() -> {
                    start.await();
                    List<String> packages;
                    List<String> modules;
                    switch (n % 3) {
                        case 0 -> {
                            packages = walk("/packages");
                            modules = walk("/modules");
                        }
                        case 1 -> {
                            modules = walk("/modules");
                            packages = new ArrayList<>();
                            listRecursively(FS.getPath("/packages"), packages);
                        }
                        default -> {
                            // a package directory and a link before their parent
                            check(Files.isDirectory(FS.getPath("/packages/java.util")),
                                  "no /packages/java.util");
                            check(Files.isSymbolicLink(FS.getPath("/packages/java.lang/java.base")),
                                  "no /packages/java.lang/java.base link");
                            packages = walk("/packages");
                            modules = new ArrayList<>();
                            listRecursively(FS.getPath("/modules"), modules);
                        }
                    }
                    return List.of(packages, modules);
                }));
            }
            List<List<List<String>>> trees = new ArrayList<>();
            for (Future<List<List<String>>> result : results) {
                trees.add(result.get());
            }
            List<String> packages = walk("/packages");
            List<String> modules = walk("/modules");
            check(packages.contains("/packages/java.lang/java.base"), "no java.lang link in the walk");
            for (List<List<String>> tree : trees) {
                check(tree.get(0).equals(packages), "a thread saw another /packages tree");
                check(tree.get(1).equals(modules), "a thread saw another /modules tree");
            }
        } finally {
            executor.shutdown();
        }
    }

    private static List<String> walk(String root) throws IOException {
        try (Stream<Path> stream = Files.walk(FS.getPath(root))) {
            return stream.map(Path::toString).collect(Collectors.toList());
        }
    }

    private static void listRecursively(Path dir, List<String> into) throws IOException {
        into.add(dir.toString());
        for (Path child : list(dir)) {
            if (Files.readAttributes(child, BasicFileAttributes.class, LinkOption.NOFOLLOW_LINKS).isDirectory()) {
                listRecursively(child, into);
            } else {
                into.add(child.toString());
            }
        }
    }

    private static List<Path> list(Path dir) throws IOException {
        try (Stream<Path> stream = Files.list(dir)) {
            return stream.collect(Collectors.toList());
        }
    }

    private static List<String> names(List<Path> paths) {
        return paths.stream().map(Path::toString).collect(Collectors.toList());
    }

    private static void check(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }
}
