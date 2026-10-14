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
 * @summary Test Resource.getBytes with a content length that is right, wrong
 *          or unknown, and an input stream that reads a few bytes at a time
 * @modules java.base/jdk.internal.loader
 * @run main/othervm -Xmx64m GetBytes
 */

import java.io.ByteArrayInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Arrays;
import java.util.Random;

import jdk.internal.loader.Resource;

public class GetBytes {

    private static final int[] SIZES = {
        0, 1, 2, 1023, 1024, 1025, 3071, 3072, 3073,
        65535, 65536, 65537, 131071, 131072, 131073, 200_000
    };

    public static void main(String[] args) throws Exception {
        for (int size : SIZES) {
            byte[] data = data(size);
            for (int chunk : new int[] { Integer.MAX_VALUE, 1, 100, 1000 }) {
                // the length is right
                expect(data, size, chunk, data);
                // the length is unknown
                expect(data, -1, chunk, data);
                // the length is less than the data, which is not read beyond it
                if (size > 0) {
                    expect(data, size - 1, chunk, Arrays.copyOf(data, size - 1));
                }
                if (size > 1) {
                    expect(data, 1, chunk, Arrays.copyOf(data, 1));
                }
                // the length is more than the data
                expectEOF(data, size + 1, chunk);
                expectEOF(data, size + 100_000, chunk);
                // the length is far more than the data, which is not allocated up front
                expectEOF(data, Integer.MAX_VALUE - 8, chunk);
                expectEOF(data, Integer.MAX_VALUE - 1, chunk);
            }
        }
    }

    private static void expect(byte[] data, int length, int chunk, byte[] expected)
            throws IOException {
        byte[] bytes = resource(data, length, chunk).getBytes();
        if (!Arrays.equals(bytes, expected)) {
            throw new AssertionError("getBytes() with length " + length + " and "
                    + data.length + " bytes of data returned " + bytes.length
                    + " bytes, expected " + expected.length);
        }
    }

    private static void expectEOF(byte[] data, int length, int chunk) throws IOException {
        try {
            byte[] bytes = resource(data, length, chunk).getBytes();
            throw new AssertionError("getBytes() with length " + length + " and "
                    + data.length + " bytes of data returned " + bytes.length + " bytes");
        } catch (EOFException expected) {
        }
    }

    private static byte[] data(int size) {
        byte[] data = new byte[size];
        new Random(size).nextBytes(data);
        return data;
    }

    private static Resource resource(byte[] data, int length, int chunk) {
        return new Resource() {
            public String getName() { return "data"; }
            public URL getURL() { return null; }
            public URL getCodeSourceURL() { return null; }
            public int getContentLength() { return length; }
            public InputStream getInputStream() {
                return new ByteArrayInputStream(data) {
                    @Override
                    public synchronized int read(byte[] b, int off, int len) {
                        return super.read(b, off, Math.min(len, chunk));
                    }
                };
            }
        };
    }
}
