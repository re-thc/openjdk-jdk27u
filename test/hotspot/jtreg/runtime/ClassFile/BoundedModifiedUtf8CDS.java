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
 * @summary Preserve modified UTF8 String constants through CDS archives
 * @requires vm.cds & vm.flagless
 * @library /test/lib
 * @build BoundedModifiedUtf8 jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:. BoundedModifiedUtf8CDS STATIC
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:. BoundedModifiedUtf8CDS DYNAMIC
 */

/*
 * @test id=aot
 * @summary Preserve modified UTF8 String constants through AOT caches
 * @requires vm.cds & vm.flagless & vm.cds.supports.aot.class.linking
 * @library /test/lib
 * @build BoundedModifiedUtf8 jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:. BoundedModifiedUtf8CDS AOT
 */

import java.nio.file.Path;
import jdk.test.lib.cds.CDSAppTester;
import jdk.test.lib.process.OutputAnalyzer;

public class BoundedModifiedUtf8CDS {
    private static final Path JAR = Path.of("bounded-mutf.jar").toAbsolutePath();

    public static void main(String[] args) throws Exception {
        BoundedModifiedUtf8.writeArchiveJar(JAR);
        new Tester().run(args);
    }

    private static class Tester extends CDSAppTester {
        Tester() {
            super("bounded-mutf");
            setGenerateBaseArchive(true);
            setBaseArchiveOptions("-Xverify:all");
        }

        @Override
        public String classpath(RunMode mode) {
            return JAR.toString();
        }

        @Override
        public String[] vmArgs(RunMode mode) {
            return new String[] {"-Xverify:all", "-Xlog:class+load=info"};
        }

        @Override
        public String[] appCommandLine(RunMode mode) {
            return new String[] {"BoundedModifiedUtf8", "archive"};
        }

        @Override
        public void checkExecution(OutputAnalyzer out, RunMode mode) {
            if (mode.isApplicationExecuted()) {
                out.shouldContain("Archived MUTF passed");
            }
            if (mode.isProductionRun()) {
                out.shouldContain("MutfPayload0 source: shared objects file");
            }
        }
    }
}
