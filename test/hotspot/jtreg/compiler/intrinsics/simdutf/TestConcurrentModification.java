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
 * @summary Bulk conversions of input that another thread changes meanwhile give some
 *          result of the old and new bytes, but never an exception from the coder or
 *          characters that are lost
 * @requires (os.arch == "aarch64") | (os.arch == "amd64" & vm.cpu.features ~= ".*sse4.2.*")
 * @run main/othervm TestConcurrentModification
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestConcurrentModification
 * @run main/othervm -Xint TestConcurrentModification slow
 */

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.BooleanSupplier;

public class TestConcurrentModification {
    private static final int N = 1 << 16;
    private static long budgetNanos;

    /** Runs the work while the writer runs, until the time is up. */
    private static void race(Runnable writer, BooleanSupplier work) throws Exception {
        AtomicBoolean stop = new AtomicBoolean();
        Thread thread = new Thread(() -> {
            while (!stop.get()) {
                writer.run();
            }
        });
        thread.setDaemon(true);
        thread.start();
        long end = System.nanoTime() + budgetNanos;
        int calls = 0;
        try {
            do {
                if (!work.getAsBoolean()) {
                    throw new AssertionError("inconsistent result after " + calls + " calls");
                }
                calls++;
            } while (System.nanoTime() < end || calls < 20);
        } finally {
            stop.set(true);
            thread.join();
        }
    }

    /**
     * A decoder with a tight output: whatever the other thread does to the input, it
     * converts at most one char per byte, so the result must fit and the positions
     * must stay inside the buffers.
     */
    private static void utf8Decoder(boolean direct) throws Exception {
        ByteBuffer shared = direct ? ByteBuffer.allocateDirect(N) : ByteBuffer.allocate(N);
        for (int i = 0; i < N; i++) shared.put(i, (byte) 'a');
        CharBuffer out = CharBuffer.allocate(N);
        race(() -> {
            // A reverse sweep turns the text into lead bytes, so that a valid prefix
            // changes to something else while it is being converted, and back again
            for (int i = N - 2; i >= 0; i--) shared.put(i, (byte) 0xf0);
            for (int i = 0; i < N - 1; i++) shared.put(i, (byte) 'a');
        }, () -> {
            CharsetDecoder decoder = StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPLACE);
            ByteBuffer in = shared.duplicate();
            out.clear();
            decoder.decode(in, out, true);
            return out.position() <= N && in.position() <= N;
        });
    }

    private static void utf32Decoder() throws Exception {
        ByteBuffer shared = ByteBuffer.allocate(4 * N).order(ByteOrder.LITTLE_ENDIAN);
        for (int i = 0; i < N; i++) shared.putInt(4 * i, 'a');
        CharBuffer out = CharBuffer.allocate(N);
        Charset utf32le = Charset.forName("UTF-32LE");
        race(() -> {
            for (int i = N - 2; i >= 0; i--) shared.putInt(4 * i, 0x1f600);
            for (int i = 0; i < N - 1; i++) shared.putInt(4 * i, 'a');
        }, () -> {
            CharsetDecoder decoder = utf32le.newDecoder().onMalformedInput(CodingErrorAction.REPLACE);
            ByteBuffer in = shared.duplicate().order(ByteOrder.LITTLE_ENDIAN);
            out.clear();
            decoder.decode(in, out, true);
            return out.position() <= N && in.position() <= 4 * N;
        });
    }

    /**
     * Text of two-byte Latin-1 characters that ends in a byte which is not UTF-8, so that
     * the conversion of the Latin-1 prefix ends in its error path while the other thread
     * turns characters into pairs that are malformed. Every pair gives at least one char,
     * so a String shorter than half the bytes has lost characters.
     */
    private static void latin1String() throws Exception {
        byte[] data = new byte[N];
        for (int i = 0; i < N; i += 2) {
            data[i] = (byte) 0xc3;
            data[i + 1] = (byte) 0xa9;
        }
        data[N - 1] = (byte) 0xff;
        race(() -> {
            for (int i = N - 4; i >= 0; i -= 2) data[i + 1] = (byte) 0x41;
            for (int i = 0; i < N - 2; i += 2) data[i + 1] = (byte) 0xa9;
        }, () -> new String(data, 0, N, StandardCharsets.UTF_8).length() >= N / 2);
    }

    public static void main(String[] args) throws Exception {
        budgetNanos = (args.length > 0 ? 1 : 2) * 1_000_000_000L;
        utf8Decoder(false);
        utf8Decoder(true);
        utf32Decoder();
        latin1String();
        System.out.println("passed");
    }
}
