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
 * @summary Preserve inflate error accounting after partial output and reset across all buffer shapes
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @run main/othervm -Xmx64m -Xint TestZlibNGLateChecksum
 * @run main/othervm -Xmx64m -Xbatch -XX:TieredStopAtLevel=1 TestZlibNGLateChecksum
 * @run main/othervm -Xmx64m -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000 TestZlibNGLateChecksum
 * @run main/othervm -Xmx64m -Xcheck:jni -XX:-UseZipIntrinsics TestZlibNGLateChecksum
 * @run main/othervm -Xmx64m -Xbatch -XX:TieredStopAtLevel=1 -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_zipProcess TestZlibNGLateChecksum
 * @run main/othervm -Xmx64m -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000 -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_zipProcess TestZlibNGLateChecksum
 */

import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Random;
import java.util.zip.DataFormatException;
import java.util.zip.Deflater;
import java.util.zip.Inflater;

public class TestZlibNGLateChecksum {
    private static final int CHUNK = 257;
    private static final byte SENTINEL = (byte) 0xa5;

    // Arrays, heap/direct buffers, and heap/direct slices with a nonzero
    // backing offset and position. Read-only inputs exercise hidden arrays.
    private static class Buffer {
        final int shape;
        final byte[] array;
        final ByteBuffer buffer;
        final ByteBuffer storage;
        final int offset;
        final int start = 5;
        final int size;

        Buffer(int shape, int size) {
            this.shape = shape;
            this.size = size;
            offset = shape >= 3 ? 11 : 0;
            storage = (shape == 2 || shape == 4)
                ? ByteBuffer.allocateDirect(offset + start + size + 9)
                : ByteBuffer.allocate(offset + start + size + 9);
            for (int n = 0; n < storage.capacity(); n++) storage.put(n, SENTINEL);
            if (shape >= 3) {
                storage.position(offset);
                buffer = storage.slice();
                storage.clear();
            } else {
                buffer = storage.duplicate();
            }
            array = shape == 0 ? storage.array() : null;
            clear();
        }

        void clear() { buffer.limit(start + size).position(start); }
        void put(byte[] bytes) { buffer.put(bytes); clear(); }
        ByteBuffer input() { return buffer.asReadOnlyBuffer(); }
        byte get(int n) { return storage.get(offset + start + n); }
        void checkGuards() {
            for (int n = 0; n < storage.capacity(); n++) {
                if ((n < offset + start || n >= offset + start + size) &&
                    storage.get(n) != SENTINEL) throw new AssertionError("buffer guard");
            }
        }
    }

    private static void run(Inflater inflater, byte[] data, byte[] stream,
                            boolean corrupt, int inputShape, int outputShape) throws Exception {
        inflater.reset();
        if (inflater.getBytesRead() != 0 || inflater.getBytesWritten() != 0 ||
            inflater.finished() || inflater.needsDictionary()) throw new AssertionError("reset");
        byte[] supplied = Arrays.copyOf(stream, stream.length + 3);
        Arrays.fill(supplied, stream.length, supplied.length, SENTINEL);
        if (corrupt) supplied[stream.length - 1] ^= 1; // only the final Adler byte
        Buffer input = new Buffer(inputShape, supplied.length);
        input.put(supplied);
        ByteBuffer inputView = input.input();
        if (inputShape == 0) inflater.setInput(input.array, input.start, supplied.length);
        else inflater.setInput(inputView);
        Buffer output = new Buffer(outputShape, CHUNK);
        int decoded = 0;
        boolean threw = false;
        for (int call = 0; call < data.length + 1; call++) {
            output.clear();
            long beforeIn = inflater.getBytesRead(), beforeOut = inflater.getBytesWritten();
            int returned = -1;
            try {
                returned = outputShape == 0
                    ? inflater.inflate(output.array, output.start, CHUNK)
                    : inflater.inflate(output.buffer);
            } catch (DataFormatException expected) {
                if (!corrupt) throw expected;
                threw = true;
            }
            int read = Math.toIntExact(inflater.getBytesRead() - beforeIn);
            int written = Math.toIntExact(inflater.getBytesWritten() - beforeOut);
            if (read < 0 || written < 0 || written > CHUNK ||
                (!threw && returned != written)) throw new AssertionError("per-call counts");
            if (inputShape != 0 && inputView.position() != input.start + inflater.getBytesRead())
                throw new AssertionError("input position after inflate/error");
            if (outputShape != 0 && output.buffer.position() != output.start + written)
                throw new AssertionError("output position after inflate/error");
            if (inflater.getRemaining() != supplied.length - inflater.getBytesRead())
                throw new AssertionError("remaining/consumed");
            for (int n = 0; n < written; n++) {
                if (decoded + n >= data.length || output.get(n) != data[decoded + n])
                    throw new AssertionError("decoded bytes");
            }
            decoded += written;
            if (inflater.getBytesWritten() != decoded) throw new AssertionError("cumulative output");
            input.checkGuards();
            output.checkGuards();
            if (threw) {
                if (beforeOut == 0 || written == 0 || read == 0 || inflater.finished() ||
                    inflater.needsDictionary()) throw new AssertionError("must fail late with partial output");
                break;
            }
            if (inflater.finished()) break;
            if (written == 0 && read == 0) throw new AssertionError("stalled");
        }
        if (threw != corrupt || decoded != data.length ||
            inflater.getBytesRead() != stream.length || inflater.getBytesWritten() != data.length ||
            inflater.getRemaining() != 3 || (!corrupt && !inflater.finished()))
            throw new AssertionError("final counts/status in=" + inputShape + " out=" + outputShape);
    }

    public static void main(String[] args) throws Exception {
        byte[] data = new byte[8192];
        new Random(81279).nextBytes(data);
        byte[] encoded = new byte[data.length + 256];
        int length;
        // Stored blocks give a valid stream independent of match heuristics.
        try (Deflater d = new Deflater(0)) {
            d.setInput(data);
            d.finish();
            length = d.deflate(encoded);
            if (!d.finished()) throw new AssertionError("deflate");
        }
        byte[] stream = Arrays.copyOf(encoded, length);
        try (Inflater inflater = new Inflater()) {
            // Exercise all four Java entry shapes enough to compile in both JIT tiers.
            for (int round = 0; round < 80; round++) {
                for (int in = 0; in < 5; in++) {
                    for (int out = 0; out < 5; out++) {
                        run(inflater, data, stream, true, in, out);
                        run(inflater, data, stream, false, in, out); // reset/reuse after exception
                    }
                }
            }
        }
        System.out.println("PASS late checksum: 25 buffer pairs, 80 rounds, error then reset/reuse");
    }
}
