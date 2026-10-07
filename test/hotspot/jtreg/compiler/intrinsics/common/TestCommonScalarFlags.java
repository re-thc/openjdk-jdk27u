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
 * @summary Scalar oracles cover x86 code paths with optional CPU instructions disabled
 * @requires os.simpleArch == "x64"
 * @requires vm.compiler1.enabled
 * @build compiler.intrinsics.common.TestCommonScalarIntrinsics
 * @run main/othervm -Xint -XX:+UseCommonIntrinsics -XX:-UseCountLeadingZerosInstruction compiler.intrinsics.common.TestCommonScalarFlags
 * @run main/othervm -Xint -XX:+UseCommonIntrinsics -XX:-UseCountTrailingZerosInstruction compiler.intrinsics.common.TestCommonScalarFlags
 * @run main/othervm -Xint -XX:+UseCommonIntrinsics -XX:-UsePopCountInstruction compiler.intrinsics.common.TestCommonScalarFlags
 * @run main/othervm -Xint -XX:+UseCommonIntrinsics -XX:-UseCountLeadingZerosInstruction -XX:-UseCountTrailingZerosInstruction -XX:-UsePopCountInstruction compiler.intrinsics.common.TestCommonScalarFlags
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics -XX:-UseCountLeadingZerosInstruction compiler.intrinsics.common.TestCommonScalarFlags
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics -XX:-UseCountTrailingZerosInstruction compiler.intrinsics.common.TestCommonScalarFlags
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics -XX:-UsePopCountInstruction compiler.intrinsics.common.TestCommonScalarFlags
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics -XX:-UseCountLeadingZerosInstruction -XX:-UseCountTrailingZerosInstruction -XX:-UsePopCountInstruction compiler.intrinsics.common.TestCommonScalarFlags
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics -XX:-UseCountLeadingZerosInstruction compiler.intrinsics.common.TestCommonScalarFlags
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics -XX:-UseCountTrailingZerosInstruction compiler.intrinsics.common.TestCommonScalarFlags
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics -XX:-UsePopCountInstruction compiler.intrinsics.common.TestCommonScalarFlags
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics -XX:-UseCountLeadingZerosInstruction -XX:-UseCountTrailingZerosInstruction -XX:-UsePopCountInstruction compiler.intrinsics.common.TestCommonScalarFlags
 */

package compiler.intrinsics.common;

public class TestCommonScalarFlags {
    public static void main(String[] args) {
        TestCommonScalarIntrinsics.main(args);
    }
}
