/*
 * Copyright (c) 2008, 2026, Oracle and/or its affiliates. All rights reserved.
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

/* @test
 * @bug 8366028
 * @summary unit tests for java.lang.invoke.MethodType
 * @compile MethodTypeTest.java
 * @run junit/othervm test.java.lang.invoke.MethodTypeTest
 */

package test.java.lang.invoke;

import java.lang.invoke.MethodType;
import java.lang.reflect.Method;

import java.util.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author jrose
 */
public class MethodTypeTest {

    private Class<?> rtype;
    private Class<?>[] ptypes;
    private MethodType mt_viS, mt_OO, mt_OO2, mt_vv, mt_Vv, mt_Ov;
    private MethodType mt_iSI, mt_ISi, mt_ISI, mt_iSi;
    private MethodType mt_viO, mt_iO2, mt_OOi, mt_iOi;
    private MethodType mt_VIO, mt_IO2, mt_OOI, mt_IOI, mt_VIS;
    private MethodType mt_vOiSzA, mt_OO99;
    private MethodType[] GALLERY;
    private Method compareTo;

    @BeforeEach
    public void setUp() throws Exception {
        rtype = void.class;
        ptypes = new Class<?>[] { int.class, String.class };

        mt_viS = MethodType.methodType(void.class, int.class, String.class);
        mt_OO = MethodType.methodType(Object.class, Object.class);
        mt_OO2 = MethodType.methodType(Object.class, Object.class, Object.class);
        mt_vv = MethodType.methodType(void.class);
        mt_Vv = MethodType.methodType(Void.class);
        mt_Ov = MethodType.methodType(Object.class);
        mt_iSI = MethodType.methodType(int.class, String.class, Integer.class);
        mt_ISi = MethodType.methodType(Integer.class, String.class, int.class);
        mt_ISI = MethodType.methodType(Integer.class, String.class, Integer.class);
        mt_iSi = MethodType.methodType(int.class, String.class, int.class);

        compareTo = String.class.getDeclaredMethod("compareTo", String.class);

        mt_viO = MethodType.methodType(void.class, int.class, Object.class);
        mt_iO2 = MethodType.methodType(int.class, Object.class, Object.class);
        mt_OOi = MethodType.methodType(Object.class, Object.class, int.class);
        mt_iOi = MethodType.methodType(int.class, Object.class, int.class);

        mt_VIO = MethodType.methodType(Void.class, Integer.class, Object.class);
        mt_IO2 = MethodType.methodType(Integer.class, Object.class, Object.class);
        mt_OOI = MethodType.methodType(Object.class, Object.class, Integer.class);
        mt_IOI = MethodType.methodType(Integer.class, Object.class, Integer.class);
        mt_VIS = MethodType.methodType(Void.class, Integer.class, String.class);

        mt_vOiSzA = MethodType.methodType(void.class, Object.class, int.class, String.class, boolean.class, Object[].class);
        mt_OO99 = MethodType.genericMethodType(99);

        GALLERY = new MethodType[] {
            mt_viS, mt_OO, mt_OO2, mt_vv, mt_Vv, mt_Ov,
            mt_iSI, mt_ISi, mt_ISI, mt_iSi,
            mt_viO, mt_iO2, mt_OOi, mt_iOi,
            mt_VIO, mt_IO2, mt_OOI, mt_IOI,
            mt_VIS, mt_vOiSzA, mt_OO99
        };
    }

    @AfterEach
    public void tearDown() throws Exception {
    }

    /** Make sure the method types are all distinct. */
    @Test
    public void testDistinct() {
        List<MethodType> gallery2 = new ArrayList<>();
        for (MethodType mt : GALLERY) {
            assertFalse(gallery2.contains(mt), mt.toString());
            gallery2.add(mt);
        }
        // check self-equality also:
        assertEquals(Arrays.asList(GALLERY), gallery2);
    }

    /**
     * Test of make method, of class MethodType.
     */
    @Test
    public void testMake_Class_ClassArr() {
        System.out.println("make (from type array)");
        MethodType result = MethodType.methodType(rtype, ptypes);
        assertSame(mt_viS, result);
    }

