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
 * @test id=ordinary
 * @summary C2 admits null-only bootstrap ForceInline calls without resolving signature classes
 * @requires vm.compiler2.enabled & vm.flagless & vm.cds
 * @library / /test/lib
 * @modules java.base/jdk.internal.vm.annotation jdk.compiler java.xml
 * @run driver/timeout=480 compiler.inlining.TestNullOnlyUnloadedSignature ordinary
 */

/*
 * @test id=incremental
 * @summary Delayed inlining retains the unloaded-signature restriction
 * @requires vm.compiler2.enabled & vm.flagless & vm.cds & vm.debug
 * @library / /test/lib
 * @modules java.base/jdk.internal.vm.annotation jdk.compiler java.xml
 * @run driver/timeout=240 compiler.inlining.TestNullOnlyUnloadedSignature incremental
 */

/*
 * @test id=replay
 * @summary Replay preserves the admitted bootstrap call and its null-result protection
 * @requires vm.compiler2.enabled & vm.flagless & vm.cds & vm.debug
 * @library / /test/lib
 * @modules java.base/jdk.internal.vm.annotation jdk.compiler java.xml
 * @run driver/timeout=240 compiler.inlining.TestNullOnlyUnloadedSignature replay
 */

package compiler.inlining;

import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import jdk.test.lib.Asserts;
import jdk.test.lib.compiler.CompilerUtils;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class TestNullOnlyUnloadedSignature {
    static final String PACKAGE = "compiler.inlining.nullsignature";
    static final String SUITE = PACKAGE + ".BootSuite";
    static final String SPECIAL = "force inline by annotation (null-only unloaded signature)";
    static final Map<String, Set<String>> TARGETS = Map.ofEntries(
            Map.entry("argument", Set.of("argument")),
            Map.entry("return", Set.of("result")),
            Map.entry("discard", Set.of("result")),
            Map.entry("wide", Set.of("wide")),
            Map.entry("instance-wide", Set.of("instanceWide")),
            Map.entry("missing", Set.of("missingResult", "missingArgument")),
            Map.entry("throwing", Set.of("throwing")),
            Map.entry("merge", Set.of("argument")),
            Map.entry("loop", Set.of("argument")),
            Map.entry("array", Set.of("arrayArgument")),
            Map.entry("unannotated", Set.of("unannotated")),
            Map.entry("interface", Set.of("accept")),
            Map.entry("static-interface", Set.of("acceptStatic")));
    static final Set<String> NEGATIVE = Set.of("array", "unannotated", "interface", "static-interface");
    static Path classes;

    public static void main(String[] args) throws Exception {
        classes = Path.of("null-signature-classes").toAbsolutePath();
        Asserts.assertTrue(CompilerUtils.compile(Path.of(System.getProperty("test.src"), "nullsignature"),
                classes, "--add-exports", "java.base/jdk.internal.vm.annotation=ALL-UNNAMED"));
        // The descriptor remains in the fixture, but its class must be absent at runtime.
        Files.delete(classes.resolve(PACKAGE.replace('.', '/') + "/MissingU.class"));
        switch (args[0]) {
            case "ordinary" -> {
                for (String mode : List.of("argument", "return", "discard", "wide", "instance-wide",
                        "missing", "throwing", "merge", "loop", "array", "unannotated", "interface",
                        "static-interface")) {
                    for (String share : List.of("on", "off")) {
                        run(mode, "boot", share, "", false);
                    }
                }
                for (String loader : List.of("app", "custom")) {
                    for (String mode : List.of("argument", "return")) {
                        run(mode, loader, "on", "", false);
                    }
                }
            }
            case "incremental" -> {
                for (String flag : List.of("AlwaysIncrementalInline", "StressIncrementalInlining")) {
                    for (String mode : List.of("argument", "return", "loop")) {
                        run(mode, "boot", "on", flag, false);
                    }
                }
            }
            case "replay" -> {
                run("argument", "boot", "on", "", true);
                run("return", "boot", "on", "", true);
            }
            default -> throw new AssertionError(args[0]);
        }
    }

    static List<String> common(Path work, String share) {
        return new ArrayList<>(List.of("-Xms32m", "-Xmx128m", "-Xshare:" + share,
                "-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=1000",
                "-XX:+UnlockDiagnosticVMOptions", "-XX:+LogCompilation",
                "-XX:LogFile=" + work.resolve("hotspot.xml"),
                "--add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED"));
    }

    static void run(String mode, String loader, String share, String flag, boolean replay) throws Exception {
        Path work = Path.of(mode + "-" + loader + "-" + share + "-" + flag + (replay ? "-replay" : ""))
                .toAbsolutePath();
        Files.createDirectories(work);
        List<String> options = common(work, share);
        options.add("-XX:CompileCommand=compileonly," + SUITE + "::driver*");
        options.add("-Xlog:class+load=info:file=classes.log:uptimemillis");
        if (!flag.isEmpty()) options.add("-XX:+" + flag);
        String method = mode.equals("argument") ? "driverArgument" : "driverReturn";
        if (replay) options.add("-XX:CompileCommand=option," + SUITE + "::" + method + ",bool,DumpReplay,true");
        if (loader.equals("boot")) {
            options.add("-Xbootclasspath/a:" + classes);
            options.add(SUITE);
        } else if (loader.equals("app")) {
            options.add("-cp");
            options.add(classes.toString());
            options.add(SUITE);
        } else {
            options.add(CustomLauncher.class.getName());
            options.add(classes.toString());
        }
        options.add(mode);
        ProcessBuilder pb = ProcessTools.createTestJavaProcessBuilder(options);
        pb.directory(work.toFile());
        OutputAnalyzer output = ProcessTools.executeProcess(pb);
        Files.writeString(work.resolve("stdout.log"), output.getStdout());
        Files.writeString(work.resolve("stderr.log"), output.getStderr());
        output.shouldHaveExitValue(0).shouldContain("PASS," + mode);
        boolean negative = !loader.equals("boot") || NEGATIVE.contains(mode)
                || flag.equals("AlwaysIncrementalInline");
        // Stress scheduling and the merge's first parser state are not deterministic.
        boolean requireAdmission = !negative && flag.isEmpty() && !mode.equals("merge");
        audit(work.resolve("hotspot.xml"), mode, negative, requireAdmission);
        String loads = Files.readString(work.resolve("classes.log"));
        int warm = loads.indexOf(SUITE + "$WarmupComplete source:");
        int type = loads.indexOf(PACKAGE + ".U source:");
        Asserts.assertTrue(warm >= 0, "Missing warmup class marker: " + work);
        Asserts.assertTrue(type < 0 || type > warm, "Signature class loaded before warmup: " + work);
        Asserts.assertFalse(loads.contains(PACKAGE + ".MissingU source:"), "Missing signature class loaded");
        if (Set.of("return", "discard", "merge").contains(mode)) {
            Asserts.assertTrue(type > warm, "Nonnull transition must load U: " + work);
            output.shouldContain("TRANSITION," + mode + ",exactly-once");
        }
        if (replay) {
            List<Path> dumps;
            try (var paths = Files.list(work)) {
                dumps = paths.filter(p -> p.getFileName().toString().startsWith("replay_pid")
                        && p.toString().endsWith(".log")).toList();
            }
            Asserts.assertEQ(dumps.size(), 1, "Expected one replay compilation");
            Path replayWork = work.resolve("replay");
            Files.createDirectories(replayWork);
            List<String> replayOptions = common(replayWork, share);
            replayOptions.addAll(List.of("-Xbootclasspath/a:" + classes, "-XX:+ReplayCompiles",
                    "-XX:ReplayDataFile=" + dumps.getFirst(), "-version"));
            ProcessTools.executeTestJava(replayOptions).shouldHaveExitValue(0);
            audit(replayWork.resolve("hotspot.xml"), mode, false, true);
        }
        System.out.println("Verified " + mode + "/" + loader + "/CDS=" + share + "/" + flag);
    }

    static Element parse(Path path) throws Exception {
        return DocumentBuilderFactory.newDefaultInstance().newDocumentBuilder().parse(path.toFile())
                .getDocumentElement();
    }

    static List<Element> elements(Element root, String tag) {
        List<Element> result = new ArrayList<>();
        var nodes = root.getElementsByTagName(tag);
        for (int i = 0; i < nodes.getLength(); i++) result.add((Element) nodes.item(i));
        return result;
    }

    static void audit(Path path, String mode, boolean negative, boolean requireAdmission) throws Exception {
        Element log = parse(path);
        Asserts.assertTrue(elements(log, "nmethod").stream().anyMatch(n ->
                n.getAttribute("compiler").equalsIgnoreCase("c2")
                && n.getAttribute("method").startsWith(SUITE + " driver")), "No compiled driver: " + path);
        Set<String> admitted = new HashSet<>();
        Set<String> rejected = new HashSet<>();
        for (Element task : elements(log, "task")) {
            Map<String, Element> definitions = new HashMap<>();
            for (String tag : List.of("klass", "method")) {
                for (Element e : elements(task, tag)) definitions.put(e.getAttribute("id"), e);
            }
            for (Element parser : elements(task, "parse")) {
                Element call = null;
                for (Node node = parser.getFirstChild(); node != null; node = node.getNextSibling()) {
                    if (!(node instanceof Element e)) continue;
                    if (e.getTagName().equals("call")) {
                        call = definitions.get(e.getAttribute("method"));
                    } else if (call != null && (e.getTagName().equals("inline_success")
                            || e.getTagName().equals("inline_fail"))) {
                        Element holder = definitions.get(call.getAttribute("holder"));
                        String name = call.getAttribute("name");
                        if (holder != null && holder.getAttribute("name").replace('/', '.').startsWith(SUITE)
                                && TARGETS.get(mode).contains(name)) {
                            if (e.getAttribute("reason").equals(SPECIAL)) admitted.add(name);
                            if (e.getAttribute("reason").equals("unloaded signature classes")) rejected.add(name);
                        }
                    }
                }
            }
        }
        if (negative) {
            Asserts.assertTrue(admitted.isEmpty(), "Forbidden admission: " + path + " " + admitted);
            Asserts.assertTrue(rejected.containsAll(TARGETS.get(mode)), "Missing veto: " + path + " " + rejected);
        } else if (requireAdmission) {
            Asserts.assertTrue(admitted.containsAll(TARGETS.get(mode)), "Missing admission: " + path + " " + admitted);
        }
        // Unknown actuals and MH lookup can resolve/canonicalize their signature types.
        // They are not mislabeled as direct witnesses of those excluded predicate branches.
    }

    public static class CustomLauncher {
        public static void main(String[] args) throws Exception {
            try (var loader = new URLClassLoader(new java.net.URL[] {Path.of(args[0]).toUri().toURL()},
                    ClassLoader.getPlatformClassLoader())) {
                Class<?> suite = Class.forName(SUITE, true, loader);
                try {
                    suite.getMethod("main", String[].class).invoke(null, (Object) new String[] {args[1]});
                } catch (java.lang.reflect.InvocationTargetException e) {
                    throw new AssertionError("Custom-loader fixture", e.getCause());
                }
            }
        }
    }
}
