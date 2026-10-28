/*
 * Copyright (c) 2018, 2024, Oracle and/or its affiliates. All rights reserved.
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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

package sun.security.ec;

import sun.security.ec.point.*;
import sun.security.util.CurveDB;
import sun.security.util.ArrayUtil;
import sun.security.util.math.*;
import sun.security.util.math.intpoly.*;

import java.math.BigInteger;
import java.security.ProviderException;
import java.security.spec.ECFieldFp;
import java.security.spec.ECParameterSpec;
import java.security.spec.ECPoint;
import java.security.spec.EllipticCurve;
import java.util.Map;
import java.util.Optional;

/*
 * Elliptic curve point arithmetic for prime-order curves where a=-3.
 * Formulas are derived from "Complete addition formulas for prime order
 * elliptic curves" by Renes, Costello, and Batina.
 */
public class ECOperations {

    /*
     * An exception indicating a problem with an intermediate value produced
     * by some part of the computation. For example, the signing operation
     * will throw this exception to indicate that the r or s value is 0, and
     * that the signing operation should be tried again with a different nonce.
     */
    @SuppressWarnings("serial") // Serial version compatibility is not maintained.
    static class IntermediateValueException extends Exception {
    }

    static final Map<BigInteger, IntegerFieldModuloP> fields = Map.of(
        IntegerPolynomialP256.MODULUS, MontgomeryIntegerPolynomialP256.ONE,
        IntegerPolynomialP384.MODULUS, IntegerPolynomialP384.ONE,
        IntegerPolynomialP521.MODULUS, IntegerPolynomialP521.ONE
    );

    static final Map<BigInteger, IntegerFieldModuloP> orderFields = Map.of(
        P256OrderField.MODULUS, P256OrderField.ONE,
        P384OrderField.MODULUS, P384OrderField.ONE,
        P521OrderField.MODULUS, P521OrderField.ONE
    );

    public static Optional<ECOperations> forParameters(ECParameterSpec params) {

        EllipticCurve curve = params.getCurve();
        if (!(curve.getField() instanceof ECFieldFp primeField)) {
            return Optional.empty();
        }

        BigInteger three = BigInteger.valueOf(3);
        if (!primeField.getP().subtract(curve.getA()).equals(three)) {
            return Optional.empty();
        }
        IntegerFieldModuloP field = fields.get(primeField.getP());
        if (field == null) {
            return Optional.empty();
        }

        IntegerFieldModuloP orderField = orderFields.get(params.getOrder());
        if (orderField == null) {
            return Optional.empty();
        }

        ImmutableIntegerModuloP b = field.getElement(curve.getB());
        ECOperations ecOps = new ECOperations(b, orderField);
        return Optional.of(ecOps);
    }

    final ImmutableIntegerModuloP b;
    final SmallValue one;
    final SmallValue two;
    final SmallValue three;
    final SmallValue four;
    final ProjectivePoint.Immutable neutral;
    private final IntegerFieldModuloP orderField;

    public ECOperations(IntegerModuloP b, IntegerFieldModuloP orderField) {
        this.b = b.fixed();
        this.orderField = orderField;

        this.one = b.getField().getSmallValue(1);
        this.two = b.getField().getSmallValue(2);
        this.three = b.getField().getSmallValue(3);
        this.four = b.getField().getSmallValue(4);

        IntegerFieldModuloP field = b.getField();
        this.neutral = new ProjectivePoint.Immutable(field.get0(),
            field.get1(), field.get0());
    }

    public IntegerFieldModuloP getField() {
        return b.getField();
    }
    public IntegerFieldModuloP getOrderField() {
        return orderField;
    }

    protected ProjectivePoint.Immutable getNeutral() {
        return neutral;
    }

    public boolean isNeutral(Point p) {
        ProjectivePoint<?> pp = (ProjectivePoint<?>) p;

        IntegerModuloP z = pp.getZ();

        IntegerFieldModuloP field = z.getField();
        int byteLength = (field.getSize().bitLength() + 7) / 8;
        byte[] zBytes = z.asByteArray(byteLength);
        return allZero(zBytes);
    }

