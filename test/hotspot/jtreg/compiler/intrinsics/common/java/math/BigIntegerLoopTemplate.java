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

package java.math;

public class BigIntegerLoopTemplate {
    // Rebound to the private BigInteger kernel by the hidden-nestmate factory.
    static int mul(int[] out, int[] in, int offset, int len, int k) {
        throw new AssertionError("untransformed call");
    }

    public static long loop(int mode, int[] out, int[] in) {
        long result = 0;
        for (int i = 0; i < 15; i++) {
            // Keep this selection inside the loop: it creates the argument Phi
            // whose L1 conditional-expression elimination exposed the bug.
            result += mul(out, in, 1, mode == 0 ? 8 : 0, 17);
        }
        return result;
    }
}
