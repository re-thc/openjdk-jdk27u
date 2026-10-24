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
 * @summary End launcher inflate state on allocation and corrupt-manifest failures
 * @library /test/lib
 * @run main/native ManifestCleanup
 */

import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.jar.Attributes;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;
import java.util.jar.Manifest;
import jdk.test.lib.Platform;
import jdk.test.lib.process.ProcessTools;

public class ManifestCleanup {
    public static class Main {
        public static void main(String[] args) {
            System.out.println("MANIFEST_MAIN_OK");
        }
    }

    public static void main(String[] args) throws Exception {
        byte[] text = "Manifest-Version: 1.0\r\n\r\n".getBytes(java.nio.charset.StandardCharsets.UTF_8);
        if (text.length != 25) throw new AssertionError("fixture length");
        // Final RFC1951 stored block, independently of compressor heuristics.
        byte[] raw = new byte[text.length + 5];
        raw[0] = 1;
        raw[1] = (byte) text.length;
        raw[3] = (byte) ~text.length;
        raw[4] = (byte) 0xff;
        System.arraycopy(text, 0, raw, 5, text.length);
        Path validRaw = Files.write(Path.of("valid-manifest.raw"), raw);
        Path badRaw = Files.write(Path.of("bad-manifest.raw"), new byte[]{7}); // invalid BTYPE=3
        Path stored = Files.write(Path.of("stored-manifest.raw"), text);
        Path executable = Path.of(System.getProperty("test.nativepath"),
            "ManifestCleanup" + (Platform.isWindows() ? ".exe" : ""));
        for (int c = 0; c < 6; c++) {
            ProcessTools.executeProcess(new ProcessBuilder(executable.toString(),
                Integer.toString(c), validRaw.toString(), badRaw.toString(), stored.toString()))
                .shouldHaveExitValue(0).shouldContain("PASS");
        }

        Manifest manifest = new Manifest();
        manifest.getMainAttributes().put(Attributes.Name.MANIFEST_VERSION, "1.0");
        manifest.getMainAttributes().put(Attributes.Name.MAIN_CLASS, Main.class.getName());
        String className = Main.class.getName().replace('.', '/') + ".class";
        Path jar = Path.of("valid-manifest.jar");
        try (JarOutputStream out = new JarOutputStream(Files.newOutputStream(jar), manifest);
             InputStream in = ManifestCleanup.class.getResourceAsStream("/" + className)) {
            if (in == null) throw new AssertionError("missing Main class");
            out.putNextEntry(new JarEntry(className));
            in.transferTo(out);
            out.closeEntry();
        }
        byte[] bytes = Files.readAllBytes(jar);
        ByteBuffer header = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN);
        if (header.getInt(0) != 0x04034b50 || header.getShort(8) != 8)
            throw new AssertionError("expected first entry to be deflated manifest");
        int offset = 30 + Short.toUnsignedInt(header.getShort(26)) +
            Short.toUnsignedInt(header.getShort(28));
        bytes[offset] = 7; // Preserve ZIP metadata, corrupt only the deflate stream.
        Path badJar = Files.write(Path.of("corrupt-manifest.jar"), bytes);
        ProcessTools.executeProcess(new ProcessBuilder(executable.toString(),
            "--jar", jar.toString(), "0")).shouldHaveExitValue(0).shouldContain("PASS");
        ProcessTools.executeProcess(new ProcessBuilder(executable.toString(),
            "--jar", badJar.toString(), "-2")).shouldHaveExitValue(0).shouldContain("PASS");

        // Exercise the rebuilt product libjli as well as the instrumented parser.
        ProcessTools.executeTestJava("-jar", jar.toString())
            .shouldHaveExitValue(0).shouldContain("MANIFEST_MAIN_OK");
        ProcessTools.executeTestJava("-jar", badJar.toString()).shouldNotHaveExitValue(0);
    }
}
