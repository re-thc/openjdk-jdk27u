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
 * @summary Nullable enum lowering preserves initialization, enum evolution and source compatibility
 * @library /tools/lib /test/lib
 * @modules jdk.compiler/com.sun.tools.javac.api
 *          jdk.compiler/com.sun.tools.javac.main
 * @build toolbox.ToolBox toolbox.JavacTask
 * @run main/othervm -Xmx128m -XX:+ClassUnloading NullableEnumSwitchEvolution
 */

import java.lang.module.ModuleFinder;
import java.lang.classfile.ClassFile;
import java.lang.classfile.instruction.InvokeDynamicInstruction;
import java.lang.ref.WeakReference;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

import jdk.test.lib.util.ForceGC;
import toolbox.JavacTask;
import toolbox.Task;
import toolbox.ToolBox;

public class NullableEnumSwitchEvolution {
    static final ToolBox tb = new ToolBox();
    static final String INIT = "nullable.enum.test.initialized";
    static int checks;

    public static void main(String... args) throws Exception {
        List<WeakReference<ClassLoader>> loaders = new ArrayList<>();
        for (boolean nested : new boolean[] {false, true}) {
            evolution(Path.of(nested ? "nested" : "external"), nested, loaders);
        }
        initializationOrder(Path.of("init"));
        replacementFields(Path.of("replacement-fields"));
        manySites(Path.of("many-sites"));
        modules(Path.of("modules"));
        diagnostics(Path.of("diagnostics"));
        positions(Path.of("positions"));
        if (!ForceGC.waitFor(() -> loaders.stream().allMatch(r -> r.get() == null), 10_000)) {
            throw new AssertionError("enum caller class loader retained");
        }
        System.out.println("Checked " + checks + " outcomes");
    }

    static void compile(Path source, Path output, String... options) throws Exception {
        Files.createDirectories(output);
        List<String> opts = new ArrayList<>(List.of("-g"));
        opts.addAll(Arrays.asList(options));
        new JavacTask(tb).options(opts).outdir(output)
                .files(tb.findJavaFiles(source)).run().writeAll();
    }

    static String enumSource(String name, String constants) {
        return "public enum " + name + " { " + constants +
                "; static { System.setProperty(\"" + INIT + "\", \"yes\"); } }";
    }

    static String choices(boolean nested, String constants) {
        return """
                package p;
                public class Choices {
                %s
                    public static int select(E e) {
                        return switch (e) {
                            case null -> -1;
                            case A -> 0;
                            case B -> 1;
                            case C002 -> 2;
                            case D -> 3;
                        };
                    }
                    public static int sparse(E e) {
                        return switch (e) { case null -> -1; case A -> 10; case D -> 30; default -> 99; };
                    }
                    public static int throwing(E e) {
                        return switch (e) {
                            case null -> throw new IllegalArgumentException("null");
                            case A -> throw new IllegalStateException("A");
                            default -> 7;
                        };
                    }
                }
                """.formatted(nested ? enumSource("E", constants) : "");
    }

    static void evolution(Path base, boolean nested, List<WeakReference<ClassLoader>> loaders) throws Exception {
        Path enumSrc = base.resolve("enum-src");
        Path originalEnum = base.resolve("original-enum");
        if (!nested) {
            tb.writeJavaFiles(enumSrc, "package p; " + enumSource("E", "A, B, C002, D"));
            compile(enumSrc, originalEnum);
        }
        Path source = base.resolve("src");
        tb.writeJavaFiles(source, choices(nested, "A, B, C002, D"));
        for (String release : new String[] {"21", "22", "current"}) {
            Path original = base.resolve("classes-" + release);
            List<String> options = new ArrayList<>();
            if (!nested) options.addAll(List.of("-classpath", originalEnum.toString()));
            if (!release.equals("current")) options.addAll(List.of("--release", release));
            compile(source, original, options.toArray(String[]::new));
            int version = 0;
            for (String constants : List.of("A, B, C002, D", "D, C002, B, A", "D, B, A", "EXTRA, D, C002, B, A")) {
                Path variantSrc = base.resolve("variant-src-" + version);
                Path variant = base.resolve("variant-" + version++);
                String enumText = nested
                        ? "package p; public class Choices { " + enumSource("E", constants) + " }"
                        : "package p; " + enumSource("E", constants);
                tb.writeJavaFiles(variantSrc, enumText);
                if (!Files.exists(variant)) compile(variantSrc, variant);
                Path runtime = base.resolve("runtime-" + release + "-" + version);
                copyClasses(original, runtime);
                String enumFile = nested ? "p/Choices$E.class" : "p/E.class";
                Files.createDirectories(runtime.resolve("p"));
                Files.copy(variant.resolve(enumFile), runtime.resolve(enumFile),
                        java.nio.file.StandardCopyOption.REPLACE_EXISTING);
                loaders.add(runVersion(runtime, nested ? "p.Choices$E" : "p.E", constants));
            }
        }
    }

