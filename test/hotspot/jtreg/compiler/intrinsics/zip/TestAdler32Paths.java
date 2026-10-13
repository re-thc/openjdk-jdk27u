/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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

/**
 * @test
 * @summary Verify Adler32 intrinsics with scalar, heap and direct input
 * @modules jdk.management
 * @run main/othervm -Xint compiler.intrinsics.zip.TestAdler32Paths
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch compiler.intrinsics.zip.TestAdler32Paths
 * @run main/othervm -XX:-TieredCompilation -Xbatch compiler.intrinsics.zip.TestAdler32Paths
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:-UseAdler32Intrinsics -Xcheck:jni compiler.intrinsics.zip.TestAdler32Paths
 */

/**
 * @test id=limited-avx
 * @summary Verify default Adler32 acceleration without the AVX2 HotSpot stub
 * @requires os.family == "linux" & os.simpleArch == "x64"
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires vm.opt.UseAdler32Intrinsics == null | vm.opt.UseAdler32Intrinsics == true
 * @modules jdk.management
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:UseAVX=0 compiler.intrinsics.zip.TestAdler32Paths enabled
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:UseAVX=0 compiler.intrinsics.zip.TestAdler32Paths enabled
 * @run main/othervm -XX:-TieredCompilation -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:UseAVX=0 compiler.intrinsics.zip.TestAdler32Paths enabled
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:UseAVX=1 compiler.intrinsics.zip.TestAdler32Paths enabled
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:UseAVX=1 compiler.intrinsics.zip.TestAdler32Paths enabled
 * @run main/othervm -XX:-TieredCompilation -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:UseAVX=1 compiler.intrinsics.zip.TestAdler32Paths enabled
 */

package compiler.intrinsics.zip;

import com.sun.management.HotSpotDiagnosticMXBean;
import java.lang.management.ManagementFactory;
import java.nio.ByteBuffer;
import java.util.Random;
import java.util.zip.Adler32;

public class TestAdler32Paths {
    private static long reference(byte[] data, int off, int len) {
        long a = 1, b = 0;
        for (int i = off; i < off + len; i++) {
            a = (a + (data[i] & 0xff)) % 65521;
            b = (b + a) % 65521;
        }
        return (b << 16) | a;
    }

    private static void check(Adler32 adler, long expected) {
        if (adler.getValue() != expected) {
            throw new AssertionError(adler.getValue() + " != " + expected);
        }
    }

    public static void main(String[] args) {
        if (args.length != 0 && !Boolean.parseBoolean(ManagementFactory
                .getPlatformMXBean(HotSpotDiagnosticMXBean.class)
                .getVMOption("UseAdler32Intrinsics").getValue())) {
            throw new AssertionError("Adler32 intrinsics were disabled without AVX2");
        }
        byte[] data = new byte[131072 + 31];
        new Random(17).nextBytes(data);
        ByteBuffer direct = ByteBuffer.allocateDirect(data.length);
        direct.put(data).flip();
        int[] sizes = {0, 1, 15, 16, 31, 32, 63, 64, 255, 256, 1023, 1024,
                       1025, 4096, 5551, 5552, 5553, 16384, 32768,
                       65535, 65536, 65537, 131072};
        Adler32 adler = new Adler32();
        for (int off : new int[]{0, 1, 7, 31}) {
            for (int len : sizes) {
                long expected = reference(data, off, len);
                // Exercise compiled callers as well as the interpreter entries.
                for (int repeat = 0; repeat < 10000; repeat++) {
                    adler.reset();
                    adler.update(data, off, len);
                    check(adler, expected);
                    direct.limit(off + len).position(off);
                    adler.reset();
                    adler.update(direct);
                    check(adler, expected);
                    if (direct.position() != direct.limit()) {
                        throw new AssertionError("Buffer position was not advanced");
                    }
                    adler.reset();
                    int split = len / 2;
                    adler.update(data, off, split);
                    adler.update(data, off + split, len - split);
                    check(adler, expected);
                }
                adler.reset();
                for (int i = off; i < off + len; i++) {
                    adler.update(data[i]);
                }
                check(adler, expected);
            }
        }
        for (int b = -1024; b <= 1024; b++) {
            adler.reset();
            adler.update(b);
            check(adler, reference(new byte[]{(byte)b}, 0, 1));
        }
    }
}
