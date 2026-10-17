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
 * @summary Conditional polynomial assignment preserves generic lengths in all tiers
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @modules java.base/sun.security.util.math java.base/sun.security.util.math.intpoly:+open
 * @run main/othervm -Xint -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntPolyAssign
 * @run main/othervm -Xint -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntPolyAssign
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntPolyAssign
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntPolyAssign
 * @run main/othervm -Xbatch -XX:-TieredCompilation compiler.intrinsics.common.TestCommonIntPolyAssign
 */

package compiler.intrinsics.common;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.math.BigInteger;
import java.util.Arrays;

import sun.security.util.math.IntegerFieldModuloP;
import sun.security.util.math.IntegerModuloP;
import sun.security.util.math.MutableIntegerModuloP;
import sun.security.util.math.intpoly.IntegerPolynomial;
import sun.security.util.math.intpoly.IntegerPolynomialModBinP;

public class TestCommonIntPolyAssign {
    private static final MethodHandle ASSIGN;

    static {
        try {
            var method = IntegerPolynomial.class.getDeclaredMethod(
                    "conditionalAssign", int.class, long[].class, long[].class);
            method.setAccessible(true);
            ASSIGN = MethodHandles.lookup().unreflect(method);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static void main(String[] args) throws Throwable {
        // This public field has two limbs, outside the stub's fixed-size cases.
        IntegerFieldModuloP field = new IntegerPolynomialModBinP(10, 2, 19, BigInteger.ONE);
        BigInteger value = BigInteger.valueOf(1 + (9 << 10));
        IntegerModuloP source = field.getElement(value);
        MutableIntegerModuloP target = field.get0().mutable();
        for (int i = 0; i < 30_000; i++) {
            target.conditionalSet(source, 1);
            if (!target.asBigInteger().equals(value)) {
                throw new AssertionError("Two-limb public assignment: " + target.asBigInteger());
            }
            target.conditionalSet(field.get0(), 0);
            if (!target.asBigInteger().equals(value)) {
                throw new AssertionError("Unselected public assignment changed the value");
            }
        }
        for (int length = 0; length <= 33; length++) {
            long[] sourceLimbs = new long[length];
            Arrays.fill(sourceLimbs, 9);
            if (length != 0) sourceLimbs[0] = 1;
            long[] destination = new long[length];
            ASSIGN.invokeExact(1, destination, sourceLimbs);
            if (!Arrays.equals(destination, sourceLimbs)) {
                throw new AssertionError("Assignment length " + length + ": " + Arrays.toString(destination));
            }
            long[] unchanged = destination.clone();
            ASSIGN.invokeExact(0, destination, new long[length]);
            ASSIGN.invokeExact(1, destination, destination);
            if (!Arrays.equals(destination, unchanged)) {
                throw new AssertionError("Unselected or aliased assignment length " + length);
            }
        }
    }
}
