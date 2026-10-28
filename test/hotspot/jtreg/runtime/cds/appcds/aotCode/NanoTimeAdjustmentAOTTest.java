/*
 * Copyright (c) 2026. All rights reserved.
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
 *
 */

/*
 * @test
 * @summary Exercise the clock leaf with AOT-backed classes and cached runtime stubs
 * @requires vm.cds.supports.aot.code.caching
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.gc.G1
 * @requires vm.opt.VerifyOops == null | vm.opt.VerifyOops == false
 * @library /test/lib /test/setup_aot
 * @modules java.base/jdk.internal.misc
 * @build NanoTimeAdjustmentAOTTest
 * @run driver jdk.test.lib.helpers.ClassFileInstaller -jar nta-app.jar NanoTimeAdjustmentAOTApp
 * @run driver/timeout=300 NanoTimeAdjustmentAOTTest
 */

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import jdk.internal.misc.VM;
import jdk.test.lib.cds.CDSAppTester;
import jdk.test.lib.process.OutputAnalyzer;

public class NanoTimeAdjustmentAOTTest {
    public static void main(String[] args) throws Exception {
        new Tester(false).run(new String[] {"AOT", "--two-step-training"});
        new Tester(true).run(new String[] {"AOT", "--two-step-training"});
    }

    static class Tester extends CDSAppTester {
        private final boolean enabled;
        Tester(boolean enabled) {
            super("NanoTimeAdjustmentAOT-" + (enabled ? "default" : "off"));
            this.enabled = enabled;
        }
        @Override
        public String classpath(RunMode mode) { return "nta-app.jar"; }
        private String compilationLog(RunMode mode) { return name() + "." + mode + ".xml"; }
        @Override
        public String[] vmArgs(RunMode mode) {
            List<String> flags = new ArrayList<>(List.of(
                "-Xmx128m", "-XX:+UseG1GC", "-Xbatch", "-XX:-TieredCompilation",
                "-XX:CompileThreshold=1000", "-XX:+UnlockDiagnosticVMOptions",
                "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                "-XX:+AOTAdapterCaching", "-XX:+AOTStubCaching", "-XX:+AbortVMOnAOTCodeFailure",
                "-XX:CompileCommand=dontinline,NanoTimeAdjustmentAOTApp::call",
                "-Xlog:aot+codecache+init=debug,aot+codecache+exit=debug,aot+codecache+stubs=debug"));
            if (!enabled) flags.add("-XX:-InlineNanoTimeAdjustment");
            if (mode != RunMode.ASSEMBLY) {
                flags.add("-XX:+LogCompilation");
                flags.add("-XX:LogFile=" + compilationLog(mode));
            }
            return flags.toArray(String[]::new);
        }
        @Override
        public String[] appCommandLine(RunMode mode) { return new String[] {"NanoTimeAdjustmentAOTApp"}; }
        @Override
        public void checkExecution(OutputAnalyzer out, RunMode mode) throws Exception {
            out.shouldHaveExitValue(0);
            if (mode == RunMode.ASSEMBLY) {
                out.shouldMatch("aot,codecache,exit.*AOT code cache size: [1-9]\\d* bytes");
                return;
            }
            out.shouldContain("AOT_NTA_PASS");
            checkCompilation(Path.of(compilationLog(mode)), enabled);
            if (mode == RunMode.PRODUCTION) {
                out.shouldMatch("aot,codecache,init.*Loaded [1-9]\\d* AOT code entries from AOT Code Cache");
                out.shouldMatch("aot,codecache,stubs.*Read blob.*kind=Adapter.*");
                out.shouldMatch("aot,codecache,stubs.*Read blob.*kind=SharedBlob.*");
                // This revision caches stubs/adapters, not Java nmethods. The
                // application leaf above is independently verified as JIT code.
            }
        }
    }

    static void checkCompilation(Path log, boolean enabled) throws Exception {
        var document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(log.toFile());
        String method = "NanoTimeAdjustmentAOTApp call (J)J";
        boolean compiled = false;
        int intrinsics = 0;
        NodeList nmethods = document.getElementsByTagName("nmethod");
        for (int i = 0; i < nmethods.getLength(); i++) {
            Element item = (Element)nmethods.item(i);
            compiled |= item.getAttribute("method").equals(method) && item.getAttribute("compiler").equals("c2");
        }
        NodeList tasks = document.getElementsByTagName("task");
        for (int i = 0; i < tasks.getLength(); i++) {
            Element item = (Element)tasks.item(i);
            if (!item.getAttribute("method").equals(method)) continue;
            NodeList nodes = item.getElementsByTagName("intrinsic");
            for (int j = 0; j < nodes.getLength(); j++)
                if (((Element)nodes.item(j)).getAttribute("id").equals("_getNanoTimeAdjustment")) intrinsics++;
        }
        if (!compiled || (enabled ? intrinsics == 0 : intrinsics != 0))
            throw new AssertionError("Actual C2 leaf activation mismatch: enabled=" + enabled + ", compiled=" + compiled + ", intrinsics=" + intrinsics);
    }
}

class NanoTimeAdjustmentAOTApp {
    static volatile long sink;
    public static long call(long offset) { return VM.getNanoTimeAdjustment(offset); }
    public static void main(String[] args) {
        long offset = System.currentTimeMillis() / 1000 - 1024;
        long sum = 0;
        for (int i = 0; i < 150_000; i++) sum ^= call(offset + (i & 1));
        sink = sum;
        if (call(Long.MIN_VALUE) != -1 || call(Long.MAX_VALUE) != -1)
            throw new AssertionError("Extreme-offset sentinel");
        long before = System.currentTimeMillis();
        offset = Math.floorDiv(before, 1000) - 1024;
        long adjustment = call(offset);
        long after = System.currentTimeMillis();
        if (after >= before) {
            long epoch = offset * 1_000_000_000L + adjustment;
            if (adjustment == -1 || epoch < before * 1_000_000L || epoch >= (after + 1) * 1_000_000L)
                throw new AssertionError("Clock observation outside UTC bracket");
        }
        System.out.println("AOT_NTA_PASS checksum=" + sink);
    }
}
