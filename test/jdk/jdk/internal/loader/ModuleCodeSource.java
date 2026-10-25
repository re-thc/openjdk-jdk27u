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
 * @summary Lazy CodeSources for classes defined from built-in loader modules
 * @library /test/lib
 * @modules java.base/jdk.internal.loader:+open java.base/jdk.internal.module
 * @run driver ModuleCodeSource
 */

import java.io.File;
import java.io.IOException;
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.module.ModuleDescriptor;
import java.lang.module.ModuleReader;
import java.lang.module.ModuleReference;
import java.lang.reflect.Field;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandler;
import java.nio.ByteBuffer;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.CodeSigner;
import java.security.CodeSource;
import java.security.ProtectionDomain;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.jar.Attributes;
import java.util.jar.Manifest;
import java.util.stream.Stream;

import jdk.internal.loader.BuiltinClassLoader;
import jdk.internal.module.Modules;
import jdk.test.lib.compiler.CompilerUtils;
import jdk.test.lib.helpers.ClassFileInstaller;
import jdk.test.lib.process.ProcessTools;
import jdk.test.lib.util.JarUtils;

public class ModuleCodeSource {
    static final String PROBE = ModuleCodeSource.class.getName() + "$Probe";
    static final List<String> ACCESS = List.of(
            "--add-opens=java.base/jdk.internal.loader=ALL-UNNAMED",
            "--add-exports=java.base/jdk.internal.module=ALL-UNNAMED");

    public static void main(String[] args) throws Exception {
        prepare();
        run("mods", "normal");
        run("jars", "normal");
        run("jars", "patch");
        run("jars", "synthetic");
    }

    static void prepare(String... extraClasses) throws Exception {
        Path src = Path.of("src");
        write(src.resolve("m.cache/module-info.java"), "module m.cache { exports cache.mod; }");
        write(src.resolve("m.unused/module-info.java"), "module m.unused { exports unused.mod; }");
        write(src.resolve("m.unused/unused/mod/Unused.java"),
                "package unused.mod; public class Unused {}");
        for (String name : List.of("A", "B", "Late", "C0", "C1", "C2", "C3",
                                   "C4", "C5", "C6", "C7")) {
            write(src.resolve("m.cache/cache/mod/" + name + ".java"),
                    "package cache.mod; public class " + name + " {}");
        }
        check(CompilerUtils.compile(src, Path.of("mods"), "--module-source-path", "src"),
                "module compilation");
        // CDS uses manifest-based package metadata for modular JARs. Seal the
        // fixture explicitly so the package checks also apply after restoration.
        Manifest manifest = new Manifest();
        manifest.getMainAttributes().put(Attributes.Name.MANIFEST_VERSION, "1.0");
        manifest.getMainAttributes().put(Attributes.Name.SEALED, "true");
        for (String module : List.of("m.cache", "m.unused")) {
            JarUtils.createJarFile(Path.of("jars", module + ".jar"), manifest,
                    Path.of("mods", module), Path.of("."));
        }
        for (String name : List.of("First", "Second")) {
            Path root = Path.of("patch" + name);
            Path source = Path.of("patchsrc" + name);
            write(source.resolve("cache/mod/" + name + ".java"),
                    "package cache.mod; public class " + name + " {}");
            check(CompilerUtils.compile(source, root), "patch compilation");
        }
        // The shared helper and the archive driver can be compiled into
        // different jtreg library directories. Resolve classes via resources.
        List<String> classes = new ArrayList<>(List.of("ModuleCodeSource",
                "ModuleCodeSource$Probe", "ModuleCodeSource$Probe$1", "ModuleCodeSource$MemoryModule"));
        classes.addAll(List.of(extraClasses));
        ClassFileInstaller.writeJar("probe.jar", classes.toArray(String[]::new));
    }

    static void write(Path path, String text) throws IOException {
        Files.createDirectories(path.getParent());
        Files.writeString(path, text);
    }

    static List<String> command(String modulePath) {
        List<String> command = new ArrayList<>(ACCESS);
        command.addAll(List.of("--module-path", modulePath, "--add-modules",
                "m.cache,m.unused,java.sql,jdk.compiler", "-cp", "probe.jar"));
        return command;
    }

    static void run(String modulePath, String mode) throws Exception {
        List<String> command = command(modulePath);
        command.add("-Xshare:off");
        if (mode.equals("patch")) {
            command.add("--patch-module=m.cache=patchFirst" + File.pathSeparator + "patchSecond");
        }
        command.addAll(List.of(PROBE, mode));
        ProcessTools.executeProcess(ProcessTools.createTestJavaProcessBuilder(command))
                .shouldHaveExitValue(0).shouldContain("ModuleCodeSource passed");
    }

    static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    static Object loaded(String packageName) throws Exception {
        Field field = BuiltinClassLoader.class.getDeclaredField("packageToModule");
        field.setAccessible(true);
        Object lm = ((Map<?, ?>) field.get(null)).get(packageName);
        check(lm != null, "missing LoadedModule for " + packageName);
        return lm;
    }

