/*
 * Copyright (c) 2016, 2018, Oracle and/or its affiliates. All rights reserved.
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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

package build.tools.module;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UncheckedIOException;
import java.lang.module.ModuleDescriptor;
import java.lang.module.ModuleFinder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import javax.tools.ToolProvider;
import build.tools.module.GenModuleInfoSource.Statement;

/**
 * Sanity test for GenModuleInfoSource tool
 */
public class ModuleInfoExtraTest {
    private static final Path DIR = Paths.get("gen-module-info-test");
    private static boolean verbose = false;
    public static void main(String... args) throws Exception {
        if (args.length == 2 && args[0].equals("--check-imports")) {
            checkImportDescriptors(Path.of(args[1]));
            return;
        }
        if (args.length != 0)
            verbose = true;

        GenModuleInfoSource.verbose = verbose;
        ModuleInfoExtraTest test = new ModuleInfoExtraTest("m", "m1", "m2", "m3");
        test.testModuleInfo();
        test.testExcludedModules();
        test.testSourceImports();
        test.testUnicodeBraces();
        test.errorCases();
    }

    void testUnicodeBraces() throws IOException {
        Path input = DIR.resolve("unicode-imports/module-info.java");
        Path output = DIR.resolve("unicode-generated/module-info.java");
        Path extra = DIR.resolve("unicode-imports/extra");
        Files.createDirectories(input.getParent());
        Files.createDirectories(output.getParent());
        Files.writeString(extra, "uses java.lang.Runnable;");
        for (String body : List.of("", "requires static java.sql;")) {
            String source = "open module unicode.test \\uu007b\n" + body
                    + "\n\\u007d // trailing comment\n";
            Files.writeString(input, source);
            GenModuleInfoSource unchanged = new GenModuleInfoSource(input, List.of(), Set.of("unicode.test"));
            unchanged.generate(output);
            if (!Files.readString(output).equals(source)) {
                throw new AssertionError("Unmodified escaped descriptor changed");
            }
            GenModuleInfoSource augmented = new GenModuleInfoSource(input, List.of(extra), Set.of("unicode.test"));
            augmented.generate(output);
            Path classes = DIR.resolve("unicode-classes");
            if (ToolProvider.getSystemJavaCompiler().run(null, null, null,
                    "-Werror", "-d", classes.toString(), output.toString()) != 0) {
                throw new AssertionError("Escaped augmented descriptor compilation failed");
            }
            var descriptor = ModuleFinder.of(classes).find("unicode.test").orElseThrow().descriptor();
            if (!descriptor.isOpen() || !descriptor.uses().contains("java.lang.Runnable") ||
                    (!body.isEmpty() && descriptor.requires().stream().noneMatch(r ->
                            r.name().equals("java.sql") && r.modifiers().contains(ModuleDescriptor.Requires.Modifier.STATIC)))) {
                throw new AssertionError("Escaped descriptor semantics lost");
            }
            if (!Files.readString(output).endsWith("\\u007d // trailing comment\n")) {
                throw new AssertionError("Escaped descriptor suffix lost");
            }
        }
    }

