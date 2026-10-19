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


/*
 * @test
 * @summary Check GC, deoptimization, aliases and exceptional output in an activated C2 compilation.
 * @requires vm.debug == true & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @requires vm.cpu.features ~= ".*bmi2.*"
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver TestSharedSpillSharingState
 */
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class TestSharedSpillSharingState {
    public static void main(String[] args) throws Exception {
        check("-XX:-UseFPUForSpilling");
        check("-XX:+UseFPUForSpilling");
    }

    static void check(String spilling) throws Exception {
        OutputAnalyzer output = ProcessTools.executeTestJava(
            "-Xbootclasspath/a:.", "-Xbatch", "-Xshare:off",
            "-XX:-UseOnStackReplacement", "-XX:+UnlockDiagnosticVMOptions",
            "-XX:+WhiteBoxAPI", "-XX:+UseSerialGC", "-Xms128m", "-Xmx128m",
            "-XX:+VerifyRegisterAllocator", "-XX:+VerifyOops",
            "-XX:+VerifyBeforeGC", "-XX:+VerifyAfterGC",
            "-XX:-OmitStackTraceInFastThrow", "-XX:+UseBMI2Instructions",
            spilling,
            "-XX:CompileCommand=compileonly,TestSharedSpillSharingState$Worker::kernel",
            "-XX:CompileCommand=dontinline,TestSharedSpillSharingState$Worker::barrier",
            "-XX:CompileCommand=TraceSpilling,TestSharedSpillSharingState$Worker::kernel",
            "TestSharedSpillSharingState$Worker");
        output.shouldHaveExitValue(0)
              .shouldContain("activated state checks: gc=3 deopt=2 aliases=40 exceptions=16");
        Set<Integer> activated = new HashSet<>();
        Matcher summaries = Pattern.compile("(?m)^SHARED_RELOAD_SUMMARY compile_id=([0-9]+) +"
                + Pattern.quote("TestSharedSpillSharingState$Worker::kernel")
                + ".* accepted=[1-9][0-9]* work=[0-9]+ nodes=[0-9]+ ranges=[0-9]+ exhausted=0$")
                .matcher(output.getStdout());
        while (summaries.find()) activated.add(Integer.parseInt(summaries.group(1)));
        Matcher exercised = Pattern.compile("(?m)^EXERCISE compile_id=([0-9]+) case=(.+)$")
                .matcher(output.getStdout());
        int checks = 0;
        while (exercised.find()) {
            int id = Integer.parseInt(exercised.group(1));
            if (!activated.contains(id)) {
                throw new AssertionError("No positive unexhausted rewrite in exercised C2 compilation "
                        + id + " for " + exercised.group(2));
            }
            checks++;
        }
        if (checks != 60) throw new AssertionError("Missing exercised compilations: " + checks);
        System.out.println("Activation-backed C2 state checks=" + checks + " " + spilling
                + " compilation IDs=" + activated);
    }

    public static class Worker {
        static final WhiteBox WB = WhiteBox.getWhiteBox();
        static final Method KERNEL;
        static volatile int mode, gcCalls, deoptCalls;
        static volatile long sink;
        static volatile Object garbage;
        static Object[] watched;
        static int moved;
        static {
            try {
                KERNEL = Worker.class.getDeclaredMethod("kernel", long[].class,
                        int[].class, int[].class, int[].class, int[].class, int[].class, Box[].class);
            } catch (ReflectiveOperationException e) {
                throw new ExceptionInInitializerError(e);
            }
        }
        static final class Box {
            final long bits;
            final byte[] payload = new byte[257];
            Box(long value) { bits = value; payload[13] = (byte) value; }
            void check() {
                if (payload[13] != (byte) bits) throw new AssertionError("damaged root payload");
            }
        }
        static void barrier(int stage) {
            // Moving GC precedes the shared uses in mode 1. Both deoptimization
            // modes collect after those uses, preserving their computed result.
            if (mode != 0 && stage == (mode == 1 ? 0 : 1)) {
                long[] before = Arrays.stream(watched).mapToLong(WB::getObjectAddress).toArray();
                WB.fullGC();
                gcCalls++;
                for (int i = 0; i < watched.length; i++) {
                    if (before[i] != WB.getObjectAddress(watched[i])) moved++;
                }
                if (mode == 2) {
                    WB.deoptimizeMethod(KERNEL);
                    deoptCalls++;
                } else if (mode == 3) {
                    WB.deoptimizeFrames(true);
                    deoptCalls++;
                }
            }
        }

        // Integer index copies are eligible after the call. Long values and object
        // roots must survive that call's moving GC and active deoptimization.
        static long kernel(long[] values, int[] a, int[] b, int[] c, int[] d,
                           int[] output, Box[] roots) {
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
            barrier(0);
            long result = a[index];
            output[index] = (int) result ^ 0x5a5a5a5a;
            result += (long) b[index] + c[index] + d[index];
            barrier(1);
            result ^= output[index];
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
            return result ^ roots[0].bits ^ roots[1].bits ^ roots[2].bits;
        }

        static long reference(long[] values, int[] a, int[] b, int[] c, int[] d,
                              int[] output, Box[] roots) {
            long bits = 0;
            for (long value : values) bits ^= value;
            int index = (int) bits & 1023;
            long result = a[index];
            output[index] = (int) result ^ 0x5a5a5a5a;
            result += (long) b[index] + c[index] + d[index];
            result ^= output[index];
            for (int i = 0; i < values.length; i++) {
                result += (values[i] << (i + 1)) | (values[i] >>> (63 - i));
            }
            return result ^ roots[0].bits ^ roots[1].bits ^ roots[2].bits;
        }

        static void compile(String label) {
            if (!WB.isMethodCompiled(KERNEL)) {
                if (!WB.enqueueMethodForCompilation(KERNEL, 4)) {
                    throw new AssertionError("C2 compilation not enqueued");
                }
            }
            Object[] code = WB.getNMethod(KERNEL, false);
            if (code == null || (Integer) code[1] != 4) throw new AssertionError("Missing C2 kernel");
            System.out.println("EXERCISE compile_id=" + code[3] + " case=" + label);
        }

        static long[] values(Random random, int index) {
            long[] values = new long[24];
            long bits = 0;
            for (int i = 0; i < 23; i++) bits ^= values[i] = random.nextLong();
            values[23] = bits ^ index;
            return values;
        }

        static int[][] arrays(Random random) {
            int[][] arrays = new int[5][1024];
            for (int[] array : arrays) {
                for (int i = 0; i < array.length; i++) array[i] = random.nextInt();
            }
            return arrays;
        }

        static int[][] copy(int[][] arrays) {
            int[][] result = new int[arrays.length][];
            for (int i = 0; i < arrays.length; i++) {
                if (arrays[i] == null) continue;
                for (int j = 0; j < i; j++) {
                    if (arrays[i] == arrays[j]) result[i] = result[j];
                }
                if (result[i] == null) result[i] = arrays[i].clone();
            }
            return result;
        }

        static void checkArrays(int[][] a, int[][] b) {
            if (!Arrays.deepEquals(a, b)) throw new AssertionError("complete output/alias mismatch");
        }

        static long invoke(long[] values, int[][] arrays, Box[] roots, boolean oracle) {
            return oracle ? reference(values, arrays[0], arrays[1], arrays[2], arrays[3], arrays[4], roots)
                          : kernel(values, arrays[0], arrays[1], arrays[2], arrays[3], arrays[4], roots);
        }

        static String failure(long[] values, int[][] arrays, Box[] roots, boolean oracle) {
            try {
                invoke(values, arrays, roots, oracle);
                return "no exception";
            } catch (ArrayIndexOutOfBoundsException e) {
                return e.getClass().getName() + ":" + e.getMessage();
            } catch (NullPointerException e) {
                return e.getClass().getName();
            }
        }

        public static void main(String[] args) {
            Random random = new Random(0x5348415245445354L);
            Box[] roots = {new Box(random.nextLong()), new Box(random.nextLong()), new Box(random.nextLong())};
            int[][] arrays = arrays(random);
            long[] values = values(random, 13);
            for (int i = 0; i < 12000; i++) sink = invoke(values, arrays, roots, false);
            for (int action = 0; action < 4; action++) {
                mode = 0;
                garbage = new byte[2 * 1024 * 1024];
                roots = new Box[] {new Box(random.nextLong()), new Box(random.nextLong()), new Box(random.nextLong())};
                arrays = arrays(random);
                values = values(random, 13 + action);
                watched = new Object[] {roots, values, arrays[0], arrays[1], arrays[2], arrays[3],
                                       arrays[4], roots[0], roots[1], roots[2], roots[0].payload};
                garbage = null;
                int[][] wanted = copy(arrays);
                long expected = invoke(values, wanted, roots, true);
                compile("gc-" + action);
                mode = action;
                long actual = invoke(values, arrays, roots, false);
                mode = 0;
                if (actual != expected) throw new AssertionError("GC/deopt result " + action);
                checkArrays(arrays, wanted);
                for (Box root : roots) root.check();
                if (action >= 2 && WB.isMethodCompiled(KERNEL)) {
                    throw new AssertionError("Kernel was not actively deoptimized");
                }
            }
            if (gcCalls != 3 || deoptCalls != 2 || moved == 0) {
                throw new AssertionError("GC/deopt/movement counts " + gcCalls + "/" + deoptCalls + "/" + moved);
            }
            for (int trial = 0; trial < 8; trial++) {
                values = values(random, trial == 0 ? 0 : trial == 7 ? 1023 : random.nextInt(1024));
                for (int alias = 0; alias < 5; alias++) {
                    arrays = arrays(random);
                    if (alias < 4) arrays[4] = arrays[alias];
                    else Arrays.fill(arrays, arrays[0]);
                    int[][] wanted = copy(arrays);
                    long expected = invoke(values, wanted, roots, true);
                    compile("alias-" + trial + "-" + alias);
                    long actual = invoke(values, arrays, roots, false);
                    if (actual != expected) throw new AssertionError("alias result");
                    checkArrays(arrays, wanted);
                }
            }
            values = values(random, 13);
            for (int trial = 0; trial < 16; trial++) {
                arrays = arrays(random);
                int first = trial % 4;
                arrays[first] = trial < 8 ? new int[trial % 2 == 0 ? 0 : 13] : null;
                // A second failing access checks which exception wins, and whether
                // the output store before the first failure has happened.
                arrays[(first + 1) % 4] = trial < 8 ? null : new int[0];
                int[][] wanted = copy(arrays);
                String expected = failure(values, wanted, roots, true);
                compile("exception-" + trial);
                String actual = failure(values, arrays, roots, false);
                if (actual.equals("no exception") || !actual.equals(expected)) {
                    throw new AssertionError("exception ordering: " + actual + " / " + expected);
                }
                checkArrays(arrays, wanted);
            }
            System.out.println("activated state checks: gc=" + gcCalls + " deopt=" + deoptCalls
                    + " aliases=40 exceptions=16 moved=" + moved);
        }
    }
}
