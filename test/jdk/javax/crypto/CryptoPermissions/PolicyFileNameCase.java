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
 * @summary The jurisdiction policy files are selected by name as with the
 *          glob "{default,exempt}_*.policy", which ignores case on Windows
 *          only, so that a restrictive policy file whose extension differs
 *          in case is applied on Windows
 * @library /test/lib
 * @run main/othervm PolicyFileNameCase
 */

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.crypto.Cipher;
import java.security.Security;

import jdk.test.lib.Platform;
import jdk.test.lib.Utils;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.lib.util.FileUtils;

public class PolicyFileNameCase {

    private static final String EXPORT = """
            grant {
                permission javax.crypto.CryptoAllPermission;
            };
            """;

    private static final String LOCAL = """
            grant {
                permission javax.crypto.CryptoPermission *, 128;
            };
            """;

    private static final int UNLIMITED = Integer.MAX_VALUE;

    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            // In the copied JDK: print the effective AES key-length limit
            Security.setProperty("crypto.policy", args[0]);
            System.out.println("AES limit: " +
                    Cipher.getMaxAllowedKeyLength("AES"));
            return;
        }

        Path javaHome = Path.of("java");
        FileUtils.copyDirectory(Path.of(System.getProperty("test.jdk")),
                javaHome);
        Path policyDir = javaHome.resolve(Path.of("conf", "security", "policy"));
        boolean windows = Platform.isWindows();

        // The control: a restrictive local policy that is always applied
        check(javaHome, policyDir, "testcontrol",
                Map.of("default_local.policy", LOCAL), "AES limit: 128");

        // The extension differs in case: the glob matches it on Windows only
        check(javaHome, policyDir, "testextcase",
                Map.of("default_local.POLICY", LOCAL),
                windows ? "AES limit: 128" : "AES limit: " + UNLIMITED);

        // The prefix differs in case: the glob matches it on Windows, where
        // it is then rejected as neither a default nor an exempt policy
        check(javaHome, policyDir, "testprefixcase",
                Map.of("DEFAULT_local.policy", LOCAL),
                windows ? "Couldn't parse jurisdiction policy files"
                        : "AES limit: " + UNLIMITED);
    }

    private static void check(Path javaHome, Path policyDir, String name,
            Map<String, String> files, String expected) throws Exception {
        Path dir = Files.createDirectory(policyDir.resolve(name));
        Files.writeString(dir.resolve("default_US_export.policy"), EXPORT);
        for (Map.Entry<String, String> e : files.entrySet()) {
            Files.writeString(dir.resolve(e.getKey()), e.getValue());
        }

        List<String> cmd = new ArrayList<>();
        cmd.add(javaHome.resolve("bin").resolve("java").toString());
        cmd.addAll(List.of(Utils.prependTestJavaOpts(
                "-cp", System.getProperty("test.class.path"),
                PolicyFileNameCase.class.getName(), name)));
        OutputAnalyzer out = ProcessTools.executeProcess(new ProcessBuilder(cmd));
        System.out.println(name + ": " + files.keySet());
        out.shouldContain(expected);
        if (expected.startsWith("AES limit:")) {
            out.shouldHaveExitValue(0);
        } else {
            out.shouldNotHaveExitValue(0);
        }
    }
}
