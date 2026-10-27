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
 * @summary NativePRNG mixes a large request after setSeed in chunks, so that
 *          it needs no second array as large as the request
 * @requires os.family != "windows"
 * @run main/othervm -Xmx64m NativePRNGLargeRequest NativePRNG
 * @run main/othervm -Xmx64m NativePRNGLargeRequest NativePRNGNonBlocking
 * @run main/othervm -Xmx64m NativePRNGLargeRequest NativePRNGBlocking
 */

import java.security.SecureRandom;

public class NativePRNGLargeRequest {

    public static void main(String[] args) throws Exception {
        SecureRandom random = SecureRandom.getInstance(args[0]);
        random.setSeed(new byte[] { 1, 2, 3 });
        // Exceed half the heap to detect a second request-sized allocation.
        byte[] b = new byte[40 << 20];
        random.nextBytes(b);
        // Detect unfilled regions; random output has about 1/256 zero bytes.
        int zeros = 0;
        for (byte x : b) {
            if (x == 0) {
                zeros++;
            }
        }
        if (zeros > 2 * b.length / 256) {
            throw new RuntimeException(zeros + " zero bytes");
        }
    }
}
