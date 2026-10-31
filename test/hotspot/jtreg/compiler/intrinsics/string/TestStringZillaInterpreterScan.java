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
 * @summary Interpreted Latin1 scans execute their intrinsic and retain JNI fallback
 * @requires vm.flavor != "zero"
 * @requires (os.arch == "amd64" | os.arch == "x86_64" | os.arch == "aarch64")
 * @modules java.base/java.lang:open
 * @run main/native/othervm -Xint TestStringZillaInterpreterScan true
 * @run main/native/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_stringzillaScanLatin1 TestStringZillaInterpreterScan false
 * @run main/native/othervm -Xint -XX:-UseStringZillaIntrinsics TestStringZillaInterpreterScan false
 */

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TestStringZillaInterpreterScan {
    private static final int FALLBACK = -2;
    private record Scan(byte[] bytes, int offset, int length, int mode, int expected) {}

    private static native int installFallback(Class<?> bridge);

    private static int reference(byte[] bytes, int offset, int length, int mode) {
        if (length > 65536) return FALLBACK;
        boolean reverse = mode == 2 || mode == 4;
        for (int i = reverse ? length - 1 : 0; i >= 0 && i < length; i += reverse ? -1 : 1) {
            char ch = (char)(bytes[offset + i] & 0xff);
            boolean hit = mode == 0 ? ch == '\r' || ch == '\n'
                    : mode <= 2 ? ch > 0x20 : !Character.isWhitespace(ch);
            if (hit) return i;
        }
        return -1;
    }

    private static void add(List<Scan> scans, int length, boolean blank, int tail) {
        int offset = 5;
        byte[] bytes = new byte[length + 16];
        Arrays.fill(bytes, (byte)'x');
        Arrays.fill(bytes, offset, offset + length, (byte)' ');
        if (!blank) {
            if (length > 1) bytes[offset + 1] = 0;
            if (length > 3) {
                bytes[offset + 2] = '\r';
                bytes[offset + 3] = '\n';
            }
            if (length > 8) bytes[offset + length / 2] = 'x';
            if (length > 0) bytes[offset + length - 1] = (byte)tail;
        }
        for (int mode = 0; mode < 5; mode++) {
            scans.add(new Scan(bytes, offset, length, mode, reference(bytes, offset, length, mode)));
        }
    }

    public static void main(String[] args) throws Exception {
        boolean enabled = Boolean.parseBoolean(args[0]);
        List<Scan> scans = new ArrayList<>();
        for (int length : new int[]{0, 1, 7, 8, 31, 32, 255, 256, 65535, 65536, 65537}) {
            add(scans, length, false, 0xa0);
        }
        add(scans, 65536, true, ' ');
        // trim skips NUL, while Character whitespace treats it as nonwhite.
        add(scans, 256, false, 0);
        Class<?> bridge = Class.forName("java.lang.StringZilla");
        Method scan = bridge.getDeclaredMethod("scanLatin1", byte[].class, int.class, int.class, int.class);
        scan.setAccessible(true);
        System.loadLibrary("TestStringZillaInterpreterScan");
        if (installFallback(bridge) != 0) throw new AssertionError("RegisterNatives failed");

        // JNI returns FALLBACK without inspecting the input. A real scan result
        // therefore proves execution of the interpreter intrinsic, not merely
        // its registration. A pending safepoint may legitimately use JNI.
        int[] executed = new int[scans.size()];
        for (int repeat = 0; repeat < 16; repeat++) {
            for (int i = 0; i < scans.size(); i++) {
                Scan test = scans.get(i);
                int actual = (Integer)scan.invoke(null, test.bytes, test.offset, test.length, test.mode);
                if (actual == FALLBACK) continue;
                if (!enabled || actual != test.expected) {
                    throw new AssertionError("mode=" + test.mode + ", length=" + test.length
                            + ": " + actual + " != " + test.expected);
                }
                executed[i]++;
            }
        }
        int[] modes = new int[5];
        for (int i = 0; i < scans.size(); i++) {
            Scan test = scans.get(i);
            if (enabled && test.length > 0 && test.expected != FALLBACK && executed[i] == 0) {
                throw new AssertionError("Interpreter scan intrinsic did not execute, mode="
                        + test.mode + ", length=" + test.length);
            }
            modes[test.mode] += executed[i];
        }
        System.out.println("Interpreter scan results by mode: " + Arrays.toString(modes));
    }
}