    static Object field(Object lm, String name) throws Exception {
        Field field = lm.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(lm);
    }

    static void empty(String packageName) throws Exception {
        check(field(loaded(packageName), "codeSource") == null,
                "premature CodeSource for " + packageName);
    }

    static Class<?> load(String name) throws Exception {
        return Class.forName(name, false, ClassLoader.getSystemClassLoader());
    }

    static void missing(String name) throws Exception {
        try {
            load(name);
            throw new AssertionError("found " + name);
        } catch (ClassNotFoundException expected) { }
    }

    static void source(Class<?> type, URL location) {
        ProtectionDomain pd = type.getProtectionDomain();
        CodeSource actual = pd.getCodeSource();
        CodeSource expected = new CodeSource(location, (CodeSigner[]) null);
        check(actual != null && expected.equals(actual) && actual.equals(expected),
                "CodeSource for " + type + ": " + actual + " expected " + expected);
        check(actual.hashCode() == expected.hashCode(), "CodeSource hashCode");
        check(actual.getCodeSigners() == null && actual.getCertificates() == null, "unsigned source");
        check(type.getSigners() == null, "unsigned class");
        check(pd.getClassLoader() == type.getClassLoader(), "PD loader");
        check(type.getModule().isNamed() && type.getPackage() != null
                && type.getPackage().isSealed(), "sealed named-module package");
        // Built-in module definitions still use SecureClassLoader.getPermissions.
        check(!pd.getPermissions().elements().hasMoreElements(), "module PD permissions");
    }

    public static class Probe {
        public static void main(String[] args) throws Exception {
            switch (args[0]) {
                case "normal" -> normal();
                case "patch" -> patch();
                case "synthetic" -> synthetic();
                default -> throw new AssertionError(args[0]);
            }
            System.out.println("ModuleCodeSource passed");
        }

        static void normal() throws Exception {
            empty("cache.mod");
            empty("unused.mod");
            Object lm = loaded("cache.mod");
            // Non-jrt URLs stay eager, but a miss does not create a CodeSource.
            check(field(lm, "codeSourceURL") != null, "eager file URL");
            missing("cache.mod.Missing");
            empty("cache.mod");
            Class<?> a = load("cache.mod.A");
            Class<?> b = load("cache.mod.B");
            check(a.getModule().getLayer() == ModuleLayer.boot(), "boot-layer file module");
            check(a.getClassLoader() == ClassLoader.getSystemClassLoader(), "built-in app loader");
            URL url = (URL) field(lm, "codeSourceURL");
            source(a, url);
            check(a.getProtectionDomain() == b.getProtectionDomain(), "same module PD");
            check(field(lm, "codeSource") == a.getProtectionDomain().getCodeSource(), "reused source");
            empty("unused.mod");
            jrt("java.sql", "java.sql.Driver", "java.sql.Connection", ClassLoader.getPlatformClassLoader());
            jrt("com.sun.tools.javac", "com.sun.tools.javac.Main", "com.sun.tools.javac.main.Main", ClassLoader.getSystemClassLoader());
            concurrent("cache.mod", "cache.mod.C");
        }

        static void jrt(String pkg, String first, String second, ClassLoader loader) throws Exception {
            Object lm = loaded(pkg);
            empty(pkg);
            check(field(lm, "codeSourceURL") == null, "lazy jrt URL for " + pkg);
            missing(pkg + ".Missing");
            empty(pkg);
            URL url = (URL) field(lm, "codeSourceURL");
            check(url != null && url.getProtocol().equals("jrt"), "URL conversion on miss");
            Class<?> a = load(first);
            Class<?> b = load(second);
            check(a.getClassLoader() == loader && a.getModule().getLayer() == ModuleLayer.boot(),
                    "actual built-in boot-layer definition");
            source(a, url);
            check(a.getProtectionDomain() == b.getProtectionDomain(), "same jrt PD");
            check(field(lm, "codeSource") == a.getProtectionDomain().getCodeSource(), "jrt cached source");
        }

        static void patch() throws Exception {
            Class<?> first = load("cache.mod.First");
            Class<?> second = load("cache.mod.Second");
            Class<?> original = load("cache.mod.A");
            source(first, Path.of("patchFirst").toRealPath().toUri().toURL());
            source(second, Path.of("patchSecond").toRealPath().toUri().toURL());
            source(original, Path.of("jars/m.cache.jar").toRealPath().toUri().toURL());
            check(first.getModule() == second.getModule() && first.getModule() == original.getModule(),
                    "one patched module");
            check(first.getProtectionDomain() != second.getProtectionDomain()
                    && first.getProtectionDomain() != original.getProtectionDomain(), "per-root PDs");
            empty("cache.mod");
        }