    static void copyClasses(Path source, Path dest) throws Exception {
        try (var files = Files.walk(source)) {
            for (Path file : files.filter(p -> p.toString().endsWith(".class")).toList()) {
                Path target = dest.resolve(source.relativize(file));
                Files.createDirectories(target.getParent());
                Files.copy(file, target);
            }
        }
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    static WeakReference<ClassLoader> runVersion(Path runtime, String enumName, String constants) throws Exception {
        URLClassLoader loader = new URLClassLoader(new URL[] {runtime.toUri().toURL()}, null);
        try (loader) {
            System.clearProperty(INIT);
            Class<?> caller = loader.loadClass("p.Choices");
            Class<? extends Enum> enumClass = (Class<? extends Enum>) loader.loadClass(enumName);
            Method select = caller.getMethod("select", enumClass);
            Method sparse = caller.getMethod("sparse", enumClass);
            Method throwing = caller.getMethod("throwing", enumClass);
            check(select, null, -1);
            if (System.getProperty(INIT) != null) throw new AssertionError("null initialized enum");
            for (int repeat = 0; repeat < 16; repeat++) {
                for (String name : constants.split(", ")) {
                    Enum value = Enum.valueOf(enumClass, name);
                    Object result = switch (name) {
                        case "A" -> 0; case "B" -> 1; case "C002" -> 2; case "D" -> 3;
                        default -> MatchException.class;
                    };
                    check(select, value, result);
                    check(sparse, value, name.equals("A") ? 10 : name.equals("D") ? 30 : 99);
                    check(throwing, value, name.equals("A") ? IllegalStateException.class : 7);
                }
                check(sparse, null, -1);
                check(throwing, null, IllegalArgumentException.class);
            }
        }
        return new WeakReference<>(loader);
    }

    static void check(Method method, Object value, Object expected) throws Exception {
        checks++;
        try {
            Object actual = method.invoke(null, new Object[] {value});
            if (!java.util.Objects.equals(actual, expected)) {
                throw new AssertionError(method.getName() + ": " + actual + " != " + expected);
            }
        } catch (InvocationTargetException ex) {
            if (ex.getCause().getClass() != expected) throw ex;
        }
    }

    static void initializationOrder(Path base) throws Exception {
        Path enums = base.resolve("enum-src");
        tb.writeJavaFiles(enums, "package p; " + enumSource("E", "A, B"));
        Path enumOut = base.resolve("enum-classes");
        compile(enums, enumOut);
        for (boolean nullableFirst : new boolean[] {false, true}) {
            Path src = base.resolve("src-" + nullableFirst);
            String nullable = "public static int nullable(p.E e) { return switch(e) { case null -> -1; case A -> 0; default -> 1; }; }";
            String ordinary = "public static int ordinary(java.nio.file.AccessMode e) { return switch(e) { case READ -> 0; default -> 1; }; }";
            tb.writeJavaFiles(src, "public class Init { " +
                    (nullableFirst ? nullable + ordinary : ordinary + nullable) + " }");
            Path out = base.resolve("classes-" + nullableFirst);
            compile(src, out, "-classpath", enumOut.toString());
            try (URLClassLoader loader = new URLClassLoader(new URL[] {out.toUri().toURL(), enumOut.toUri().toURL()}, null)) {
                System.clearProperty(INIT);
                Class<?> c = loader.loadClass("Init");
                c.getMethod("ordinary", java.nio.file.AccessMode.class).invoke(null, java.nio.file.AccessMode.READ);
                if (System.getProperty(INIT) != null) throw new AssertionError("unrelated enum initialized");
                check(c.getMethod("nullable", loader.loadClass("p.E")), null, -1);
                if (System.getProperty(INIT) != null) throw new AssertionError("null initialized enum");
            }
        }
    }

    static void replacementFields(Path base) throws Exception {
        Path originalSrc = base.resolve("original-src");
        tb.writeJavaFiles(originalSrc, "package p; public enum E { A, B }", """
                package p;
                public class Aliases {
                    public static int select(E e) {
                        return switch(e) { case null -> -1; case A -> 7; default -> 9; };
                    }
                }
                """);
        Path original = base.resolve("original");
        compile(originalSrc, original);
        int version = 0;
        for (String field : List.of("public static final E A = B;", "public static final E A = null;",
                "private static final E A = B;", "public E A;", "public static final String A = \"alias\";")) {
            Path source = base.resolve("src-" + version);
            Path variant = base.resolve("variant-" + version);
            tb.writeJavaFiles(source, "package p; public enum E { B; " + field + " }");
            compile(source, variant);
            Path runtime = base.resolve("runtime-" + version++);
            copyClasses(original, runtime);
            Files.copy(variant.resolve("p/E.class"), runtime.resolve("p/E.class"),
                    java.nio.file.StandardCopyOption.REPLACE_EXISTING);
            try (URLClassLoader loader = new URLClassLoader(new URL[] {runtime.toUri().toURL()}, null)) {
                Class<?> e = loader.loadClass("p.E");
                Method select = loader.loadClass("p.Aliases").getMethod("select", e);
                check(select, null, -1);
                check(select, e.getEnumConstants()[0], 9);
            }
        }
    }

    static void manySites(Path base) throws Exception {
        // A per-site label bound must not become an unbounded shared initializer.
        int count = 2_500;
        StringBuilder constants = new StringBuilder("package p; public enum Large { ");
        StringBuilder switches = new StringBuilder("package p; public class Many { ");
        for (int i = 0; i < count; i++) {
            if (i != 0) constants.append(',');
            constants.append('C').append(i);
        }
        constants.append('}');
        for (int i = 0; i < count; i += 4) {
            switches.append("public static int s").append(i).append("(Large e) { return switch(e) {")
                    .append("case null -> -1;");
            for (int j = i; j < i + 4; j++) {
                switches.append("case C").append(j).append(" -> ").append(j).append(';');
            }
            switches.append("default -> -2; }; }");
        }
        switches.append('}');
        Path source = base.resolve("src");
        tb.writeJavaFiles(source, constants.toString(), switches.toString());
        Path out = base.resolve("classes");
        compile(source, out);
        try (URLClassLoader loader = new URLClassLoader(new URL[] {out.toUri().toURL()}, null)) {
            Class<?> e = loader.loadClass("p.Large");
            Object[] values = e.getEnumConstants();
            Class<?> caller = loader.loadClass("p.Many");
            for (int i : new int[] {0, 1_248, 2_496}) {
                Method select = caller.getMethod("s" + i, e);
                check(select, null, -1);
                check(select, values[i], i);
                check(select, values[i + 3], i + 3);
                check(select, values[(i + 4) % count], -2);
            }
        }
    }

    static void modules(Path base) throws Exception {
        Path src = base.resolve("src");
        tb.writeJavaFiles(src.resolve("m.api"), "module m.api { exports api; }", """
                package api;
                public class API {
                    private enum Hidden { A }
                    public static Hidden get(boolean nonNull) { return nonNull ? Hidden.A : null; }
                }
                """, "package api; public enum PublicE { A, B, C }");
        tb.writeJavaFiles(src.resolve("m.use"), "module m.use { requires m.api; exports use; }", """
                package use;
                public class Uses {
                    public static int hidden(boolean nonNull) {
                        var e = api.API.get(nonNull);
                        return switch(e) { case null -> 1; default -> 2; };
                    }
                    public static int hiddenLabel(boolean nonNull) {
                        var e = api.API.get(nonNull);
                        return switch(e) { case null -> 1; case A -> 2; default -> 3; };
                    }
                    public static int select(api.PublicE e) {
                        return switch(e) { case null -> -1; case A -> 7; case B -> 8; default -> 9; };
                    }
                }
                """);
        Path mods = base.resolve("mods");
        compile(src, mods, "--module-source-path", src.toString());
        var config = ModuleLayer.boot().configuration().resolve(ModuleFinder.of(mods), ModuleFinder.of(), Set.of("m.use"));
        ModuleLayer layer = ModuleLayer.boot().defineModulesWithOneLoader(config, ClassLoader.getPlatformClassLoader());
        Class<?> uses = layer.findLoader("m.use").loadClass("use.Uses");
        // Inaccessible inferred types retain the existing linkage path. Do not
        // add a direct values() access to such a class from the generated map.
        for (var method : ClassFile.of().parse(mods.resolve("m.use/use/Uses.class")).methods()) {
            if (method.methodName().stringValue().startsWith("hidden")) {
                boolean bootstrap = method.code().orElseThrow().elementStream()
                        .filter(InvokeDynamicInstruction.class::isInstance)
                        .map(InvokeDynamicInstruction.class::cast)
                        .anyMatch(i -> i.bootstrapMethod().owner().descriptorString()
                                .equals("Ljava/lang/runtime/SwitchBootstraps;"));
                if (!bootstrap) throw new AssertionError("inaccessible inferred enum was rewritten");
            }
        }
        Class<?> e = layer.findLoader("m.api").loadClass("api.PublicE");
        check(uses.getMethod("select", e), null, -1);
        check(uses.getMethod("select", e), e.getEnumConstants()[0], 7);
    }

    static void diagnostics(Path base) throws Exception {
        for (String test : List.of("duplicate", "null", "empty")) {
            Path src = base.resolve(test + "-src");
            String cases = switch (test) {
                case "duplicate" -> "case null -> 0; case A -> 1; case A -> 2; default -> 3;";
                case "null" -> "case null -> 0; case null -> 1; default -> 2;";
                default -> "case null -> 0;";
            };
            tb.writeJavaFiles(src, "class Bad { enum E { A, B } int f(E e) { return switch(e) { " + cases + " }; } }");
            String output = new JavacTask(tb).options("-XDrawDiagnostics")
                    .files(tb.findJavaFiles(src)).run(Task.Expect.FAIL).getOutput(Task.OutputKind.DIRECT);
            String expected = test.equals("empty") ? "compiler.err.not.exhaustive" : "compiler.err.duplicate.case.label";
            if (!output.contains(expected)) throw new AssertionError(output);
        }
    }

    static void positions(Path base) throws Exception {
        String source = """
                package p;
                public class Lines {
                    public enum E { A, B }
                    public static int f(E e) {
                        return 10 + switch(e) {
                            case null -> throw new IllegalStateException("null"); // NULL_ARM
                            case A -> throw new IllegalArgumentException("A"); // ENUM_ARM
                            case B -> 7;
                        };
                    }
                }
                """;
        Path src = base.resolve("src"), out = base.resolve("classes");
        tb.writeJavaFiles(src, source);
        compile(src, out);
        try (URLClassLoader loader = new URLClassLoader(new URL[] {out.toUri().toURL()}, null)) {
            Class<?> c = loader.loadClass("p.Lines"), e = loader.loadClass("p.Lines$E");
            Method f = c.getMethod("f", e);
            for (boolean isNull : new boolean[] {true, false}) {
                String marker = isNull ? "NULL_ARM" : "ENUM_ARM";
                int line = 1 + (int) source.substring(0, source.indexOf(marker)).chars().filter(ch -> ch == '\n').count();
                try { f.invoke(null, new Object[] {isNull ? null : e.getEnumConstants()[0]}); throw new AssertionError(); }
                catch (InvocationTargetException ex) {
                    StackTraceElement frame = ex.getCause().getStackTrace()[0];
                    if (!frame.getMethodName().equals("f") || frame.getLineNumber() != line) throw new AssertionError(frame);
                }
            }
        }
    }
}
