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

import java.lang.ref.SoftReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/*
 * @test
 * @summary Tests that a method held by a cleared reference is found again
 *          among the methods of its class, including the overloaded,
 *          generic and bridge ones
 * @modules java.desktop/java.beans:open
 * @run main ClearedMethodRefTest
 */
public class ClearedMethodRefTest {

    public interface Source<T> {
        T get();
    }

    public static class Text implements Source<String> {
        public String get() { return ""; }
        public void put(int value) { }
        public void put(long value) { }
        public void put(Object value) { }
        public void put(int[] value) { }
        public void put(String... values) { }
        public void put(List<String> values) { }
        public <N extends Number> N number(N value) { return value; }
        public void fail() throws java.io.IOException { }
        public static void util(java.util.Map<String, Integer> map) { }
    }

    public static void main(String[] args) throws Exception {
        Class<?> type = Class.forName("java.beans.MethodRef");
        Constructor<?> constructor = type.getDeclaredConstructor();
        constructor.setAccessible(true);
        Method set = type.getDeclaredMethod("set", Method.class);
        Method get = type.getDeclaredMethod("get");
        Field reference = type.getDeclaredField("methodRef");
        set.setAccessible(true);
        get.setAccessible(true);
        reference.setAccessible(true);

        List<Method> methods = new ArrayList<>();
        for (Method method : Text.class.getMethods()) {
            if (method.getDeclaringClass() == Text.class) {
                methods.add(method);
            }
        }
        // the bridge method for Source.get() is declared in Text as well
        if (methods.stream().filter(m -> m.getName().equals("get")).count() != 2) {
            throw new Error("bridge method is missing");
        }
        for (Method method : methods) {
            Object ref = constructor.newInstance();
            set.invoke(ref, method);
            if (get.invoke(ref) != method) {
                throw new Error("not the same method: " + method);
            }
            ((SoftReference<?>) reference.get(ref)).clear();
            Object found = get.invoke(ref);
            if (!method.equals(found)) {
                throw new Error("expected " + method + " but found " + found);
            }
        }
    }
}
