/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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
 * @summary Instrumentation sizing includes static fields in Class mirrors after C2 compilation
 * @requires vm.compiler2.enabled & vm.bits == "64" & (os.arch == "amd64" | os.arch == "aarch64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox GetObjectSizeClassMirrors
 * @run shell MakeJAR.sh basicAgent
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:-TieredCompilation -XX:-UseTypeSpeculation -Xmx128m
 *      -XX:CompileCommand=inline,sun.instrument.InstrumentationImpl::getObjectSize
 *      -XX:CompileCommand=dontinline,GetObjectSizeClassMirrors::size*
 *      -XX:-UseFourByteObjectHeaders -XX:+UseCompactObjectHeaders -javaagent:basicAgent.jar
 *      GetObjectSizeClassMirrors
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:-TieredCompilation -XX:-UseTypeSpeculation -Xmx128m
 *      -XX:CompileCommand=inline,sun.instrument.InstrumentationImpl::getObjectSize
 *      -XX:CompileCommand=dontinline,GetObjectSizeClassMirrors::size*
 *      -XX:-UseFourByteObjectHeaders -XX:-UseCompactObjectHeaders -javaagent:basicAgent.jar
 *      GetObjectSizeClassMirrors
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:-TieredCompilation -XX:-UseTypeSpeculation -Xmx128m
 *      -XX:CompileCommand=inline,sun.instrument.InstrumentationImpl::getObjectSize
 *      -XX:CompileCommand=dontinline,GetObjectSizeClassMirrors::size*
 *      -XX:+UseFourByteObjectHeaders -javaagent:basicAgent.jar
 *      GetObjectSizeClassMirrors
 */

import java.lang.instrument.Instrumentation;
import java.lang.reflect.Method;
import jdk.test.lib.Asserts;
import jdk.test.lib.Utils;
import jdk.test.whitebox.WhiteBox;

public class GetObjectSizeClassMirrors {
    static final WhiteBox WB = WhiteBox.getWhiteBox();
    static Instrumentation instrumentation;
    static volatile long sink;

    static class Empty {}
    static class ConstantLong { static final long VALUE = 1L; }
    static class OneLong { static long value; }
    static class EightLongs { static long a, b, c, d, e, f, g, h; }
    static class EightReferences { static Object a, b, c, d, e, f, g, h; }
    static final class InstanceFields { long a, b, c, d, e, f, g, h; }

    static long sizeObject(Object value) { return instrumentation.getObjectSize(value); }
    static long sizeClass(Class<?> value) { return instrumentation.getObjectSize(value); }
    static long sizeConstant() { return instrumentation.getObjectSize(EightLongs.class); }
    static long sizeInstance(InstanceFields value) { return instrumentation.getObjectSize(value); }
    static long sizeArray(int[] value) { return instrumentation.getObjectSize(value); }

    static Method compile(String name, Class<?>... parameters) throws Exception {
        Method method = GetObjectSizeClassMirrors.class.getDeclaredMethod(name, parameters);
        WB.deoptimizeMethod(method);
        WB.clearMethodState(method);
        Asserts.assertTrue(WB.enqueueMethodForCompilation(method, 4));
        Utils.waitForCondition(() -> WB.getMethodCompilationLevel(method) == 4);
        return method;
    }

    public static void main(String[] args) throws Exception {
        instrumentation = InstrumentationHandoff.getInstrumentationOrThrow();
        Class<?>[] mirrors = { Empty.class, ConstantLong.class, OneLong.class, EightLongs.class,
                EightReferences.class, InstanceFields.class, int.class, void.class, int[].class,
                Object[].class, String.class };
        InstanceFields instance = new InstanceFields();
        int[] array = new int[3];
        Object[] controls = { new Object(), instance, array, new Object[3], new long[3] };
        // Mixed object/array profiles and disabled type speculation keep sizeObject generic.
        for (int i = 0; i < 10_000; i++) {
            long sum = sizeConstant() + sizeInstance(instance) + sizeArray(array);
            for (Class<?> mirror : mirrors) sum += sizeObject(mirror) + sizeClass(mirror);
            for (Object control : controls) sum += sizeObject(control);
            sink = sum;
        }
        Method[] methods = { compile("sizeObject", Object.class), compile("sizeClass", Class.class),
                compile("sizeConstant"), compile("sizeInstance", InstanceFields.class), compile("sizeArray", int[].class) };

        for (Class<?> mirror : mirrors) {
            long expected = WB.getObjectSize(mirror);
            Asserts.assertEQ(expected, sizeClass(mirror), "Class argument: " + mirror);
            Asserts.assertEQ(expected, sizeObject(mirror), "Object argument: " + mirror);
        }
        Asserts.assertEQ(WB.getObjectSize(EightLongs.class), sizeConstant(), "constant Class argument");
        Asserts.assertEQ(WB.getObjectSize(instance), sizeInstance(instance), "exact instance argument");
        Asserts.assertEQ(WB.getObjectSize(array), sizeArray(array), "exact array argument");
        for (Object control : controls) {
            Asserts.assertEQ(WB.getObjectSize(control), sizeObject(control), "generic control");
        }
        for (Method method : methods) {
            Asserts.assertEQ(4, WB.getMethodCompilationLevel(method), "probe remains compiled: " + method);
        }
        System.out.println("Verified C2 sizes for Class mirrors, ordinary instances and arrays");
    }
}
