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

/*
 * @test
 * @summary Route a complete constant exit Phi without moving descendant range casts.
 * @requires vm.compiler2.enabled & (vm.bits == "64")
 * @library /test/lib
 * @run driver compiler.loopopts.TestConstantPhiRouting
 */

package compiler.loopopts;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import jdk.test.lib.process.ProcessTools;

public class TestConstantPhiRouting {
    private static final String CLASS = TestConstantPhiRouting.class.getName();
    private static final String POSITIVE = CLASS + " testPositive ([I[I[II)I";
    private static final String MIXED = CLASS + " testMixed ([I[I[IIZ)I";
    private static final String LOCAL = CLASS + " testLocal ([I[I[II)I";
    private static final Set<String> TARGETS = Set.of(POSITIVE, MIXED, LOCAL);

    // next and haveMatch merge at the same Region. The checkIndex intrinsic
    // explicitly creates a descendant narrowing CastII of next. Ordinary array
    // access alone does not require that direct Phi-to-CastII shape during
    // loop opts. The no-match arm continues the ordinary loop.
    public static int testPositive(int[] data, int[] selectors, int[] output, int limit) {
        int sum = 0;
        int pos = 0;
        while (pos < limit) {
            output[pos & 7] = pos + 17;
            int tag = selectors[pos & 7];
            int next;
            boolean haveMatch;
            if ((tag & 1) == 0) {
                next = pos;
                haveMatch = false;
            } else if ((tag & 2) == 0) {
                next = pos + 1;
                haveMatch = false;
            } else {
                next = pos + 2;
                haveMatch = true;
            }
            if (haveMatch) {
                int checked = Objects.checkIndex(next, data.length - 2);
                return sum + data[checked + 2] + next;
            }
            sum += next;
            pos++;
        }
        return sum;
    }

    // One incoming condition is a parameter, so the routing admission must
    // not claim complete constant folding on every Region edge.
    public static int testMixed(int[] data, int[] selectors, int[] output, int limit, boolean flag) {
        int sum = 0;
        int pos = 0;
        while (pos < limit) {
            output[pos & 7] = pos + 17;
            int tag = selectors[pos & 7];
            int next;
            boolean haveMatch;
            if ((tag & 1) == 0) {
                next = pos;
                haveMatch = flag;
            } else if ((tag & 2) == 0) {
                next = pos + 1;
                haveMatch = false;
            } else {
                next = pos + 2;
                haveMatch = true;
            }
            if (haveMatch) {
                int checked = Objects.checkIndex(next, data.length - 2);
                return sum + data[checked + 2] + next;
            }
            sum += next;
            pos++;
        }
        return sum;
    }

    // The access and its narrowing dependency precede the exit test. Routing
    // predecessor paths around that computation would change exception order.
    public static int testLocal(int[] data, int[] selectors, int[] output, int limit) {
        int sum = 0;
        int pos = 0;
        while (pos < limit) {
            output[pos & 7] = pos + 17;
            int tag = selectors[pos & 7];
            int next;
            boolean haveMatch;
            if ((tag & 1) == 0) {
                next = pos;
                haveMatch = false;
            } else if ((tag & 2) == 0) {
                next = pos + 1;
                haveMatch = false;
            } else {
                next = pos + 2;
                haveMatch = true;
            }
            int checked = Objects.checkIndex(next, data.length - 2);
            int value = data[checked + 2];
            if (haveMatch) {
                return sum + value + next;
            }
            sum += next;
            pos++;
        }
        return sum;
    }

    // compileonly below keeps this independent source oracle interpreted.
    private static int reference(Inputs in, int mode) {
        int sum = 0;
        int pos = 0;
        while (pos < in.limit) {
            in.output[pos & 7] = pos + 17;
            int tag = in.selectors[pos & 7];
            int next;
            boolean haveMatch;
            if ((tag & 1) == 0) {
                next = pos;
                haveMatch = mode == 1 && in.flag;
            } else if ((tag & 2) == 0) {
                next = pos + 1;
                haveMatch = false;
            } else {
                next = pos + 2;
                haveMatch = true;
            }
            int value = 0;
            if (mode == 2) {
                int checked = Objects.checkIndex(next, in.data.length - 2);
                value = in.data[checked + 2];
            }
            if (haveMatch) {
                if (mode != 2) {
                    int checked = Objects.checkIndex(next, in.data.length - 2);
                    value = in.data[checked + 2];
                }
                return sum + value + next;
            }
            sum += next;
            pos++;
        }
        return sum;
    }

    private record Inputs(int[] data, int[] selectors, int[] output, int limit, boolean flag) {
        Inputs copy() {
            IdentityHashMap<int[], int[]> copies = new IdentityHashMap<>();
            return new Inputs(copy(data, copies), copy(selectors, copies), copy(output, copies), limit, flag);
        }

        private static int[] copy(int[] array, IdentityHashMap<int[], int[]> copies) {
            return array == null ? null : copies.computeIfAbsent(array, a -> a.clone());
        }
    }

    private record Result(int value, Class<?> exception) { }

