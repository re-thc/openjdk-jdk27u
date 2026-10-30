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
 * @summary Verify deterministic target-data generation and Unicode version checks
 * @modules jdk.compiler
 * @run main GenerateCaseInsensitiveMapTest
 */

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import javax.tools.ToolProvider;

public class GenerateCaseInsensitiveMapTest {
    public static void main(String[] args) throws Exception {
        Path root = Path.of(System.getProperty("test.src", ".")).toAbsolutePath();
        while (root != null && !Files.isDirectory(root.resolve("make/jdk/src/classes"))) {
            root = root.getParent();
        }
        if (root == null) {
            throw new AssertionError("Cannot find JDK source repository");
        }
        Path work = Files.createTempDirectory(Path.of("."), "case-map-generator-");
        Path classes = Files.createDirectory(work.resolve("classes"));
        Path tools = root.resolve("make/jdk/src/classes/build/tools/generatecharacter");
        int status = ToolProvider.getSystemJavaCompiler().run(null, null, null,
                "-d", classes.toString(), tools.resolve("UnicodeSpec.java").toString(),
                tools.resolve("GenerateCaseInsensitiveMap.java").toString());
        if (status != 0) {
            throw new AssertionError("Generator compilation failed: " + status);
        }
        try (URLClassLoader loader = new URLClassLoader(
                new java.net.URL[] { classes.toUri().toURL() })) {
            Method main = loader.loadClass("build.tools.generatecharacter.GenerateCaseInsensitiveMap")
                    .getMethod("main", String[].class);
            Path template = root.resolve("src/java.xml/share/classes/com/sun/org/apache/"
                    + "xerces/internal/impl/xpath/regex/CaseInsensitiveMap.java.template");
            Path data = root.resolve("src/java.base/share/data/unicodedata");
            Path character = root.resolve("src/java.base/share/classes/java/lang/Character.java");
            Path first = work.resolve("first.java");
            Path second = work.resolve("second.java");
            generate(main, template, data.resolve("UnicodeData.txt"), data.resolve("ReadMe.txt"),
                    character, first);
            generate(main, template, data.resolve("UnicodeData.txt"), data.resolve("ReadMe.txt"),
                    character, second);
            if (Files.mismatch(first, second) != -1) {
                throw new AssertionError("Regeneration is not byte-for-byte deterministic");
            }
            Path synthetic = work.resolve("UnicodeData.txt");
            // Private-use characters have identity case mappings on the host.
            // This artificial target gives them a simple lower/upper pair. All
            // other characters, including host ASCII letters, remain identity.
            String syntheticData = "E000;TEST CAPITAL;Lu;0;L;;;;;N;;;;E001;\n"
                    + "E001;TEST SMALL;Ll;0;L;;;;;N;;;E000;;E000\n";
            Files.writeString(synthetic, syntheticData);
            Path readme = work.resolve("ReadMe.txt");
            Path declaration = work.resolve("Character.java");
            Files.writeString(readme, "Version 99.0.0 of the Unicode Standard\n");
            Files.writeString(declaration, "Unicode Standard, version 99.0.\n");
            Path output = work.resolve("synthetic.java");
            generate(main, template, synthetic, readme, declaration, output);
            String source = Files.readString(output);
            if (!source.contains("page[0] = new int[] { 0xe001, 0x1 };")
                    || !source.contains("page[1] = new int[] { 0xe000, 0x2 };")
                    || source.contains("page[65] =")
                    || source.split("new int\\[256\\]\\[\\];", -1).length != 2) {
                throw new AssertionError("Generator did not use target simple mappings: " + source);
            }
            Files.writeString(declaration, "Unicode Standard, version 98.0.\n");
            byte[] previous = Files.readAllBytes(output);
            rejectMismatch(main, template, synthetic, readme, declaration, output);
            if (!Arrays.equals(previous, Files.readAllBytes(output))) {
                throw new AssertionError("Mismatch overwrote existing output");
            }
            Path absent = work.resolve("must-not-exist.java");
            rejectMismatch(main, template, synthetic, readme, declaration, absent);
            if (Files.exists(absent)) {
                throw new AssertionError("Mismatch created output");
            }
            Files.writeString(declaration, "Unicode Standard, version 99.0.\n");
            String rangeFirst = "E010;<Test, First>;Lo;0;L;;;;;N;;;;;\n";
            String rangeLast = "E020;<Test, Last>;Lo;0;L;;;;;N;;;;;\n";
            Files.writeString(synthetic, syntheticData + rangeFirst + rangeLast);
            generate(main, template, synthetic, readme, declaration, output);
            previous = Files.readAllBytes(output);
            for (String invalid : new String[] {
                    "", // empty file
                    "invalid\n",
                    syntheticData + syntheticData, // decreasing and duplicate records
                    syntheticData.replace("E001;TEST SMALL", "E000;TEST SMALL"),
                    syntheticData.replace("E000;;E000", "110000;;E000"),
                    syntheticData.replace("E000;;E000", "-001;;E000"),
                    syntheticData + rangeFirst, // truncated range
                    syntheticData + rangeLast, // range end without a start
                    syntheticData + rangeFirst + rangeLast.replace("Test", "Other"),
                    syntheticData + rangeFirst + rangeLast.replace(";Lo;", ";Lu;"),
                    syntheticData + "10000;TEST;Lo;0;L;;;;;N;;;;;\ninvalid\n"
            }) {
                Files.writeString(synthetic, invalid);
                reject(main, synthetic.toString(), template, synthetic, readme, declaration, output);
                if (!Arrays.equals(previous, Files.readAllBytes(output))) {
                    throw new AssertionError("Invalid target data overwrote output");
                }
                reject(main, synthetic.toString(), template, synthetic, readme, declaration, absent);
                if (Files.exists(absent)) {
                    throw new AssertionError("Invalid target data created output");
                }
            }
        }
        System.out.println("Deterministic generation, target mappings, version and data guards passed");
    }

    private static void generate(Method main, Path... paths) throws Exception {
        main.invoke(null, (Object) Arrays.stream(paths).map(Path::toString).toArray(String[]::new));
    }

    private static void rejectMismatch(Method main, Path... paths) throws Exception {
        reject(main, "Target Unicode version mismatch", paths);
    }

    private static void reject(Method main, String message, Path... paths) throws Exception {
        try {
            generate(main, paths);
            throw new AssertionError("Invalid generator input was accepted");
        } catch (InvocationTargetException exception) {
            if (!(exception.getCause() instanceof IllegalArgumentException)
                    || !exception.getCause().getMessage().contains(message)) {
                throw exception;
            }
        }
    }
}
