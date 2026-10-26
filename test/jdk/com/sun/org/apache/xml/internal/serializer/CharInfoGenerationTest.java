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
 * @summary Bundled serializer entity generation is reproducible and up to date
 * @modules jdk.compiler
 * @run main/othervm transform.CharInfoGenerationTest
 */
package transform;

import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Comparator;
import javax.tools.ToolProvider;

public class CharInfoGenerationTest {
    public static void main(String[] args) throws Exception {
        Path root = Path.of(System.getProperty("test.root")).resolve("../..").normalize();
        Path serializer = root.resolve("src/java.xml/share/classes/com/sun/org/apache/xml/internal/serializer");
        Path generator = root.resolve("make/jdk/src/classes/build/tools/serializer/GenerateCharInfo.java");
        Path work = Files.createTempDirectory("charinfo-generation");
        try {
            int result = ToolProvider.getSystemJavaCompiler().run(null, null, null,
                    "-d", work.toString(), generator.toString());
            if (result != 0) throw new AssertionError("Generator compilation: " + result);
            try (var loader = new URLClassLoader(new java.net.URL[] {work.toUri().toURL()}, null)) {
                Class<?> tool = Class.forName("build.tools.serializer.GenerateCharInfo", true, loader);
                Path generated = work.resolve("CharInfoData.java");
                tool.getMethod("main", String[].class).invoke(null, (Object) new String[] {
                        serializer.toString(), generated.toString()});
                if (Files.mismatch(serializer.resolve("CharInfoData.java"), generated) != -1) {
                    throw new AssertionError("Regenerate CharInfoData with this JDK; resource or enumeration order changed");
                }
            }
            System.out.println("PASS generated source is current on " + Runtime.version());
        } finally {
            try (var files = Files.walk(work)) {
                for (Path p : files.sorted(Comparator.reverseOrder()).toList()) Files.delete(p);
            }
        }
    }
}
