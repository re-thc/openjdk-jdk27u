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
 * @summary NativePRNG keeps the bytes passed to setSeed in a SHA1PRNG that is
 *          mixed into the output, and does not create it before then
 * @requires os.family != "windows"
 * @modules java.base/sun.security.provider:+open
 * @run main/othervm NativePRNGSetSeed NativePRNG
 * @run main/othervm NativePRNGSetSeed NativePRNGNonBlocking
 * @run main/othervm NativePRNGSetSeed NativePRNGBlocking
 * @run main/othervm NativePRNGSetSeed default
 */

import java.lang.reflect.Field;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;

public class NativePRNGSetSeed {

    public static void main(String[] args) throws Exception {
        String alg = args[0];
        if (alg.equals("default")) {
            testDefault();
        } else {
            test(alg);
        }
    }

    private static void test(String alg) throws Exception {
        System.out.println("Testing " + alg);
        SecureRandom sr = SecureRandom.getInstance(alg);
        Object io = randomIO(alg);

        // generating bytes and seeds doesn't create the mixing SHA1PRNG
        for (int len : new int[] {0, 1, 16, 17, 255, 256, 257, 1000, 70000}) {
            byte[] b = new byte[len];
            sr.nextBytes(b);
            if (len >= 16 && isZero(b)) {
                throw new Exception("Only zeros for length " + len);
            }
        }
        sr.generateSeed(8);
        checkMix(io, false);
        byte[] first = new byte[16];
        byte[] second = new byte[16];
        sr.nextBytes(first);
        sr.nextBytes(second);
        if (Arrays.equals(first, second)) {
            throw new Exception("Same bytes twice");
        }

        // setSeed supplements the state of the mixing SHA1PRNG
        byte[] seed1 = {1, 2, 3, 4, 5};
        sr.setSeed(seed1);
        checkMix(io, true);
        byte[] state = state(io);
        if (state.length != 20) {
            throw new Exception("Unexpected state length " + state.length);
        }
        byte[] seed2 = {6, 7, 8};
        byte[] before = state.clone();
        sr.setSeed(seed2);
        MessageDigest md = MessageDigest.getInstance("SHA-1");
        md.update(before);
        byte[] expected = md.digest(seed2);
        if (!Arrays.equals(expected, state(io))) {
            throw new Exception("Seed doesn't supplement the state");
        }
        sr.setSeed(new byte[0]);
        sr.setSeed(1);

        for (int len : new int[] {0, 1, 16, 17, 256, 1000, 70000}) {
            byte[] b = new byte[len];
            sr.nextBytes(b);
            if (len >= 16 && isZero(b)) {
                throw new Exception("Only zeros for length " + len);
            }
        }
        sr.nextBytes(first);
        sr.nextBytes(second);
        if (Arrays.equals(first, second)) {
            throw new Exception("Same bytes twice");
        }

        concurrent(sr);
    }

    // new SecureRandom(byte[]) seeds the default generator
    private static void testDefault() throws Exception {
        SecureRandom sr = new SecureRandom();
        if (!sr.getAlgorithm().equals("NativePRNG")) {
            System.out.println("Skipping, default is " + sr.getAlgorithm());
            return;
        }
        Object io = randomIO("NativePRNG");
        sr.nextBytes(new byte[16]);
        checkMix(io, false);
        SecureRandom seeded = new SecureRandom(new byte[] {1, 2, 3});
        checkMix(io, true);
        seeded.nextBytes(new byte[16]);
    }

    // Threads draw bytes while others set seeds; all the bytes must differ.
    private static void concurrent(SecureRandom sr) throws Exception {
        int readers = 4;
        int draws = 50_000;
        Set<ByteBuffer> seen = ConcurrentHashMap.newKeySet();
        AtomicReference<Throwable> failure = new AtomicReference<>();
        CountDownLatch start = new CountDownLatch(1);
        Thread[] threads = new Thread[readers + 1];
        for (int i = 0; i < readers; i++) {
            threads[i] = new Thread(() -> {
                try {
                    start.await();
                    for (int j = 0; j < draws; j++) {
                        byte[] b = new byte[16];
                        sr.nextBytes(b);
                        if (!seen.add(ByteBuffer.wrap(b))) {
                            throw new Exception("Duplicate bytes");
                        }
                    }
                } catch (Throwable t) {
                    failure.compareAndSet(null, t);
                }
            });
        }
        threads[readers] = new Thread(() -> {
            try {
                start.await();
                for (int j = 0; j < 1000; j++) {
                    sr.setSeed(new byte[] {(byte) j, (byte) (j >> 8)});
                }
            } catch (Throwable t) {
                failure.compareAndSet(null, t);
            }
        });
        for (Thread t : threads) {
            t.start();
        }
        start.countDown();
        for (Thread t : threads) {
            t.join();
        }
        if (failure.get() != null) {
            throw new Exception("Failed", failure.get());
        }
    }

    private static boolean isZero(byte[] b) {
        for (byte x : b) {
            if (x != 0) {
                return false;
            }
        }
        return true;
    }

    private static Object randomIO(String alg) throws Exception {
        String cn = switch (alg) {
            case "NativePRNG" -> "sun.security.provider.NativePRNG";
            case "NativePRNGBlocking" ->
                "sun.security.provider.NativePRNG$Blocking";
            case "NativePRNGNonBlocking" ->
                "sun.security.provider.NativePRNG$NonBlocking";
            default -> throw new IllegalArgumentException(alg);
        };
        Field f = Class.forName(cn).getDeclaredField("INSTANCE");
        f.setAccessible(true);
        return f.get(null);
    }

    private static Object mixRandom(Object io) throws Exception {
        Field f = io.getClass().getDeclaredField("mixRandom");
        f.setAccessible(true);
        return f.get(io);
    }

    private static void checkMix(Object io, boolean expected) throws Exception {
        if ((mixRandom(io) != null) != expected) {
            throw new Exception("Mixing SHA1PRNG should "
                    + (expected ? "" : "not ") + "exist");
        }
    }

    private static byte[] state(Object io) throws Exception {
        Object mix = mixRandom(io);
        Field f = mix.getClass().getDeclaredField("state");
        f.setAccessible(true);
        return (byte[]) f.get(mix);
    }
}
