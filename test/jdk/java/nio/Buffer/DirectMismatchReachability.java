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
 * @summary Keep direct buffer and view owners alive while mismatch polls between native chunks
 * @run main/othervm/timeout=480 -Xbatch -Xmx64m -XX:MaxDirectMemorySize=256m DirectMismatchReachability
 */

import java.nio.ByteBuffer;
import java.nio.LongBuffer;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;

public class DirectMismatchReachability {
    private static final int SIZE = 4 << 20;
    private static final AtomicBoolean RUNNING = new AtomicBoolean(true);

    private static int bytes(ByteBuffer a, ByteBuffer b) {
        return a.mismatch(b);
    }

    private static int longs(LongBuffer a, LongBuffer b) {
        return a.mismatch(b);
    }

    private static int mixed(ByteBuffer a, ByteBuffer b) {
        return a.mismatch(b);
    }

    private static void check(int result, int expected) {
        if (result != expected) throw new AssertionError(result + " != " + expected);
    }

    private static void test() {
        ByteBuffer a = ByteBuffer.allocateDirect(SIZE);
        ByteBuffer b = ByteBuffer.allocateDirect(SIZE);
        check(bytes(a, b), -1);
        b.put(SIZE - 1, (byte) 1);
        check(bytes(a, b), SIZE - 1);
        // A view's attachment must retain the original buffer's cleaner owner.
        check(longs(a.asLongBuffer(), b.asLongBuffer()), SIZE / Long.BYTES - 1);
        check(longs(a.asReadOnlyBuffer().asLongBuffer(), b.asLongBuffer()), SIZE / Long.BYTES - 1);
        // These heap arrays are small enough to move during ordinary GCs.
        byte[] data = new byte[256 << 10];
        Arrays.fill(data, (byte) 31);
        ByteBuffer heap = ByteBuffer.wrap(data);
        ByteBuffer direct = ByteBuffer.allocateDirect(data.length);
        direct.put(0, data);
        check(mixed(heap, direct), -1);
        direct.put(data.length - 1, (byte) 32);
        check(mixed(heap, direct), data.length - 1);
    }

    public static void main(String[] args) throws Exception {
        ByteBuffer a = ByteBuffer.allocateDirect(4096);
        ByteBuffer b = ByteBuffer.allocateDirect(4096);
        LongBuffer x = a.asLongBuffer(), y = b.asLongBuffer();
        ByteBuffer heap = ByteBuffer.allocate(4096);
        for (int i = 0; i < 20000; i++) {
            check(bytes(a, b), -1);
            check(longs(x, y), -1);
            check(mixed(heap, b), -1);
        }
        Thread gc = Thread.ofPlatform().start(() -> {
            while (RUNNING.get()) {
                System.gc();
                Thread.yield();
            }
        });
        try {
            for (int i = 0; i < 128; i++) test();
        } finally {
            RUNNING.set(false);
            gc.join();
        }
    }
}
