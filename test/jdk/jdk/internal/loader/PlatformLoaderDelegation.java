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
 * @summary Test loading classes with the platform class loader, which finds
 *          the classes in the packages that are not in a module of a built-in
 *          class loader with the boot class loader
 * @library /test/lib
 * @run main PlatformLoaderDelegation
 */

import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;

import jdk.test.lib.process.ProcessTools;

public class PlatformLoaderDelegation {

    public static void main(String[] args) throws Exception {
        if (args.length == 0) {
            // a class in the boot class path that is appended to
            Path boot = Path.of("boot");
            Files.createDirectories(boot.resolve("bootpkg"));
            Files.write(boot.resolve("bootpkg/B.class"), classBytes("bootpkg.B"));
            ProcessTools.executeProcess(ProcessTools.createTestJavaProcessBuilder(
                    "-Xbootclasspath/a:" + boot,
                    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
                    "-cp", System.getProperty("test.classes"),
                    "PlatformLoaderDelegation", "test"))
                .shouldHaveExitValue(0);
            return;
        }

        ClassLoader platform = ClassLoader.getPlatformClassLoader();
        ClassLoader app = ClassLoader.getSystemClassLoader();

        // in a module of the boot class loader
        same(String.class, platform.loadClass("java.lang.String"));
        same(String.class, app.loadClass("java.lang.String"));
        // in a module of the platform class loader
        Class<?> connection = platform.loadClass("java.sql.Connection");
        same(platform, connection.getClassLoader());
        same(connection, app.loadClass("java.sql.Connection"));
        // in a package of the boot class path
        Class<?> b = platform.loadClass("bootpkg.B");
        same(null, b.getClassLoader());
        same(b, app.loadClass("bootpkg.B"));
        same(b, Class.forName("bootpkg.B", false, platform));
        same(b, Class.forName("bootpkg.B", false, app));

        // not found, also in packages that exist
        for (ClassLoader loader : new ClassLoader[] { platform, app }) {
            for (String name : new String[] { "Missing", "nopkg.Missing", "java.lang.Missing",
                                              "java.sql.Missing", "bootpkg.Missing" }) {
                try {
                    Class<?> c = loader.loadClass(name);
                    throw new AssertionError(name + " is loaded as " + c);
                } catch (ClassNotFoundException expected) {
                }
            }
        }

        // a class defined to the platform class loader without a module is found
        byte[] bytes = classBytes("defpkg.D");
        Method defineClass = ClassLoader.class.getDeclaredMethod(
                "defineClass", String.class, byte[].class, int.class, int.class);
        defineClass.setAccessible(true);
        Class<?> d = (Class<?>) defineClass.invoke(platform, "defpkg.D", bytes, 0, bytes.length);
        same(platform, d.getClassLoader());
        same(d, platform.loadClass("defpkg.D"));
        same(d, app.loadClass("defpkg.D"));
        same(d, Class.forName("defpkg.D", false, app));
    }

    private static byte[] classBytes(String name) {
        return ClassFile.of().build(ClassDesc.of(name), cb -> { });
    }

    private static void same(Object expected, Object actual) {
        if (expected != actual) {
            throw new AssertionError("Expected " + expected + ", got " + actual);
        }
    }
}