    byte[] seedToScalar(byte[] seedBytes)
        throws IntermediateValueException {

        // Produce a nonce from the seed using FIPS 186-4,section B.5.1:
        // Per-Message Secret Number Generation Using Extra Random Bits
        // or
        // Produce a scalar from the seed using FIPS 186-4, section B.4.1:
        // Key Pair Generation Using Extra Random Bits

        // To keep the implementation simple, sample in the range [0,n)
        // and throw IntermediateValueException in the (unlikely) event
        // that the result is 0.

        // Get 64 extra bits and reduce into the nonce
        int seedBits = orderField.getSize().bitLength() + 64;
        if (seedBytes.length * 8 < seedBits) {
            throw new ProviderException("Incorrect seed length: " +
            seedBytes.length * 8 + " < " + seedBits);
        }

        // input conversion only works on byte boundaries
        // clear high-order bits of last byte so they don't influence nonce
        int lastByteBits = seedBits % 8;
        if (lastByteBits != 0) {
            int lastByteIndex = seedBits / 8;
            byte mask = (byte) (0xFF >>> (8 - lastByteBits));
            seedBytes[lastByteIndex] &= mask;
        }

        int seedLength = (seedBits + 7) / 8;
        IntegerModuloP scalarElem =
            orderField.getElement(seedBytes, 0, seedLength, (byte) 0);
        int scalarLength = (orderField.getSize().bitLength() + 7) / 8;
        byte[] scalarArr = new byte[scalarLength];
        scalarElem.asByteArray(scalarArr);
        if (ECOperations.allZero(scalarArr)) {
            throw new IntermediateValueException();
        }
        return scalarArr;
    }

    /*
     * Compare all values in the array to 0 without branching on any value
     *
     */
    public static boolean allZero(byte[] arr) {
        byte acc = 0;
        for (int i = 0; i < arr.length; i++) {
            acc |= arr[i];
        }
        return acc == 0;
    }

    /**
     * Multiply an affine point by a scalar and return the result as a mutable
     * point.
     *
     * @param affineP the point
     * @param s the scalar as a little-endian array
     * @return the product
     */
    public MutablePoint multiply(AffinePoint affineP, byte[] s) {
        PointMultiplier multiplier = null;
        if (getField() instanceof IntegerMontgomeryFieldModuloP
                && affineP.equals(Secp256R1GeneratorMontgomeryMultiplier.generator)) {
            // Lazy class loading here
            multiplier =
                Secp256R1GeneratorMontgomeryMultiplier.Holder.multiplier;
        } else {
            multiplier = new DefaultMultiplier(this, affineP);
        }

        return multiplier.pointMultiply(s);
    }

    /**
     * Multiply an affine ecpoint point by a scalar and return the result as a
     * mutable point.
     *
     * @param ecPoint the point
     * @param s the scalar as a little-endian array
     * @return the product
     */
    public MutablePoint multiply(ECPoint ecPoint, byte[] s) {
        return multiply(AffinePoint.fromECPoint(ecPoint, getField()), s);
    }

    /*
     * Point double
     */
    private void setDouble(ProjectivePoint.Mutable p, MutableIntegerModuloP t0,
        MutableIntegerModuloP t1, MutableIntegerModuloP t2,
        MutableIntegerModuloP t3, MutableIntegerModuloP t4) {

        t0.setValue(p.getX()).setSquare();
        t1.setValue(p.getY()).setSquare();
        t2.setValue(p.getZ()).setSquare();
        t3.setValue(p.getX()).setProduct(p.getY());
        t4.setValue(p.getY()).setProduct(p.getZ());

        t3.setSum(t3);
        p.getZ().setProduct(p.getX());

        p.getZ().setProduct(two);

        p.getY().setValue(t2).setProduct(b);
        p.getY().setDifference(p.getZ());

        p.getY().setProduct(three);
        p.getX().setValue(t1).setDifference(p.getY());

        p.getY().setSum(t1);
        p.getY().setProduct(p.getX());
        p.getX().setProduct(t3);

        t2.setProduct(three);
        p.getZ().setProduct(b);

        p.getZ().setDifference(t2);
        p.getZ().setDifference(t0);
        p.getZ().setProduct(three);
        t0.setProduct(three);

        t0.setDifference(t2);
        t0.setProduct(p.getZ());
        p.getY().setSum(t0);

        t4.setSum(t4);
        p.getZ().setProduct(t4);

        p.getX().setDifference(p.getZ());
        p.getZ().setValue(t4).setProduct(t1);

        p.getZ().setProduct(four);

    }

    /**
     * Adds second Mutable (Projective) point to first.
     *
     * Used by ECDSAOperations. This method constructs new temporaries each time
     * it is called. For better efficiency, the (private) method that reuses
     * temporaries should be used if more than one sum will be computed.
     *
     * @param p first point and result
     * @param p2 second point to add
     */
    public void setSum(MutablePoint p, MutablePoint p2) {
        IntegerModuloP zero = p.getField().get0();
        MutableIntegerModuloP t0 = zero.mutable();
        MutableIntegerModuloP t1 = zero.mutable();
        MutableIntegerModuloP t2 = zero.mutable();
        MutableIntegerModuloP t3 = zero.mutable();
        MutableIntegerModuloP t4 = zero.mutable();

        setSum((ProjectivePoint.Mutable) p, (ProjectivePoint.Mutable) p2,
            t0, t1, t2, t3, t4);
    }

