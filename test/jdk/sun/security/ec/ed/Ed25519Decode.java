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
 * @summary Check Ed25519 square-root correction and generic-field decoding
 * @library /sun/security/util/math
 * @modules java.base/sun.security.ec.ed:+open
 *          java.base/sun.security.ec.point
 *          java.base/sun.security.util.math
 *          java.base/sun.security.util.math.intpoly
 * @build BigIntegerModuloP
 * @run main/othervm Ed25519Decode
 * @run main/othervm -Xint Ed25519Decode
 */

import java.lang.reflect.Field;
import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.Signature;
import java.security.spec.EdECPrivateKeySpec;
import java.security.spec.EdECPublicKeySpec;
import java.security.spec.EdECPoint;
import java.security.spec.NamedParameterSpec;
import java.util.Arrays;
import java.util.HexFormat;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;

import sun.security.ec.ed.Ed25519Operations;
import sun.security.ec.ed.EdDSAOperations;
import sun.security.ec.ed.EdDSAParameters;
import sun.security.ec.point.AffinePoint;
import sun.security.util.math.IntegerFieldModuloP;
import sun.security.util.math.intpoly.IntegerPolynomial25519;

public class Ed25519Decode {
    private static final BigInteger P = BigInteger.ONE.shiftLeft(255)
        .subtract(BigInteger.valueOf(19));
    private static final BigInteger ROOT = new BigInteger(
        "2b8324804fc1df0b2b4d00993dfbd7a72f431806ad2fe478c4ee1b274a0ea0b0", 16);

    public static void main(String[] args) throws Exception {
        // Also distinguish this root from its negative: both square to -1.
        check(ROOT.equals(BigInteger.TWO.modPow(P.subtract(BigInteger.ONE)
            .shiftRight(2), P)), "exact power");
        check(ROOT.multiply(ROOT).mod(P).equals(P.subtract(BigInteger.ONE)),
            "square root of -1");
        concurrentFirstUse();
        testDecodeComparison();

        for (int p : new int[] {13, 29, 37}) {
            BigInteger prime = BigInteger.valueOf(p);
            for (int d = 2; d < p; d++) {
                if (nonSquare(BigInteger.valueOf(d), prime)) {
                    testCurve(new BigIntegerModuloP(prime),
                        BigInteger.valueOf(d), p);
                }
            }
        }
        // A different modulus with the same bit length must use the fallback.
        BigInteger other = P.subtract(BigInteger.valueOf(1000));
        do {
            other = other.nextProbablePrime();
        } while (!other.mod(BigInteger.valueOf(8)).equals(BigInteger.valueOf(5)));
        check(other.bitLength() == P.bitLength() && !other.equals(P),
            "different 255-bit prime");
        testCurve(new BigIntegerModuloP(other), BigInteger.TWO, 32);
        // The correction depends on the field, not on the curve coefficient.
        for (int d = 2, curves = 0; curves < 3; d++) {
            if (nonSquare(BigInteger.valueOf(d), P)) {
                testCurve(IntegerPolynomial25519.ONE, BigInteger.valueOf(d), 32);
                testCurve(new BigIntegerModuloP(P), BigInteger.valueOf(d), 16);
                curves++;
            }
        }
        testEncodedPoints();
        testSignatures();
    }

    private static void concurrentFirstUse() throws Exception {
        IntegerFieldModuloP field = IntegerPolynomial25519.ONE;
        var start = new CountDownLatch(1);
        try (var pool = Executors.newFixedThreadPool(4)) {
            var jobs = new java.util.ArrayList<java.util.concurrent.Future<?>>();
            for (int t = 0; t < 4; t++) {
                jobs.add(pool.submit(() -> {
                    start.await();
                    var ops = new Ed25519Operations(field.getElement(BigInteger.TWO),
                        BigInteger.ZERO, BigInteger.ONE);
                    // y = 0 always takes the correction branch.
                    for (int i = 0; i < 32; i++) {
                        AffinePoint point = ops.decodeAffinePoint(
                            InvalidKeyException::new, 0, field.get0());
                        check(point.getX().asBigInteger().equals(ROOT),
                            "concurrent correction");
                    }
                    Field constant = Class.forName(
                        "sun.security.ec.ed.Ed25519Operations$Ed25519Constants")
                        .getDeclaredField("SQRT_MINUS_ONE");
                    constant.setAccessible(true);
                    check(ROOT.equals(constant.get(null)), "stored constant");
                    testSignatures();
                    return null;
                }));
            }
            start.countDown();
            for (var job : jobs) {
                job.get();
            }
        }
    }

