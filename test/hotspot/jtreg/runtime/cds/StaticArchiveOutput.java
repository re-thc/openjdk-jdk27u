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
 * @test id=existing
 * @summary Classic CDS preserves output until archive preparation succeeds
 * @requires vm.cds
 * @library /test/lib
 * @run driver StaticArchiveOutput preparation existing
 */

/*
 * @test id=absent
 * @summary Classic CDS preserves output until archive preparation succeeds
 * @requires vm.cds
 * @library /test/lib
 * @run driver StaticArchiveOutput preparation absent
 */

/*
 * @test id=success
 * @summary Classic CDS preserves output until archive preparation succeeds
 * @requires vm.cds
 * @library /test/lib
 * @run driver StaticArchiveOutput success
 */

/*
 * @test id=writeError
 * @summary Classic CDS preserves output until archive preparation succeeds
 * @requires vm.cds
 * @library /test/lib
 * @run driver StaticArchiveOutput writeError
 */

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import jdk.test.lib.Asserts;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class StaticArchiveOutput {
    private static final String SENTINEL = "Existing archive must survive preparation failure";

    public static void main(String[] args) throws Exception {
        Path archive = Path.of("output.jsa");
        switch (args[0]) {
        case "preparation":
            boolean existing = args[1].equals("existing");
            if (existing) {
                Files.writeString(archive, SENTINEL);
            }
            Path classDir = Files.createDirectory(Path.of("classes")).toRealPath();
            Files.copy(Path.of(System.getProperty("test.classes"), "StaticArchiveOutputApp.class"),
                       classDir.resolve("StaticArchiveOutputApp.class"));
            Path classList = Path.of("classes.list");
            Files.writeString(classList, "java/lang/Object\nStaticArchiveOutputApp\n");
            // This check runs inside VM_PopulateDumpSharedSpace, after the old early open.
            dump(archive, "-cp", classDir.toString(), "-XX:SharedClassListFile=" + classList)
                .shouldNotHaveExitValue(0)
                .shouldContain("Cannot have non-empty directory in paths")
                .shouldNotContain("Dumping shared data to file:");
            if (existing) {
                Asserts.assertEQ(Files.readString(archive), SENTINEL,
                                 "Preparation failure must preserve the existing file");
            } else {
                Asserts.assertFalse(Files.exists(archive), "Preparation failure must not expose an empty output");
            }
            break;
        case "success":
            Files.writeString(archive, SENTINEL);
            OutputAnalyzer out = dump(archive);
            out.shouldHaveExitValue(0);
            String log = out.getStdout();
            int prepared = log.indexOf("Make training data shareable");
            int opened = log.indexOf("Dumping shared data to file:");
            Asserts.assertTrue(prepared >= 0 && opened > prepared,
                               "Output must open after archive preparation completes");
            Asserts.assertGT(Files.size(archive), (long) SENTINEL.length(), "Archive bytes must be written");
            new OutputAnalyzer(ProcessTools.createTestJavaProcessBuilder(
                "-Xshare:on", "-XX:SharedArchiveFile=" + archive, "-version").start())
                .shouldHaveExitValue(0).shouldContain("sharing");
            break;
        case "writeError":
            archive = Path.of("missing-directory", "output.jsa");
            dump(archive).shouldHaveExitValue(1)
                .shouldContain("Unable to create shared archive file")
                .shouldContain("Encountered error while dumping");
            Asserts.assertFalse(Files.exists(archive), "Failed open must not create an archive");
            break;
        default:
            throw new IllegalArgumentException(args[0]);
        }
    }

    private static OutputAnalyzer dump(Path archive, String... extra) throws Exception {
        List<String> command = new ArrayList<>(List.of(
            "-Xshare:dump", "-Xlog:cds,aot", "-XX:SharedArchiveFile=" + archive));
        command.addAll(List.of(extra));
        return new OutputAnalyzer(ProcessTools.createTestJavaProcessBuilder(command).start());
    }
}

class StaticArchiveOutputApp {}