    private static Result invoke(Inputs in, int mode, boolean interpreted) {
        try {
            int value = interpreted ? reference(in, mode) : switch (mode) {
                case 0 -> testPositive(in.data, in.selectors, in.output, in.limit);
                case 1 -> testMixed(in.data, in.selectors, in.output, in.limit, in.flag);
                case 2 -> testLocal(in.data, in.selectors, in.output, in.limit);
                default -> throw new AssertionError("bad mode");
            };
            return new Result(value, null);
        } catch (NullPointerException | IndexOutOfBoundsException e) {
            return new Result(0, e.getClass());
        }
    }

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static void check(Inputs original) {
        for (int mode = 0; mode < 3; mode++) {
            Inputs actual = original.copy();
            Inputs expected = original.copy();
            Result result = invoke(actual, mode, false);
            Result oracle = invoke(expected, mode, true);
            require(result.equals(oracle), "result/exception mismatch mode=" + mode);
            require(Arrays.equals(actual.data, expected.data), "data mismatch mode=" + mode);
            require(Arrays.equals(actual.selectors, expected.selectors), "selector mismatch mode=" + mode);
            require(Arrays.equals(actual.output, expected.output), "partial-store mismatch mode=" + mode);
        }
    }

    private static void child() {
        int[] data = new int[32];
        Arrays.setAll(data, i -> 31 * i + 7);
        int[] tags = {0, 1, 0, 3, 1, 0, 3, 0};
        for (int i = 0; i < 20_000; i++) {
            int[] selectors = new int[8];
            for (int j = 0; j < 8; j++) selectors[j] = tags[(j + i) & 7];
            check(new Inputs(data, selectors, new int[8], 8 + (i & 7), (i & 1) == 0));
        }
        check(new Inputs(null, tags, new int[8], 12, false));
        check(new Inputs(new int[2], tags, new int[8], 12, true));
        check(new Inputs(data, tags, new int[2], 12, false));
        check(new Inputs(data, null, new int[8], 12, true));
        check(new Inputs(data, tags, null, 12, false));
        check(new Inputs(null, null, null, 0, false));
        check(new Inputs(null, null, null, -1, true));
        check(new Inputs(data, tags, data, 12, false));
        check(new Inputs(data, tags, tags, 12, true));
        System.out.println("CONSTANT_PHI_ROUTING_ORACLE_PASS");
    }

    private static void checkLog(Path path) throws Exception {
        var factory = DocumentBuilderFactory.newInstance();
        factory.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
        var document = factory.newDocumentBuilder().parse(path.toFile());
        require(document.getElementsByTagName("hotspot_log_done").getLength() == 1, "incomplete log");
        Map<String, String> installed = new HashMap<>();
        NodeList nmethods = document.getElementsByTagName("nmethod");
        for (int i = 0; i < nmethods.getLength(); i++) {
            Element nmethod = (Element) nmethods.item(i);
            String method = nmethod.getAttribute("method");
            if (TARGETS.contains(method) && "c2".equals(nmethod.getAttribute("compiler")) &&
                    !nmethod.hasAttribute("compile_kind")) {
                String id = nmethod.getAttribute("compile_id");
                require(installed.putIfAbsent(id, method) == null, "duplicate installed compile_id=" + id);
            }
        }
        Map<String, Integer> events = new HashMap<>();
        Set<String> completed = new HashSet<>();
        Set<String> seenTasks = new HashSet<>();
        NodeList tasks = document.getElementsByTagName("task");
        for (int i = 0; i < tasks.getLength(); i++) {
            Element task = (Element) tasks.item(i);
            String id = task.getAttribute("compile_id");
            String installedMethod = installed.get(id);
            if (installedMethod == null) continue;
            String method = task.getAttribute("method");
            require(installedMethod.equals(method) && !task.hasAttribute("compile_kind"),
                    "installed task identity mismatch compile_id=" + id);
            require(seenTasks.add(id), "duplicate task for installed compile_id=" + id);
            NodeList done = task.getElementsByTagName("task_done");
            require(done.getLength() == 1 && "1".equals(((Element) done.item(0)).getAttribute("success")),
                    "installed task unsuccessful: " + method);
            require(task.getElementsByTagName("failure").getLength() == 0, "ambiguous retried task: " + method);
            NodeList accepted = task.getElementsByTagName("constant_phi_routing");
            for (int j = 0; j < accepted.getLength(); j++) {
                Element event = (Element) accepted.item(j);
                require(Integer.parseInt(event.getAttribute("if")) > 0 &&
                        Integer.parseInt(event.getAttribute("region")) > 0, "event without node identities");
            }
            events.merge(method, accepted.getLength(), Integer::sum);
            completed.add(method);
        }
        require(seenTasks.equals(installed.keySet()), "installed compilation missing its unique task");
        require(completed.containsAll(TARGETS), "missing successful normal C2 targets: " + completed);
        // Installed C2 code alone does not establish that the new admission ran.
        require(events.getOrDefault(POSITIVE, 0) > 0, "positive routing did not activate");
        require(events.getOrDefault(MIXED, 0) == 0, "mixed condition incorrectly admitted");
        require(events.getOrDefault(LOCAL, 0) == 0, "intervening local access incorrectly admitted");
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            child();
            return;
        }
        Path log = Path.of("constant-phi-routing.xml").toAbsolutePath();
        Files.deleteIfExists(log);
        ProcessTools.executeProcess(ProcessTools.createLimitedTestJavaProcessBuilder(
                "-Xbatch", "-XX:-TieredCompilation", "-XX:-UseOnStackReplacement", "-XX:CompileThreshold=1000",
                "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintFlagsFinal", "-XX:+LogCompilation", "-XX:LogFile=" + log,
                "-XX:CompileCommand=compileonly," + CLASS + "::test*", CLASS, "child"))
                .shouldHaveExitValue(0).shouldContain("CONSTANT_PHI_ROUTING_ORACLE_PASS")
                // StressRecompilation can discard successful Compile attempts
                // without a failure tag. Their events cannot identify the
                // installed attempt, even with one enclosing task element.
                .shouldNotMatch("(?m)^\\s*bool\\s+StressRecompilation\\s*:?=\\s*true\\b");
        checkLog(log);
    }
}
