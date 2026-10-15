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
 * @summary NativePRNG gets its bytes from /dev/urandom or /dev/random where
 *          getrandom() is blocked, and is available only where it can read
 *          what it needs. It handles kernels before Linux 5.6 that reject
 *          GRND_INSECURE, also before their random number generator is
 *          initialized
 * @requires os.family == "linux"
 * @library /test/lib
 * @run main/othervm/native NativePRNGFallback enosys
 * @run main/othervm/native NativePRNGFallback eperm
 * @run main/othervm/native NativePRNGFallback old-kernel
 * @run main/othervm/native NativePRNGFallback uninitialized
 * @run main/othervm/native NativePRNGFallback no-random
 * @run main/othervm/native NativePRNGFallback no-random-egd-urandom
 * @run main/othervm/native NativePRNGFallback no-urandom
 * @run main/othervm/native NativePRNGFallback no-devices
 */

import java.nio.file.Path;
import java.security.SecureRandom;
import java.security.Security;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HexFormat;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import jtreg.SkippedException;

public class NativePRNGFallback {

    private static final int EPERM = 1;
    private static final int EAGAIN = 11;
    private static final int EINVAL = 22;
    private static final int ENOSYS = 38;

    private static final int GRND_NONBLOCK = 1;
    private static final int GRND_INSECURE = 4;

    private static final int THREADS = 8;
    private static final int REQUESTS = 2_000;
    private static final int[] SIZES = { 16, 64, 100, 5_000, 20_000 };

    private static final List<String> ALGORITHMS = List.of("NativePRNG",
            "NativePRNGNonBlocking", "NativePRNGBlocking");

    // Runs a command in a user and mount namespace where /dev holds only
    // null, zero and the device named by the first argument, if any.
    private static final String HIDE_DEVICES = """
            set -e
            keep=$1; shift
            d=$(mktemp -d)
            for f in null zero urandom random; do
                touch $d/$f; mount --bind /dev/$f $d/$f
            done
            mount -t tmpfs tmpfs /dev
            for f in null zero $keep; do
                touch /dev/$f; mount --bind $d/$f /dev/$f
            done
            exec "$@"
            """;

    private static native int install(int mode, int err);
    private static native int getrandom(int flags);

    public static void main(String[] args) throws Exception {
        switch (args[0]) {
            case "no-random" ->
                runHidden("urandom", List.of(), List.of("NativePRNGNonBlocking"));
            case "no-random-egd-urandom" ->
                runHidden("urandom", List.of("-Djava.security.egd=file:/dev/urandom"),
                        List.of("NativePRNG", "NativePRNGNonBlocking"));
            case "no-urandom" ->
                runHidden("random", List.of(), List.of("NativePRNGBlocking"));
            case "no-devices" ->
                runHidden("", List.of(), List.of());
            case "child" -> child(List.of(args).subList(1, args.length));
            default -> blocked(args[0]);
        }
    }

    // runs child() in a JVM whose /dev has only the device keep, and checks
    // that only the algorithms expected are available
    private static void runHidden(String keep, List<String> options,
            List<String> expected) throws Exception {
        List<String> unshare = List.of("unshare", "-Urm", "sh", "-c",
                HIDE_DEVICES, "sh", keep);
        Process p = new ProcessBuilder(concat(unshare, List.of("true")))
                .inheritIO().start();
        if (p.waitFor() != 0) {
            throw new SkippedException("Cannot hide /dev/random or /dev/urandom");
        }
        List<String> java = concat(List.of(
                Path.of(System.getProperty("java.home"), "bin", "java").toString(),
                "--enable-native-access=ALL-UNNAMED",
                "-Djava.library.path=" + System.getProperty("java.library.path"),
                "-cp", System.getProperty("java.class.path")), options);
        java = concat(java, concat(List.of("NativePRNGFallback", "child"), expected));
        p = new ProcessBuilder(concat(unshare, java)).inheritIO().start();
        int exit = p.waitFor();
        if (exit != 0) {
            throw new RuntimeException("Child failed: " + exit);
        }
    }

    private static List<String> concat(List<String> a, List<String> b) {
        List<String> l = new ArrayList<>(a);
        l.addAll(b);
        return l;
    }