        static void concurrent(String pkg, String prefix) throws Exception {
            // A distinct synthetic module below also tests a race on first use.
            CyclicBarrier start = new CyclicBarrier(8);
            try (var pool = Executors.newFixedThreadPool(8)) {
                List<Callable<Class<?>>> tasks = new ArrayList<>();
                for (int i = 0; i < 8; i++) {
                    String name = prefix + i;
                    tasks.add(() -> { start.await(); return load(name); });
                }
                ProtectionDomain pd = null;
                for (var result : pool.invokeAll(tasks)) {
                    Class<?> c = result.get();
                    if (pd == null) pd = c.getProtectionDomain();
                    check(c.getProtectionDomain() == pd, "concurrent PD");
                }
                CodeSource cached = (CodeSource) field(loaded(pkg), "codeSource");
                check(cached != null && cached.equals(pd.getCodeSource()), "published equivalent source");
                // First-use races may produce equal sources; no singleton identity is required.
            }
        }

        static void synthetic() throws Exception {
            AtomicInteger parses = new AtomicInteger();
            AtomicInteger ports = new AtomicInteger();
            AtomicInteger attempts = new AtomicInteger();
            URL.setURLStreamHandlerFactory(protocol -> {
                if (protocol.equals("unavailable")) attempts.incrementAndGet();
                if (!protocol.equals("observable")) return null;
                return new URLStreamHandler() {
                    protected URLConnection openConnection(URL u) { throw new AssertionError(); }
                    protected void parseURL(URL u, String spec, int start, int limit) {
                        parses.incrementAndGet();
                        super.parseURL(u, spec, start, limit);
                    }
                    protected int getDefaultPort() { ports.incrementAndGet(); return 19; }
                };
            });
            MemoryModule custom = new MemoryModule("custom", URI.create("observable://127.0.0.1/mod"));
            check(parses.get() == 1, "eager overridable URL conversion");
            missing(custom.pkg + ".Missing");
            check(parses.get() == 1 && ports.get() == 0, "miss conversion/constructor timing");
            Class<?> customA = load(custom.pkg + ".A");
            int afterFirst = ports.get();
            Class<?> customB = load(custom.pkg + ".B");
            check(afterFirst > 0 && ports.get() > afterFirst, "per-definition handler callbacks");
            // Expected CodeSource construction and equality can themselves call
            // the handler; keep those checks outside the callback measurement.
            source(customA, (URL) field(loaded(custom.pkg), "codeSourceURL"));
            source(customB, (URL) field(loaded(custom.pkg), "codeSourceURL"));
            empty(custom.pkg);

            MemoryModule absent = new MemoryModule("absent", null);
            absent.define("A");
            absent.define("B");
            empty(absent.pkg);
            MemoryModule bad = new MemoryModule("bad", URI.create("unavailable://host/mod"));
            int eager = attempts.get();
            check(eager > 0, "eager failed conversion");
            missing(bad.pkg + ".Missing");
            check(attempts.get() > eager, "failed conversion retried on miss");
            int miss = attempts.get();
            bad.define("A");
            check(attempts.get() > miss, "failed conversion retried on success");
            bad.define("B");
            empty(bad.pkg);

            MemoryModule file = new MemoryModule("memory", URI.create("file:/memory-module"));
            concurrent(file.pkg, file.pkg + ".C");
            check(file.releases.get() == 8, "concurrent release");
            file.define("A");
            file.define("B");
            try {
                load(file.pkg + ".Broken");
                throw new AssertionError("malformed class accepted");
            } catch (ClassFormatError expected) { }
            check(file.releases.get() == 11, "release on VM definition error");
        }
    }

    // Register custom references directly with the actual built-in app loader.
    // A ModuleLayer one-loader test would exercise sibling Loader instead.
    public static class MemoryModule extends ModuleReference implements ModuleReader {
        final String pkg;
        final AtomicInteger releases = new AtomicInteger();

        MemoryModule(String name, URI location) {
            super(ModuleDescriptor.newModule("test." + name)
                    .packages(Set.of("memory." + name)).build(), location);
            pkg = "memory." + name;
            ClassLoader loader = ClassLoader.getSystemClassLoader();
            Modules.defineModule(loader, descriptor(), location);
            ((BuiltinClassLoader) loader).loadModule(this);
        }

        void define(String suffix) throws Exception {
            Class<?> c = load(pkg + "." + suffix);
            URL url = (URL) field(loaded(pkg), "codeSourceURL");
            source(c, url);
        }

        public ModuleReader open() { return this; }
        public Optional<URI> find(String name) { return Optional.empty(); }
        public Stream<String> list() { return Stream.empty(); }
        public void close() { }

        public Optional<ByteBuffer> read(String name) {
            if (name.endsWith("/Missing.class")) return Optional.empty();
            byte[] bytes = name.endsWith("/Broken.class") ? new byte[1]
                    : ClassFile.of().build(ClassDesc.of(name.substring(0, name.length() - 6)
                            .replace('/', '.')), cb -> { });
            ByteBuffer buffer = ByteBuffer.allocateDirect(bytes.length);
            buffer.put(bytes).flip();
            return Optional.of(buffer.asReadOnlyBuffer());
        }

        public void release(ByteBuffer buffer) {
            check(buffer.isDirect() && buffer.isReadOnly(), "original protected ByteBuffer");
            releases.incrementAndGet();
        }
    }
}
