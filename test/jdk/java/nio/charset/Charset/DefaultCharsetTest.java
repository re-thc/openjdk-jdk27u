/*
 * Copyright (c) 2017, 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 4772857
 * @summary Unit test for Charset.defaultCharset
 * @requires os.family == "linux"
 * @library /test/lib
 * @build jdk.test.lib.Utils
 *        jdk.test.lib.Asserts
 *        jdk.test.lib.JDKToolFinder
 *        jdk.test.lib.JDKToolLauncher
 *        jdk.test.lib.Platform
 *        jdk.test.lib.process.*
 *        Default
 * @run junit DefaultCharsetTest
 */

import java.nio.charset.Charset;
import java.util.stream.Stream;

import jdk.test.lib.process.ProcessTools;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class DefaultCharsetTest {

    public static Stream<String> locales() {
        return Stream.of("en_US", "en_US.utf8", "ja_JP.utf8", "tr_TR",
                "ru_RU", "zh_CN", "C", "ja_JP", "ja_JP.eucjp", "ja_JP.ujis");
    }

    @ParameterizedTest
    @MethodSource("locales")
    public void testDefaultCharset(String locale) throws Exception {
        boolean installed = ProcessTools.executeProcess("locale", "-a").getStdout().lines()
                .anyMatch(name -> name.equalsIgnoreCase(locale));
        if (!installed) {
            System.out.println(locale + ": Locale not supported, skipping...");
            return;
        }
        ProcessBuilder pb = ProcessTools.createTestJavaProcessBuilder(
                "-Dfile.encoding=COMPAT", Default.class.getName());
        pb.environment().put("LC_ALL", locale);
        ProcessBuilder charmap = new ProcessBuilder("locale", "charmap");
        charmap.environment().put("LC_ALL", locale);
        String expectedCharset = ProcessTools.executeProcess(charmap)
                .shouldHaveExitValue(0).getStdout().trim();
        var result = ProcessTools.executeProcess(pb);
        if (Charset.isSupported(expectedCharset)) {
            String actual = result.shouldHaveExitValue(0).getStdout();
            String expected = "DEFAULT_CHARSET=" + Charset.forName(expectedCharset).name();
            assertTrue(actual.lines().anyMatch(line -> line.equalsIgnoreCase(expected)),
                       String.format("LC_ALL = %s, got defaultCharset = %s, "
                               + "NOT as expected %s",
                               locale, actual, expectedCharset));
        } else {
            result.shouldNotHaveExitValue(0)
                  .shouldContain("Unsupported native filesystem encoding");
        }
    }
}