    /**
     * Test of make method, of class MethodType.
     */
    @Test
    public void testMake_Class_List() {
        System.out.println("make (from type list)");
        MethodType result = MethodType.methodType(rtype, Arrays.asList(ptypes));
        assertSame(mt_viS, result);
    }

    /**
     * Test of make method, of class MethodType.
     */
    @Test
    public void testMake_3args() {
        System.out.println("make (from type with varargs)");
        MethodType result = MethodType.methodType(rtype, ptypes[0], ptypes[1]);
        assertSame(mt_viS, result);
    }

    /**
     * Test of make method, of class MethodType.
     */
    @Test
    public void testMake_Class() {
        System.out.println("make (from single type)");
        Class<?> rt = Integer.class;
        MethodType expResult = MethodType.methodType(rt, new Class<?>[0]);
        MethodType result = MethodType.methodType(rt);
        assertSame(expResult, result);
    }

    @Test
    public void testMakeGeneric() {
        System.out.println("makeGeneric");
        int objectArgCount = 2;
        MethodType expResult = mt_OO2;
        MethodType result = MethodType.genericMethodType(objectArgCount);
        assertSame(expResult, result);
    }

    /**
     * Test of make method, of class MethodType.
     */
    @Test
    public void testMake_MethodType() {
        System.out.println("make (from rtype, MethodType)");
        MethodType expResult = mt_iO2;
        MethodType result = MethodType.methodType(int.class, mt_IO2);
        assertSame(expResult, result);
    }

    /**
     * Test of make method, of class MethodType.
     */
    @Test
    public void testMake_String_ClassLoader() {
        System.out.println("make (from bytecode signature)");
        ClassLoader loader = null;
        MethodType[] instances = {mt_viS, mt_OO2, mt_vv, mt_Ov, mt_iSI, mt_ISi, mt_ISI, mt_iSi};
        String obj = "Ljava/lang/Object;";
        assertEquals(obj, concat(Object.class));
        String[] expResults = {
            "(ILjava/lang/String;)V",
            concat("(", obj, 2, ")", Object.class),
            "()V", "()"+obj,
            concat("(", String.class, Integer.class, ")I"),
            concat("(", String.class, "I)", Integer.class),
            concat("(", String.class, Integer.class, ")", Integer.class),
            concat("(", String.class, "I)I")
        };
        for (int i = 0; i < instances.length; i++) {
            MethodType instance = instances[i];
            String result = instance.toMethodDescriptorString();
            assertEquals(expResults[i], result, "#"+i);
            MethodType parsed = MethodType.fromMethodDescriptorString(result, loader);
            assertSame(instance, parsed, "--#"+i);
        }
    }
    private static String concat(Object... parts) {
        StringBuilder sb = new StringBuilder();
        Object prevPart = "";
        for (Object part : parts) {
            if (part instanceof Class) {
                part = "L"+((Class)part).getName()+";";
            }
            if (part instanceof Integer) {
                for (int n = (Integer) part; n > 1; n--)
                    sb.append(prevPart);
                part = "";
            }
            sb.append(part);
            prevPart = part;
        }
        return sb.toString().replace('.', '/');
    }

    public static String[] badMethodDescriptorStrings() {
        return new String[] {
                "(I)",
                "(V)V",
                "([V)V",
                "(" + "[".repeat(256) + "J)I",
                "(java/lang/Object)V",
                "()java/lang/Object",
                "()Lbad.Name;",
                "()Lbad[Name;",
                "(L;)V",
                "(L/Missing;)I",
                "(Lmissing/;)Z",
        };
    }

    // JDK-8366028
    @ParameterizedTest
    @MethodSource("badMethodDescriptorStrings")
    public void testFromMethodDescriptorStringNegatives(String desc) {
        assertThrows(IllegalArgumentException.class, () -> {
            MethodType.fromMethodDescriptorString(desc, null);
        });
    }

    @Test
    public void testHasPrimitives() {
        System.out.println("hasPrimitives");
        MethodType[] instances = {mt_viS, mt_OO2, mt_vv, mt_Ov, mt_iSI, mt_ISi, mt_ISI, mt_iSi};
        boolean[] expResults =   {true,   false,  true,  false, true,   true,   false,  true};
        for (int i = 0; i < instances.length; i++) {
            boolean result = instances[i].hasPrimitives();
            assertEquals(expResults[i], result, "#"+i);
        }
    }

