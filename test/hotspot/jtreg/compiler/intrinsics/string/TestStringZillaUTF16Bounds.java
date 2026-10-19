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
 * @summary UTF-16 reverse search checks physical source bounds before intrinsic reads
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires (os.arch == "amd64" | os.arch == "x86_64" | os.arch == "aarch64")
 * @library /test/lib
 * @modules java.base/java.lang:open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -Xint -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI TestStringZillaUTF16Bounds 0
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:TieredStopAtLevel=1 -XX:CompileCommand=dontinline,TestStringZillaUTF16Bounds::probe TestStringZillaUTF16Bounds 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:-TieredCompilation -XX:CompileCommand=dontinline,TestStringZillaUTF16Bounds::probe TestStringZillaUTF16Bounds 4
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:TieredStopAtLevel=1 -XX:-UseStringZillaIntrinsics -XX:CompileCommand=dontinline,TestStringZillaUTF16Bounds::probe TestStringZillaUTF16Bounds 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:-TieredCompilation -XX:-UseStringZillaIntrinsics -XX:CompileCommand=dontinline,TestStringZillaUTF16Bounds::probe TestStringZillaUTF16Bounds 4
 */

/*
 * @test id=serial
 * @summary UTF-16 physical bounds precede serial reverse-search probes
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @modules java.base/java.lang:open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:UseAVX=0 -XX:TieredStopAtLevel=1 -XX:CompileCommand=dontinline,TestStringZillaUTF16Bounds::probe TestStringZillaUTF16Bounds 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:UseAVX=0 -XX:-TieredCompilation -XX:CompileCommand=dontinline,TestStringZillaUTF16Bounds::probe TestStringZillaUTF16Bounds 4
 */

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import jdk.test.whitebox.WhiteBox;

public class TestStringZillaUTF16Bounds {
    private static final MethodHandle LAST_INDEX_OF;

    static {
        try {
            LAST_INDEX_OF = MethodHandles.privateLookupIn(String.class, MethodHandles.lookup())
                    .findStatic(String.class, "lastIndexOf",
                            MethodType.methodType(int.class, byte[].class, byte.class,
                                    int.class, String.class, int.class));
        } catch (ReflectiveOperationException failure) {
            throw new ExceptionInInitializerError(failure);
        }
    }

    record Case(byte[] value, int logicalCount, String needle, int from) {}

    public static int probe(byte[] value, int count, String needle, int from) throws Throwable {
        return (int)LAST_INDEX_OF.invokeExact(value, (byte)1, count, needle, from);
    }

    private static Case fixture(int length, int count, boolean mixed) {
        char unit = mixed ? 'a' : '\u0401';
        ByteBuffer bytes = ByteBuffer.allocate(length * 2).order(ByteOrder.nativeOrder());
        for (int i = 0; i < length; i++) bytes.putChar(unit);
        return new Case(bytes.array(), length, String.valueOf(unit).repeat(count), length - count);
    }

    private static void check(Case test) throws Throwable {
        for (int bytes : new int[]{test.value.length - 2, test.value.length - 1}) {
            // Simulate a stale builder backing array with a newer logical count.
            byte[] stale = Arrays.copyOf(test.value, bytes);
            try {
                probe(stale, test.logicalCount, test.needle, test.from);
                throw new AssertionError("Missing physical bounds check: bytes=" + bytes
                        + " count=" + test.logicalCount + " needle=" + test.needle.length()
                        + " from=" + test.from);
            } catch (StringIndexOutOfBoundsException expected) {
            }
        }
    }

    public static void main(String[] args) throws Throwable {
        int level = Integer.parseInt(args[0]);
        List<Case> cases = new ArrayList<>();
        for (int length : new int[]{4, 15, 16, 17, 31}) {
            cases.add(fixture(length, 4, false));
        }
        for (int count : new int[]{4, 9, 16, 32, 64, 65, 129}) {
            cases.add(fixture(count, count, true));
            cases.add(fixture(Math.max(16, count + 8), count, true));
            cases.add(fixture(256, count, true));
        }
        for (int i = 0; i < (level == 0 ? cases.size() : 10_000); i++) {
            Case test = cases.get(i % cases.size());
            if (probe(test.value, test.logicalCount, test.needle, test.from) != test.from) {
                throw new AssertionError("Valid UTF-16 fixture");
            }
        }
        if (level != 0) {
            WhiteBox wb = WhiteBox.getWhiteBox();
            Class<?> utf16 = Class.forName("java.lang.StringUTF16");
            Method[] methods = {
                TestStringZillaUTF16Bounds.class.getMethod("probe",
                        byte[].class, int.class, String.class, int.class),
                utf16.getDeclaredMethod("lastIndexOf",
                        byte[].class, int.class, byte[].class, int.class, int.class),
                utf16.getDeclaredMethod("lastIndexOfJava",
                        byte[].class, byte[].class, int.class, int.class),
                utf16.getDeclaredMethod("lastIndexOfLatin1",
                        byte[].class, int.class, byte[].class, int.class, int.class)
            };
            for (Method method : methods) {
                wb.deoptimizeMethod(method);
                if (!wb.enqueueMethodForCompilation(method, level) || !wb.isMethodCompiled(method)
                        || wb.getMethodCompilationLevel(method) != level) {
                    throw new AssertionError("Cannot compile " + method + " at level " + level);
                }
            }
        }
        for (Case test : cases) check(test);
    }
}
