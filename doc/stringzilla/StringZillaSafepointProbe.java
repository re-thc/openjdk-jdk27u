/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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

import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicLong;
import jdk.test.whitebox.WhiteBox;

// Standalone measurement: no timing assertion or wall-clock guarantee.
public class StringZillaSafepointProbe {
    private static volatile boolean stop;
    private static volatile int sink;
    private static final AtomicLong starts = new AtomicLong();

    public static int probe(String value, String needle) { return value.lastIndexOf(needle); }

    public static void main(String[] args) throws Exception {
        int count = 4096, length = 262144;
        char[] target = new char[count];
        Arrays.fill(target, (char)0x0401);
        target[count - 2] = 0x0402;
        ByteBuffer shifted = ByteBuffer.allocate((count + 1) * 2).order(ByteOrder.nativeOrder());
        for (int i = 0; i < count; i++) shifted.putChar(1 + i * 2, target[i]);
        char[] chars = new char[length + count + 1];
        Arrays.fill(chars, 0, length, (char)0x0401);
        for (int i = 0; i <= count; i++) chars[length + i] = shifted.getChar(i * 2);
        String value = new String(chars), needle = new String(target);
        String warm = "\u0401".repeat(1024) + "\u0402";
        for (int i = 0; i < 5000; i++) sink = probe(warm, "\u0401\u0402");
        WhiteBox wb = WhiteBox.getWhiteBox();
        Method method = StringZillaSafepointProbe.class.getMethod("probe", String.class, String.class);
        wb.deoptimizeMethod(method);
        if (!wb.enqueueMethodForCompilation(method, 1) || !wb.isMethodCompiled(method))
            throw new AssertionError("Caller did not compile in C1");
        if (probe(value, needle) != -1) throw new AssertionError("Adverse fixture has a match");
        Thread worker = new Thread(() -> {
            while (!stop) {
                starts.incrementAndGet();
                sink = probe(value, needle);
                if (sink != -1) throw new AssertionError("Adverse search result");
            }
        });
        long[] pauses = new long[12];
        worker.start();
        try {
            long previous = 0;
            for (int i = 0; i < pauses.length; i++) {
                while (starts.get() <= previous) Thread.onSpinWait();
                previous = starts.get();
                // Request during an active search, not on its entry poll.
                Thread.sleep(1);
                long before = System.nanoTime();
                wb.forceSafepoint();
                pauses[i] = System.nanoTime() - before;
            }
        } finally {
            stop = true;
            worker.join();
        }
        System.out.println("{\"workload\":\"reverse-odd-near-end\",\"length\":" + length +
                           ",\"needleLength\":" + count + ",\"samples_ns\":" + Arrays.toString(pauses) + "}");
    }
}