    private static boolean nonSquare(BigInteger value, BigInteger p) {
        return value.modPow(p.subtract(BigInteger.ONE).shiftRight(1), p)
            .equals(p.subtract(BigInteger.ONE));
    }

    private static void testCurve(IntegerFieldModuloP field, BigInteger d,
                                  int count) throws Exception {
        BigInteger p = field.getSize();
        var ops = new Ed25519Operations(field.getElement(d),
            BigInteger.ZERO, BigInteger.ONE);
        int corrections = 0;
        for (int i = 0; i < count; i++) {
            BigInteger y = BigInteger.valueOf(i);
            BigInteger u = y.multiply(y).subtract(BigInteger.ONE).mod(p);
            BigInteger v = d.multiply(y.multiply(y)).add(BigInteger.ONE).mod(p);
            BigInteger ratio = u.multiply(v.modInverse(p)).mod(p);
            // Independent square-root algorithm for primes congruent to 5 mod 8.
            BigInteger root = ratio.modPow(p.add(BigInteger.valueOf(3))
                .shiftRight(3), p);
            if (!root.multiply(root).mod(p).equals(ratio)) {
                root = root.multiply(BigInteger.TWO.modPow(
                    p.subtract(BigInteger.ONE).shiftRight(2), p)).mod(p);
            }
            boolean square = root.multiply(root).mod(p).equals(ratio);
            // Check that every tested field exercises the affected branch.
            BigInteger trial = u.multiply(v.modPow(BigInteger.valueOf(3), p))
                .multiply(u.multiply(v.modPow(BigInteger.valueOf(7), p))
                    .modPow(p.subtract(BigInteger.valueOf(5)).shiftRight(3), p))
                .mod(p);
            if (u.signum() != 0 && v.multiply(trial.multiply(trial)).mod(p)
                    .equals(u.negate().mod(p))) {
                corrections++;
            }
            for (int sign = 0; sign < 2; sign++) {
                boolean valid = square && (root.signum() != 0 || sign == 0);
                try {
                    AffinePoint point = ops.decodeAffinePoint(
                        InvalidKeyException::new, sign, field.getElement(y));
                    check(valid, "accepted nonsquare or zero with odd sign");
                    BigInteger expected = root.testBit(0) == (sign == 1)
                        ? root : p.subtract(root).mod(p);
                    // BigIntegerModuloP's mutable inverse may be unreduced.
                    check(point.getX().asBigInteger().mod(p).equals(expected),
                        "wrong root for p=" + p + ", d=" + d + ", y=" + y);
                    check(point.getY().asBigInteger().equals(y), "changed y");
                } catch (InvalidKeyException e) {
                    check(!valid && e.getMessage().equals("Invalid point"),
                        "unexpected rejection");
                }
            }
        }
        check(corrections > 0, "correction branch not exercised");
    }

    private static void testEncodedPoints() throws Exception {
        var params = EdDSAParameters.get(InvalidKeyException::new,
            NamedParameterSpec.ED25519);
        var ops = new EdDSAOperations(params);
        testCurve(params.getField(), params.getD().asBigInteger(), 64);
        for (int sign = 0; sign < 2; sign++) {
            for (int y = 0; y < 32; y++) {
                var point = new EdECPoint(sign == 1, BigInteger.valueOf(y));
                byte[] encoded = encode(point);
                byte[] saved = encoded.clone();
                compareDecodings(
                    () -> ops.decodeAffinePoint(InvalidKeyException::new, encoded),
                    () -> ops.decodeAffinePoint(InvalidKeyException::new, point));
                check(Arrays.equals(encoded, saved), "input modified");
            }
        }
        for (int length : new int[] {0, 1, 31, 33}) {
            reject(ops, new byte[length], "incorrect length");
        }
        for (int sign = 0; sign < 2; sign++) {
            for (BigInteger y = P; y.bitLength() <= 255; y = y.add(BigInteger.ONE)) {
                reject(ops, encode(new EdECPoint(sign == 1, y)),
                    "y value is too large");
            }
        }
        reject(ops, encode(new EdECPoint(true, BigInteger.ONE)), "Invalid point");
        reject(ops, encode(new EdECPoint(true, P.subtract(BigInteger.ONE))),
            "Invalid point");
        reject(ops, HexFormat.of().parseHex(
            "d85a980182b10ac7d54bfed3c964073a0ee172f3daa62325af021a68f707511a"),
            "Invalid point");
    }

