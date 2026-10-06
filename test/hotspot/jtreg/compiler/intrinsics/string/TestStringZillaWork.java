/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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
 * @summary Force bounded chunk helpers through C1/C2, including overlapping windows
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires (os.arch == "amd64" | os.arch == "x86_64" | os.arch == "aarch64")
 * @library /test/lib
 * @modules java.base/java.lang:open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI TestStringZillaWork
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:DisableIntrinsic=_stringzillaEqualsRange,_stringzillaFindLatin1,_stringzillaFindUTF16,_stringzillaRfindLatin1,_stringzillaRfindUTF16,_stringzillaFindUTF16Latin1,_stringzillaRfindUTF16Latin1,_stringzillaFindCharLatin1,_stringzillaFindCharUTF16,_stringzillaRfindCharLatin1,_stringzillaRfindCharUTF16 TestStringZillaWork
 */

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import jdk.test.whitebox.WhiteBox;

public class TestStringZillaWork {
    private static final int MAX = 65536;
    private static Method search, character, equality;
    private static final MethodHandle privateEquals;
    private static final MethodHandle checkedEquals;
    static {
        try {
            Class<?> latin = Class.forName("java.lang.StringLatin1");
            privateEquals = MethodHandles.privateLookupIn(latin, MethodHandles.lookup())
                    .findStatic(latin, "equals0", MethodType.methodType(boolean.class, byte[].class, byte[].class));
            checkedEquals = MethodHandles.privateLookupIn(latin, MethodHandles.lookup())
                    .findStatic(latin, "equals", MethodType.methodType(boolean.class, byte[].class, byte[].class));
        } catch (ReflectiveOperationException failure) {
            throw new ExceptionInInitializerError(failure);
        }
    }

    public static int probePrivate(byte[] left, byte[] right, int cookie) throws Throwable {
        return (boolean)privateEquals.invokeExact(left, right) ? cookie : -cookie;
    }

    public static int probeChecked(byte[] left, byte[] right, int cookie) throws Throwable {
        return (boolean)checkedEquals.invokeExact(left, right) ? cookie : -cookie;
    }

    private static void equal(int actual, int expected) {
        if (actual != expected) throw new AssertionError(actual + " != " + expected);
    }

    private static byte[] utf16(char... chars) {
        ByteBuffer buffer = ByteBuffer.allocate(chars.length * 2).order(ByteOrder.nativeOrder());
        for (char c : chars) buffer.putChar(c);
        return buffer.array();
    }

    private static void check() throws Exception {
        for (int encoding = 0; encoding < 3; encoding++) {
            byte[] source = new byte[MAX * 2 + 34];
            if (encoding == 0) Arrays.fill(source, (byte)'a');
            else {
                ByteBuffer view = ByteBuffer.wrap(source).order(ByteOrder.nativeOrder());
                for (int i = 0; i < source.length; i += 2) view.putChar(i, (char)0x400);
            }
            byte[] target = encoding == 1 ? utf16((char)0x410, (char)0x400, (char)0x400, (char)0x411)
                                         : new byte[]{'b', 'a', 'a', 'c'};
            byte[] inSource = encoding == 2 ? utf16('b', 'a', 'a', 'c') : target;
            int offset = encoding == 0 ? 17 : 34;
            for (int position : new int[]{offset + MAX - 2, offset + MAX, source.length - inSource.length}) {
                System.arraycopy(inSource, 0, source, position, inSource.length);
                for (boolean reverse : new boolean[]{false, true}) {
                    int result = (Integer)search.invoke(null, source, offset, source.length - offset,
                                                       target, target.length, encoding, reverse);
                    equal(result, position - offset);
                }
                Arrays.fill(source, position, position + inSource.length, (byte)0);
            }
        }
        // Code-point pairs cross a chunk boundary and keep a nonzero base offset.
        byte[] source = new byte[MAX * 2 + 34];
        int offset = 34, position = offset + MAX - 2;
        System.arraycopy(utf16((char)0xd83d, (char)0xde42), 0, source, position, 4);
        for (boolean reverse : new boolean[]{false, true}) {
            equal((Integer)character.invoke(null, source, offset, source.length - offset,
                                            0x1f642, true, reverse), position - offset);
        }
        byte[] left = new byte[MAX * 2 + 17];
        Arrays.fill(left, (byte)7);
        byte[] right = left.clone();
        if (!(Boolean)equality.invoke(null, left, right)) throw new AssertionError("Chunk equality");
        for (int position2 : new int[]{MAX - 1, MAX, MAX * 2, right.length - 1}) {
            right[position2]++;
            if ((Boolean)equality.invoke(null, left, right)) throw new AssertionError("Chunk mismatch");
            right[position2]--;
        }
        // Long needles use Java rather than repeating almost-complete windows.
        equal((Integer)search.invoke(null, new byte[8192], 0, 8192, new byte[2048], 2048, 0, false), -2);
        equal((Integer)search.invoke(null, new byte[8192], 0, 8192, new byte[65], 65, 2, true), -2);
    }

    public static void main(String[] args) throws Throwable {
        Class<?> bridge = Class.forName("java.lang.StringZilla");
        search = bridge.getDeclaredMethod("searchLarge", byte[].class, int.class, int.class,
                                          byte[].class, int.class, int.class, boolean.class);
        character = bridge.getDeclaredMethod("searchCharLarge", byte[].class, int.class, int.class,
                                             int.class, boolean.class, boolean.class);
        equality = bridge.getDeclaredMethod("equalsLarge", byte[].class, byte[].class);
        Method[] methods = {search, character, equality};
        for (Method method : methods) method.setAccessible(true);
        check();
        WhiteBox wb = WhiteBox.getWhiteBox();
        for (int level : new int[]{1, 4}) {
            for (Method method : methods) {
                wb.deoptimizeMethod(method);
                if (!wb.enqueueMethodForCompilation(method, level) || !wb.isMethodCompiled(method) ||
                    wb.getMethodCompilationLevel(method) != level) {
                    throw new AssertionError("Chunk helper did not compile at " + level + ": " + method);
                }
            }
            check();
        }
        byte[] small = new byte[16];
        for (int i = 0; i < 5000; i++) {
            equal(probePrivate(small, small.clone(), 123), 123);
            equal(probeChecked(small, small.clone(), 123), 123);
        }
        for (String name : new String[]{"probePrivate", "probeChecked"}) {
            Method probe = TestStringZillaWork.class.getMethod(name, byte[].class, byte[].class, int.class);
            for (boolean same : new boolean[]{true, false}) {
                wb.deoptimizeMethod(probe);
                if (!wb.enqueueMethodForCompilation(probe, 1) || !wb.isMethodCompiled(probe) ||
                    wb.getMethodCompilationLevel(probe) != 1) throw new AssertionError("Private caller not in C1");
                byte[] left = new byte[MAX + 1], right = left.clone();
                if (!same) right[MAX] = 1;
                equal(name.equals("probePrivate") ? probePrivate(left, right, 123)
                                                 : probeChecked(left, right, 123), same ? 123 : -123);
            }
        }
    }
}