    void testSourceImports() throws IOException {
        Path input = DIR.resolve("source-imports");
        Path generated = DIR.resolve("generated-imports");
        String requires = """
                requires static java.sql;
                requires transitive
                    java.logging;
                requires static /* keep both modifiers */ transitive java.xml;
                requires transitive static java.naming;
                """;
        String open = """
                /* imported descriptor */
                @Deprecated(since="27", forRemoval=true)
                open module server.open
                {
                %s
                    exports openapi to java.desktop, client.keep;
                } // trailing comment
                """.formatted(requires);
        String closed = """
                module server.extra {
                %s
                    exports api;
                    exports impl to java.desktop, client.keep;
                    exports hidden to java.desktop;
                    opens impl to java.desktop, client.keep;
                    opens hidden to java.desktop;
                    uses java.lang.Runnable;
                    provides java.lang.Runnable with impl.Service;
                }
                """.formatted(requires);
        Map<String, String> descriptors = Map.of("server.open", open,
                "server.extra", closed, "client.keep", "module client.keep { }");
        Set<String> allowed = Set.of("server.open", "server.extra", "client.keep");
        for (var entry : descriptors.entrySet()) {
            Path file = input.resolve(entry.getKey()).resolve("module-info.java");
            Files.createDirectories(file.getParent());
            Files.writeString(file, entry.getValue());
            Path output = generated.resolve(entry.getKey()).resolve("module-info.java");
            Files.createDirectories(output.getParent());
            GenModuleInfoSource generator = new GenModuleInfoSource(file, List.of(), allowed);
            generator.moduleInfo.excludeModules(Set.of("java.desktop"));
            generator.generate(output);
            if (entry.getKey().startsWith("server.")) {
                String text = Files.readString(output);
                if (!text.contains(requires) || text.contains("java.desktop")) {
                    throw new AssertionError("Imported requires/qualified targets changed: " + text);
                }
            }
        }
        Map<String, String> classes = Map.of(
                "server.open/openapi/Open.java", "package openapi; public class Open { public Open() {} }",
                "server.extra/api/Api.java", "package api; public class Api { public Api() {} }",
                "server.extra/impl/Service.java", "package impl; public class Service implements Runnable { public Service() {} public void run() {} }",
                "server.extra/hidden/Hidden.java", "package hidden; public class Hidden { public Hidden() {} }");
        for (var entry : classes.entrySet()) {
            Path file = generated.resolve(entry.getKey());
            Files.createDirectories(file.getParent());
            Files.writeString(file, entry.getValue());
            Path imported = input.resolve(entry.getKey());
            Files.createDirectories(imported.getParent());
            Files.writeString(imported, entry.getValue());
        }
        // If javac discovers this excluded imported source, compilation fails.
        Path desktop = input.resolve("java.desktop");
        Files.createDirectories(desktop);
        Files.writeString(desktop.resolve("module-info.java"), "module java.desktop { }");
        Files.writeString(desktop.resolve("MustNotCompile.java"), "excluded invalid Java source");
        compileImports(generated, DIR.resolve("import-classes"));

        // The platform-extra path must preserve open modules and complete
        // multiline static/transitive requires too.
        Path extra = input.resolve("extra");
        Files.writeString(extra, "exports openapi to client.keep;");
        Path original = DIR.resolve("augmented-source/module-info.java");
        Files.createDirectories(original.getParent());
        Files.writeString(original, open.replace("exports openapi to java.desktop, client.keep;", ""));
        GenModuleInfoSource augmented = new GenModuleInfoSource(original, List.of(extra), allowed);
        augmented.generate(generated.resolve("server.open/module-info.java"));
        compileImports(generated, DIR.resolve("augmented-import-classes"));
    }

    void compileImports(Path source, Path output) throws IOException {
        var compiler = ToolProvider.getSystemJavaCompiler();
        try (var manager = compiler.getStandardFileManager(null, null, null);
             var files = Files.walk(source)) {
            var inputs = files.filter(p -> p.toString().endsWith(".java")).toList();
            if (!compiler.getTask(null, manager, null, List.of("--module-source-path",
                    source.toString(), "-d", output.toString(), "-Werror"), null,
                    manager.getJavaFileObjectsFromPaths(inputs)).call()) {
                throw new AssertionError("Imported source compilation failed");
            }
        }
        checkImportDescriptors(output);
    }

    static void checkImportDescriptors(Path output) {
        var finder = ModuleFinder.of(output);
        ModuleDescriptor open = finder.find("server.open").orElseThrow().descriptor();
        ModuleDescriptor closed = finder.find("server.extra").orElseThrow().descriptor();
        if (!open.isOpen() || open.exports().size() != 1 || closed.isOpen() || closed.exports().size() != 2 ||
                closed.opens().size() != 1 || !closed.uses().contains("java.lang.Runnable") ||
                closed.provides().size() != 1) {
            throw new AssertionError("Imported descriptor semantics lost");
        }
        var openExport = open.exports().iterator().next();
        if (!openExport.source().equals("openapi") || !openExport.targets().equals(Set.of("client.keep"))) {
            throw new AssertionError("Open module qualified export changed: " + openExport);
        }
        for (var descriptor : List.of(open, closed)) {
            Set<String> required = descriptor.requires().stream()
                    .map(ModuleDescriptor.Requires::name).collect(Collectors.toSet());
            if (!required.containsAll(Set.of("java.sql", "java.logging", "java.xml", "java.naming"))) {
                throw new AssertionError("Imported requires directives lost: " + required);
            }
            for (var requirement : descriptor.requires()) {
                Set<ModuleDescriptor.Requires.Modifier> expected = switch (requirement.name()) {
                    case "java.sql" -> Set.of(ModuleDescriptor.Requires.Modifier.STATIC);
                    case "java.logging" -> Set.of(ModuleDescriptor.Requires.Modifier.TRANSITIVE);
                    case "java.xml", "java.naming" -> Set.of(ModuleDescriptor.Requires.Modifier.STATIC,
                            ModuleDescriptor.Requires.Modifier.TRANSITIVE);
                    default -> requirement.modifiers();
                };
                if (!requirement.modifiers().equals(expected)) {
                    throw new AssertionError("Requires modifiers lost: " + requirement);
                }
            }
        }
        for (var export : closed.exports()) {
            if (export.source().equals("impl") && !export.targets().equals(Set.of("client.keep"))) {
                throw new AssertionError("Qualified export broadened: " + export);
            }
        }
        if (!closed.opens().iterator().next().targets().equals(Set.of("client.keep"))) {
            throw new AssertionError("Qualified opens broadened");
        }
    }

