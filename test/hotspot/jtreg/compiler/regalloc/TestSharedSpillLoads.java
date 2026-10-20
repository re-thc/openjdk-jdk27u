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
 */

/*
 * @test
 * @summary Equal primitive spill reloads must preserve loop values, aliases,
 *          exception ordering, cold calls, and tied two-address uses.
 * @requires vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @run main/othervm -Xbatch -XX:-OmitStackTraceInFastThrow -XX:CompileCommand=dontinline,TestSharedSpillLoads::kernel* -XX:CompileCommand=dontinline,TestSharedSpillLoads::cold -XX:CompileCommand=exclude,TestSharedSpillLoads::reference TestSharedSpillLoads
 * @run main/othervm -Xbatch -XX:-OmitStackTraceInFastThrow -XX:-UseBMI2Instructions -XX:CompileCommand=dontinline,TestSharedSpillLoads::kernel* -XX:CompileCommand=dontinline,TestSharedSpillLoads::cold -XX:CompileCommand=exclude,TestSharedSpillLoads::reference TestSharedSpillLoads
 * @run main/othervm -Xbatch -XX:-OmitStackTraceInFastThrow -XX:-UseFPUForSpilling -XX:CompileCommand=dontinline,TestSharedSpillLoads::kernel* -XX:CompileCommand=dontinline,TestSharedSpillLoads::cold -XX:CompileCommand=exclude,TestSharedSpillLoads::reference TestSharedSpillLoads
 */
import java.util.Arrays;
import java.util.Random;

public class TestSharedSpillLoads {
    static volatile long sink;

    static int cold(byte[] data, int n) {
        int v = 0;
        for (int i = 0; i < data.length; i++) {
            v = Integer.rotateLeft(v, 5) ^ data[i] ^ (n + i);
        }
        return v;
    }

    static long kernel2(long[] table, long[] seeds, byte[] data, long[] out, int n) {
        int mask = table.length - 1;
        long checksum = 0;
        long a0 = seeds[0];
        long a1 = seeds[1];
        for (int i = 0; i < n; i++) {
            long p = table[(int) a0 & mask];
            long q = table[(int) a1 & mask];
            long r = table[(int) (a0 + a1) & mask];
            if ((i & 511) == 0) checksum += cold(data, i);
            long mix = (p & 65535) + ((q >>> 16) & 65535) + ((r >>> 32) & 65535);
            out[i] = mix ^ (p >>> 48) ^ (q >>> 48) ^ (r >>> 48);
            a0 = Long.rotateLeft(a0 + p + mix, 1);
            a1 = Long.rotateLeft(a1 + q + mix, 2);
        }
        return checksum + a0 + a1;
    }

    static long kernel4(long[] table, long[] seeds, byte[] data, long[] out, int n) {
        int mask = table.length - 1;
        long checksum = 0;
        long a0 = seeds[0];
        long a1 = seeds[1];
        long a2 = seeds[2];
        long a3 = seeds[3];
        for (int i = 0; i < n; i++) {
            long p = table[(int) a0 & mask];
            long q = table[(int) a1 & mask];
            long r = table[(int) (a0 + a1) & mask];
            if ((i & 511) == 0) checksum += cold(data, i);
            long mix = (p & 65535) + ((q >>> 16) & 65535) + ((r >>> 32) & 65535);
            out[i] = mix ^ (p >>> 48) ^ (q >>> 48) ^ (r >>> 48);
            a0 = Long.rotateLeft(a0 + p + mix, 1);
            a1 = Long.rotateLeft(a1 + q + mix, 2);
            a2 = Long.rotateLeft(a2 + r + mix, 3);
            a3 = Long.rotateLeft(a3 + p + mix, 4);
        }
        return checksum + a0 + a1 + a2 + a3;
    }

    static long kernel6(long[] table, long[] seeds, byte[] data, long[] out, int n) {
        int mask = table.length - 1;
        long checksum = 0;
        long a0 = seeds[0];
        long a1 = seeds[1];
        long a2 = seeds[2];
        long a3 = seeds[3];
        long a4 = seeds[4];
        long a5 = seeds[5];
        for (int i = 0; i < n; i++) {
            long p = table[(int) a0 & mask];
            long q = table[(int) a1 & mask];
            long r = table[(int) (a0 + a1) & mask];
            if ((i & 511) == 0) checksum += cold(data, i);
            long mix = (p & 65535) + ((q >>> 16) & 65535) + ((r >>> 32) & 65535);
            out[i] = mix ^ (p >>> 48) ^ (q >>> 48) ^ (r >>> 48);
            a0 = Long.rotateLeft(a0 + p + mix, 1);
            a1 = Long.rotateLeft(a1 + q + mix, 2);
            a2 = Long.rotateLeft(a2 + r + mix, 3);
            a3 = Long.rotateLeft(a3 + p + mix, 4);
            a4 = Long.rotateLeft(a4 + q + mix, 5);
            a5 = Long.rotateLeft(a5 + r + mix, 6);
        }
        return checksum + a0 + a1 + a2 + a3 + a4 + a5;
    }