    @FunctionalInterface
    private interface Decoder {
        AffinePoint decode() throws InvalidKeyException;
    }

    private static void compareDecodings(Decoder bytes, Decoder point)
            throws InvalidKeyException {
        AffinePoint actual;
        try {
            actual = bytes.decode();
        } catch (InvalidKeyException e) {
            try {
                point.decode();
            } catch (InvalidKeyException expected) {
                check(e.getMessage().equals(expected.getMessage()),
                    "different rejection");
                return;
            }
            throw new RuntimeException("inconsistent rejection");
        }
        // An exception here must not be classified as a byte-decode rejection.
        check(actual.equals(point.decode()), "decoding mismatch");
    }

    private static void testDecodeComparison() throws InvalidKeyException {
        IntegerFieldModuloP field = IntegerPolynomial25519.ONE;
        AffinePoint accepted = new AffinePoint(field.get0(), field.get1());
        Decoder accept = () -> accepted;
        InvalidKeyException rejection = new InvalidKeyException("Invalid point");
        Decoder reject = () -> { throw rejection; };
        compareDecodings(accept, accept);
        compareDecodings(reject, reject);

        boolean detected = false;
        try {
            compareDecodings(accept, reject);
        } catch (InvalidKeyException expected) {
            check(expected == rejection, "wrong point-decode failure");
            detected = true;
        }
        check(detected, "accepted bytes but rejected point was not detected");

        detected = false;
        try {
            compareDecodings(reject, accept);
        } catch (RuntimeException expected) {
            check(expected.getMessage().equals("inconsistent rejection"),
                "wrong byte-decode failure");
            detected = true;
        }
        check(detected, "rejected bytes but accepted point was not detected");
    }

    private static byte[] encode(EdECPoint point) {
        byte[] bytes = new byte[32];
        BigInteger y = point.getY();
        for (int i = 0; i < bytes.length; i++) {
            bytes[i] = y.byteValue();
            y = y.shiftRight(8);
        }
        bytes[31] |= (byte) (point.isXOdd() ? 0x80 : 0);
        return bytes;
    }

    private static void reject(EdDSAOperations ops, byte[] encoded,
                               String message) throws Exception {
        try {
            ops.decodeAffinePoint(InvalidKeyException::new, encoded);
            throw new RuntimeException("accepted invalid encoding");
        } catch (InvalidKeyException e) {
            check(e.getMessage().equals(message), "wrong rejection");
        }
    }

    private static void testSignatures() throws Exception {
        // RFC 8032, section 7.1, TEST 1.
        HexFormat hex = HexFormat.of();
        byte[] seed = hex.parseHex(
            "9d61b19deffd5a60ba844af492ec2cc44449c5697b326919703bac031cae7f60");
        byte[] publicBytes = hex.parseHex(
            "d75a980182b10ab7d54bfed3c964073a0ee172f3daa62325af021a68f707511a");
        byte[] expected = hex.parseHex(
            "e5564300c360ac729086e2cc806e828a84877f1eb8e5d974d873e06522490155"
          + "5fb8821590a33bacc61e39701cf9b46bd25bf5f0595bbe24655141438e7a100b");
        var params = EdDSAParameters.get(InvalidKeyException::new,
            NamedParameterSpec.ED25519);
        var ops = new EdDSAOperations(params);
        AffinePoint point = ops.decodeAffinePoint(InvalidKeyException::new, publicBytes);
        var factory = KeyFactory.getInstance("Ed25519", "SunEC");
        var privateKey = factory.generatePrivate(new EdECPrivateKeySpec(
            NamedParameterSpec.ED25519, seed));
        var publicKey = factory.generatePublic(new EdECPublicKeySpec(
            NamedParameterSpec.ED25519, new EdECPoint(
                point.getX().asBigInteger().testBit(0), point.getY().asBigInteger())));
        Signature signer = Signature.getInstance("Ed25519", "SunEC");
        Signature verifier = Signature.getInstance("Ed25519", "SunEC");
        signer.initSign(privateKey);
        verifier.initVerify(publicKey);
        for (int i = 0; i < 16; i++) {
            check(Arrays.equals(signer.sign(), expected), "RFC signature");
            check(verifier.verify(expected), "RFC verification");
            byte[] bad = expected.clone();
            bad[63] ^= 1;
            check(!verifier.verify(bad), "mutated signature accepted");
            verifier.initVerify(publicKey);
        }
    }

    private static void check(boolean condition, String message) {
        if (!condition) {
            throw new RuntimeException(message);
        }
    }
}