    /*
     * Mixed point addition
     */
    private void setSum(ProjectivePoint.Mutable p, AffinePoint p2,
        MutableIntegerModuloP t0, MutableIntegerModuloP t1,
        MutableIntegerModuloP t2, MutableIntegerModuloP t3,
        MutableIntegerModuloP t4) {

        t0.setValue(p.getX()).setProduct(p2.getX(false));
        t1.setValue(p.getY()).setProduct(p2.getY(false));
        t3.setValue(p2.getX(false)).setSum(p2.getY(false));
        t4.setValue(p.getX()).setSum(p.getY());
        t3.setProduct(t4);
        t4.setValue(t0).setSum(t1);

        t3.setDifference(t4);
        t4.setValue(p2.getY(false)).setProduct(p.getZ());
        t4.setSum(p.getY());

        p.getY().setValue(p2.getX(false)).setProduct(p.getZ());
        p.getY().setSum(p.getX());
        t2.setValue(p.getZ());
        p.getZ().setProduct(b);

        p.getX().setValue(p.getY()).setDifference(p.getZ());
        p.getX().setProduct(three);

        p.getZ().setValue(t1).setDifference(p.getX());
        p.getX().setSum(t1);
        p.getY().setProduct(b);

        t2.setProduct(three);
        p.getY().setDifference(t2);

        p.getY().setDifference(t0);
        p.getY().setProduct(three);

        t0.setProduct(three);
        t0.setDifference(t2);

        t1.setValue(t4).setProduct(p.getY());
        t2.setValue(t0).setProduct(p.getY());
        p.getY().setValue(p.getX()).setProduct(p.getZ());

        p.getY().setSum(t2);
        p.getX().setProduct(t3);
        p.getX().setDifference(t1);

        p.getZ().setProduct(t4);
        t3.setProduct(t0);
        p.getZ().setSum(t3);
    }

    /*
     * Projective point addition
     */
    private void setSum(ProjectivePoint.Mutable p, ProjectivePoint.Mutable p2,
        MutableIntegerModuloP t0, MutableIntegerModuloP t1,
        MutableIntegerModuloP t2, MutableIntegerModuloP t3,
        MutableIntegerModuloP t4) {

        t0.setValue(p.getX()).setProduct(p2.getX());
        t1.setValue(p.getY()).setProduct(p2.getY());
        t2.setValue(p.getZ()).setProduct(p2.getZ());

        t3.setValue(p.getX()).setSum(p.getY());
        t4.setValue(p2.getX()).setSum(p2.getY());
        t3.setProduct(t4);

        t4.setValue(t0).setSum(t1);
        t3.setDifference(t4);
        t4.setValue(p.getY()).setSum(p.getZ());

        p.getY().setValue(p2.getY()).setSum(p2.getZ());
        t4.setProduct(p.getY());
        p.getY().setValue(t1).setSum(t2);

        t4.setDifference(p.getY());
        p.getX().setSum(p.getZ());
        p.getY().setValue(p2.getX()).setSum(p2.getZ());

        p.getX().setProduct(p.getY());
        p.getY().setValue(t0).setSum(t2);
        p.getY().setAdditiveInverse().setSum(p.getX());

        p.getZ().setValue(t2).setProduct(b);
        p.getX().setValue(p.getY()).setDifference(p.getZ());

        p.getX().setProduct(three);

        p.getZ().setValue(t1).setDifference(p.getX());
        p.getX().setSum(t1);

        p.getY().setProduct(b);
        t2.setProduct(three);

        p.getY().setDifference(t2);
        p.getY().setDifference(t0);
        p.getY().setProduct(three);

        t0.setProduct(three);

        t0.setDifference(t2);
        t1.setValue(t4).setProduct(p.getY());
        t2.setValue(t0).setProduct(p.getY());

        p.getY().setValue(p.getX()).setProduct(p.getZ());
        p.getY().setSum(t2);
        p.getX().setProduct(t3);

        p.getX().setDifference(t1);
        p.getZ().setProduct(t4);

        t3.setProduct(t0);
        p.getZ().setSum(t3);
    }

    // The extra step in the Full Public key validation as described in
    // NIST SP 800-186 Appendix D.1.1.2
    public boolean checkOrder(ECPoint point) {
        BigInteger x = point.getAffineX();
        BigInteger y = point.getAffineY();

        // Verify that n Q = INFINITY. Output REJECT if verification fails.
        IntegerFieldModuloP field = this.getField();
        AffinePoint ap = new AffinePoint(field.getElement(x), field.getElement(y));
        byte[] scalar = this.orderField.getSize().toByteArray();
        ArrayUtil.reverse(scalar);
        return isNeutral(this.multiply(ap, scalar));
    }