    String[] moduleInfo = new String[] {
        "module m {",
        "    requires m1;",
        "    requires transitive m2;",
        "    exports p",
        "    to",
        "               // comment ... ",
        "    /* comment */ m1",
        ",",
        "       m2,m3",
        "  ;",
        "    exports q to m1;",
        "    provides s with /*   ",
        "    comment */ impl     ;    // comment",
        "    provides s1",
        "       with  ",
        "       impl1, impl2;",
        "}"
    };

    String[] moduleInfoExtra = new String[] {
        "exports q",
        "to",
        "   m2 // comment",
        "   /* comment */;",
        "   ;",
        "opens p.q ",
        "   to /* comment */ m3",
        "   , // m1",
        "   /* comment */ m4; uses p.I",
        ";   provides s1 with impl3;"
    };

    final Builder builder;
    ModuleInfoExtraTest(String name, String... modules) {
        this.builder = new Builder(name).modules(modules);
    }

    void testExcludedModules() throws IOException {
        GenModuleInfoSource source = builder.sourceFile(new String[] {
            "@Deprecated(since=\"27\", forRemoval=true)",
            "module m {",
            "    exports p to m1, m2;",
            "    exports q to m1;",
            "    exports publicapi;",
            "    opens internal to m1;",
            "    opens shared to m1, m2;",
            "}"
        }).build();
        source.moduleInfo.excludeModules(Set.of("m1"));
        if (!source.moduleInfo.exports.get("p").targets.equals(Set.of("m2")) ||
            source.moduleInfo.exports.containsKey("q") ||
            !source.moduleInfo.exports.get("publicapi").isUnqualified() ||
            source.moduleInfo.opens.containsKey("internal") ||
            !source.moduleInfo.opens.get("shared").targets.equals(Set.of("m2"))) {
            throw new AssertionError("Incorrect export/open filtering");
        }
        Path output = DIR.resolve("filtered-module-info.java");
        source.generate(output);
        if (!Files.readString(output).contains("@Deprecated(since=\"27\", forRemoval=true)")) {
            throw new AssertionError("Module annotation lost");
        }
    }


    void testModuleInfo() throws IOException {
        GenModuleInfoSource source = builder.sourceFile(moduleInfo).build();
        Set<String> targetsP = new HashSet<>();
        targetsP.add("m1");
        targetsP.add("m2");
        targetsP.add("m3");

        Set<String> targetsQ = new HashSet<>();
        targetsQ.add("m1");

        Set<String> providerS = new HashSet<>();
        providerS.add("impl");

        Set<String> providerS1 = new HashSet<>();
        providerS1.add("impl1");
        providerS1.add("impl2");

        Set<String> opensPQ = new HashSet<>();

        check(source, targetsP, targetsQ, opensPQ, providerS, providerS1);

        // augment with extra
        Path file = DIR.resolve("extra");
        Files.write(file, Arrays.asList(moduleInfoExtra));
        source = builder.build(file);

        targetsQ.add("m2");
        providerS1.add("impl3");

        opensPQ.add("m3");
        check(source, targetsP, targetsQ, opensPQ, providerS, providerS1);
    }

    void check(GenModuleInfoSource source,
               Set<String> targetsP,
               Set<String> targetsQ,
               Set<String> opensPQ,
               Set<String> providerS,
               Set<String> providerS1) {
        if (verbose)
            source.moduleInfo.print(new PrintWriter(System.out, true));

        Statement export = source.moduleInfo.exports.get("p");
        if (!export.targets.equals(targetsP)) {
            throw new Error("unexpected: " + export);
        }

        export = source.moduleInfo.exports.get("q");
        if (!export.targets.equals(targetsQ)) {
            throw new Error("unexpected: " + export);
        }

        Statement provides = source.moduleInfo.provides.get("s");
        if (!provides.targets.equals(providerS)) {
            throw new Error("unexpected: " + provides);
        }

        provides = source.moduleInfo.provides.get("s1");
        if (!provides.targets.equals(providerS1)) {
            throw new Error("unexpected: " + provides);
        }
    }

