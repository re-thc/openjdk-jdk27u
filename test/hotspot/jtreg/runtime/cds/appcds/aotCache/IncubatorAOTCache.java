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
 * @summary Incubator modules retain the archived boot layer and AOT-linked classes
 * @requires vm.cds.supports.aot.class.linking
 * @requires vm.flagless
 * @library /test/lib
 * @modules java.management
 *          jdk.management
 *          jdk.incubator.vector
 * @build IncubatorAOTCache jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller -jar app.jar IncubatorScalarApp IncubatorVectorApp
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver IncubatorAOTCache AOT --two-step-training
 * @run driver IncubatorAOTCache AOT --one-step-training
 * @run driver IncubatorAOTCache STATIC
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI IncubatorAOTCache DYNAMIC
 */

import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.management.ManagementFactory;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.function.IntUnaryOperator;

import com.sun.management.HotSpotDiagnosticMXBean;

import jdk.incubator.vector.IntVector;
import jdk.incubator.vector.VectorOperators;
import jdk.incubator.vector.VectorSpecies;
import jdk.test.lib.Asserts;
import jdk.test.lib.Platform;
import jdk.test.lib.cds.CDSAppTester;
import jdk.test.lib.cds.CDSJarUtils;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class IncubatorAOTCache {
    private static final String WARNING = "WARNING: Using incubator modules: jdk.incubator.vector";
    private static final String LOGGING = "-Xlog:aot=debug,cds=debug,aot+module=debug,"
        + "aot+init=debug,aot+class=debug,class+load=info,class+init=info";

    public static void main(String[] args) throws Exception {
        // The first control distinguishes the incubator gate from a generally unusable archive.
        new Tester("scalar", false, false, args).run(args);
        new Tester("scalar-vector-module", true, false, args).run(args);
        Tester vector = new Tester("vector", true, true, args);
        vector.run(args);

        if (args[0].equals("AOT")) {
            checkSplitPackages();
            // A graph mismatch must still reject an archive containing AOT-linked classes.
            runWithCache(vector, true, "--add-modules=jdk.incubator.vector,jdk.httpserver")
                .shouldNotHaveExitValue(0)
                .shouldContain("Mismatched values for property jdk.module.addmods")
                .shouldContain("It cannot be used when archived full module graph is not used");
            runWithCache(vector, true, "--show-module-resolution")
                .shouldNotHaveExitValue(0)
                .shouldContain("It cannot be used when archived full module graph is not used");

            Path empty = Files.createDirectories(Path.of("empty-modules"));
            for (String option : List.of("--patch-module=jdk.incubator.vector=" + empty,
                                         "--upgrade-module-path=" + empty,
                                         "--limit-modules=java.base,jdk.incubator.vector")) {
                String name = option.substring(0, option.indexOf('='));
                runWithCache(vector, true, option)
                    .shouldNotHaveExitValue(0)
                    .shouldContain("is disabled when the " + name + " option is specified");
                OutputAnalyzer fallback = runWithCache(vector, false, option, "-XX:AOTMode=auto");
                fallback.shouldHaveExitValue(0).shouldContain("APP-OK")
                        .shouldContain("is disabled when the " + name + " option is specified")
                        .shouldMatch("class,load.*IncubatorVectorApp source: file:")
                        .shouldNotContain("Using AOT-linked classes: true");
                checkWarnings(fallback, 1);
            }

            // These change the runtime's preferred vector width. Compare with a fresh VM,
            // rather than assuming a particular CPU or a preferred species size.
            if (Platform.isX64()) {
                checkVectorConfiguration(vector, "-XX:UseAVX=0");
                checkVectorConfiguration(vector, "-XX:MaxVectorSize=16");
            }
        }
    }

    private static void checkSplitPackages() throws Exception {
        Path source = Files.createDirectories(Path.of("split-source"));
        Files.writeString(source.resolve("module-info.java"), "module vector.conflict { }");
        Path pkg = Files.createDirectories(source.resolve("jdk/incubator/vector"));
        Files.writeString(pkg.resolve("Conflict.java"),
                          "package jdk.incubator.vector; public class Conflict { }");
        CDSJarUtils.buildFromSourceDirectory("conflict.jar", source.toString());
        ProcessTools.executeTestJava("-Xshare:dump", "-XX:SharedArchiveFile=split.jsa",
            "--module-path=conflict.jar", "--add-modules=jdk.incubator.vector,vector.conflict")
            .shouldNotHaveExitValue(0)
            .shouldMatch("Package jdk.incubator.vector in both module .* and module .*");
    }

    private static OutputAnalyzer runWithCache(Tester tester, boolean archived, String... options) throws Exception {
        List<String> command = new ArrayList<>(List.of(tester.vmArgs(CDSAppTester.RunMode.PRODUCTION)));
        command.addAll(List.of("-XX:AOTMode=on", "-XX:AOTCache=" + tester.aotCacheFile()));
        command.addAll(List.of(options));
        command.addAll(List.of("-cp", "app.jar", "IncubatorVectorApp", archived ? "archived" : "training"));
        return ProcessTools.executeTestJava(command.toArray(String[]::new));
    }

    private static void checkVectorConfiguration(Tester tester, String option) throws Exception {
        String flag = option.substring("-XX:".length(), option.indexOf('='));
        try {
            ManagementFactory.getPlatformMXBean(HotSpotDiagnosticMXBean.class).getVMOption(flag);
        } catch (IllegalArgumentException e) {
            // C1-only and Zero VMs may not provide these CPU/compiler options.
            System.out.println("Skipping unavailable VM option: " + flag);
            return;
        }
        OutputAnalyzer fresh = ProcessTools.executeTestJava(
            "-Xshare:off", option, "--add-modules=jdk.incubator.vector",
            "-cp", "app.jar", "IncubatorVectorApp", "training");
        fresh.shouldHaveExitValue(0);
        OutputAnalyzer cached = runWithCache(tester, true, option,
            "-XX:+UnlockDiagnosticVMOptions", "-XX:-AbortVMOnAOTCodeFailure");
        cached.shouldHaveExitValue(0).shouldContain("Using AOT-linked classes: true");
        Asserts.assertEQ(vectorShape(cached), vectorShape(fresh));
        checkWarnings(cached, 1);
    }

    private static String vectorShape(OutputAnalyzer out) {
        out.shouldMatch("VECTOR-SHAPE preferred=([0-9]+) max=([0-9]+)");
        return out.firstMatch("VECTOR-SHAPE preferred=([0-9]+) max=([0-9]+)");
    }

    private static void checkWarnings(OutputAnalyzer out, int expected) {
        long count = out.getStderr().lines().filter(WARNING::equals).count();
        Asserts.assertEQ(count, (long) expected, "incubator warning count");
    }

    private static class Tester extends CDSAppTester {
        private final boolean incubator;
        private final boolean vector;
        private final boolean oneStep;

        Tester(String name, boolean incubator, boolean vector, String[] args) {
            super(name + "-" + String.join("-", args));
            this.incubator = incubator;
            this.vector = vector;
            oneStep = args.length > 1 && args[1].equals("--one-step-training");
        }

        @Override
        public String classpath(RunMode mode) {
            return "app.jar";
        }

        @Override
        public String[] vmArgs(RunMode mode) {
            List<String> options = new ArrayList<>(List.of(LOGGING,
                "--add-opens=java.base/jdk.internal.module=ALL-UNNAMED"));
            if (incubator) {
                options.add("--add-modules=jdk.incubator.vector");
            }
            if (vector && isAOTWorkflow()) {
                options.add("-XX:+AOTClassLinking");
            }
            return options.toArray(String[]::new);
        }

        @Override
        public String[] appCommandLine(RunMode mode) {
            return new String[] { vector ? "IncubatorVectorApp" : "IncubatorScalarApp",
                                  mode.isProductionRun() && !isDynamicWorkflow()
                                      ? "archived" : "training" };
        }

        @Override
        public void checkExecution(OutputAnalyzer out, RunMode mode) {
            int warnings = incubator ? 1 : 0;
            if (oneStep && mode == RunMode.TRAINING) {
                // The recording process launches a separate assembly VM; both warn once.
                warnings *= 2;
            }
            checkWarnings(out, warnings);
            if (mode.isApplicationExecuted()) {
                out.shouldContain("APP-OK");
            }
            if (isAOTWorkflow() && (mode == RunMode.ASSEMBLY || (oneStep && mode == RunMode.TRAINING))) {
                out.shouldContain("Full module graph = enabled")
                   .shouldMatch("IncubatorScalarApp\\$\\$Lambda/[^\\r\\n]+hidden aot-linked inited")
                   .shouldNotMatch("jdk\\.incubator\\.vector\\.(VectorShape|IntVector|AbstractSpecies|.*Species) aot-linked inited");
            }
            if (mode.isProductionRun()) {
                // A dynamic top archive cannot add a boot layer to its base archive.
                if (!isDynamicWorkflow()) {
                    out.shouldContain("ARCHIVED-BOOT-LAYER-OK")
                       .shouldContain("use_full_module_graph = true; java.base")
                       .shouldNotContain("CDS heap data is disabled");
                }
                if (isAOTWorkflow()) {
                    out.shouldContain("Using AOT-linked classes: true");
                }
                if (vector) {
                    out.shouldMatch("class,load.*IncubatorVectorApp source: shared objects")
                       .shouldMatch("class,load.*jdk.incubator.vector.IntVector source: shared objects")
                       .shouldMatch("class,init.*Initializing 'jdk/incubator/vector/VectorShape'")
                       .shouldNotMatch("jdk\\.incubator\\.vector\\.(VectorShape|IntVector|AbstractSpecies|.*Species) \\(aot-inited");
                }
            }
        }
    }
}

