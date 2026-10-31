/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
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
 * @requires (os.family == "windows")
 * @summary Unicode Windows paths and processes must not require public legacy codecs
 * @run main/othervm -Dstdout.encoding=UTF-8 -Dstderr.encoding=UTF-8 WindowsUnicodePaths
 */

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.charset.UnsupportedCharsetException;
import java.nio.file.Files;
import java.nio.file.Path;

public class WindowsUnicodePaths {
    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            if (!args[0].equals("\u4e2d-\ud83d\ude00") ||
                    !args[0].equals(System.getenv("MODERN_CHARSET_PATH_TEST"))) {
                throw new AssertionError("Child argument or environment was altered");
            }
            Path file = Path.of("\u4e2d-\ud83d\ude00.txt");
            Files.writeString(file, args[0], StandardCharsets.UTF_8);
            if (!file.toFile().isFile() || !Files.readString(file.toRealPath(), StandardCharsets.UTF_8).equals(args[0])) {
                throw new AssertionError("Unicode path or file content changed");
            }
            Files.delete(file);
            System.out.print("ok");
            return;
        }
        Path root = Files.createTempDirectory("modern-charset-");
        Path dir = Files.createDirectory(root.resolve("\u4e2d-\ud83d\ude00"));
        Path outputFile = dir.resolve("\u8f93\u51fa-\ud83d\ude00.txt");
        try {
            String java = Path.of(System.getProperty("java.home"), "bin", "java.exe").toString();
            String classes = Path.of(System.getProperty("test.classes", ".")).toAbsolutePath().toString();
            ProcessBuilder pb = new ProcessBuilder(java, "-Dstdout.encoding=UTF-8", "-Dstderr.encoding=UTF-8",
                    "-cp", classes, WindowsUnicodePaths.class.getName(), "\u4e2d-\ud83d\ude00");
            pb.directory(dir.toFile());
            pb.environment().put("MODERN_CHARSET_PATH_TEST", "\u4e2d-\ud83d\ude00");
            pb.redirectErrorStream(true).redirectOutput(outputFile.toFile());
            Process child = pb.start();
            int exit = child.waitFor();
            String output = Files.readString(outputFile, StandardCharsets.UTF_8);
            Files.delete(outputFile);
            if (exit != 0 || !output.equals("ok")) {
                throw new AssertionError("Unicode child failed: " + output);
            }
            if (!Charset.isSupported(System.getProperty("native.encoding"))) {
                for (Runnable action : new Runnable[] {
                        () -> child.inputReader(), () -> child.errorReader(), () -> child.outputWriter()}) {
                    try {
                        action.run();
                        throw new AssertionError("Unsupported native stream encoding accepted");
                    } catch (UnsupportedCharsetException expected) { }
                }
                child.inputReader(StandardCharsets.UTF_8);
                child.errorReader(StandardCharsets.UTF_8);
                child.outputWriter(StandardCharsets.UTF_8);
                Process compat = new ProcessBuilder(java, "-Dstdout.encoding=UTF-8",
                        "-Dstderr.encoding=UTF-8", "-Dfile.encoding=COMPAT", "-version")
                        .redirectErrorStream(true).start();
                String diagnostic = new String(compat.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
                if (compat.waitFor() == 0 || !diagnostic.contains("Unsupported native encoding for file.encoding=COMPAT")) {
                    throw new AssertionError("Missing COMPAT diagnostic: " + diagnostic);
                }
            }
        } finally {
            Files.deleteIfExists(outputFile);
            Files.delete(dir);
            Files.delete(root);
        }
    }
}