    final Map<String[], String> badModuleInfos = Map.of(
        new String[] {
            "module x {",
            "   exports p1 to ",
            "           m1",
            "}"
        },                      ".*, line .*, compiler.err.expected.*",
        new String[] {
            "module x ",
            "   exports p1;"
        },                      ".*, line .*, compiler.err.expected.*",
        new String[] {
            "module x {",
            "   requires m1;",
            "   requires",
            "}"
        },                      ".*, line .*, compiler.err.expected.*",
        new String[] {
            "module x {",
            "   requires transitive m1",
            "}"
        },                      ".*, line .*, compiler.err.expected.*",
        new String[] {
            "module x {",
            "   exports p1 to m1;",
            "   exports p1 to m2;",
            "}"
        },                      ".*, line .*, multiple exports p1.*"
    );

    final Map<String[], String> badExtraFiles = Map.of(
            new String[] {
                "requires m2;"     // not allowed
            },                      ".*, line .*, cannot declare requires .*",
            new String[] {
                "exports p1 to m1;",
                "exports p2"            // missing semicolon
            },                      ".*, line .*, reach end of file.*",
            new String[] {
                "exports to m1;"        // missing <identifier>
            },                      ".*, line .*, <identifier> missing.*",
            new String[] {
                "exports p3 to m1;",
                "    m2, m3;"           // missing keyword
            },                      ".*, line .*, missing keyword.*",
            new String[] {
                "provides s with impl1;",   // typo ; should be ,
                "   impl2, impl3;"
            },                      ".*, line .*, missing keyword.*",
            new String[] {
                "uses s3",                  // missing semicolon
                "provides s3 with impl1,",
                "   impl2, impl3;"
            },                      ".*, line .*, missing semicolon.*",
            new String[] {
                "opens p1 to m1,, m2;"     // missing identifier
            },                      ".*, line .*, <identifier> missing.*"
    );

    final Map<String[], String> duplicates = Map.of(
            new String[] {
                "   exports p1 to m1, m2;",
                "   exports p1 to m3;",
            },                      ".*, line .*, multiple exports p1.*",
            new String[] {
                "   opens p1 to m1, m2;",
                "   exports p1 to m3;",
                "   opens p1 to m3;"
            },                      ".*, line .*, multiple opens p1.*",
            new String[] {
                "   uses s;",
                "   uses s;"
            },                      ".*, line .*, multiple uses s.*",
            new String[] {
                "   provides s with impl1;",
                "   provides s with impl2, impl3;"
            },                      ".*, line .*, multiple provides s.*"
    );

    void errorCases() {
        badModuleInfos.entrySet().stream().forEach(e -> badModuleInfoFile(e.getKey(), e.getValue()));
        badExtraFiles.entrySet().stream().forEach(e -> badExtraFile(e.getKey(), e.getValue()));
        duplicates.entrySet().stream().forEach(e -> badExtraFile(e.getKey(), e.getValue()));
    }

    void badModuleInfoFile(String[] lines, String regex)  {
        Builder builder = new Builder("x").modules("m1", "m2", "m3");
        try {
            GenModuleInfoSource source = builder.sourceFile(lines).build();
            throw new RuntimeException("Expected error: " + Arrays.toString(lines));
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        } catch (Error e) {
            if (!e.getMessage().matches(regex)) {
                throw e;
            }
        }
    }

    void badExtraFile(String[] extras, String regex)  {
        Path file = DIR.resolve("test1");
        try {
            Files.write(file, Arrays.asList(extras));
            builder.build(file);
            Files.deleteIfExists(file);
            throw new RuntimeException("Expected error: " + Arrays.toString(extras));
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        } catch (Error e) {
            if (!e.getMessage().matches(regex)) {
                throw e;
            }
        }
    }

    static class Builder {
        final String moduleName;
        final Path sourceFile;
        final Set<String> modules = new HashSet<>();
        public Builder(String name) {
            this.moduleName = name;
            this.sourceFile = DIR.resolve(name).resolve("module-info.java");
        }

        public Builder modules(String... names) {
            Arrays.stream(names).forEach(modules::add);
            return this;
        }

        public Builder sourceFile(String... lines) throws IOException {
            Files.createDirectories(sourceFile.getParent());
            try (BufferedWriter bw = Files.newBufferedWriter(sourceFile);
                 PrintWriter writer = new PrintWriter(bw)) {
                for (String l : lines) {
                    writer.println(l);
                }
            }
            return this;
        }

        public GenModuleInfoSource build() throws IOException {
            return build(Collections.emptyList());
        }

        public GenModuleInfoSource build(Path extraFile) throws IOException {
            return build(Collections.singletonList(extraFile));
        }

        public GenModuleInfoSource build(List<Path> extraFiles) throws IOException {
            return new GenModuleInfoSource(sourceFile, extraFiles, modules);
        }
    }

}