    sealed interface PointMultiplier
        permits DefaultMultiplier, Secp256R1GeneratorMontgomeryMultiplier {
        // Multiply the point by a scalar and return the result as a mutable
        // point.  The multiplier point is specified by the implementation of
        // this interface, which could be a general EC point or EC generator
        // point.
        //
        // Multiply the ECPoint (that is specified in the implementation) by
        // a scalar and return the result as a ProjectivePoint.Mutable point.
        // The point to be multiplied can be a general EC point or the
        // generator of a named EC group.  The scalar multiplier is an integer
        // in little endian byte array representation.
        ProjectivePoint.Mutable pointMultiply(byte[] scalar);

        private static void lookup(
                ProjectivePoint.Immutable[] ips, int index,
                ProjectivePoint.Mutable result) {
            for (int i = 0; i < 16; i++) {
                int xor = index ^ i;
                int bit3 = (xor & 0x8) >>> 3;
                int bit2 = (xor & 0x4) >>> 2;
                int bit1 = (xor & 0x2) >>> 1;
                int bit0 = (xor & 0x1);
                int inverse = bit0 | bit1 | bit2 | bit3;
                int set = 1 - inverse;

                ProjectivePoint.Immutable pi = ips[i];
                result.conditionalSet(pi, set);
            }
        }
    }

    final static class DefaultMultiplier implements PointMultiplier {
        private final ECOperations ecOps;
        private final ProjectivePoint.Immutable[] pointMultiples;

        DefaultMultiplier(ECOperations ecOps, AffinePoint affineP) {
            this.ecOps = ecOps;

            // Precompute and cache point multiples
            this.pointMultiples = new ProjectivePoint.Immutable[16];

            IntegerFieldModuloP field = ecOps.getField();
            ImmutableIntegerModuloP zero = field.get0();
            // temporaries
            MutableIntegerModuloP t0 = zero.mutable();
            MutableIntegerModuloP t1 = zero.mutable();
            MutableIntegerModuloP t2 = zero.mutable();
            MutableIntegerModuloP t3 = zero.mutable();
            MutableIntegerModuloP t4 = zero.mutable();

            ProjectivePoint.Mutable ps =
                new ProjectivePoint.Mutable(field);
            ps.getY().setValue(field.get1().mutable());

            // 0P is neutral---same as initial result value
            pointMultiples[0] = ps.fixed();

            ps.setValue(affineP);
            // 1P = P
            pointMultiples[1] = ps.fixed();

            // the rest are calculated using mixed point addition
            for (int i = 2; i < 16; i++) {
                ecOps.setSum(ps, affineP, t0, t1, t2, t3, t4);
                pointMultiples[i] = ps.fixed();
            }
        }

        @Override
        public ProjectivePoint.Mutable pointMultiply(byte[] s) {
            // 4-bit windowed multiply with branchless lookup.
            // The mixed addition is faster, so it is used to construct
            // the array at the beginning of the operation.

            IntegerFieldModuloP field = ecOps.getField();
            ImmutableIntegerModuloP zero = field.get0();
            // temporaries
            MutableIntegerModuloP t0 = zero.mutable();
            MutableIntegerModuloP t1 = zero.mutable();
            MutableIntegerModuloP t2 = zero.mutable();
            MutableIntegerModuloP t3 = zero.mutable();
            MutableIntegerModuloP t4 = zero.mutable();

            ProjectivePoint.Mutable result = new ProjectivePoint.Mutable(field);
            result.getY().setValue(field.get1().mutable());
            ProjectivePoint.Mutable lookupResult = new ProjectivePoint.Mutable(field);

            for (int i = s.length - 1; i >= 0; i--) {
                double4(result, t0, t1, t2, t3, t4);

                int high = (0xFF & s[i]) >>> 4;
                PointMultiplier.lookup(pointMultiples, high, lookupResult);
                ecOps.setSum(result, lookupResult, t0, t1, t2, t3, t4);

                double4(result, t0, t1, t2, t3, t4);

                int low = 0xF & s[i];
                PointMultiplier.lookup(pointMultiples, low, lookupResult);
                ecOps.setSum(result, lookupResult, t0, t1, t2, t3, t4);
            }

            return result;
        }

        private void double4(ProjectivePoint.Mutable p,
                MutableIntegerModuloP t0, MutableIntegerModuloP t1,
                MutableIntegerModuloP t2, MutableIntegerModuloP t3,
                MutableIntegerModuloP t4) {
            for (int i = 0; i < 4; i++) {
                ecOps.setDouble(p, t0, t1, t2, t3, t4);
            }
        }
    }

