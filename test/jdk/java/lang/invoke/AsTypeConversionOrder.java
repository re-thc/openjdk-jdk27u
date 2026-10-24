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
 * @summary The LambdaForm of an adapter made by MethodHandle.asType depends on the
 *          shape of the conversions, not on the classes that are cast to
 * @modules java.base/java.lang.invoke:open
 * @run main AsTypeConversionOrder
 */

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

public class AsTypeConversionOrder {

    public static class A { }
    public static class B { }
    public static class C { }
    public static class D { }
    public static class E { }
    public static class F { }
    public static class G { }
    public static class H { }

    // Each group has the same conversion shape with different target classes.
    // Its adapters must share a LambdaForm regardless of class identity hashes.
    public static void s1(A a, B b, C c) { }
    public static void s2(D a, E b, F c) { }
    public static void s3(G a, H b, A c) { }
    public static void s4(B a, D b, G c) { }
    public static void s5(C a, F b, H c) { }
    public static void s6(E a, G b, B c) { }

    public static String t1(int i, A a, long l, B b, C c) { return null; }
    public static String t2(int i, D a, long l, E b, F c) { return null; }
    public static String t3(int i, G a, long l, H b, A c) { return null; }
    public static String t4(int i, B a, long l, D b, G c) { return null; }
    public static String t5(int i, C a, long l, F b, H c) { return null; }

    // a class that is cast to at two positions is converted by one LambdaForm edit
    public static int r1(A a, A b, B c, B d) { return 0; }
    public static int r2(C a, C b, D c, D d) { return 0; }
    public static int r3(E a, E b, F c, F d) { return 0; }
    public static int r4(G a, G b, H c, H d) { return 0; }

    // the same with the receiver
    public void v1(A a, B b, C c) { }
    public void v2(D a, E b, F c) { }
    public void v3(G a, H b, A c) { }
    public void v4(B a, D b, G c) { }

    public static void main(String[] args) throws Throwable {
        Field form = MethodHandle.class.getDeclaredField("form");
        form.setAccessible(true);
        for (String prefix : new String[] { "s", "t", "r", "v" }) {
            List<MethodHandle> adapters = new ArrayList<>();
            for (Method m : AsTypeConversionOrder.class.getDeclaredMethods()) {
                String name = m.getName();
                if (name.length() == 2 && name.startsWith(prefix) && Character.isDigit(name.charAt(1))) {
                    MethodHandle mh = MethodHandles.lookup().unreflect(m);
                    adapters.add(mh.asType(MethodType.genericMethodType(mh.type().parameterCount())));
                }
            }
            if (adapters.size() < 4) {
                throw new AssertionError("Missing methods for " + prefix);
            }
            Object expected = form.get(adapters.get(0));
            for (MethodHandle adapter : adapters) {
                if (form.get(adapter) != expected) {
                    throw new AssertionError("Group " + prefix + ": the adapters do not share their LambdaForm");
                }
            }
        }
    }
}