    static long kernel8(long[] table, long[] seeds, byte[] data, long[] out, int n) {
        int mask = table.length - 1;
        long checksum = 0;
        long a0 = seeds[0];
        long a1 = seeds[1];
        long a2 = seeds[2];
        long a3 = seeds[3];
        long a4 = seeds[4];
        long a5 = seeds[5];
        long a6 = seeds[6];
        long a7 = seeds[7];
        for (int i = 0; i < n; i++) {
            long p = table[(int) a0 & mask];
            long q = table[(int) a1 & mask];
            long r = table[(int) (a0 + a1) & mask];
            if ((i & 511) == 0) checksum += cold(data, i);
            long mix = (p & 65535) + ((q >>> 16) & 65535) + ((r >>> 32) & 65535);
            out[i] = mix ^ (p >>> 48) ^ (q >>> 48) ^ (r >>> 48);
            a0 = Long.rotateLeft(a0 + p + mix, 1);
            a1 = Long.rotateLeft(a1 + q + mix, 2);
            a2 = Long.rotateLeft(a2 + r + mix, 3);
            a3 = Long.rotateLeft(a3 + p + mix, 4);
            a4 = Long.rotateLeft(a4 + q + mix, 5);
            a5 = Long.rotateLeft(a5 + r + mix, 6);
            a6 = Long.rotateLeft(a6 + p + mix, 7);
            a7 = Long.rotateLeft(a7 + q + mix, 8);
        }
        return checksum + a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7;
    }

    static long reference(int k, long[] table, long[] seeds, byte[] data, long[] out, int n) {
        long[] a = seeds.clone();
        long sum = 0;
        for (int i = 0; i < n; i++) {
            long p = table[(int) a[0] & (table.length - 1)];
            long q = table[(int) a[1] & (table.length - 1)];
            long r = table[(int) (a[0] + a[1]) & (table.length - 1)];
            if ((i & 511) == 0) sum += cold(data, i);
            long mix = (p & 65535) + ((q >>> 16) & 65535) + ((r >>> 32) & 65535);
            out[i] = mix ^ (p >>> 48) ^ (q >>> 48) ^ (r >>> 48);
            for (int j = 0; j < k; j++) {
                long value = a[j] + (j % 3 == 0 ? p : j % 3 == 1 ? q : r) + mix;
                a[j] = (value << (j + 1)) | (value >>> (63 - j));
            }
        }
        for (int j = 0; j < k; j++) sum += a[j];
        return sum;
    }

    static long run(int k, long[] t, long[] s, byte[] d, long[] o, int n) {
        return switch (k) {
            case 2 -> kernel2(t, s, d, o, n);
            case 4 -> kernel4(t, s, d, o, n);
            case 6 -> kernel6(t, s, d, o, n);
            case 8 -> kernel8(t, s, d, o, n);
            default -> throw new AssertionError();
        };
    }

    static void warmAndCheck(String[] args) {
        Random r = new Random(987654321);
        long[] t = new long[256], s = new long[8], o = new long[512];
        byte[] d = new byte[7];
        r.nextBytes(d);
        for (int i = 0; i < t.length; i++) t[i] = r.nextLong();
        for (int i = 0; i < s.length; i++) s[i] = r.nextLong();
        for (int i = 0; i < 12000; i++) {
            for (int k : new int[] {2, 4, 6, 8}) sink = run(k, t, s, d, o, 512);
        }
        int checks = 0;
        for (int length : new int[] {1, 3, 16, 255, 256}) {
            t = new long[length];
            for (int j = 0; j < length; j++) t[j] = r.nextLong();
            for (int n : new int[] {0, 1, 2, 7, 511, 512}) {
                for (int k : new int[] {2, 4, 6, 8}) {
                    long[] a = new long[n], b = new long[n];
                    long x = run(k, t, s, d, a, n), y = reference(k, t, s, d, b, n);
                    if (x != y || !Arrays.equals(a, b)) throw new AssertionError(length + ":" + n + ":" + k);
                    checks++;
                }
            }
        }
        System.out.println("generated accumulator oracle checks=" + checks + " sink=" + sink);
    }

    static String failure(int kind, long[] table, long[] seeds, byte[] bytes,
                          long[] output, int count, boolean oracle) {
        try {
            if (oracle) reference(kind, table, seeds, bytes, output, count);
            else run(kind, table, seeds, bytes, output, count);
            return "no exception";
        } catch (ArrayIndexOutOfBoundsException e) {
            return e.getClass().getName() + ":" + e.getMessage();
        }
    }

    public static void main(String[] args) {
        warmAndCheck(args);
        Random random = new Random(0x436f70795370696cL);
        long[] seeds = new long[8];
        for (int i = 0; i < seeds.length; i++) seeds[i] = random.nextLong();
        byte[] bytes = new byte[7];
        random.nextBytes(bytes);
        int aliases = 0, boundaries = 0;
        for (int kind : new int[] {2, 4, 6, 8}) {
            for (int length : new int[] {1, 3, 16, 255, 256}) {
                long[] initial = new long[length];
                for (int i = 0; i < length; i++) initial[i] = random.nextLong();
                for (int count : new int[] {0, 1, length / 2, length}) {
                    long[] actual = initial.clone(), wanted = initial.clone();
                    long a = run(kind, actual, seeds, bytes, actual, count);
                    long b = reference(kind, wanted, seeds, bytes, wanted, count);
                    if (a != b || !Arrays.equals(actual, wanted)) {
                        throw new AssertionError("alias " + kind + ":" + length + ":" + count);
                    }
                    aliases++;
                }
                for (int count : new int[] {1, 7, 513}) {
                    int capacity = count - 1;
                    long[] actual = new long[capacity], wanted = new long[capacity];
                    Arrays.fill(actual, 0x5a5a5a5a5a5a5a5aL);
                    Arrays.fill(wanted, 0x5a5a5a5a5a5a5a5aL);
                    String a = failure(kind, initial, seeds, bytes, actual, count, false);
                    String b = failure(kind, initial, seeds, bytes, wanted, count, true);
                    if (a.equals("no exception") || !a.equals(b) || !Arrays.equals(actual, wanted)) {
                        throw new AssertionError("bounds " + kind + ":" + length + ":" + count + " " + a + " / " + b);
                    }
                    boundaries++;
                }
            }
        }
        System.out.println("alias checks=" + aliases + " boundary-and-complete-output checks=" + boundaries);
    }
}
