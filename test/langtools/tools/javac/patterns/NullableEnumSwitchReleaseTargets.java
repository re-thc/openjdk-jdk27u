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
 * @summary Preserve legacy enum-constant lowering and existing zero-label paths across targets
 * @library /tools/lib
 * @modules jdk.compiler/com.sun.tools.javac.api
 *          jdk.compiler/com.sun.tools.javac.main
 * @build toolbox.ToolBox toolbox.JavacTask
 * @run main NullableEnumSwitchReleaseTargets
 */

import java.lang.classfile.ClassFile;
import java.lang.classfile.instruction.InvokeDynamicInstruction;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import toolbox.JavacTask;
import toolbox.ToolBox;

public class NullableEnumSwitchReleaseTargets {
    static final ToolBox tb = new ToolBox();

    public static void main(String... args) throws Exception {
        Path src = Path.of("src");
        tb.writeJavaFiles(src, """
                public class Choices {
                    public enum E { A, B, C, D, OTHER }
                    public static int selections;
                    static E select(E e) { selections++; return e; }
                    public static int pick(E e) {
                        return switch (select(e)) {
                            case null -> -1;
                            case A -> 0;
                            case B -> 1;
                            case C -> 2;
                            case D -> 3;
                            default -> 9;
                        };
                    }
                    public static int onlyDefault(E e) {
                        return switch (select(e)) { case null -> -2; default -> 2; };
                    }
                }
                """);
        for (int release : new int[] {21, 22, 23, Runtime.version().feature()}) {
            check(src, Path.of("release-" + release), release, "--release", "" + release);
        }
        for (int target : new int[] {21, 22, 23}) {
            check(src, Path.of("target-" + target), target,
                    "-Xlint:-options", "-source", "" + target, "-target", "" + target);
        }
        check(src, Path.of("source-21-target-23"), 23,
                "-Xlint:-options", "-source", "21", "-target", "23");
        check(src, Path.of("current"), Runtime.version().feature());
    }

    static void check(Path src, Path output, int target, String... options) throws Exception {
        Files.createDirectories(output);
        new JavacTask(tb).options(options).outdir(output)
                .files(tb.findJavaFiles(src)).run().writeAll();
        var model = ClassFile.of().parse(output.resolve("Choices.class"));
        if (model.majorVersion() != target + 44) throw new AssertionError("wrong target: " + model.majorVersion());
        int methods = 0;
        for (var method : model.methods()) {
            if (!List.of("pick", "onlyDefault").contains(method.methodName().stringValue())) continue;
            methods++;
            var switches = method.code().orElseThrow().elementStream()
                    .filter(InvokeDynamicInstruction.class::isInstance)
                    .map(InvokeDynamicInstruction.class::cast)
                    .filter(i -> i.bootstrapMethod().owner().descriptorString()
                            .equals("Ljava/lang/runtime/SwitchBootstraps;")).toList();
            // Zero-label expressions already use the direct reference-switch
            // path on older targets. Enum-constant labels retain the legacy ABI.
            if (target < 23 && method.methodName().equalsString("pick")) {
                if (switches.size() != 1) throw new AssertionError(output + ": " + switches);
                var indy = switches.getFirst();
                if (!indy.bootstrapMethod().methodName().equals("typeSwitch") ||
                        !indy.name().equalsString("typeSwitch") ||
                        !indy.type().equalsString("(Ljava/lang/Object;I)I")) {
                    throw new AssertionError(output + ": " + indy);
                }
            } else if (!switches.isEmpty()) {
                throw new AssertionError(output + ": nullable enum expression retained bootstrap");
            }
        }
        if (methods != 2) throw new AssertionError("missing methods: " + methods);
        try (URLClassLoader loader = new URLClassLoader(new URL[] {output.toUri().toURL()}, null)) {
            Class<?> caller = loader.loadClass("Choices");
            Class<?> e = loader.loadClass("Choices$E");
            Method pick = caller.getMethod("pick", e);
            Method onlyDefault = caller.getMethod("onlyDefault", e);
            Object[] constants = e.getEnumConstants();
            for (int i = 0; i < constants.length; i++) {
                equal(i < 4 ? i : 9, pick.invoke(null, constants[i]));
                equal(2, onlyDefault.invoke(null, constants[i]));
            }
            equal(-1, pick.invoke(null, new Object[] {null}));
            equal(-2, onlyDefault.invoke(null, new Object[] {null}));
            equal(12, caller.getField("selections").get(null));
        }
    }

    static void equal(int expected, Object actual) {
        if (!Integer.valueOf(expected).equals(actual)) throw new AssertionError(expected + " != " + actual);
    }
}
