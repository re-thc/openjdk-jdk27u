/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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

package compiler.regalloc;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

/** Accepted events in the exact installed C2 task, not enabled flags/search traces. */
public class TestRetainSpillCopiesActivation {
    private static final String METHOD = "compiler.regalloc.TestRetainSpillCopies compiled ([IJI)J";

    private static int number(Element element, String name) {
        return Integer.parseInt(element.getAttribute(name));
    }

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static boolean target(Element element) {
        return METHOD.equals(element.getAttribute("method")) && !element.hasAttribute("compile_kind");
    }

    private static void run(String name, boolean enabled, boolean framePointer, boolean requireActivation) throws Exception {
        Path log = Path.of("retention-" + name + ".xml").toAbsolutePath();
        Files.deleteIfExists(log);
        var options = new ArrayList<String>();
        options.addAll(java.util.List.of("-Xbatch", "-XX:-TieredCompilation", "-XX:-UseOnStackReplacement",
                "-XX:-StressRecompilation",
                "-XX:CompileThreshold=100", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                "-Xbootclasspath/a:.", "-XX:+VerifyRegisterAllocator", "-XX:+LogCompilation",
                "-XX:LogFile=" + log, "-XX:" + (enabled ? "+" : "-") + "RetainSpillCopies",
                "-XX:CompileCommand=compileonly,compiler.regalloc.TestRetainSpillCopies::compiled",
                "-XX:CompileCommand=dontinline,compiler.regalloc.TestRetainSpillCopies::returningCall"));
        if (framePointer) options.add("-XX:+PreserveFramePointer");
        options.add(TestRetainSpillCopies.class.getName());
        OutputAnalyzer output = ProcessTools.executeProcess(
                ProcessTools.createLimitedTestJavaProcessBuilder(options.toArray(String[]::new)));
        output.shouldHaveExitValue(0).shouldContain("RETENTION_ORACLE_PASS cases=1200");
        var factory = DocumentBuilderFactory.newInstance();
        factory.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        var document = factory.newDocumentBuilder().parse(log.toFile());
        require(document.getElementsByTagName("hotspot_log_done").getLength() == 1, "incomplete compilation log");
        Set<String> installed = new HashSet<>();
        NodeList nmethods = document.getElementsByTagName("nmethod");
        for (int i = 0; i < nmethods.getLength(); i++) {
            Element nmethod = (Element) nmethods.item(i);
            if (target(nmethod) && "c2".equals(nmethod.getAttribute("compiler"))) {
                // Non-tiered C2 logs may omit level; compiler=c2 is authoritative.
                installed.add(nmethod.getAttribute("compile_id"));
            }
        }
        require(!installed.isEmpty(), "no normal installed C2 target compilation");
        int accepted = 0, baseOops = 0;
        NodeList tasks = document.getElementsByTagName("task");
        for (int i = 0; i < tasks.getLength(); i++) {
            Element task = (Element) tasks.item(i);
            if (!target(task) || !installed.contains(task.getAttribute("compile_id"))) continue;
            NodeList done = task.getElementsByTagName("task_done");
            require(done.getLength() == 1 && "1".equals(((Element) done.item(0)).getAttribute("success")),
                    "installed task did not complete successfully");
            // A CompileTask can contain failed/discarded Compile attempts with
            // the same compile_id. Do not credit their events to the installed
            // attempt. This controlled test requires an unambiguous task.
            require(task.getElementsByTagName("failure").getLength() == 0,
                    "target compilation retried: accepted events cannot identify the installed attempt");
            NodeList events = task.getElementsByTagName("retained_spill_copy");
            require(events.getLength() <= 4, "retention exceeded its cleanup-pass cap");
            for (int j = 0; j < events.getLength(); j++) {
                Element event = (Element) events.item(j);
                require(number(event, "old") != number(event, "new"), "same-color event");
                require((number(event, "old") & ~1) != (number(event, "new") & ~1), "same GP alias family");
                require(number(event, "benefit") > 0, "event without prospective reuse");
                require(number(event, "seed") > 0 && number(event, "source") > 0, "missing node identity");
                require(number(event, "home") == number(event, "home_after"), "source home changed");
                require(number(event, "oop") == number(event, "oop_after"), "source oop kind changed");
                require(Set.of("phi", "validated_entry").contains(event.getAttribute("invariant")),
                        "unsupported invariant source");
                String kind = event.getAttribute("kind");
                require(Set.of("base_oop", "narrow_oop", "int").contains(kind), "unsupported value kind");
                require(number(event, "slots") == (kind.equals("base_oop") ? 2 : 1), "wrong register width");
                if (kind.equals("base_oop")) {
                    require(number(event, "oop") == 1, "base oop classification lost");
                    baseOops++;
                }
                accepted++;
            }
        }
        if (!enabled) {
            require(document.getElementsByTagName("retained_spill_copy").getLength() == 0,
                    "disabled retention emitted an accepted event");
        }
        if (requireActivation) {
            require(accepted > 0 && baseOops > 0,
                    "coverage failure: no accepted base-oop recolor in the exact normal C2 target; "
                    + "do not treat C2 compilation/search activity as positive activation");
        }
        System.out.println("RETENTION_ACTIVATION mode=" + name + " compile_ids=" + installed
                + " accepted=" + accepted + " base_oops=" + baseOops);
    }

    public static void main(String[] args) throws Exception {
        run("enabled", true, false, true);
        run("disabled", false, false, false);
        run("frame-pointer", true, true, false);
    }
}
