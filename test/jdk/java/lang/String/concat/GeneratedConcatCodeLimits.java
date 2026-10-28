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
 * @summary Generated concat limits agree with classfile analysis without changing the bytecode
 * @library /test/lib
 * @run driver GeneratedConcatCodeLimits
 */

import java.lang.classfile.ClassFile;
import java.lang.classfile.ClassTransform;
import java.lang.classfile.CodeTransform;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.invoke.StringConcatFactory;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;

import jdk.test.lib.process.ProcessTools;

public class GeneratedConcatCodeLimits {
    public static void main(String[] args) throws Throwable {
        if (args.length != 0) {
            generate();
            return;
        }

        ClassFile analyzer = ClassFile.of(ClassFile.StackMapsOption.GENERATE_STACK_MAPS);
        // The default is an instance cache. Two forces static generation;
        // sixteen also exercises the cache and inline threshold boundaries.
        for (int threshold : new int[] { 256, 2, 16 }) {
            Path directory = Path.of("concat-" + threshold).toAbsolutePath();
            Files.createDirectories(directory);
            var process = ProcessTools.createTestJavaProcessBuilder(
                    "-Xverify:all",
                    "-XX:+UnlockDiagnosticVMOptions",
                    "-XX:+BytecodeVerificationLocal",
                    "-Djava.lang.invoke.StringConcatFactory.dump=true",
                    "-Djava.lang.invoke.StringConcat.cacheThreshold=" + threshold,
                    "-Djava.lang.invoke.StringConcat.inlineThreshold=" + (threshold == 2 ? 0 : 16),
                    GeneratedConcatCodeLimits.class.getName(), "generate");
            process.directory(directory.toFile());
            ProcessTools.executeProcess(process).shouldHaveExitValue(0);

            int count = 0;
            try (var files = Files.walk(directory.resolve("stringConcatClasses"))) {
                for (Path file : files.filter(p -> p.toString().endsWith(".class")).toList()) {
                    byte[] original = Files.readAllBytes(file);
                    // Force the standard analyzer to recompute every method's limits and frames.
                    // Exact equality also guards against inflated limits and unnecessary frames.
                    byte[] analyzed = analyzer.transformClass(analyzer.parse(original),
                            ClassTransform.transformingMethodBodies(CodeTransform.ACCEPT_ALL));
                    if (!Arrays.equals(original, analyzed)) {
                        throw new AssertionError("Classfile analysis changed " + file
                                + " at byte " + Arrays.mismatch(original, analyzed));
                    }
                    count++;
                }
            }
            if (count < 10) {
                throw new AssertionError("Too few generated shapes: " + count);
            }
        }
    }

    private static void generate() throws Throwable {
        for (Class<?> type : new Class<?>[] { boolean.class, byte.class, short.class, char.class,
                int.class, long.class, float.class, double.class, Object.class, String.class,
                CharSequence.class, int[].class, String[].class }) {
            exercise(repeat(type, 2));
        }
        for (int arity : new int[] { 15, 16, 17, 199, 200 }) {
            exercise(repeat(int.class, arity));
            exercise(repeat(Object.class, arity));
        }
        for (int arity : new int[] { 15, 16, 17, 99, 100 }) {
            exercise(repeat(long.class, arity));
            exercise(repeat(double.class, arity));
        }
        exercise(new Class<?>[] { char.class, Object.class });
        exercise(new Class<?>[] { float.class, double.class });
        exercise(new Class<?>[] { long.class, double.class, Object.class, char.class,
                float.class, int.class, boolean.class, String.class, int[].class });
    }

    private static Class<?>[] repeat(Class<?> type, int count) {
        Class<?>[] types = new Class<?>[count];
        Arrays.fill(types, type);
        return types;
    }

    private static void exercise(Class<?>[] types) throws Throwable {
        Object[] values = new Object[types.length];
        for (int i = 0; i < types.length; i++) {
            Class<?> type = types[i];
            if (type == boolean.class) {
                values[i] = true;
            } else if (type == byte.class) {
                values[i] = (byte) -128;
            } else if (type == short.class) {
                values[i] = (short) -32768;
            } else if (type == char.class) {
                values[i] = '\u0100';
            } else if (type == int.class) {
                values[i] = Integer.MIN_VALUE;
            } else if (type == long.class) {
                values[i] = Long.MIN_VALUE;
            } else if (type == float.class) {
                values[i] = -0.0f;
            } else if (type == double.class) {
                values[i] = Double.NaN;
            } else if (type == String.class || type == CharSequence.class) {
                values[i] = "\u0100";
            } else if (type == int[].class) {
                values[i] = new int[] { 1, 2 };
            } else if (type == String[].class) {
                values[i] = new String[] { "value" };
            }
        }

        MethodType type = MethodType.methodType(String.class, types);
        for (String prefix : new String[] { "prefix", "\u0100" }) {
            String recipe = prefix.concat("\1".repeat(types.length)).concat("suffix");
            var target = StringConcatFactory.makeConcatWithConstants(
                    MethodHandles.lookup(), "concat", type, recipe).getTarget();
            if (!type.equals(target.type())) {
                throw new AssertionError(target.type());
            }
            StringBuilder expected = new StringBuilder(prefix);
            for (Object value : values) {
                expected.append(value);
            }
            expected.append("suffix");
            String actual = (String) target.invokeWithArguments(values);
            if (!expected.toString().equals(actual)) {
                throw new AssertionError(actual);
            }
        }
    }
}