    // Represents a multiplier with a larger precomputed table. Intended to be
    // used for Basepoint multiplication
    final static class Secp256R1GeneratorMontgomeryMultiplier
        implements PointMultiplier {
        private static final ECOperations secp256r1Ops = new ECOperations(
            MontgomeryIntegerPolynomialP256.ONE.getElement(
                    CurveDB.P_256.getCurve().getB()), P256OrderField.ONE);
        public static final AffinePoint generator = AffinePoint.fromECPoint(
            CurveDB.P_256.getGenerator(), secp256r1Ops.getField());

        // Pre-computed table to speed up the point multiplication.
        //
        // This is a 4x16 array of ProjectivePoint.Immutable elements.
        // The first row contains the following multiples of the
        // generator.
        //
        // index   |    point
        // --------+----------------
        // 0x0000  | 0G
        // 0x0001  | 1G
        // 0x0002  | (2^64)G
        // 0x0003  | (2^64 + 1)G
        // 0x0004  | 2^128G
        // 0x0005  | (2^128 + 1)G
        // 0x0006  | (2^128 + 2^64)G
        // 0x0007  | (2^128 + 2^64 + 1)G
        // 0x0008  | 2^192G
        // 0x0009  | (2^192 + 1)G
        // 0x000A  | (2^192 + 2^64)G
        // 0x000B  | (2^192 + 2^64 + 1)G
        // 0x000C  | (2^192 + 2^128)G
        // 0x000D  | (2^192 + 2^128 + 1)G
        // 0x000E  | (2^192 + 2^128 + 2^64)G
        // 0x000F  | (2^192 + 2^128 + 2^64 + 1)G
        //
        // For the other 3 rows, points[i][j] = 2^16 * (points[i-1][j].
        //
        // The points other than 0G are listed as the hex strings of their
        // affine x and y coordinates, row by row.  They are fixed by the
        // curve, and computing them with 60 scalar multiplications when the
        // class is initialized made the first use of secp256r1 slow.
        // Secp256R1GeneratorTable.java recomputes them with BigInteger
        // arithmetic.
        private static final String[] TABLE = {
            // row 0, index 1 to 15
            "6b17d1f2e12c4247f8bce6e563a440f277037d812deb33a0f4a13945d898c296",
            "4fe342e2fe1a7f9b8ee7eb4a7c0f9e162bce33576b315ececbb6406837bf51f5",
            "0fa822bc2811aaa58492592e326e25de29493baaad651f7e90e75cb48e14db63",
            "bff44ae8f5dba80d6f4ad4bcb3df188b34b1a65050fe82f5e41124545f462ee7",
            "300a4bbc89d6726fb257c0de95e02789e96c98fd0d35f1fa93391ce2097992af",
            "72aac7e0d09b46447f1ddb25ff1e3c6f5bb1eeada9d806a5aa54a291c08127a0",
            "447d739beedb5e67fb982fd588c6766efc35ff7dc297eac357c84fc9d789bd85",
            "2d4825ab834131eee12e9d953a4aaff73d349b95a7fae5000c7e33c972e25b32",
            "ef9519328a9c72ffddc6068bb91dfc60ef7fbd2b1a0a11b713949c932a1d367f",
            "611e9fc37dbb2c9bc1ee9807022c219c23183b0895ca1740196035a77376d8a8",
            "550663797b51f5d87dea6482e11238bf2936df5ec6c9bc36cae2b1920b57f4bc",
            "157164848aecb8510afa40018d9d50e59fb3d576dbdefbe144ffe216348a964c",
            "eb5d7745b21141eaa2e8f483f43e43917ccd84e70d715f26e48ecafffc5cde01",
            "eafd72ebdbecc17b0990e6a158006cee85f22cfe2844b645cac917e2731a3479",
            "a6d39677a78492762736ff8344315fc596439591a3c6b94a6cf20ffb313728be",
            "674f84749b0b881666b8babd2d27ecdf824a920c2284059bf2bab833c357f5f4",
            "4e769e7672c9ddad31855f7db8c7fedb74e02f080203a56b2df48c04677c8a3e",
            "42b99082de8306631ec0057206947281fb9ae16f3b9122a5a4c36165b824bbb0",
            "78878ef61c6ce04d7fdc1ca008a1c478d1f89e799c0ce1316ef95150dda868b9",
            "b6cb3f5d7b72c321de53142c12309def6ace570ebde08d4f9c62b9121fe0d976",
            "0c88bc4d716b1287595c5220812ffcae5b82dd5bd54fb4967f991ed2c31a3573",
            "dd5ddea3f3901dc618d1b5b39c04e6aa7c8181f4df2564f33a57bf635f48aca8",
            "68f344af6b317466efe0a423083e49f343a0a28c42ba792fe96a79fb3e72ad0c",
            "31b9c405f8540a20604ed93c24d67ff3668bfc2271f5c626cdfe17db3fb24d4a",
            "4052bf4b6f461db9663c62c3edbad7a00d1a10144ec39c28d36b4789a2582e7f",
            "fecf4d5190b0fc61862be6bd71d70cc8e724f33999bfcc5b235a27c3188d25eb",
            "1eddbae2c802e41a123202a8f62bff7aafdf5cc08526a7a474346c10a1d4cfac",
            "43104d86560ebcfc0c45f45273db33a036e06b7e4c7019178fa0af2dd603f844",
            "b48e26b484f7a21c0a4a46fb6aaf363a66b0de3225c4744b9615b5110d1d78e5",
            "fac015404d4d3dab64131bcdfed6f668c004e4048b7b0f9806ebb0f621a01b2d",
            // row 1, index 1 to 15
            "a018366f4e91e90d8e5c643340e586b4714ab749c9052a0503e8465c6eade3c4",
            "e2bbec1714110b167c6ce578349d8369d5f7284e44614f37f45c42026b26e8d0",
            "6e29f959be28c47fae5abca185755c08346924376f5412c1d4d3d2de4351964c",
            "34565d9f500f32f65052ec6cc184246def640c527a0bfb63118824bd563fd88f",
            "a7e595bbd2b50109d5384a12225bffb2676762cff651cfe773286f8874de97ca",
            "422808c9a8e763aa59129f09c3b131fbf79000543f1a756ba006f7567b6f5aa0",
            "f81f5be38b8ca534e8a5c7938d18df9e0d238966f74e1a6b826fadc0523b716d",
            "dc7f49329c1f06df1d56d29d380e0328660758503a878330464002f512632401",
            "00d4af7eac5d29ddabc15a6c479917a243d268a14856bc8df5d5c53f842817c3",
            "dbd77f5ce8a63f469910ee9976bb80fa75216556ad504fe4269912f5768356e1",
            "42ad3ab519813e590674cf523f7beb8b10aa5c5d4f11c6596cc15b4661c64fa8",
            "516f65927695db98c7db6916991b4af72b7b716af7de2ab614ba71a068b1922b",
            "4882b62540a23c8104e63a32714b76015e020053e3514c6100e3c2516c316ae2",
            "1cf38b40f5a348d3ef73184d2b86633b38cafd92f6caf4bab1f8911f7845a444",
            "55d5398d1666432b557582c99ad534580101fb06a050e62c320f09c3839bb85f",
            "576e229049ff8e2d059c6a9e8ebaa72ad90d6a7f1833d9e1f7f631184fed936f",
            "3443b9a6de92d2732b7b908858261bc9c78a312ae6b6d4022aed7e42431ba5a4",
            "0dbab95d9877b893989ca058bd6aa9377460c6bb330dde0a0fa7424598f2648b",
            "8c2661f75f7f75cd844e7cb5bb35c5cd78645e40db8dffcf15fc6f87748eccd0",
            "34a6e034c697e87f12621ce31cf614cc43af528aee18ad77d1a245a044134b3c",
            "bc7e526d52dcd481aabd8bc0101dcf62aec4184fdb83b8a335732d03c35c06a8",
            "c497cc3aa575dc2510a56e757b56139057920783bad8ca1a5b0f3dff4aed9e52",
            "d8a9497a648bceda2dbd3409454f3152f5555db5c0fd5ee07bf4e37cb0c31e5e",
            "8ce7c1d46ad513b64f0f2fe19124878be3c5e35451c5a7915f3e3ef9989f1a2b",
            "ae0f0eba18174f115178cca528630357499f2401504baaacf74097d525e09d44",
            "eab80a02e86c3b37bb221d6328f23b2c6981990da9b3e591c1e0ee67b844b6f3",
            "9afc07597dde08127049f63ef0b663a7a1df80800d279aaf56212b36999bca22",
            "6c9f1ef57df967ff54e14cdfc822d8a8674599c8dd3d3c44aebce0bf0b39cc81",
            "e6ac67b1996218b7144ebc2de747aa83db46ae4d68a84bf098fbea5ee72dd53a",
            "e91b85063e7ef395f3b563ff850d9b6856484a26728e5d164ed6d73f7e384c3c",
            // row 2, index 1 to 15
            "7fe36b40af22af8921656b32262c71da1ab919365c65dfb63a5a9e22185a5943",
            "e697d45825b636249f09f40407dca6f174b3d5867b8af212d50d152c699ca101",
            "4a5b506612a677a657880b3a18a2e902e9a521b074ca0141a84aa9397512218e",
            "eb13461ceac089f1c42604fbe1627d40626db15419e26d9d0beada7a4c4f3840",
            "0781b8291c6a220ac342967aa815c8575e52c4144103ecbcf9faed0927a43281",
            "690cde8df015159397b2a14f1291643488f80eeee54a05e35a8343ceeac55f80",
            "8a535f566ec73617f5622df4373713269e4c35874afdf43aaee9c75df7f82f2a",
            "0455c08468b08bd737e02819085a92bfcde533864c8c7669c5f9a0ac223094b7",
            "06bada7ab77f82765050a949b6cdc279f9a4bf62876dc4440c0a6e2c9477b5d9",
            "5b476dfd0e6cb18a427d49101366eb70debd8a4b7ea1070fc8b4aed1ea48dac9",
            "3e29864e8a2ec90829a751b1ae23c5d84d54606812d66f3b7c5c3e44278c340a",
            "239b90ea3dc31e7e1f150e68e322d1edad1744c4765bd780142d2a6626dbb850",
            "820f4dd949f72ff7dbcab759f8862ed4305dde6709776f8e78c416527a53322a",
            "140406ec783a05ec1b481b1b215c14d375be5d937b4e8cc46cc544a62b5debd4",
            "68f6b8542783dfeeeb5b06e70ce08ffefd75f3fa01876bd86a703f10e895df07",
            "cbe1feba92e40ce6fbc8044dfda45028cf5293d2f310bf7f90c76f8a78712655",
            "d0b2f94d2f420109230f729f2250e927fc82ef0b6acea274e998ceea4396e4c1",
            "971459828b0719e57db2636658954e7a10b838f8624c3b454305adddb38d4966",
            "961610004a866abac2d5cba4f234068757f2929e53d0b8764bd6b72623369fc9",
            "7acb9fadcee75e442cf1f2438fe5131c69ab197d92ddcb2449997bcd2e407a5e",
            "24eb9acca333bf5ba60d880f6f75aaeaf57f0c917aea685b254e839423d2d4c0",
            "69f891c5acd079cc743125f88bac4c4dfeef9341c51a6b4fe3de4ccb1cda5dea",
            "e51f547c5972a107b422d1e7bd6f85147ed031a0e45c2258eee44b35702476b5",
            "1c309a2b25bb1387a62f98b3a9fe9a068ca922ee097c184ea25bcd6fc9cf343d",
            "20b87b8aa2c4e503c504977708011828b00148833472c98e9295dbeb1967c459",
            "f5c6fa49919776be0d11adef5f69a0441bd539338fe582dd3063175de057c277",
            "1ed7d1b9332010b9a454c3fad83faa563876cba1102fad5f8c944e760fd59e11",
            "3a2b03f03217257a52b520f0eb6a2a2405e4d0dcac0cd344a1011a270024b889",
            "15fee545c78dd9f6fc7d229ca0058c3bf330240db58d5a62f20fc2afdf1d043d",
            "4ab5b6b2b8753f81557d9f49461210fb41ef80e5d046ac04501e82885bc98cda",
            // row 3, index 1 to 15
            "d8de765227b7873763de93c34d8b561cf73a835fbb8e9c71c2ebaf8017e55104",
            "2fd29465be13f2d15c4c628ad1dcf924c2f73fce1940db1b2a02ef80e52e08cd",
            "224a02299eecc99a0634a786f116445779c3bb5b5501d267f0699bf9e2f2b734",
            "fa41a8d29b6d22b4149a08ad871d7fff07b704b673c7afd0840f585491ec7fdf",
            "c6b5231e47ceece48fe4c3d73e35452557be2b2fe102ce5f40b20058e47d3d41",
            "3a88c645bbfd94d7da3c0b66592e0b4e3342e975c9540822bf0b583419d1eb09",
            "20e118564880c79cb927e3501cf2a53f030b86e3cecac60728cf1ab99076f57b",
            "ff67b352ac437ef731bdc3e3fb6de9979fe0dc9b40e1b71e8583bedbada7afe6",
            "46e428b7630ca9da169bd3838a6f0c2d39329d4f69989e5b1acea0eb92a12fef",
            "659711144082017be35316adfa1ed69a5729c0769934d26f4f96219ccf3f9e41",
            "582c073a9475b9aef23cd64013e41417327c664966d4f95fc5916f32fdfc3516",
            "272261361d417c423da2d275e9f826d0021ee1e4be2bff82512f013595f3d3a4",
            "c851cb2431d78d976dd4865d191ccf2a75c5235e085fece4093710e0117b5234",
            "85ce4d7bcaca2b126f2b80def6166978e06fb62bf1f176b84cd24915b2179716",
            "f50b99b7468810b73a5a7dcf08bd17915c08966a2ecc1e07606304b1a44e8de3",
            "e2b5061e55f18f0c8789973a2dedcebbe975f18d21721e854a3f3ba6db7f3588",
            "06ed1148f552387f5e370ebfe9cae5b47877f34c12b6507253b738547310119e",
            "4dcc18734d95facb46203a232a00d72c88959a9e561ffb87f14acc8fc463d605",
            "faa431ba8697c2259c13c0411b333132c83674f2910bdffad7defcecace5e1ed",
            "157c8c0cc04255a835b48788366e420ab3dc25bd5d81ccacbaf105116b1df7a3",
            "4eb12668c612cc1951646c94504e2e279579780b691358b2e942fc34805b4a7c",
            "04b0737c070c7ee99cf18a95b59af49e74b25a526b55878f3caf7c93460bc7cf",
            "2f7a7ea99316d10e34fb31d424e659a9258806fedba9f3717920dd8828449520",
            "54124cf99388d610c924d45058bd9f775bb75386f20127be9dfcaa8abb952fd0",
            "6caae7760efe617d55313f53ca86aa1405731a37d6a50ca0dce4b2b8c1aa3e8e",
            "b6a5f5b439321572ac133cc678b41283546a652a52c8087f5d49af6d06a0378a",
            "78a0664a4f2434a2fc172d77e7b989b0377164c27a9591d589b0d1bc954f0d1b",
            "01526062e6be26abf2300a53e21d680f4997bae1f4c495d66811046b0d3c62f4",
            "1e861bc1972202beede61ee9473f7b1194c2a6dc9619917be294af04b0991313",
            "5c7126b9f8fe284a5fc453c2c3291d1b22f6e128649b84ba0267e0c8e5e0f368"
        };

        // The multiplier, with its table, is created when the generator is
        // first multiplied, not when another point is compared to it
        static final class Holder {
            static final PointMultiplier multiplier =
                new Secp256R1GeneratorMontgomeryMultiplier();
        }

        private final ImmutableIntegerModuloP zero;
        private final ImmutableIntegerModuloP one;
        private final ProjectivePoint.Immutable[][] points;

        private Secp256R1GeneratorMontgomeryMultiplier() {
            IntegerFieldModuloP field = MontgomeryIntegerPolynomialP256.ONE;
            zero = field.get0();
            one = field.get1();

            points = new ProjectivePoint.Immutable[4][16];
            for (int d = 0; d < 4; d++) {
                points[d][0] = new ProjectivePoint.Immutable(
                    zero.fixed(), one.fixed(), zero.fixed());
                for (int w = 1; w < 16; w++) {
                    int i = (d * 15 + w - 1) * 2;
                    AffinePoint p = AffinePoint.fromECPoint(
                        new ECPoint(new BigInteger(TABLE[i], 16),
                                    new BigInteger(TABLE[i + 1], 16)),
                        field);
                    points[d][w] = new ProjectivePoint.Immutable(
                        p.getX(false), p.getY(false), one.fixed());
                }
            }
        }

        public ProjectivePoint.Mutable pointMultiply(byte[] s) {
            MutableIntegerModuloP t0 = zero.mutable();
            MutableIntegerModuloP t1 = zero.mutable();
            MutableIntegerModuloP t2 = zero.mutable();
            MutableIntegerModuloP t3 = zero.mutable();
            MutableIntegerModuloP t4 = zero.mutable();

            ProjectivePoint.Mutable d = new ProjectivePoint.Mutable(
                    zero.mutable(),
                    one.mutable(),
                    zero.mutable());
            ProjectivePoint.Mutable r = d.mutable();
            for (int i = 15; i >= 0; i--) {
                secp256r1Ops.setDouble(d, t0, t1, t2, t3, t4);
                for (int j = 3; j >= 0; j--) {
                    int pos = i + j * 16;
                    int index = (bit(s, pos + 192) << 3) |
                                (bit(s, pos + 128) << 2) |
                                (bit(s, pos +  64) << 1) |
                                    bit(s, pos);

                    PointMultiplier.lookup(points[j], index, r);
                    secp256r1Ops.setSum(d, r, t0, t1, t2, t3, t4);
                }
            }

            return d;
        }

        private static int bit(byte[] k, int i) {
            return (k[i >> 3] >> (i & 0x07)) & 0x01;
        }
    }
}
