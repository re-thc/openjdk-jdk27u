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
 * @summary Redefinition invalidates a null-only inlined bootstrap callee's dependent root
 * @requires vm.compiler2.enabled & vm.flagless & vm.jvmti
 * @library / /test/lib
 * @modules java.instrument jdk.compiler java.xml
 * @build compiler.inlining.TestNullOnlyUnloadedSignature
 * @run driver/timeout=240 compiler.inlining.TestNullOnlyRedefinition
 */

package compiler.inlining;

import java.lang.classfile.ClassFile;
import java.lang.classfile.Instruction;
import java.lang.classfile.Opcode;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.jar.Attributes;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;
import java.util.jar.Manifest;
import java.util.stream.Collectors;
import jdk.test.lib.Asserts;
import jdk.test.lib.compiler.CompilerUtils;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class TestNullOnlyRedefinition {
    static final String PACKAGE = "compiler.inlining.nullredefine";
    static final String DRIVER = PACKAGE + ".Driver";

    public static void main(String[] args) throws Exception {
        Path source = Path.of(System.getProperty("test.src"), "nullredefine");
        Path boot = Path.of("redefine-boot").toAbsolutePath();
        Path app = Path.of("redefine-app").toAbsolutePath();
        Asserts.assertTrue(CompilerUtils.compile(source.resolve("boot"), boot, "-g:none",
                "--add-exports", "java.base/jdk.internal.vm.annotation=ALL-UNNAMED"));
        Asserts.assertTrue(CompilerUtils.compile(source.resolve("app"), app, "-g:none",
                "-classpath", boot.toString()));
        Path replacement = Path.of("Helper-replacement.class").toAbsolutePath();
        makeReplacement(boot.resolve(PACKAGE.replace('.', '/') + "/Helper.class"), replacement);
        Manifest manifest = new Manifest();
        manifest.getMainAttributes().put(Attributes.Name.MANIFEST_VERSION, "1.0");
        manifest.getMainAttributes().putValue("Premain-Class", PACKAGE + ".agent.Agent");
        manifest.getMainAttributes().putValue("Can-Redefine-Classes", "true");
        Path agent = Path.of("null-signature-agent.jar").toAbsolutePath();
        try (JarOutputStream jar = new JarOutputStream(Files.newOutputStream(agent), manifest);
             var files = Files.walk(app)) {
            for (Path file : files.filter(Files::isRegularFile).toList()) {
                jar.putNextEntry(new JarEntry(app.relativize(file).toString().replace('\\', '/')));
                Files.copy(file, jar);
                jar.closeEntry();
            }
        }
        Path log = Path.of("redefine.xml").toAbsolutePath();
        Path classes = Path.of("redefine-classes.log").toAbsolutePath();
        Path redefine = Path.of("redefine-events.log").toAbsolutePath();
        List<String> flags = new ArrayList<>(List.of("-Xms32m", "-Xmx256m", "-Xbatch",
                "-XX:-TieredCompilation", "-XX:CompileThreshold=100", "-XX:+UnlockDiagnosticVMOptions",
                "-XX:+PrintCompilation", "-XX:+PrintInlining", "-XX:+LogCompilation", "-XX:LogFile=" + log,
                "-XX:CompileCommand=quiet", "-XX:CompileCommand=compileonly," + DRIVER + "::root",
                "-XX:CompileCommand=compileonly," + DRIVER + "::control",
                "-XX:CompileCommand=dontinline," + DRIVER + "::root",
                "-XX:CompileCommand=dontinline," + DRIVER + "::control",
                "-Xlog:class+load=info:file=redefine-classes.log:uptimemillis,level,tags",
                "-Xlog:redefine+class*=debug:file=redefine-events.log:uptimemillis,level,tags",
                "-Xbootclasspath/a:" + boot, "-javaagent:" + agent, "-cp", app.toString(),
                PACKAGE + ".agent.Launcher", replacement.toString()));
        OutputAnalyzer output = ProcessTools.executeTestJava(flags);
        Files.writeString(Path.of("redefine-stdout.log"), output.getStdout());
        output.shouldHaveExitValue(0).shouldContain("PR2_U_STATE before-warm false")
                .shouldContain("PR2_U_STATE after-warm-before-redefine false")
                .shouldContain("PR2_REDEFINE_PASS");
        String stdout = output.getStdout();
        int before = stdout.indexOf("PR2_BEFORE_REDEFINE");
        int after = stdout.indexOf("PR2_AFTER_REDEFINE");
        Asserts.assertTrue(before >= 0 && after > before);
        Asserts.assertTrue(java.util.regex.Pattern.compile("Helper::value[^\\n]*null-only unloaded signature")
                .matcher(stdout.substring(0, before)).find(), "No actual unloaded-signature admission");
        var xml = TestNullOnlyUnloadedSignature.parse(log);
        Set<String> roots = compiled(xml, "root");
        Set<String> controls = compiled(xml, "control");
        Asserts.assertFalse(roots.isEmpty(), "Root was not compiled by C2");
        Asserts.assertFalse(controls.isEmpty(), "Control was not compiled by C2");
        Set<String> invalid = TestNullOnlyUnloadedSignature.elements(xml, "make_not_entrant").stream()
                .map(e -> e.getAttribute("compile_id")).collect(Collectors.toSet());
        Asserts.assertTrue(invalid.contains(roots.iterator().next()), "Inlined dependency was not invalidated");
        Asserts.assertTrue(controls.stream().noneMatch(invalid::contains), "Unrelated control invalidated");
        Asserts.assertTrue(java.util.regex.Pattern.compile("Driver::root[^\\n]*made not entrant")
                .matcher(stdout.substring(before, after)).find(), "Invalidation was outside redefinition");
        String events = Files.readString(redefine);
        Asserts.assertTrue(events.contains("Marked dependent nmethods for deopt"), "Missing dependency witness");
        Asserts.assertFalse(events.contains("Marked all nmethods for deopt"), "Global deopt masks dependencies");
    }

    static Set<String> compiled(org.w3c.dom.Element log, String method) {
        return TestNullOnlyUnloadedSignature.elements(log, "nmethod").stream()
                .filter(n -> n.getAttribute("compiler").equalsIgnoreCase("c2")
                        && n.getAttribute("method").equals(DRIVER + " " + method + " ()I"))
                .map(n -> n.getAttribute("compile_id"))
                .collect(Collectors.toCollection(java.util.LinkedHashSet::new));
    }

    static void makeReplacement(Path original, Path replacement) throws Exception {
        byte[] bytes = Files.readAllBytes(original);
        var methods = ClassFile.of().parse(bytes).methods();
        var value = methods.stream().filter(m -> m.methodName().stringValue().equals("value")).findFirst().orElseThrow();
        Asserts.assertEQ(value.methodType().stringValue(), "(Lcompiler/inlining/nullredefine/UnloadedU;)I");
        List<Opcode> code = value.code().orElseThrow().elementStream().filter(e -> e instanceof Instruction)
                .map(e -> ((Instruction) e).opcode()).toList();
        Asserts.assertEQ(code, List.of(Opcode.ICONST_1, Opcode.IRETURN));
        // With -g:none, this entire Code body is unique in the two-method helper:
        // stack=1, locals=1, length=2, iconst_1/ireturn, no handlers or nested attributes.
        byte[] pattern = {0, 1, 0, 1, 0, 0, 0, 2, 4, (byte) 0xac, 0, 0, 0, 0};
        int at = -1;
        for (int i = 0; i <= bytes.length - pattern.length; i++) {
            if (Arrays.mismatch(bytes, i, i + pattern.length, pattern, 0, pattern.length) < 0) {
                Asserts.assertEQ(at, -1, "Ambiguous method body");
                at = i;
            }
        }
        Asserts.assertTrue(at >= 0, "Method body not found");
        byte[] changed = bytes.clone();
        changed[at + 8] = 5; // iconst_2
        int differences = 0;
        for (int i = 0; i < bytes.length; i++) if (bytes[i] != changed[i]) differences++;
        Asserts.assertEQ(differences, 1, "Replacement must retain every other class-file byte");
        Files.write(replacement, changed);
    }
}
