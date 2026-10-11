/*
 * Copyright (c) 2026, Datadog, Inc. All rights reserved.
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
 *
 */

/*
 * @test id=serial
 * @summary Test that identity hash codes are stable across Serial GC
 * @bug 8379910
 * @requires vm.gc.Serial
 * @requires vm.opt.UseFourByteObjectHeaders == null | vm.opt.UseFourByteObjectHeaders == true
 * @library /test/lib
 * @run main/othervm -XX:+UseFourByteObjectHeaders -XX:+UseSerialGC
 *      -Xms64m -Xmx64m
 *      TestHashCodeEvacRace
 */

/*
 * @test id=g1
 * @summary Test that identity hash codes are stable across G1 GC
 * @bug 8379910
 * @requires vm.gc.G1
 * @requires vm.opt.UseFourByteObjectHeaders == null | vm.opt.UseFourByteObjectHeaders == true
 * @library /test/lib
 * @run main/othervm -XX:+UseFourByteObjectHeaders -XX:+UseG1GC
 *      -Xms64m -Xmx64m
 *      TestHashCodeEvacRace
 */

/*
 * @test id=zgc
 * @summary Test that identity hash codes are stable across ZGC
 * @bug 8379910
 * @requires vm.gc.Z
 * @requires vm.opt.UseFourByteObjectHeaders == null | vm.opt.UseFourByteObjectHeaders == true
 * @library /test/lib
 * @run main/othervm -XX:+UseFourByteObjectHeaders -XX:+UseZGC
 *      -Xms64m -Xmx64m
 *      TestHashCodeEvacRace
 */

/**
 * Checks hash and payload stability while readers race with allocation and GC.
 * The payload has no hash gap, so relocation must grow hashed objects before
 * publishing their copies.
 */
public class TestHashCodeEvacRace {

    // With compact headers: 4-byte header + 4-byte int = 8 bytes.
    // No room for the 4-byte identity hash — requires expansion on evacuation.
    static class IntHolder {
        int value;
        IntHolder(int v) { value = v; }
    }

    static final int NUM_OBJECTS = 50_000;
    static final int NUM_READERS = 4;
    static final int DURATION_MS = 10_000;

    static final IntHolder[] objects = new IntHolder[NUM_OBJECTS];
    static final int[] expectedHash = new int[NUM_OBJECTS];

    static volatile Object sink;
    static volatile boolean running = true;
    static volatile String failure = null;

    public static void main(String[] args) throws Exception {
        // Create objects and record their identity hash codes.
        // After this, each object has is_hashed_not_expanded state.
        for (int i = 0; i < NUM_OBJECTS; i++) {
            objects[i] = new IntHolder(i);
            expectedHash[i] = System.identityHashCode(objects[i]);
        }

        // Reader threads: continuously read identity hash codes and verify
        // they match the recorded values. During concurrent evacuation,
        // readers may follow forwarding pointers to to-space copies.
        // Without the fix, the copy may be visible before its hash is
        // initialized, causing a mismatch.
        Thread[] readers = new Thread[NUM_READERS];
        for (int t = 0; t < NUM_READERS; t++) {
            readers[t] = new Thread(() -> {
                while (running && failure == null) {
                    for (int i = 0; i < NUM_OBJECTS; i++) {
                        IntHolder obj = objects[i];
                        if (obj == null) continue;
                        int actual = System.identityHashCode(obj);
                        int expected = expectedHash[i];
                        if (actual != expected) {
                            failure = "Hash mismatch at index " + i
                                    + ": expected=" + expected
                                    + " actual=" + actual;
                            return;
                        }
                    }
                }
            });
            readers[t].setDaemon(true);
            readers[t].start();
        }

        // Main thread: allocate garbage to trigger GC and evacuation.
        // The objects[] array keeps the hashed objects alive so they get
        // evacuated rather than collected.
        long deadline = System.currentTimeMillis() + DURATION_MS;
        while (System.currentTimeMillis() < deadline && failure == null) {
            for (int i = 0; i < 100; i++) {
                sink = new byte[4096];
            }
            Thread.yield();
        }

        running = false;
        for (Thread t : readers) t.join(5000);

        if (failure != null) {
            throw new RuntimeException(failure);
        }
        System.out.println("PASSED");
    }
}
