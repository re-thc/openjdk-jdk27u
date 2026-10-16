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
 * @summary Check the open types that an MXBean maps the primitive types,
 *          their wrapper classes and the arrays of them to
 * @run main PrimitiveOpenTypesTest
 */

import java.lang.management.ManagementFactory;
import javax.management.MBeanAttributeInfo;
import javax.management.MBeanInfo;
import javax.management.MBeanOperationInfo;
import javax.management.MBeanServer;
import javax.management.ObjectName;
import javax.management.openmbean.ArrayType;
import javax.management.openmbean.OpenType;
import javax.management.openmbean.SimpleType;

public class PrimitiveOpenTypesTest {

    public interface PrimsMXBean {
        int getI();
        long getJ();
        boolean isZ();
        byte getB();
        short getS();
        char getC();
        float getF();
        double getD();
        Integer getInteger();
        Void getVoid();
        int[] getIs();
        long[] getJs();
        boolean[] getZs();
        byte[] getBs();
        short[] getSs();
        char[] getCs();
        float[] getFs();
        double[] getDs();
        Long[] getJobjects();
        int[][] getIss();
        void run();
    }

    public static class Prims implements PrimsMXBean {
        public int getI() { return 0; }
        public long getJ() { return 0; }
        public boolean isZ() { return false; }
        public byte getB() { return 0; }
        public short getS() { return 0; }
        public char getC() { return 0; }
        public float getF() { return 0; }
        public double getD() { return 0; }
        public Integer getInteger() { return null; }
        public Void getVoid() { return null; }
        public int[] getIs() { return null; }
        public long[] getJs() { return null; }
        public boolean[] getZs() { return null; }
        public byte[] getBs() { return null; }
        public short[] getSs() { return null; }
        public char[] getCs() { return null; }
        public float[] getFs() { return null; }
        public double[] getDs() { return null; }
        public Long[] getJobjects() { return null; }
        public int[][] getIss() { return null; }
        public void run() { }
    }

    public static void main(String[] args) throws Exception {
        MBeanServer mbs = ManagementFactory.getPlatformMBeanServer();
        primitives(mbs);
        if (failure != null)
            throw new AssertionError(failure);
        System.out.println("OK");
    }

    private static void primitives(MBeanServer mbs) throws Exception {
        ObjectName prims = new ObjectName("test:type=Prims");
        mbs.registerMBean(new Prims(), prims);
        MBeanInfo info = mbs.getMBeanInfo(prims);
        checkType(info, "I", "int", SimpleType.INTEGER);
        checkType(info, "J", "long", SimpleType.LONG);
        checkType(info, "Z", "boolean", SimpleType.BOOLEAN);
        checkType(info, "B", "byte", SimpleType.BYTE);
        checkType(info, "S", "short", SimpleType.SHORT);
        checkType(info, "C", "char", SimpleType.CHARACTER);
        checkType(info, "F", "float", SimpleType.FLOAT);
        checkType(info, "D", "double", SimpleType.DOUBLE);
        checkType(info, "Integer", "java.lang.Integer", SimpleType.INTEGER);
        checkType(info, "Void", "java.lang.Void", SimpleType.VOID);
        checkType(info, "Is", "[I", primitiveArray(int[].class));
        checkType(info, "Js", "[J", primitiveArray(long[].class));
        checkType(info, "Zs", "[Z", primitiveArray(boolean[].class));
        checkType(info, "Bs", "[B", primitiveArray(byte[].class));
        checkType(info, "Ss", "[S", primitiveArray(short[].class));
        checkType(info, "Cs", "[C", primitiveArray(char[].class));
        checkType(info, "Fs", "[F", primitiveArray(float[].class));
        checkType(info, "Ds", "[D", primitiveArray(double[].class));
        checkType(info, "Jobjects", "[Ljava.lang.Long;",
                  ArrayType.getArrayType(SimpleType.LONG));
        checkType(info, "Iss", "[[I", primitiveArray(int[][].class));
        MBeanOperationInfo run = operation(info, "run");
        check("void".equals(run.getReturnType()), "type of run " + run.getReturnType());
        check(SimpleType.VOID.equals(run.getDescriptor().getFieldValue("openType")),
              "open type of run " + run.getDescriptor());
    }

    private static ArrayType<?> primitiveArray(Class<?> c) {
        return ArrayType.getPrimitiveArrayType(c);
    }

    private static void checkType(MBeanInfo info, String name, String type,
                                  OpenType<?> openType) {
        MBeanAttributeInfo a = attribute(info, name);
        check(type.equals(a.getType()), name + " has type " + a.getType());
        check(openType.equals(a.getDescriptor().getFieldValue("openType")),
              name + " has open type " + a.getDescriptor().getFieldValue("openType"));
    }

    private static MBeanOperationInfo operation(MBeanInfo info, String name) {
        for (MBeanOperationInfo o : info.getOperations()) {
            if (o.getName().equals(name))
                return o;
        }
        throw new AssertionError("no operation " + name);
    }

    private static MBeanAttributeInfo attribute(MBeanInfo info, String name) {
        for (MBeanAttributeInfo a : info.getAttributes()) {
            if (a.getName().equals(name))
                return a;
        }
        throw new AssertionError("no attribute " + name);
    }

    private static String failure;

    private static void check(boolean condition, String what) {
        if (!condition)
            fail(what);
    }

    private static void fail(String what) {
        System.out.println("FAILED: " + what);
        if (failure == null)
            failure = what;
    }
}
