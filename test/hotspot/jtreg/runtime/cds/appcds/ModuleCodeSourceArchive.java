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
 * @test id=cds
 * @summary Module CodeSource state across static and dynamic CDS archives
 * @requires vm.cds.write.archived.java.heap
 * @library /test/lib /test/jdk/jdk/internal/loader
 * @modules java.base/jdk.internal.loader:+open java.base/jdk.internal.module
 *          java.base/jdk.internal.misc
 * @build ModuleCodeSource ModuleCodeSourceArchive jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:. ModuleCodeSourceArchive STATIC DYNAMIC
 */

/*
 * @test id=aot
 * @summary Module CodeSource state across AOT-linked archives
 * @requires vm.cds.supports.aot.class.linking
 * @library /test/lib /test/jdk/jdk/internal/loader
 * @modules java.base/jdk.internal.loader:+open java.base/jdk.internal.module
 *          java.base/jdk.internal.misc
 * @build ModuleCodeSource ModuleCodeSourceArchive
 * @run driver ModuleCodeSourceArchive AOT
 */

import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import jdk.internal.misc.CDS;
import jdk.test.lib.cds.CDSAppTester;
import jdk.test.lib.process.OutputAnalyzer;

public class ModuleCodeSourceArchive {
    public static void main(String[] args) throws Exception {
        ModuleCodeSource.prepare("ModuleCodeSourceArchive", "ModuleCodeSourceArchive$Tester",
                "ModuleCodeSourceArchive$App");
        for (String workflow : args) {
            new Tester(workflow).run(new String[] { workflow });
        }
    }

    static class Tester extends CDSAppTester {
        Tester(String workflow) {
            super("ModuleCodeSource-" + workflow);
            if (workflow.equals("DYNAMIC")) {
                // A bundled AOT-linked base may require a different module
                // graph. Use a fresh ordinary base for compatibility testing.
                setGenerateBaseArchive(true);
                setBaseArchiveOptions("-XX:-AOTClassLinking");
            }
        }

        public String classpath(RunMode mode) { return "probe.jar"; }
        public String modulepath(RunMode mode) { return "jars"; }

        public String[] vmArgs(RunMode mode) {
            List<String> args = new ArrayList<>(ModuleCodeSource.ACCESS);
            args.addAll(List.of("--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                    "--add-modules=m.cache,m.unused,java.sql,jdk.compiler",
                    "-Xlog:class+load=info", "-Xlog:aot=info,cds=info",
                    isAOTWorkflow() ? "-XX:+AOTClassLinking" : "-XX:-AOTClassLinking"));
            return args.toArray(String[]::new);
        }

        public String[] appCommandLine(RunMode mode) {
            return new String[] { App.class.getName(), mode.isProductionRun() ? "production" : "training",
                    isDynamicWorkflow() ? "dynamic" : "fullgraph" };
        }

        public void checkExecution(OutputAnalyzer out, RunMode mode) {
            if (mode.isApplicationExecuted()) {
                out.shouldContain("ModuleCodeSource archive passed");
            }
            if (mode.isProductionRun()) {
                // Confirm an application class really came from the archive.
                out.shouldMatch("ModuleCodeSourceArchive\\$App source: shared objects file");
                out.shouldMatch("cache.mod.A source: shared objects file");
                out.shouldMatch("cache.mod.Late source: file:");
                out.shouldNotMatch("cache.mod.Late source: shared objects file");
                if (!isDynamicWorkflow()) {
                    // A fresh module graph would also have empty caches. Require
                    // actual restoration, not just shared class metadata.
                    out.shouldContain("use_full_module_graph = true");
                }
                if (isAOTWorkflow()) {
                    out.shouldContain("Using AOT-linked classes: true");
                }
            }
        }
    }

    public static class App {
        public static void main(String[] args) throws Exception {
            boolean production = args[0].equals("production");
            if (production) {
                ModuleCodeSource.check(CDS.isUsingArchive(), "archive in use");
                // For static/AOT, full-graph restoration is required by the
                // driver. Dynamic CDS checks compatibility with its base graph;
                // it does not prove restoration of the new module holders.
                ModuleCodeSource.empty("cache.mod");
                ModuleCodeSource.empty("java.sql");
                ModuleCodeSource.empty("com.sun.tools.javac");
            }
            ModuleCodeSource.empty("unused.mod");
            Class<?> a = ModuleCodeSource.load("cache.mod.A");
            Class<?> sql = ModuleCodeSource.load("java.sql.Driver");
            Class<?> javac = ModuleCodeSource.load("com.sun.tools.javac.Main");
            for (Class<?> c : List.of(a, sql, javac)) {
                URL url = ModuleLayer.boot().configuration().findModule(c.getModule().getName())
                        .orElseThrow().reference().location().orElseThrow().toURL();
                ModuleCodeSource.source(c, url);
            }
            if (production) {
                // This class was never requested in training. Exercise a real
                // built-in module definition after restoring archived state.
                Class<?> late = ModuleCodeSource.load("cache.mod.Late");
                ModuleCodeSource.check(late.getProtectionDomain() == a.getProtectionDomain(),
                        "archived/new class PD equivalence");
                URL moduleURL = ModuleLayer.boot().configuration().findModule("m.cache")
                        .orElseThrow().reference().location().orElseThrow().toURL();
                ModuleCodeSource.check(a.getPackage() == late.getPackage()
                        && a.getPackage().isSealed(moduleURL), "archived/new sealed package equivalence");
                Object cs = ModuleCodeSource.field(ModuleCodeSource.loaded("cache.mod"), "codeSource");
                ModuleCodeSource.check(cs != null && cs.equals(a.getProtectionDomain().getCodeSource()),
                        "post-restore source publication");
            } else {
                for (String pkg : List.of("cache.mod", "java.sql", "com.sun.tools.javac")) {
                    ModuleCodeSource.check(ModuleCodeSource.field(ModuleCodeSource.loaded(pkg), "codeSource") != null,
                            "training populated " + pkg);
                }
            }
            ModuleCodeSource.empty("unused.mod");
            System.out.println("ModuleCodeSource archive passed");
        }
    }
}