    @Test
    public void testHasWrappers() {
        System.out.println("hasWrappers");
        MethodType[] instances = {mt_viS, mt_OO2, mt_vv, mt_Ov, mt_iSI, mt_ISi, mt_ISI, mt_iSi};
        boolean[] expResults =   {false,  false,  false, false, true,   true,   true,   false};
        for (int i = 0; i < instances.length; i++) {
            System.out.println("  hasWrappers "+instances[i]);
            boolean result = instances[i].hasWrappers();
            assertEquals(expResults[i], result, "#"+i);
        }
    }

    @Test
    public void testErase() {
        System.out.println("erase");
        MethodType[] instances  = {mt_viS, mt_OO2, mt_vv, mt_Ov, mt_iSI, mt_ISi, mt_ISI, mt_iSi};
        MethodType[] expResults = {mt_viO, mt_OO2, mt_vv, mt_Ov, mt_iO2, mt_OOi, mt_OO2, mt_iOi};
        for (int i = 0; i < instances.length; i++) {
            MethodType result = instances[i].erase();
            assertSame(expResults[i], result, "#"+i);
        }
    }

    @Test
    public void testGeneric() {
        System.out.println("generic");
        MethodType[] instances =  {mt_viS, mt_OO2, mt_vv, mt_Ov, mt_iSI, mt_ISi, mt_ISI, mt_iSi};
        MethodType[] expResults = {mt_OO2, mt_OO2, mt_Ov, mt_Ov, mt_OO2, mt_OO2, mt_OO2, mt_OO2};
        for (int i = 0; i < instances.length; i++) {
            MethodType result = instances[i].generic();
            assertSame(expResults[i], result, "#"+i);
        }
    }

    @Test
    public void testWrap() {
        System.out.println("wrap");
        MethodType[] instances =  {mt_viS, mt_OO2, mt_vv, mt_Ov, mt_iSI, mt_ISi, mt_ISI, mt_iSi};
        MethodType[] expResults = {mt_VIS, mt_OO2, mt_Vv, mt_Ov, mt_ISI, mt_ISI, mt_ISI, mt_ISI};
        for (int i = 0; i < instances.length; i++) {
            MethodType result = instances[i].wrap();
            assertSame(expResults[i], result, "#"+i);
        }
    }

    @Test
    public void testUnwrap() {
        System.out.println("unwrap");
        MethodType[] instances =  {mt_viS, mt_OO2, mt_vv, mt_Ov, mt_iSI, mt_ISi, mt_ISI, mt_iSi};
        MethodType[] expResults = {mt_viS, mt_OO2, mt_vv, mt_Ov, mt_iSi, mt_iSi, mt_iSi, mt_iSi};
        for (int i = 0; i < instances.length; i++) {
            MethodType result = instances[i].unwrap();
            assertSame(expResults[i], result, "#"+i);
        }
    }

    /**
     * Test of parameterType method, of class MethodType.
     */
    @Test
    public void testParameterType() {
        System.out.println("parameterType");
        for (int num = 0; num < ptypes.length; num++) {
            MethodType instance = mt_viS;
            Class<?> expResult = ptypes[num];
            Class<?> result = instance.parameterType(num);
            assertSame(expResult, result);
        }
    }

    /**
     * Test of parameterCount method, of class MethodType.
     */
    @Test
    public void testParameterCount() {
        System.out.println("parameterCount");
        MethodType instance = mt_viS;
        int expResult = 2;
        int result = instance.parameterCount();
        assertEquals(expResult, result);
    }

    /**
     * Test of returnType method, of class MethodType.
     */
    @Test
    public void testReturnType() {
        System.out.println("returnType");
        MethodType instance = mt_viS;
        Class<?> expResult = void.class;
        Class<?> result = instance.returnType();
        assertSame(expResult, result);
    }

    /**
     * Test of parameterList method, of class MethodType.
     */
    @Test
    public void testParameterList() {
        System.out.println("parameterList");
        MethodType instance = mt_viS;
        List<Class<?>> expResult = Arrays.asList(ptypes);
        List<Class<?>> result = instance.parameterList();
        assertEquals(expResult, result);
    }

