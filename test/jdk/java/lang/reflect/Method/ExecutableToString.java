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
 * @summary Check the strings of methods and constructors, including the
 *          message of the exception thrown when they can't be made accessible
 * @run main ExecutableToString
 */

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InaccessibleObjectException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

public class ExecutableToString {

    public ExecutableToString() { }

    protected <K, V extends Comparable<? super V>> ExecutableToString(Map<K, V> map, int... n)
            throws IOException, IllegalStateException { }

    static <T extends Number & Comparable<T> & java.io.Serializable, U, X extends Exception>
    T pick(List<? extends T> list, U u, T[][] rest) throws X, IOException { return null; }

    public final synchronized void plain(int a, String[] b, long[][] c) { }

    interface Bounded<T extends Runnable & AutoCloseable> {
        void run(T t) throws Exception;
    }

    private static int failures;

    private static void check(String expected, String actual) {
        if (!expected.equals(actual)) {
            failures++;
            System.err.println("expected: " + expected);
            System.err.println("  actual: " + actual);
        }
    }

    public static void main(String[] args) throws Exception {
        Class<?> c = ExecutableToString.class;

        Constructor<?> noArgs = c.getConstructor();
        check("public ExecutableToString()", noArgs.toString());
        check("public ExecutableToString()", noArgs.toGenericString());

        Constructor<?> generic = c.getDeclaredConstructor(Map.class, int[].class);
        check("protected ExecutableToString(java.util.Map,int[])"
                + " throws java.io.IOException,java.lang.IllegalStateException",
                generic.toString());
        check("protected <K,V extends java.lang.Comparable<? super V>> ExecutableToString"
                + "(java.util.Map<K, V>,int...)"
                + " throws java.io.IOException,java.lang.IllegalStateException",
                generic.toGenericString());

        Method pick = c.getDeclaredMethod("pick", List.class, Object.class, Number[][].class);
        check("static java.lang.Number ExecutableToString.pick(java.util.List,java.lang.Object,"
                + "java.lang.Number[][]) throws java.lang.Exception,java.io.IOException",
                pick.toString());
        check("static <T extends java.lang.Number & java.lang.Comparable<T>"
                + " & java.io.Serializable,U,X extends java.lang.Exception> T"
                + " ExecutableToString.pick(java.util.List<? extends T>,U,T[][]) throws X,java.io.IOException",
                pick.toGenericString());

        Method plain = c.getDeclaredMethod("plain", int.class, String[].class, long[][].class);
        check("public final synchronized void ExecutableToString.plain(int,java.lang.String[],long[][])",
              plain.toString());
        check("public final synchronized void ExecutableToString.plain(int,java.lang.String[],long[][])",
              plain.toGenericString());

        Method run = Bounded.class.getDeclaredMethod("run", Runnable.class);
        check("public abstract void ExecutableToString$Bounded.run(java.lang.Runnable)"
                + " throws java.lang.Exception",
                run.toString());
        check("public abstract void ExecutableToString$Bounded.run(T) throws java.lang.Exception",
              run.toGenericString());

        Method wait = Object.class.getMethod("wait", long.class);
        check("public final void java.lang.Object.wait(long) throws java.lang.InterruptedException",
              wait.toString());

        Method clone = Object.class.getDeclaredMethod("clone");
        String msg = denied(clone);
        check("Unable to make protected native java.lang.Object java.lang.Object.clone()"
                + " throws java.lang.CloneNotSupportedException accessible: "
                + "module java.base does not \"opens java.lang\" to " + c.getModule(),
                msg);

        Constructor<?> ctor = Thread.class.getDeclaredConstructor(ThreadGroup.class, String.class,
                                                                  int.class, Runnable.class, long.class);
        check("Unable to make java.lang.Thread(java.lang.ThreadGroup,java.lang.String,int,"
                + "java.lang.Runnable,long) accessible: "
                + "module java.base does not \"opens java.lang\" to " + c.getModule(),
                denied(ctor));

        if (failures > 0) {
            throw new RuntimeException(failures + " failures");
        }
    }

    private static String denied(java.lang.reflect.AccessibleObject ao) {
        try {
            ao.setAccessible(true);
        } catch (InaccessibleObjectException e) {
            return e.getMessage();
        }
        throw new RuntimeException("setAccessible succeeded: " + ao);
    }
}