    // with getrandom() blocked, checks that exactly the algorithms expected
    // are available and that they work
    private static void child(List<String> expected) throws Exception {
        System.loadLibrary("NativePRNGFallback");
        if (install(0, ENOSYS) != 0) {
            throw new RuntimeException("Cannot install a seccomp filter");
        }
        if (getrandom(0) != ENOSYS) {
            throw new RuntimeException("getrandom() is not blocked");
        }
        for (String alg : ALGORITHMS) {
            boolean available = Security.getProvider("SUN")
                    .getService("SecureRandom", alg) != null;
            if (available != expected.contains(alg)) {
                throw new RuntimeException(alg + " available: " + available);
            }
            if (available) {
                check(SecureRandom.getInstance(alg));
            }
        }
        String def = new SecureRandom().getAlgorithm();
        if (!def.equals(expected.contains("NativePRNG") ? "NativePRNG" : "DRBG")) {
            throw new RuntimeException("Default: " + def);
        }
    }

    // with getrandom() failing as mode says, checks that all algorithms
    // are available and work
    private static void blocked(String mode) throws Exception {
        System.loadLibrary("NativePRNGFallback");

        // The filter must be in place before the SUN provider checks
        // whether NativePRNG is available.
        int filter, err;
        switch (mode) {
            case "enosys" -> { filter = 0; err = ENOSYS; }
            case "eperm" -> { filter = 0; err = EPERM; }
            case "old-kernel" -> { filter = 1; err = EINVAL; }
            case "uninitialized" -> { filter = 2; err = EINVAL; }
            default -> throw new IllegalArgumentException(mode);
        }
        int e = install(filter, err);
        if (e != 0) {
            throw new SkippedException("Cannot install a seccomp filter: " + e);
        }
        expect(GRND_INSECURE, err);
        if (filter == 0) {
            expect(0, err);
        } else {
            expect(0, 0);
            expect(GRND_NONBLOCK, filter == 2 ? EAGAIN : 0);
        }

        if (!new SecureRandom().getAlgorithm().equals("NativePRNG")) {
            throw new RuntimeException("NativePRNG is not the default");
        }
        for (String alg : ALGORITHMS) {
            check(SecureRandom.getInstance(alg));
        }
    }

    // checks that getrandom() with these flags fails with this errno, or
    // succeeds if it is 0
    private static void expect(int flags, int errno) {
        int e = getrandom(flags);
        if (e == 0 && errno != 0) {
            // getrandom() did not make the system call, which the vDSO of
            // glibc 2.41 and later may do
            throw new SkippedException("getrandom() does not fail");
        }
        if (e != errno) {
            throw new RuntimeException("getrandom(" + flags + ") got errno "
                    + e + ", expected " + errno);
        }
    }

    // gets random bytes concurrently, checks that they don't repeat, and
    // that seeds and mixing after setSeed work
    private static void check(SecureRandom random) throws Exception {
        Set<String> seen = ConcurrentHashMap.newKeySet();
        List<Thread> threads = new ArrayList<>();
        List<Throwable> failures = new ArrayList<>();
        for (int t = 0; t < THREADS; t++) {
            int first = t;
            Thread thread = new Thread(() -> {
                for (int i = 0; i < REQUESTS; i++) {
                    byte[] b = new byte[SIZES[(first + i) % SIZES.length]];
                    random.nextBytes(b);
                    String s = HexFormat.of().formatHex(b, 0, 16);
                    if (!seen.add(s)) {
                        throw new RuntimeException(random.getAlgorithm()
                                + ": repeated bytes " + s);
                    }
                }
            });
            thread.setUncaughtExceptionHandler((th, ex) -> {
                synchronized (failures) {
                    failures.add(ex);
                }
            });
            threads.add(thread);
            thread.start();
        }
        for (Thread thread : threads) {
            thread.join();
        }
        if (!failures.isEmpty()) {
            throw new RuntimeException(failures.get(0));
        }

        byte[] s1 = random.generateSeed(32);
        byte[] s2 = random.generateSeed(32);
        if (Arrays.equals(s1, s2)) {
            throw new RuntimeException(random.getAlgorithm()
                    + ": equal seeds");
        }
        random.setSeed(s1);
        byte[] a = new byte[10_000];
        byte[] b = new byte[10_000];
        random.nextBytes(a);
        random.nextBytes(b);
        if (Arrays.equals(a, b)) {
            throw new RuntimeException(random.getAlgorithm()
                    + ": equal bytes after setSeed");
        }
    }
}
