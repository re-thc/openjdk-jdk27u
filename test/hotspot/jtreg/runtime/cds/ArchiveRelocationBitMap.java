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
 * @test id=static
 * @summary Relocate complete CDS pointer maps with sequential and parallel workers
 * @requires vm.cds
 * @library /test/lib
 * @run driver ArchiveRelocationBitMap STATIC
 */

/*
 * @test id=aot
 * @summary Relocate complete AOT pointer maps with sequential and parallel workers
 * @requires vm.cds.supports.aot.class.linking
 * @library /test/lib
 * @run driver ArchiveRelocationBitMap AOT
 */

import java.nio.file.Path;

import jdk.test.lib.cds.SimpleCDSAppTester;
import jdk.test.lib.helpers.ClassFileInstaller;
import jdk.test.lib.process.OutputAnalyzer;

public class ArchiveRelocationBitMap {
    public static void main(String[] args) throws Exception {
        String jar = ClassFileInstaller.writeJar("relocation.jar", "ArchiveRelocationBitMapApp");
        // An alternative mapping can reuse the preferred address; base zero guarantees relocation.
        SimpleCDSAppTester tester = SimpleCDSAppTester.of("relocation")
            .classpath(Path.of(jar).toAbsolutePath().toString())
            .addVmArgs("-XX:+UnlockDiagnosticVMOptions", "-XX:ArchiveRelocationMode=1",
                       "-XX:SharedBaseAddress=0",
                       "-XX:-AOTCacheParallelRelocation", "-Xlog:cds+reloc=debug,aot+reloc=debug")
            .appCommandLine("ArchiveRelocationBitMapApp")
            .setProductionChecker((OutputAnalyzer out) -> {
                out.shouldContain("runtime archive relocation start");
                out.shouldContain("runtime archive relocation done");
                out.shouldContain("Relocated archive application ran");
            });
        tester.run(args);
        tester.rerunProduction("-XX:ActiveProcessorCount=2", "-XX:+AOTCacheParallelRelocation");
    }
}

class ArchiveRelocationBitMapApp {
    public static void main(String[] args) {
        System.out.println("Relocated archive application ran");
    }
}
