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
 * @summary AArch64 C1 mismatch leaves require constant scale and a bounded constant length
 * @requires os.arch == "aarch64" & vm.compiler1.enabled
 * @requires vm.opt.final.UseVectorizedMismatchIntrinsic == true
 * @library /test/lib
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.c1.TestBoundedVectorizedMismatch
 */

package compiler.c1;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;
import jdk.internal.misc.Unsafe;
import jdk.internal.util.ArraysSupport;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class TestBoundedVectorizedMismatch {
    private static final long A_OFFSET = Unsafe.ARRAY_BYTE_BASE_OFFSET + 1;
    private static final long B_OFFSET = Unsafe.ARRAY_BYTE_BASE_OFFSET + 3;
    private static final int LIMIT = 65536;
    private static final String MARKER = "@@compile ";

    interface Scan {
        int mismatch(byte[] a, byte[] b);
    }

    record Case(String method, boolean intrinsic, int length, int scale, Scan scan) {}

    private static List<Case> cases() {
        return List.of(
                new Case("testZero", true, 0, 0, TestBoundedVectorizedMismatch::testZero),
                new Case("testWord", true, 8, 0, TestBoundedVectorizedMismatch::testWord),
                new Case("testMinimum", true, 128, 0, TestBoundedVectorizedMismatch::testMinimum),
                new Case("testBytes", true, LIMIT, 0, TestBoundedVectorizedMismatch::testBytes),
                new Case("testChars", true, LIMIT >> 1, 1, TestBoundedVectorizedMismatch::testChars),
                new Case("testInts", true, LIMIT >> 2, 2, TestBoundedVectorizedMismatch::testInts),
                new Case("testLongs", true, LIMIT >> 3, 3, TestBoundedVectorizedMismatch::testLongs),
                new Case("testBytesAbove", false, LIMIT + 1, 0, TestBoundedVectorizedMismatch::testBytesAbove),
                new Case("testCharsAbove", false, (LIMIT >> 1) + 1, 1, TestBoundedVectorizedMismatch::testCharsAbove),
                new Case("testIntsAbove", false, (LIMIT >> 2) + 1, 2, TestBoundedVectorizedMismatch::testIntsAbove),
                new Case("testLongsAbove", false, (LIMIT >> 3) + 1, 3, TestBoundedVectorizedMismatch::testLongsAbove),
                new Case("testUnknownLength", false, LIMIT + 1, 0,
                         (a, b) -> testUnknownLength(a, b, LIMIT + 1)),
                new Case("testUnknownScale", false, 16, 3, (a, b) -> testUnknownScale(a, b, 3)),
                // Invalid inputs are compiled to check admission, without executing accesses.
                new Case("testNegative", false, 0, 0, null),
                new Case("testNegativeScale", false, 0, 0, null),
                new Case("testLargeScale", false, 0, 0, null),
                new Case("testOverflow", false, 0, 0, null));
    }

    public static int testZero(byte[] a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, 0, 0);
    }

    public static int testWord(byte[] a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, 8, 0);
    }

    public static int testMinimum(byte[] a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, 128, 0);
    }

    public static int testBytes(byte[] a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, LIMIT, 0);
    }

    public static int testChars(byte[] a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, LIMIT >> 1, 1);
    }

    public static int testInts(byte[] a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, LIMIT >> 2, 2);
    }

    public static int testLongs(byte[] a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, LIMIT >> 3, 3);
    }

    public static int testBytesAbove(byte[] a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, LIMIT + 1, 0);
    }

    public static int testCharsAbove(byte[] a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, (LIMIT >> 1) + 1, 1);
    }

    public static int testIntsAbove(byte[] a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, (LIMIT >> 2) + 1, 2);
    }

    public static int testLongsAbove(byte[] a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, (LIMIT >> 3) + 1, 3);
    }

    public static int testUnknownLength(byte[] a, byte[] b, int length) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, length, 0);
    }

    public static int testUnknownScale(byte[] a, byte[] b, int scale) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, 16, scale);
    }

    public static int testNegative(byte[] a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, -1, 0);
    }

    public static int testNegativeScale(byte[] a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, 0, -1);
    }

    public static int testLargeScale(byte[] a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, 0, 4);
    }

    public static int testOverflow(byte[] a, byte[] b) {
        return ArraysSupport.vectorizedMismatch(a, A_OFFSET, b, B_OFFSET, Integer.MAX_VALUE, 3);
    }

    private static void check(Scan scan, int length, int scale) {
        int bytes = length << scale;
        byte[] a = new byte[bytes + 8];
        byte[] b = new byte[bytes + 8];
        checkResult(scan.mismatch(a, b), a, b, length, scale, -1);
        for (int position : new int[] {0, 1, 7, 8, 63, 64, bytes - 1}) {
            if (position >= 0 && position < bytes) {
                b[3 + position] = 1;
                checkResult(scan.mismatch(a, b), a, b, length, scale, position >> scale);
                b[3 + position] = 0;
            }
        }
    }

    private static void checkResult(int result, byte[] a, byte[] b, int length, int scale, int expected) {
        if (result < 0) {
            int tail = ~result;
            if (tail < 0 || tail > (7 >> scale) || tail > length) {
                throw new AssertionError("Invalid tail: " + tail);
            }
            result = -1;
            for (int position = (length - tail) << scale; position < (length << scale); position++) {
                if (a[1 + position] != b[3 + position]) {
                    result = position >> scale;
                    break;
                }
            }
        }
        if (result != expected) {
            throw new AssertionError("length=" + length + ", scale=" + scale + ": " + result + " != " + expected);
        }
    }

    private static void child() throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        testWord(new byte[16], new byte[16]);
        for (Case c : cases()) {
            Method method = Arrays.stream(TestBoundedVectorizedMismatch.class.getDeclaredMethods())
                    .filter(m -> m.getName().equals(c.method())).findFirst().orElseThrow();
            System.out.println(MARKER + c.method());
            System.out.flush();
            if (!wb.enqueueMethodForCompilation(method, 1) || wb.getMethodCompilationLevel(method) != 1) {
                throw new AssertionError(c.method() + " was not compiled at C1 level 1");
            }
            if (c.scan() != null) {
                check(c.scan(), c.length(), c.scale());
            }
        }
        for (int scale = 0; scale <= 3; scale++) {
            final int s = scale;
            check((a, b) -> testUnknownScale(a, b, s), 16, scale);
        }
        System.out.println(MARKER + "end");
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            child();
            return;
        }
        String test = TestBoundedVectorizedMismatch.class.getName();
        OutputAnalyzer output = ProcessTools.executeProcess(ProcessTools.createLimitedTestJavaProcessBuilder(
                "-Xbootclasspath/a:.", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                "--add-exports=java.base/jdk.internal.util=ALL-UNNAMED",
                "-XX:+TieredCompilation", "-XX:TieredStopAtLevel=1", "-XX:-BackgroundCompilation",
                "-XX:+PrintInlining", "-XX:CompileCommand=quiet",
                "-XX:CompileCommand=compileonly," + test + "::test*", test, "child"));
        output.shouldHaveExitValue(0);
        String stdout = output.getStdout().replace("\r\n", "\n");
        List<Case> cases = cases();
        Pattern intrinsic = Pattern.compile("ArraysSupport::vectorizedMismatch[^\\r\\n]*\\bintrinsic\\b");
        for (int i = 0; i < cases.size(); i++) {
            Case c = cases.get(i);
            int start = stdout.indexOf(MARKER + c.method() + "\n");
            String next = MARKER + (i + 1 < cases.size() ? cases.get(i + 1).method() : "end") + "\n";
            int end = stdout.indexOf(next, start);
            if (start < 0 || end < 0 || intrinsic.matcher(stdout.substring(start, end)).find() != c.intrinsic()) {
                System.out.println(stdout);
                throw new AssertionError(c.method() + ": expected intrinsic=" + c.intrinsic());
            }
        }
    }
}