    /**
     * Test of parameterArray method, of class MethodType.
     */
    @Test
    public void testParameterArray() {
        System.out.println("parameterArray");
        MethodType instance = mt_viS;
        Class<?>[] expResult = ptypes;
        Class<?>[] result = instance.parameterArray();
        assertEquals(Arrays.asList(expResult), Arrays.asList(result));
    }

    /**
     * Test of equals method, of class MethodType.
     */
    @Test
    public void testEquals_Object() {
        System.out.println("equals");
        Object x = null;
        MethodType instance = mt_viS;
        boolean expResult = false;
        boolean result = instance.equals(x);
        assertEquals(expResult, result);
    }

    /**
     * Test of equals method, of class MethodType.
     */
    @Test
    public void testEquals_MethodType() {
        System.out.println("equals");
        MethodType that = mt_viS;
        MethodType instance = mt_viS;
        boolean expResult = true;
        boolean result = instance.equals(that);
        assertEquals(expResult, result);
    }

    /**
     * Test of hashCode method, of class MethodType.
     */
    @Test
    public void testHashCode() {
        System.out.println("hashCode");
        MethodType instance = mt_viS;
        ArrayList<Class<?>> types = new ArrayList<>();
        types.add(instance.returnType());
        types.addAll(instance.parameterList());
        int expResult = types.hashCode();
        int result = instance.hashCode();
        assertEquals(expResult, result);
    }

    /**
     * Test of toString method, of class MethodType.
     */
    @Test
    public void testToString() {
        System.out.println("toString");
        MethodType[] instances = {mt_viS, mt_OO2, mt_vv, mt_Ov, mt_iSI, mt_ISi, mt_ISI, mt_iSi};
        //String expResult = "void[int, class java.lang.String]";
        String[] expResults = {
            "(int,String)void",
            "(Object,Object)Object",
            "()void",
            "()Object",
            "(String,Integer)int",
            "(String,int)Integer",
            "(String,Integer)Integer",
            "(String,int)int"
        };
        for (int i = 0; i < instances.length; i++) {
            MethodType instance = instances[i];
            String result = instance.toString();
            System.out.println("#"+i+":"+result);
            assertEquals(expResults[i], result, "#"+i);
        }
    }

    private static byte[] writeSerial(Object x) throws java.io.IOException {
        try (java.io.ByteArrayOutputStream bout = new java.io.ByteArrayOutputStream();
             java.io.ObjectOutputStream out = new java.io.ObjectOutputStream(bout)
             ) {
            out.writeObject(x);
            out.flush();
            return bout.toByteArray();
        }
    }
    private static Object readSerial(byte[] wire) throws java.io.IOException, ClassNotFoundException {
        try (java.io.ByteArrayInputStream bin = new java.io.ByteArrayInputStream(wire);
             java.io.ObjectInputStream in = new java.io.ObjectInputStream(bin)) {
            return in.readObject();
        }
    }
    private static void testSerializedEquality(Object x) throws java.io.IOException, ClassNotFoundException {
        if (x instanceof Object[])
            x = Arrays.asList((Object[]) x);  // has proper equals method
        byte[] wire = writeSerial(x);
        Object y = readSerial(wire);
        assertEquals(x, y);
    }

    /** Test (de-)serialization. */
    @Test
    public void testSerialization() throws Throwable {
        System.out.println("serialization");
        for (MethodType mt : GALLERY) {
            testSerializedEquality(mt);
        }
        testSerializedEquality(GALLERY);

        // Make a list of mixed objects:
        List<Object> stuff = new ArrayList<>();
        Collections.addAll(stuff, GALLERY);  // copy #1
        Object[] triples = Arrays.copyOfRange(GALLERY, 0, GALLERY.length/2);
        Collections.addAll(stuff, triples);  // copy #3 (partial)
        for (MethodType mt : GALLERY) {
            Collections.addAll(stuff, mt.parameterArray());
        }
        Collections.shuffle(stuff, new Random(292));
        Collections.addAll(stuff, GALLERY);  // copy #2
        testSerializedEquality(stuff);
    }

}
