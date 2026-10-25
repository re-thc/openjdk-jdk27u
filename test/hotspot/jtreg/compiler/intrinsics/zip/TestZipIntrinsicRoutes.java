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
 * @summary ZIP processing bypasses JNI in the interpreter, C1 and C2 for all buffer shapes
 * @requires (os.simpleArch == "x64" | os.simpleArch == "aarch64") & vm.compiler1.enabled & vm.compiler2.enabled
 * @library /test/lib
 * @modules java.xml
 * @build TestZlibNG
 * @run driver TestZipIntrinsicRoutes
 */

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
import jdk.test.lib.process.ProcessTools;

public class TestZipIntrinsicRoutes {
    private static Map<String, Element> ids(Element task, String tag) {
        Map<String, Element> result = new HashMap<>();
        var nodes = task.getElementsByTagName(tag);
        for (int i = 0; i < nodes.getLength(); i++) {
            Element e = (Element) nodes.item(i);
            result.put(e.getAttribute("id"), e);
        }
        return result;
    }

    private static String holder(String id, Map<String, Element> methods,
                                 Map<String, Element> classes) {
        Element method = methods.get(id);
        Element klass = method == null ? null : classes.get(method.getAttribute("holder"));
        return klass == null ? "" : klass.getAttribute("name").replace('/', '.');
    }

    private static void verifyCompilation(Path log, String compiler) throws Exception {
        var factory = DocumentBuilderFactory.newInstance();
        factory.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        var document = factory.newDocumentBuilder().parse(log.toFile());
        Set<String> compiled = new HashSet<>();
        var nmethods = document.getElementsByTagName("nmethod");
        for (int i = 0; i < nmethods.getLength(); i++) {
            Element e = (Element) nmethods.item(i);
            if (e.getAttribute("compiler").equals(compiler)) {
                compiled.add(e.getAttribute("compile_id"));
            }
        }
        Set<String> callers = new HashSet<>();
        var tasks = document.getElementsByTagName("task");
        for (int i = 0; i < tasks.getLength(); i++) {
            Element task = (Element) tasks.item(i);
            if (!compiled.contains(task.getAttribute("compile_id"))) continue;
            var done = task.getElementsByTagName("task_done");
            if (done.getLength() != 1 ||
                !((Element) done.item(0)).getAttribute("success").equals("1")) continue;
            Map<String, Element> methods = ids(task, "method"), classes = ids(task, "klass");
            var calls = task.getElementsByTagName("call");
            for (int j = 0; j < calls.getLength(); j++) {
                Element call = (Element) calls.item(j);
                Element target = methods.get(call.getAttribute("method"));
                if (target == null || !target.getAttribute("name").equals("process") ||
                    !holder(call.getAttribute("method"), methods, classes)
                        .equals("java.util.zip.ZipUtils")) continue;
                boolean intrinsic = false;
                for (Node next = call.getNextSibling(); next != null; next = next.getNextSibling()) {
                    if (!(next instanceof Element e)) continue;
                    if (Set.of("call", "parse").contains(e.getTagName())) break;
                    intrinsic |= e.getTagName().equals("intrinsic") &&
                                 e.getAttribute("id").equals("_zipProcess");
                    intrinsic |= e.getTagName().equals("inline_success") &&
                                 e.getAttribute("reason").equals("intrinsic");
                }
                if (!intrinsic) continue;
                for (Node parent = call.getParentNode(); parent != task; parent = parent.getParentNode()) {
                    if (parent instanceof Element e && e.getTagName().equals("parse")) {
                        callers.add(holder(e.getAttribute("method"), methods, classes));
                    }
                }
            }
        }
        if (!callers.containsAll(Set.of("java.util.zip.Deflater", "java.util.zip.Inflater"))) {
            throw new AssertionError(compiler + " did not intrinsify both ZIP callers: " + callers);
        }
    }

    private static void run(String mode, boolean enabled) throws Exception {
        List<String> options = new ArrayList<>(List.of(
            "-Xshare:off", "-Xmx64m", "-Xlog:jni+resolve=debug",
            "-XX:" + (enabled ? "+" : "-") + "UseZipIntrinsics"));
        Path log = Path.of("zip-" + mode + "-" + enabled + ".xml").toAbsolutePath();
        if (mode.equals("int")) {
            options.add("-Xint");
        } else {
            options.addAll(List.of("-Xbatch", "-XX:+UnlockDiagnosticVMOptions",
                "-XX:+LogCompilation", "-XX:LogFile=" + log));
            options.addAll(mode.equals("c1")
                ? List.of("-XX:TieredStopAtLevel=1", "-XX:CompileThresholdScaling=0.1")
                : List.of("-XX:-TieredCompilation", "-XX:CompileThreshold=1000"));
        }
        // This existing workload covers tiny/empty/large input, all heap/direct
        // combinations, small output, dictionaries, reset, and GC while processing.
        options.add("TestZlibNG");
        var output = ProcessTools.executeTestJava(options).shouldHaveExitValue(0);
        String text = output.getOutput();
        for (String name : List.of("java.util.zip.Deflater.deflate",
                                   "java.util.zip.Inflater.inflate")) {
            if (enabled == text.contains("Dynamic-linking native method " + name)) {
                throw new AssertionError("Wrong JNI route for " + name + " in " + mode +
                                         " enabled=" + enabled);
            }
        }
        if (text.contains("Dynamic-linking native method java.util.zip.ZipUtils.process")) {
            throw new AssertionError("ZIP processing resolved its JNI fallback in " + mode);
        }
        if (enabled && !mode.equals("int")) verifyCompilation(log, mode);
        System.out.println("Verified " + mode + " ZIP route, enabled=" + enabled);
    }

    public static void main(String[] args) throws Exception {
        run("int", false); // Positive control for the JNI-resolution oracle.
        for (String mode : List.of("int", "c1", "c2")) run(mode, true);
    }
}