class IncubatorScalarApp {
    public static int increment(int value) {
        return value + 1;
    }

    public static void main(String[] args) throws Throwable {
        IntUnaryOperator increment = value -> value + 1;
        var handle = MethodHandles.lookup().findStatic(IncubatorScalarApp.class, "increment",
                                                       MethodType.methodType(int.class, int.class));
        if (increment.applyAsInt(41) != 42 || (int) handle.invokeExact(41) != 42) {
            throw new AssertionError("lambda/method handle result");
        }
        if (args[0].equals("archived")) {
            // The restored layer itself is a heap object. Check its identity, not just
            // whether some classes were loaded from the shared archive.
            Class<?> archived = Class.forName("jdk.internal.module.ArchivedBootLayer");
            var get = archived.getDeclaredMethod("get");
            var layer = archived.getDeclaredMethod("bootLayer");
            get.setAccessible(true);
            layer.setAccessible(true);
            Object holder = get.invoke(null);
            if (holder == null || layer.invoke(holder) != ModuleLayer.boot()) {
                throw new AssertionError("boot layer was not restored from the archived heap");
            }
            System.out.println("ARCHIVED-BOOT-LAYER-OK");
        }
        System.out.println("APP-OK");
    }
}

class IncubatorVectorApp {
    public static void main(String[] args) throws Throwable {
        Module module = IntVector.class.getModule();
        if (module != ModuleLayer.boot().findModule("jdk.incubator.vector").orElseThrow()
                || module.getLayer() != ModuleLayer.boot()
                || module.getClassLoader() != null
                || !module.getDescriptor().exports().stream()
                          .anyMatch(e -> e.source().equals("jdk.incubator.vector"))) {
            throw new AssertionError("vector module identity");
        }
        VectorSpecies<Integer> species = IntVector.SPECIES_PREFERRED;
        int[] values = new int[257];
        int expected = 0;
        for (int i = 0; i < values.length; i++) {
            values[i] = i - 80;
            expected += values[i] * 3 + 7;
        }
        int actual = 0;
        int i = 0;
        for (; i < species.loopBound(values.length); i += species.length()) {
            actual += IntVector.fromArray(species, values, i).mul(3).add(7)
                               .reduceLanes(VectorOperators.ADD);
        }
        for (; i < values.length; i++) {
            actual += values[i] * 3 + 7;
        }
        var broadcast = MethodHandles.lookup().findStatic(IntVector.class, "broadcast",
            MethodType.methodType(IntVector.class, VectorSpecies.class, int.class));
        IntVector v = (IntVector) broadcast.invokeExact(species, 5);
        IntUnaryOperator reduce = value -> IntVector.broadcast(species, value).reduceLanes(VectorOperators.ADD);
        if (actual != expected || v.reduceLanes(VectorOperators.ADD) != 5 * species.length()
                || reduce.applyAsInt(7) != 7 * species.length()) {
            throw new AssertionError("vector/lambda/method handle result");
        }
        System.out.println("VECTOR-SHAPE preferred=" + species.vectorBitSize()
                           + " max=" + IntVector.SPECIES_MAX.vectorBitSize());
        IncubatorScalarApp.main(args);
    }
}
