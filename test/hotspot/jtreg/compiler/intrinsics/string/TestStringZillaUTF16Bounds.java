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
 * @summary Reverse search checks physical source bounds before intrinsic reads
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires (os.arch == "amd64" | os.arch == "x86_64" | os.arch == "aarch64")
 * @library /test/lib
 * @modules java.base/java.lang:open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -Xint -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI TestStringZillaUTF16Bounds 0
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:TieredStopAtLevel=1 -XX:CompileCommand=dontinline,TestStringZillaUTF16Bounds::probe* TestStringZillaUTF16Bounds 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:-TieredCompilation -XX:CompileCommand=dontinline,TestStringZillaUTF16Bounds::probe* TestStringZillaUTF16Bounds 4
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:TieredStopAtLevel=1 -XX:-UseStringZillaIntrinsics -XX:CompileCommand=dontinline,TestStringZillaUTF16Bounds::probe* TestStringZillaUTF16Bounds 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:-TieredCompilation -XX:-UseStringZillaIntrinsics -XX:CompileCommand=dontinline,TestStringZillaUTF16Bounds::probe* TestStringZillaUTF16Bounds 4
 */

/*
 * @test id=serial
 * @summary Physical bounds precede serial reverse-search probes
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @modules java.base/java.lang:open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:UseAVX=0 -XX:TieredStopAtLevel=1 -XX:CompileCommand=dontinline,TestStringZillaUTF16Bounds::probe* TestStringZillaUTF16Bounds 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:UseAVX=0 -XX:-TieredCompilation -XX:CompileCommand=dontinline,TestStringZillaUTF16Bounds::probe* TestStringZillaUTF16Bounds 4
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
    private static final MethodHandle SCAN;
    private static final MethodHandle INITIALIZE;

    static {
        try {
            LAST_INDEX_OF = MethodHandles.privateLookupIn(String.class, MethodHandles.lookup())
                    .findStatic(String.class, "lastIndexOf",
                            MethodType.methodType(int.class, byte[].class, byte.class,
                                    int.class, String.class, int.class));
            Class<?> stringZilla = Class.forName("java.lang.StringZilla");
            SCAN = MethodHandles.privateLookupIn(stringZilla, MethodHandles.lookup())
                    .findStatic(stringZilla, "scan", MethodType.methodType(int.class,
                            byte[].class, int.class, int.class, int.class));
            INITIALIZE = MethodHandles.privateLookupIn(stringZilla, MethodHandles.lookup())
                    .findStatic(stringZilla, "initialize", MethodType.methodType(int.class));
        } catch (ReflectiveOperationException failure) {
            throw new ExceptionInInitializerError(failure);
        }
    }

    record Case(byte[] value, int logicalCount, String needle, int from) {}

    public static int probe(byte[] value, int count, String needle, int from) throws Throwable {
        return (int)LAST_INDEX_OF.invokeExact(value, (byte)1, count, needle, from);
    }

    public static int probeLatin1(byte[] value, int count, String needle, int from) throws Throwable {
        return (int)LAST_INDEX_OF.invokeExact(value, (byte)0, count, needle, from);
    }

    public static int probeScan(byte[] value, int from, int to, int mode) throws Throwable {
        return (int)SCAN.invokeExact(value, from, to, mode);
    }

    private static int scanOracle(byte[] value, int from, int to, int mode) {
        boolean reverse = mode == 2 || mode == 4;
        for (int i = reverse ? to - 1 : from; reverse ? i >= from : i < to; i += reverse ? -1 : 1) {
            int ch = value[i] & 0xff;
            boolean match = mode == 0 ? ch == '\r' || ch == '\n'
                    : mode <= 2 ? ch > 0x20 : !Character.isWhitespace((char)ch);
            if (match) return i + (reverse ? 1 : 0);
        }
        return reverse ? from : to;
    }

    private static void checkScan() throws Throwable {
        // Repeated initialization must preserve compiled scan targets.
        int firstConfiguration = (int)INITIALIZE.invokeExact();
        if ((int)INITIALIZE.invokeExact() != firstConfiguration) {
            throw new AssertionError("Kernel selection changed");
        }
        byte[] value = new byte[65537 + 8];
        for (int i = 0; i < value.length; i++) value[i] = (byte)i;
        for (int[] range : new int[][]{{0, 0}, {value.length, value.length}, {0, 1}, {1, 257},
                                      {0, 65536}, {0, 65537}, {7, 65544}}) {
            for (int mode = 0; mode <= 4; mode++) {
                if (probeScan(value, range[0], range[1], mode)
                        != scanOracle(value, range[0], range[1], mode)) {
                    throw new AssertionError("Scan result at " + Arrays.toString(range) + " mode=" + mode);
                }
            }
        }
        if (probeScan(new byte[0], 0, 0, 0) != 0 || probeScan(value, 0, 1, 5) != -2) {
            throw new AssertionError("Empty scan or unsupported mode");
        }
        for (int[] range : new int[][]{{-1, 1}, {0, value.length + 1}, {1, 0},
                                      {Integer.MAX_VALUE, Integer.MAX_VALUE}, {0, Integer.MAX_VALUE}}) {
            try {
                probeScan(value, range[0], range[1], 0);
                throw new AssertionError("Missing scan physical bounds check");
            } catch (IndexOutOfBoundsException expected) { }
        }
        // Every byte value in every lane, including high bits and both search
        // directions. The oracle uses Character's public whitespace predicate.
        byte[] word = new byte[16];
        for (int mode = 0; mode <= 4; mode++) {
            for (int symbol = 0; symbol < 256; symbol++) {
                for (int position = 0; position < 8; position++) {
                    Arrays.fill(word, (byte)(mode == 0 ? 'x' : ' '));
                    word[4 + position] = (byte)symbol;
                    if (probeScan(word, 4, 12, mode) != scanOracle(word, 4, 12, mode)) {
                        throw new AssertionError("Byte-set word probe mode=" + mode
                                + " value=" + symbol + " lane=" + position);
                    }
                }
            }
        }
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

    private static void checkLatin1(Case test) throws Throwable {
        byte[] stale = Arrays.copyOf(test.value, test.value.length - 1);
        try {
            probeLatin1(stale, test.logicalCount, test.needle, test.from);
            throw new AssertionError("Missing Latin-1 physical bounds check");
        } catch (IndexOutOfBoundsException expected) {
        }
    }

    public static void main(String[] args) throws Throwable {
        int level = Integer.parseInt(args[0]);
        List<Case> cases = new ArrayList<>();
        List<Case> latin1 = new ArrayList<>();
        for (int length : new int[]{4, 15, 16, 17, 31}) {
            cases.add(fixture(length, 4, false));
        }
        for (int count : new int[]{4, 9, 16, 32, 64, 65, 129}) {
            cases.add(fixture(count, count, false));
            cases.add(fixture(Math.max(16, count + 8), count, false));
            cases.add(fixture(256, count, false));
            cases.add(fixture(count, count, true));
            cases.add(fixture(Math.max(16, count + 8), count, true));
            cases.add(fixture(256, count, true));
        }
        for (int count : new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
                                   17, 32, 64, 129, 257}) {
            for (int length : new int[]{count, Math.max(256, count + 8), 4096}) {
                byte[] value = new byte[length];
                Arrays.fill(value, (byte)'a');
                latin1.add(new Case(value, length, "a".repeat(count), length - count));
            }
        }
        byte[] blank = new byte[65537];
        byte[] near = new byte[16];
        Arrays.fill(blank, (byte)' ');
        for (int i = 0; i < (level == 0 ? cases.size() : 10_000); i++) {
            Case test = cases.get(i % cases.size());
            if (probe(test.value, test.logicalCount, test.needle, test.from) != test.from) {
                throw new AssertionError("Valid UTF-16 fixture");
            }
            Case latin = latin1.get(i % latin1.size());
            if (probeLatin1(latin.value, latin.logicalCount, latin.needle, latin.from) != latin.from) {
                throw new AssertionError("Valid Latin-1 fixture");
            }
            int end = (i & 1) == 0 ? 33 : blank.length;
            int mode = i % 5;
            if (probeScan(blank, 0, end, mode) != (mode == 2 || mode == 4 ? 0 : end)) {
                throw new AssertionError("Valid empty-result scan");
            }
            Arrays.fill(near, (byte)(mode == 0 ? 'x' : ' '));
            near[4 + (i & 7)] = (byte)i;
            if (probeScan(near, 4, 12, mode) != scanOracle(near, 4, 12, mode)) {
                throw new AssertionError("Valid near-result scan");
            }
        }
        if (level != 0) {
            WhiteBox wb = WhiteBox.getWhiteBox();
            Class<?> utf16 = Class.forName("java.lang.StringUTF16");
            Method[] methods = {
                TestStringZillaUTF16Bounds.class.getMethod("probe",
                        byte[].class, int.class, String.class, int.class),
                TestStringZillaUTF16Bounds.class.getMethod("probeLatin1",
                        byte[].class, int.class, String.class, int.class),
                TestStringZillaUTF16Bounds.class.getMethod("probeScan",
                        byte[].class, int.class, int.class, int.class),
                Class.forName("java.lang.StringLatin1").getDeclaredMethod("lastIndexOf",
                        byte[].class, int.class, byte[].class, int.class, int.class),
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
        for (Case test : latin1) checkLatin1(test);
        checkScan();
    }
}
