/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 */

/*
 * @test
 * @summary Small first CharsetEncoder calls defer registration; bulk initializes and warm small work uses the native leaf
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.gc.Serial
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @library /test/lib
 * @modules java.base/sun.nio.cs:+open java.base/java.lang:+open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:+UseG1GC -Xint compiler.intrinsics.tmfy.TestCharsetEncoderColdAdmission 0 true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:+UseG1GC -Xbatch -XX:TieredStopAtLevel=1 compiler.intrinsics.tmfy.TestCharsetEncoderColdAdmission 1 true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:+UseG1GC -Xbatch -XX:-TieredCompilation compiler.intrinsics.tmfy.TestCharsetEncoderColdAdmission 4 true
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:+UseG1GC -XX:-UseTmfyStringCoding -Xint compiler.intrinsics.tmfy.TestCharsetEncoderColdAdmission 0 false
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:+UseSerialGC -Xint compiler.intrinsics.tmfy.TestCharsetEncoderColdAdmission 0 false
 */
package compiler.intrinsics.tmfy;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;
import jdk.test.whitebox.WhiteBox;

public class TestCharsetEncoderColdAdmission {
    public static void main(String[] args) throws Exception {
        int level = Integer.parseInt(args[0]);
        boolean nativeRoute = Boolean.parseBoolean(args[1]);
        CharsetEncoder encoder = StandardCharsets.UTF_8.newEncoder();
        Class<?> holder = encoder.getClass();
        Field ready = holder.getDeclaredField("utf8Ready");
        ready.setAccessible(true);
        check(!ready.getBoolean(null), "readiness before public work");

        Method origin = holder.getDeclaredMethod("encodeArrayLoopSlow", CharBuffer.class,
                char[].class, int.class, int.class, ByteBuffer.class, byte[].class,
                int.class, int.class);
        WhiteBox wb = WhiteBox.getWhiteBox();
        wb.testSetDontInlineMethod(origin, true);
        if (level != 0) {
            check(wb.enqueueMethodForCompilation(origin, level), "origin compilation");
            check(wb.getMethodCompilationLevel(origin) == level, "origin tier");
        }

        for (int units : new int[] {32, 127, 128, 1023}) {
            encode(encoder, units);
            check(!ready.getBoolean(null), "small work initialized at " + units);
        }
        encode(encoder, 1024);
        check(ready.getBoolean(null) == nativeRoute, "bulk readiness");

        // Diagnostics stay outside the cold readiness observations. Reading
        // these counters registers the separate String holder, not Encoder.
        long[] before = StringCodingAccess.counters0();
        encode(encoder, 128);
        long[] after = StringCodingAccess.counters0();
        check(after[3] - before[3] == (nativeRoute ? 1 : 0), "warm small leaf route");
        check(after[4] == before[4], "unexpected JNI route");
        check(ready.getBoolean(null) == nativeRoute, "warm readiness");
        System.out.println("CHARSET_ENCODER_COLD_ADMISSION_OK level=" + level
                + " native=" + nativeRoute);
    }

    private static void encode(CharsetEncoder encoder, int units) {
        char[] input = new char[units];
        Arrays.fill(input, '\u4e2d');
        CharBuffer source = CharBuffer.wrap(input);
        ByteBuffer destination = ByteBuffer.allocate(3 * units);
        encoder.reset();
        check(encoder.encode(source, destination, true) == CoderResult.UNDERFLOW,
                "encode result");
        check(source.position() == units && destination.position() == 3 * units,
                "encode positions");
        for (int i = 0; i < units; i++) {
            check(destination.get(3 * i) == (byte) 0xe4
                    && destination.get(3 * i + 1) == (byte) 0xb8
                    && destination.get(3 * i + 2) == (byte) 0xad, "encode bytes");
        }
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
