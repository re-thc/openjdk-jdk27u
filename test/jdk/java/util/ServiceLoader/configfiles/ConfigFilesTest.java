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
 * @summary Test the providers that ServiceLoader locates with provider-configuration
 *          files: the order of the files on the class path and the module path, the
 *          syntax and the errors of the files, reload, and that a JAR file of a class
 *          loader that is closed can be deleted
 * @library /test/lib
 * @modules jdk.compiler
 * @build jdk.test.lib.compiler.CompilerUtils
 *        jdk.test.lib.process.ProcessTools
 *        jdk.test.lib.util.JarUtils
 * @run main/othervm ConfigFilesTest
 */

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.charset.StandardCharsets;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.ServiceConfigurationError;
import java.util.ServiceLoader;
import java.util.stream.Collectors;

import jdk.test.lib.compiler.CompilerUtils;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.lib.util.JarUtils;

/**
 * The test runs a child VM for each class path and module path, as the
 * application class loader is the one that has the class path to look up.
 * The child prints one line for each provider ("P class") or error ("E message")
 * that the lookup gives, and the test compares them with the expected lines.
 */
public class ConfigFilesTest {

    private static final String SERVICE = "cfg.Svc";
    private static final String CONFIG = "META-INF/services/" + SERVICE;

    private static final Path WORK = Path.of("work");
    // the service and the providers on the class path
    private static final Path CLASSES = WORK.resolve("classes");
    // a provider in an automatic module and an empty module
    private static final Path MODULE_CLASSES = WORK.resolve("moduleclasses");

    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            child(args);
        } else {
            compileClasses();
            testOrder();
            testBootClassPath();
            testModulePath();
            testSyntax();
            testErrors();
            testReload();
            testDirectoryInPlaceOfFile();
            testCompareWithURLClassLoader();
            testJarNotLocked();
        }
    }

    // ---- the test cases

    /**
     * The providers are in the order of the class path, and a provider that is
     * named by more than one file is located once, where it is first named.
     */
    private static void testOrder() throws Exception {
        Path d1 = dir("order-d1", "cfg.P1\ncfg.P2\n");
        Path a = jar("order-a.jar", "cfg.P3\n");
        Path b = jar("order-b.jar", "cfg.P2\ncfg.P4\n");
        Path d2 = dir("order-d2", "cfg.P5\n");
        Path none = Files.createDirectories(WORK.resolve("order-none"));
        check(run(List.of(d1, a, b, none, d2), List.of()),
              "P cfg.P1", "P cfg.P2", "P cfg.P3", "P cfg.P4", "P cfg.P5");
        check(run(List.of(d2, none, b, a, d1), List.of()),
              "P cfg.P5", "P cfg.P2", "P cfg.P4", "P cfg.P3", "P cfg.P1");
        // many more JAR files than the first ones that a loader opens
        List<Path> many = new ArrayList<>();
        List<String> expected = new ArrayList<>();
        for (int i = 0; i < 40; i++) {
            String provider = "cfg.P" + (1 + i % 6);
            many.add(i % 5 == 0 ? dir("order-many" + i, provider + "\n")
                                : i % 5 == 1 ? jar("order-many" + i + ".jar", "")
                                             : jar("order-many" + i + ".jar", provider + "\n"));
            if (i % 5 != 1 && !expected.contains("P " + provider)) {
                expected.add("P " + provider);
            }
        }
        check(run(many, List.of()), expected.toArray(String[]::new));
    }

    /**
     * The class path of the boot class loader comes first, and it is all that the
     * lookup with the platform class loader has to look at.
     */
    private static void testBootClassPath() throws Exception {
        Path boot = dir("boot-dir", "cfg.P4\ncfg.P5\n");
        Path d1 = dir("boot-d1", "cfg.P1\n");
        Path a = jar("boot-a.jar", "cfg.P2\ncfg.P4\n");
        String bootClassPath = "-Xbootclasspath/a:" + CLASSES.toAbsolutePath()
                + File.pathSeparator + boot.toAbsolutePath();
        check(run(List.of(bootClassPath), List.of(d1, a), List.of()),
              "P cfg.P4", "P cfg.P5", "P cfg.P1", "P cfg.P2");
        check(run(List.of(bootClassPath), List.of(d1, a), List.of(), "installed"),
              "P cfg.P4", "P cfg.P5");
        check(run(List.of(), List.of(d1, a), List.of(), "installed"));
    }

    /**
     * Providers in modules come before those on the class path. The files in the
     * modules are read too, and the class that one of them names is a provider
     * if it is in the unnamed module.
     */
    private static void testModulePath() throws Exception {
        Path d1 = dir("module-d1", "cfg.P1\n");
        Path auto = automaticModule("module-auto.jar", "emod.Q1");
        Path modular = modularModule("module-modular.jar", "cfg.P2\n");
        check(run(List.of(d1), List.of(auto)),
              "P emod.Q1", "P cfg.P1");
        check(run(List.of(d1), List.of(modular)),
              "P cfg.P2", "P cfg.P1");
        check(run(List.of(d1), List.of(modular, auto)),
              "P emod.Q1", "P cfg.P2", "P cfg.P1");
    }

    /**
     * Comments, blank lines, white space and the line terminators.
     */
    private static void testSyntax() throws Exception {
        String config = "# only a comment\n"
                + "\n"
                + "   cfg.P1   # a comment after the name\r\n"
                + "cfg.P2\rcfg.P3\n"
                + "\r\n"
                + "\t \ncfg.P4\t\n"
                + "# \u00e9 \u20ac \ud83d\ude00 and \ufffd\n"
                + "cfg.P5 #\n"
                + "cfg.P1\n"
                + "cfg.P6";
        check(run(List.of(dir("syntax-dir", config)), List.of()),
              "P cfg.P1", "P cfg.P2", "P cfg.P3", "P cfg.P4", "P cfg.P5", "P cfg.P6");
        check(run(List.of(jar("syntax.jar", config)), List.of()),
              "P cfg.P1", "P cfg.P2", "P cfg.P3", "P cfg.P4", "P cfg.P5", "P cfg.P6");
        // nothing to locate, with the line terminators of all kinds
        for (String empty : List.of("", "\n", "\r", "\r\n", "# cfg.P1", "#\n\n#\r\n", "  \t ")) {
            check(run(List.of(dir("syntax-empty-dir", empty)), List.of()));
            check(run(List.of(jar("syntax-empty.jar", empty)), List.of()));
        }
        // a byte that is not valid in UTF-8, in a comment
        byte[] bad = ("cfg.P1\n# \u00e9\n".getBytes(StandardCharsets.UTF_8));
        bad[bad.length - 3] = (byte) 0xc3;
        bad[bad.length - 2] = (byte) 0x28;
        Path badDir = dir("syntax-bad-utf8", bad);
        check(run(List.of(badDir), List.of()), "P cfg.P1");
    }

    /**
     * Errors in the files give a ServiceConfigurationError with the URL of the
     * file and the number of the line. The lookup goes on with the next file, and
     * the names before the error in the file are not located.
     */
    private static void testErrors() throws Exception {
        Path next = jar("errors-next.jar", "cfg.P6\n");
        record Case(String config, int line, String error) { }
        List<Case> cases = List.of(
                new Case("cfg.P1 cfg.P2\n", 1, "Illegal configuration-file syntax"),
                new Case("cfg.P1\tcfg.P2\n", 1, "Illegal configuration-file syntax"),
                new Case("# comment\n\n9bad\n", 3, "Illegal provider-class name: 9bad"),
                new Case("cfg.P1\ncfg.a-b # c\n", 2, "Illegal provider-class name: cfg.a-b"),
                new Case("cfg.P1\r\ncfg.P2\rcfg.P3;\n", 3, "Illegal provider-class name: cfg.P3;"),
                new Case("cfg@P1\n", 1, "Illegal provider-class name: cfg@P1"));
        for (Case c : cases) {
            Path d = dir("errors-dir", c.config);
            check(run(List.of(d, next), List.of()),
                  "E " + SERVICE + ": " + fileURL(d) + ":" + c.line + ": " + c.error,
                  "P cfg.P6");
            Path j = jar("errors.jar", c.config);
            check(run(List.of(j, next), List.of()),
                  "E " + SERVICE + ": " + jarURL(j) + ":" + c.line + ": " + c.error,
                  "P cfg.P6");
            // a modular JAR file on the module path: the file is a resource of the module
            Path m = modularModule("errors-module.jar", c.config);
            check(run(List.of(next), List.of(m)),
                  "E " + SERVICE + ": " + moduleURL(m) + ":" + c.line + ": " + c.error,
                  "P cfg.P6");
        }
        // a name that is not a class, and one that is not a provider
        Path d = dir("errors-class", "cfg.P1\ncfg.Missing\ncfg.Bad\ncfg.P2\n");
        check(run(List.of(d), List.of()),
              "P cfg.P1",
              "E " + SERVICE + ": Provider cfg.Missing not found",
              "E " + SERVICE + ": cfg.Bad not a subtype",
              "P cfg.P2");
    }

    /**
     * A file that is added to the directory of the class path is located
     * after reload, and not before.
     */
    private static void testReload() throws Exception {
        Path d1 = dir("reload-d1", "cfg.P1\n");
        Path reloaded = WORK.resolve("reload-dir");
        deleteTree(reloaded);
        Files.createDirectories(reloaded);
        Path a = jar("reload-a.jar", "cfg.P2\n");
        check(run(List.of(d1, reloaded, a), List.of(), "reload", reloaded.toString()),
              "1 P cfg.P1", "1 P cfg.P2",
              "2 P cfg.P1", "2 P cfg.P2",
              "3 P cfg.P1", "3 P cfg.P3", "3 P cfg.P2",
              "4 P cfg.P1", "4 P cfg.P3", "4 P cfg.P4", "4 P cfg.P2",
              "5 P cfg.P1", "5 P cfg.P2");
    }

    /**
     * A directory where the file is expected is read as its URL says, it is
     * listed by the file protocol.
     */
    private static void testDirectoryInPlaceOfFile() throws Exception {
        Path d = WORK.resolve("dirfile-dir");
        deleteTree(d);
        Path config = Files.createDirectories(d.resolve(CONFIG));
        Files.writeString(config.resolve("cfg.P4"), "ignored");
        Files.writeString(config.resolve("cfg.P2"), "ignored");
        Path next = dir("dirfile-next", "cfg.P5\n");
        check(run(List.of(d, next), List.of()), "P cfg.P2", "P cfg.P4", "P cfg.P5");
    }

    /**
     * The class path and the module path, with a class loader that is not the
     * application class loader, give the same providers and errors.
     */
    private static void testCompareWithURLClassLoader() throws Exception {
        Path d1 = dir("compare-d1", "cfg.P1\ncfg.P1 cfg.P2\ncfg.P3\n");
        Path a = jar("compare-a.jar", "cfg.P3\ncfg.P2\n# comment\n9\ncfg.P4\n");
        Path b = jar("compare-b.jar", "cfg.P5");
        Path d2 = dir("compare-d2", "cfg.Missing\r\ncfg.P6\r\n");
        List<Path> cp = List.of(d1, a, b, d2);
        List<String> byApp = run(cp, List.of());
        List<String> byURL = run(cp, List.of(), "url");
        if (!byApp.equals(byURL)) {
            throw new AssertionError("application class loader: " + byApp
                                     + "\nURLClassLoader: " + byURL);
        }
        System.out.println("same lines from both: " + byApp);
    }

    /**
     * A JAR file can be deleted once the URLClassLoader that located providers in it
     * has been closed, there is no JarFile left open.
     */
    private static void testJarNotLocked() throws Exception {
        Path j = jar("locked.jar", "cfg.P1\n");
        Path path = j.toRealPath();
        for (int i = 0; i < 3; i++) {
            URL[] urls = { j.toUri().toURL(), CLASSES.toUri().toURL() };
            try (URLClassLoader loader = new URLClassLoader(urls, ClassLoader.getPlatformClassLoader())) {
                Class<?> svc = Class.forName(SERVICE, false, loader);
                ServiceLoader<?> sl = ServiceLoader.load(svc, loader);
                List<String> names = new ArrayList<>();
                for (Object provider : sl) {
                    names.add(provider.getClass().getName());
                }
                sl.reload();
                for (Object provider : sl) {
                    names.add(provider.getClass().getName());
                }
                if (!names.equals(List.of("cfg.P1", "cfg.P1"))) {
                    throw new AssertionError("providers: " + names);
                }
            }
            if (isOpen(path)) {
                throw new AssertionError(path + " is open after the class loader is closed");
            }
            // fails on Windows if the JAR file is open
            Files.delete(j);
            j = jar("locked.jar", "cfg.P1\n");
        }
    }

    // ---- the child VM

    private static void child(String[] args) throws Exception {
        Class<?> svc = Class.forName(SERVICE);
        switch (args[0]) {
            case "list" -> {
                list("", ServiceLoader.load(svc));
                stream("S ", ServiceLoader.load(svc));
            }
            case "installed" -> list("", ServiceLoader.loadInstalled(svc));
            case "url" -> {
                // the entries of the class path, with a class loader that is not a built-in one
                List<URL> urls = new ArrayList<>();
                for (String e : System.getProperty("java.class.path").split(File.pathSeparator)) {
                    urls.add(Path.of(e).toUri().toURL());
                }
                try (URLClassLoader loader = new URLClassLoader(urls.toArray(URL[]::new),
                                                                 ClassLoader.getPlatformClassLoader())) {
                    Class<?> loaded = Class.forName(SERVICE, false, loader);
                    list("", ServiceLoader.load(loaded, loader));
                    stream("S ", ServiceLoader.load(loaded, loader));
                }
            }
            case "reload" -> {
                Path file = Path.of(args[1]).resolve(CONFIG);
                ServiceLoader<?> sl = ServiceLoader.load(svc);
                list("1 ", sl);
                // the loader gives the providers that it has already located
                Files.createDirectories(file.getParent());
                Files.writeString(file, "cfg.P3\n");
                list("2 ", sl);
                sl.reload();
                list("3 ", sl);
                Files.writeString(file, "cfg.P3\n# cfg.P5\r\ncfg.P4");
                sl.reload();
                list("4 ", sl);
                Files.delete(file);
                sl.reload();
                list("5 ", sl);
            }
            default -> throw new IllegalArgumentException(args[0]);
        }
    }

    private static void list(String prefix, ServiceLoader<?> sl) {
        Iterator<?> iterator = sl.iterator();
        for (int i = 0; i < 100; i++) {
            try {
                if (!iterator.hasNext()) {
                    break;
                }
                System.out.println(prefix + "P " + iterator.next().getClass().getName());
            } catch (ServiceConfigurationError e) {
                System.out.println(prefix + "E " + e.getMessage());
            }
        }
    }

    // The stream gives the same providers and errors, and goes on after an error
    private static void stream(String prefix, ServiceLoader<?> sl) {
        int[] providers = { 0 };
        for (int i = 0; i < 100; i++) {
            try {
                sl.stream().skip(providers[0]).forEach(p -> {
                    System.out.println(prefix + "P " + p.type().getName());
                    providers[0]++;
                });
                break;
            } catch (ServiceConfigurationError e) {
                System.out.println(prefix + "E " + e.getMessage());
            }
        }
    }

    // ---- the files to use

    private static void compileClasses() throws Exception {
        Path src = WORK.resolve("src");
        Path moduleSrc = WORK.resolve("modulesrc");
        deleteTree(WORK);
        Files.createDirectories(src.resolve("cfg"));
        Files.writeString(src.resolve("cfg/Svc.java"), source("cfg", "public interface Svc { }"));
        for (int i = 1; i <= 6; i++) {
            Files.writeString(src.resolve("cfg/P" + i + ".java"),
                    source("cfg", "public class P" + i + " implements Svc { public P" + i + "() { } }"));
        }
        Files.writeString(src.resolve("cfg/Bad.java"),
                source("cfg", "public class Bad { public Bad() { } }"));
        if (!CompilerUtils.compile(src, CLASSES)) {
            throw new AssertionError("compilation failed");
        }
        Files.createDirectories(moduleSrc.resolve("emod"));
        Files.writeString(moduleSrc.resolve("emod/Q1.java"),
                source("emod", "public class Q1 implements cfg.Svc { public Q1() { } }"));
        if (!CompilerUtils.compile(moduleSrc, MODULE_CLASSES, "-cp", CLASSES.toString())) {
            throw new AssertionError("compilation failed");
        }
        // module-info.class of a module without anything in it
        Path infoSrc = WORK.resolve("infosrc");
        Files.createDirectories(infoSrc);
        Files.writeString(infoSrc.resolve("module-info.java"), "module emod.modular { }\n");
        if (!CompilerUtils.compile(infoSrc, WORK.resolve("infoclasses"))) {
            throw new AssertionError("compilation failed");
        }
    }

    // The declaration is put together here, jtreg takes it for the package of this
    // test if it is written out in the text.
    private static String source(String pkg, String declaration) {
        return "package " + pkg + "; " + declaration + "\n";
    }

    private static Path dir(String name, String config) throws IOException {
        return dir(name, config.getBytes(StandardCharsets.UTF_8));
    }

    /** Creates a directory of the class path, with the configuration file. */
    private static Path dir(String name, byte[] config) throws IOException {
        Path dir = WORK.resolve(name);
        deleteTree(dir);
        Files.createDirectories(dir.resolve("META-INF/services"));
        Files.write(dir.resolve(CONFIG), config);
        return dir;
    }

    /** Creates a JAR file with the configuration file, which is not there if it is empty. */
    private static Path jar(String name, String config) throws IOException {
        Path content = WORK.resolve(name + ".content");
        deleteTree(content);
        Files.createDirectories(content.resolve("META-INF/services"));
        if (config.isEmpty()) {
            Files.writeString(content.resolve("other.txt"), "x");
        } else {
            Files.write(content.resolve(CONFIG), config.getBytes(StandardCharsets.UTF_8));
        }
        Path jar = WORK.resolve(name);
        JarUtils.createJarFile(jar, content);
        return jar;
    }

    /** Creates an automatic module with a provider that its file names. */
    private static Path automaticModule(String name, String provider) throws IOException {
        Path content = WORK.resolve(name + ".content");
        deleteTree(content);
        Files.createDirectories(content.resolve("META-INF/services"));
        Files.writeString(content.resolve(CONFIG), provider + "\n");
        Path classFile = Path.of(provider.replace('.', '/') + ".class");
        Files.createDirectories(content.resolve(classFile).getParent());
        Files.copy(MODULE_CLASSES.resolve(classFile), content.resolve(classFile));
        Path jar = WORK.resolve(name);
        JarUtils.createJarFile(jar, content);
        return jar;
    }

    /** Creates an explicit module, without anything in it but the configuration file. */
    private static Path modularModule(String name, String config) throws IOException {
        Path content = WORK.resolve(name + ".content");
        deleteTree(content);
        Files.createDirectories(content.resolve("META-INF/services"));
        Files.write(content.resolve(CONFIG), config.getBytes(StandardCharsets.UTF_8));
        Files.copy(WORK.resolve("infoclasses/module-info.class"), content.resolve("module-info.class"));
        Path jar = WORK.resolve(name);
        JarUtils.createJarFile(jar, content);
        return jar;
    }

    // ---- running the child

    private static List<String> run(List<Path> classPath, List<Path> modulePath, String... mode)
            throws Exception {
        return run(List.of(), classPath, modulePath, mode);
    }

    private static List<String> run(List<String> options, List<Path> classPath, List<Path> modulePath,
                                    String... mode) throws Exception {
        List<String> command = new ArrayList<>(options);
        String cp = classPath.stream().map(p -> p.toAbsolutePath().toString())
                .collect(Collectors.joining(File.pathSeparator));
        // the classes of the providers and of this test come after the entries to test
        cp += File.pathSeparator + CLASSES.toAbsolutePath() + File.pathSeparator
                + System.getProperty("java.class.path");
        command.add("-cp");
        command.add(cp);
        if (!modulePath.isEmpty()) {
            command.add("--module-path");
            command.add(modulePath.stream().map(p -> p.toAbsolutePath().toString())
                    .collect(Collectors.joining(File.pathSeparator)));
            command.add("--add-modules");
            command.add("ALL-MODULE-PATH");
        }
        command.add("ConfigFilesTest");
        command.addAll(mode.length == 0 ? List.of("list") : Arrays.asList(mode));
        OutputAnalyzer output = ProcessTools.executeTestJava(command);
        output.shouldHaveExitValue(0);
        List<String> lines = new ArrayList<>();
        List<String> streamLines = new ArrayList<>();
        for (String line : output.stdoutAsLines()) {
            if (line.isEmpty()) {
                continue;
            }
            if (line.startsWith("S ")) {
                streamLines.add(line.substring(2));
            } else {
                lines.add(line);
            }
        }
        // the stream locates the same providers, and gives the same errors
        if (mode.length == 0 || mode[0].equals("url")) {
            if (!streamLines.equals(lines)) {
                throw new AssertionError("iterator " + lines + "\nstream " + streamLines);
            }
        }
        return lines;
    }

    /** Checks the lines that the child printed. */
    private static void check(List<String> actual, String... expected) {
        if (!actual.equals(List.of(expected))) {
            throw new AssertionError("expected " + List.of(expected) + "\nactual " + actual);
        }
    }

    private static String fileURL(Path dir) throws IOException {
        return dir.toRealPath().resolve(CONFIG).toUri().toURL().toString();
    }

    private static String jarURL(Path jar) throws IOException {
        return "jar:" + jar.toRealPath().toUri().toURL() + "!/" + CONFIG;
    }

    private static String moduleURL(Path jar) throws IOException {
        return "jar:" + jar.toRealPath().toUri() + "!/" + CONFIG;
    }

    private static void deleteTree(Path dir) throws IOException {
        if (Files.isDirectory(dir)) {
            try (DirectoryStream<Path> entries = Files.newDirectoryStream(dir)) {
                for (Path entry : entries) {
                    deleteTree(entry);
                }
            }
        }
        Files.deleteIfExists(dir);
    }

    /** Returns true if this process has the file open, where this can be told. */
    private static boolean isOpen(Path file) throws IOException {
        Path fds = Path.of("/proc/self/fd");
        if (!Files.isDirectory(fds)) {
            return false;
        }
        try (DirectoryStream<Path> entries = Files.newDirectoryStream(fds)) {
            for (Path fd : entries) {
                try {
                    if (Files.readSymbolicLink(fd).equals(file)) {
                        return true;
                    }
                } catch (IOException ignore) {
                    // the descriptor of the stream being read, or it has been closed
                }
            }
        }
        return false;
    }
}
