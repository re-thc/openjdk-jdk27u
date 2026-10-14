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

/*
 * @test
 * @summary The table of multiples of the secp256r1 generator that
 *          ECOperations uses must agree with plain affine arithmetic
 * @modules java.base/sun.security.ec java.base/sun.security.ec.point
 * @run main Secp256R1GeneratorTable
 */

import java.math.BigInteger;
import java.security.AlgorithmParameters;
import java.security.spec.ECGenParameterSpec;
import java.security.spec.ECParameterSpec;
import java.security.spec.ECPoint;
import java.util.Random;

import sun.security.ec.ECOperations;

public class Secp256R1GeneratorTable {

    private static BigInteger p;
    private static BigInteger a;

    // returns null for the point at infinity
    private static ECPoint add(ECPoint u, ECPoint v) {
        if (u == null) {
            return v;
        }
        if (v == null) {
            return u;
        }
        BigInteger lambda;
        if (u.getAffineX().equals(v.getAffineX())) {
            if (!u.getAffineY().equals(v.getAffineY())
                    || u.getAffineY().signum() == 0) {
                return null;
            }
            lambda = u.getAffineX().pow(2).multiply(BigInteger.valueOf(3))
                    .add(a).multiply(u.getAffineY().shiftLeft(1)
                    .modInverse(p)).mod(p);
        } else {
            lambda = v.getAffineY().subtract(u.getAffineY())
                    .multiply(v.getAffineX().subtract(u.getAffineX())
                    .modInverse(p)).mod(p);
        }
        BigInteger x = lambda.pow(2).subtract(u.getAffineX())
                .subtract(v.getAffineX()).mod(p);
        BigInteger y = lambda.multiply(u.getAffineX().subtract(x))
                .subtract(u.getAffineY()).mod(p);
        return new ECPoint(x, y);
    }

    private static ECPoint multiply(BigInteger k, ECPoint g) {
        ECPoint r = null;
        for (int i = k.bitLength() - 1; i >= 0; i--) {
            r = add(r, r);
            if (k.testBit(i)) {
                r = add(r, g);
            }
        }
        return r;
    }

    // the scalar as the 32 byte little endian array that ECOperations takes
    private static byte[] littleEndian(BigInteger k) {
        byte[] s = new byte[32];
        byte[] b = k.toByteArray();
        for (int i = 0; i < b.length && i < s.length; i++) {
            s[i] = b[b.length - 1 - i];
        }
        return s;
    }

    private static void check(ECOperations ops, ECParameterSpec params,
            BigInteger k) {
        ECPoint expected = multiply(k.mod(params.getOrder()),
                params.getGenerator());
        ECPoint actual = ops.multiply(params.getGenerator(), littleEndian(k))
                .asAffine().toECPoint();
        if (!expected.equals(actual)) {
            throw new RuntimeException("Wrong multiple of the generator for "
                    + k.toString(16) + ": expected (" + expected.getAffineX()
                    .toString(16) + ", " + expected.getAffineY().toString(16)
                    + "), got (" + actual.getAffineX().toString(16) + ", "
                    + actual.getAffineY().toString(16) + ")");
        }
    }

    public static void main(String[] args) throws Exception {
        AlgorithmParameters ap = AlgorithmParameters.getInstance("EC");
        ap.init(new ECGenParameterSpec("secp256r1"));
        ECParameterSpec params = ap.getParameterSpec(ECParameterSpec.class);
        p = new BigInteger("FFFFFFFF00000001000000000000000000000000"
                + "FFFFFFFFFFFFFFFFFFFFFFFF", 16);
        a = p.subtract(BigInteger.valueOf(3));
        ECOperations ops = ECOperations.forParameters(params).get();

        // Row d and index w of the table is the multiple that a scalar with
        // only the bits of w at 2^64 steps, shifted by 16 * d bits, selects.
        int count = 0;
        for (int d = 0; d < 4; d++) {
            for (int w = 1; w < 16; w++) {
                BigInteger k = BigInteger.ZERO;
                for (int bit = 0; bit < 4; bit++) {
                    if ((w & (1 << bit)) != 0) {
                        k = k.setBit(64 * bit);
                    }
                }
                check(ops, params, k.shiftLeft(16 * d));
                count++;
            }
        }

        // all bits set, the order minus one, and scalars that use every
        // entry of the table several times
        BigInteger n = params.getOrder();
        check(ops, params, BigInteger.ONE);
        check(ops, params, BigInteger.TWO.pow(256).subtract(BigInteger.ONE));
        check(ops, params, n.subtract(BigInteger.ONE));
        check(ops, params, n.add(BigInteger.TWO));
        Random random = new Random(0x5ec9256L);
        for (int i = 0; i < 40; i++) {
            check(ops, params, new BigInteger(256, random));
        }
        System.out.println("Checked " + count + " table entries");
    }
}
