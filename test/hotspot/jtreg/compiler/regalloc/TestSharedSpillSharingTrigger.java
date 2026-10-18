/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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
 */

import java.util.Random;

// Ordinary definitions remain live across the call. The computed index has
// several register-only comparison/address users in the high-pressure region.
// This supplies eligible sibling reloads without admitting Phi or tied origins.
public class TestSharedSpillSharingTrigger {
    static volatile long sink;

    static void barrier() {
        sink++;
    }

    static long kernel(long[] values, int[] a, int[] b, int[] c, int[] d) {
        long p0 = values[0];
        long p1 = values[1];
        long p2 = values[2];
        long p3 = values[3];
        long p4 = values[4];
        long p5 = values[5];
        long p6 = values[6];
        long p7 = values[7];
        long p8 = values[8];
        long p9 = values[9];
        long p10 = values[10];
        long p11 = values[11];
        long p12 = values[12];
        long p13 = values[13];
        long p14 = values[14];
        long p15 = values[15];
        long p16 = values[16];
        long p17 = values[17];
        long p18 = values[18];
        long p19 = values[19];
        long p20 = values[20];
        long p21 = values[21];
        long p22 = values[22];
        long p23 = values[23];
        int index = (int) (p0 ^ p1 ^ p2 ^ p3 ^ p4 ^ p5 ^ p6 ^ p7 ^ p8 ^ p9 ^ p10 ^ p11 ^ p12 ^ p13 ^ p14 ^ p15 ^ p16 ^ p17 ^ p18 ^ p19 ^ p20 ^ p21 ^ p22 ^ p23) & 1023;
        barrier();
        long result = (long) a[index] + b[index] + c[index] + d[index];
        result += Long.rotateLeft(p0, 1);
        result += Long.rotateLeft(p1, 2);
        result += Long.rotateLeft(p2, 3);
        result += Long.rotateLeft(p3, 4);
        result += Long.rotateLeft(p4, 5);
        result += Long.rotateLeft(p5, 6);
        result += Long.rotateLeft(p6, 7);
        result += Long.rotateLeft(p7, 8);
        result += Long.rotateLeft(p8, 9);
        result += Long.rotateLeft(p9, 10);
        result += Long.rotateLeft(p10, 11);
        result += Long.rotateLeft(p11, 12);
        result += Long.rotateLeft(p12, 13);
        result += Long.rotateLeft(p13, 14);
        result += Long.rotateLeft(p14, 15);
        result += Long.rotateLeft(p15, 16);
        result += Long.rotateLeft(p16, 17);
        result += Long.rotateLeft(p17, 18);
        result += Long.rotateLeft(p18, 19);
        result += Long.rotateLeft(p19, 20);
        result += Long.rotateLeft(p20, 21);
        result += Long.rotateLeft(p21, 22);
        result += Long.rotateLeft(p22, 23);
        result += Long.rotateLeft(p23, 24);
        return result;
    }

    static long reference(long[] values, int[] a, int[] b, int[] c, int[] d) {
        long bits = 0;
        for (long value : values) bits ^= value;
        int index = (int) bits & 1023;
        long result = (long) a[index] + b[index] + c[index] + d[index];
        for (int i = 0; i < values.length; i++) {
            result += (values[i] << (i + 1)) | (values[i] >>> (63 - i));
        }
        return result;
    }

    public static void main(String[] args) {
        Random random = new Random(812341);
        long[] values = new long[24];
        int[] a = new int[1024], b = new int[1024], c = new int[1024], d = new int[1024];
        for (int i = 0; i < a.length; i++) {
            a[i] = random.nextInt();
            b[i] = random.nextInt();
            c[i] = random.nextInt();
            d[i] = random.nextInt();
        }
        for (int i = 0; i < 12000; i++) {
            if (i % 100 == 0) {
                for (int j = 0; j < values.length; j++) values[j] = random.nextLong();
            }
            long actual = kernel(values, a, b, c, d);
            long expected = reference(values, a, b, c, d);
            if (actual != expected) throw new AssertionError("result at " + i);
        }
        if (sink != 12000) throw new AssertionError("call side effects: " + sink);
        System.out.println("trigger oracle checks=12000");
    }
}
