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
 * @summary Instrumentation reports current object sizes after four-byte hash expansion
 * @requires vm.bits == "64" & (os.arch == "amd64" | os.arch == "aarch64")
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires vm.gc.Serial & vm.gc.G1 & vm.gc.Z
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox FourByteHeaderObjectSize
 * @run shell MakeJAR.sh basicAgent
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:+UnlockExperimentalVMOptions -XX:+UseFourByteObjectHeaders -XX:+UseSerialGC
 *      -XX:+TieredCompilation -Xbatch -Xmx256m -javaagent:basicAgent.jar
 *      FourByteHeaderObjectSize FourByteHeaderObjectSize
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:+UnlockExperimentalVMOptions -XX:+UseFourByteObjectHeaders -XX:+UseG1GC
 *      -XX:+TieredCompilation -Xbatch -Xmx256m -javaagent:basicAgent.jar
 *      FourByteHeaderObjectSize FourByteHeaderObjectSize
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:+UnlockExperimentalVMOptions -XX:+UseFourByteObjectHeaders -XX:+UseZGC
 *      -XX:+TieredCompilation -Xbatch -Xmx256m -javaagent:basicAgent.jar
 *      FourByteHeaderObjectSize FourByteHeaderObjectSize
 */

import java.lang.instrument.Instrumentation;
import java.lang.reflect.Method;
import java.util.ArrayList;
import jdk.test.lib.Asserts;
import jdk.test.lib.Utils;
import jdk.test.whitebox.WhiteBox;

public class FourByteHeaderObjectSize extends ASimpleInstrumentationTestCase {
    static final WhiteBox WB = WhiteBox.getWhiteBox();
    static final class Cell { int value; Cell(int value) { this.value = value; } }
    static Instrumentation instrumentation;
    static volatile Object garbage;
    static volatile long sink;
    static long sizeObject(Object value) { return instrumentation.getObjectSize(value); }
    static long sizeCell(Cell value) { return instrumentation.getObjectSize(value); }
    static long sizeArray(int[] value) { return instrumentation.getObjectSize(value); }

    public FourByteHeaderObjectSize(String name) { super(name); }
    public static void main(String[] args) throws Throwable {
        new FourByteHeaderObjectSize(args[0]).runTest();
    }
    static void compile(String name, Class<?> parameter, int level) throws Exception {
        Method method = FourByteHeaderObjectSize.class.getDeclaredMethod(name, parameter);
        WB.deoptimizeMethod(method);
        WB.clearMethodState(method);
        Asserts.assertTrue(WB.enqueueMethodForCompilation(method, level));
        Utils.waitForCondition(() -> WB.getMethodCompilationLevel(method) == level);
    }
    @Override protected void doRunTest() throws Throwable {
        instrumentation = fInst;
        var objects = new ArrayList<Object>();
        for (int i = 0; i < 12000; i++) {
            objects.add(new Cell(i));
            garbage = new byte[64];
        }
        for (int length = 0; length < 32; length++) {
            objects.add(new byte[length]);
            objects.add(new int[length]);
            objects.add(new long[length]);
            objects.add(new Object[length]);
        }
        objects.add(Cell.class);
        var hashes = new int[objects.size()];
        var baseSizes = new long[objects.size()];
        for (int i = 0; i < objects.size(); i++) {
            baseSizes[i] = WB.getObjectSize(objects.get(i));
            hashes[i] = System.identityHashCode(objects.get(i));
        }
        Cell cell = (Cell) objects.get(0);
        int[] array = (int[]) objects.get(12001);
        for (int i = 0; i < 20000; i++) {
            sink = sizeObject(cell) + sizeCell(cell) + sizeArray(array);
        }
        for (int level : new int[] {1, 4}) {
            compile("sizeObject", Object.class, level);
            compile("sizeCell", Cell.class, level);
            compile("sizeArray", int[].class, level);
            for (int round = 0; round < 3; round++) System.gc();
            int expanded = 0;
            for (int i = 0; i < objects.size(); i++) {
                Object object = objects.get(i);
                long actual = WB.getObjectSize(object);
                if (actual > baseSizes[i]) expanded++;
                Asserts.assertEQ(sizeObject(object), actual, "generic size at compilation level " + level);
                if (object instanceof Cell value) {
                    Asserts.assertEQ(sizeCell(value), actual, "exact instance size");
                    Asserts.assertEQ(value.value, i);
                } else if (object instanceof int[] value) {
                    Asserts.assertEQ(sizeArray(value), actual, "exact array size");
                }
                Asserts.assertEQ(System.identityHashCode(object), hashes[i]);
            }
            Asserts.assertGT(expanded, 0, "GC must exercise hash expansion");
            System.out.println("Verified current object sizes at compilation level " + level);
        }
    }
}
