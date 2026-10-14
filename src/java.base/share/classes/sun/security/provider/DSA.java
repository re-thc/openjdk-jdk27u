/*
 * Copyright (c) 1996, 2023, Oracle and/or its affiliates. All rights reserved.
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

package sun.security.provider;

import java.io.*;
import java.util.*;
import java.math.BigInteger;
import java.nio.ByteBuffer;

import java.security.*;
import java.security.interfaces.*;
import java.security.spec.*;

import sun.security.util.Debug;
import sun.security.util.DerValue;
import sun.security.util.DerInputStream;

/**
 * The Digital Signature Standard (using the Digital Signature
 * Algorithm), as described in fips186-3 of the National Institute of
 * Standards and Technology (NIST), using SHA digest algorithms
 * from FIPS180-3.
 *
 * This file contains the signature implementation for the
 * SHA1withDSA (DSS), SHA224withDSA, SHA256withDSA, SHA384withDSA,
 * SHA512withDSA, SHA3-224withDSA, SHA3-256withDSA, SHA3-384withDSA,
 * SHA3-512withDSA.
 *
 * Only verification is supported: DSA signatures are still found in
 * signed JARs and certificate chains, but new ones should not be made.
 *
 * In addition, IEEE P1363 signature format is supported. The
 * corresponding implementation is registered under <sig>inP1363Format,
 * e.g. SHA256withDSAinP1363Format.
 *
 * @author Benjamin Renaud
 *
 * @since   1.1
 *
 * @see DSAPublicKey
 * @see DSAPrivateKey
 */
abstract class DSA extends SignatureSpi {

    /* Are we debugging? */
    private static final boolean debug = false;

    /* The parameter object */
    private DSAParams params;

    /* algorithm parameters */
    private BigInteger presetP, presetQ, presetG;

    /* The public key, if any */
    private BigInteger presetY;

    /* The message digest object used */
    private final MessageDigest md;

    /* The format. true for the IEEE P1363 format. false (default) for ASN.1 */
    private final boolean p1363Format;

    /**
     * Construct a blank DSA object. It must be
     * initialized before being usable for verifying.
     */
    DSA(MessageDigest md) {
        this(md, false);
    }

    /**
     * Construct a blank DSA object that will use the specified
     * signature format. {@code p1363Format} should be {@code true} to
     * use the IEEE P1363 format. If {@code p1363Format} is {@code false},
     * the DER-encoded ASN.1 format will be used. The DSA object must be
     * initialized before being usable for verifying.
     */
    DSA(MessageDigest md, boolean p1363Format) {
        super();
        this.md = md;
        this.p1363Format = p1363Format;
    }

    protected void engineInitSign(PrivateKey privateKey)
            throws InvalidKeyException {
        throw new InvalidKeyException("DSA signing is not supported");
    }

    /**
     * Initialize the DSA object with a DSA public key.
     *
     * @param publicKey the DSA public key.
     *
     * @exception InvalidKeyException if the key is not a valid DSA public
     * key.
     */
    protected void engineInitVerify(PublicKey publicKey)
            throws InvalidKeyException {
        if (!(publicKey instanceof java.security.interfaces.DSAPublicKey pub)) {
            throw new InvalidKeyException("not a DSA public key: " +
                                          publicKey);
        }

        // check for algorithm specific constraints before doing initialization
        DSAParams params = pub.getParams();
        if (params == null) {
            throw new InvalidKeyException("DSA public key lacks parameters");
        }
        this.params = params;
        this.presetY = pub.getY();
        this.presetP = params.getP();
        this.presetQ = params.getQ();
        this.presetG = params.getG();
        this.md.reset();
    }

    /**
     * Update a byte to be verified.
     */
    protected void engineUpdate(byte b) {
        md.update(b);
    }

    /**
     * Update an array of bytes to be verified.
     */
    protected void engineUpdate(byte[] data, int off, int len) {
        md.update(data, off, len);
    }

    protected void engineUpdate(ByteBuffer b) {
        md.update(b);
    }


    protected byte[] engineSign() throws SignatureException {
        throw new SignatureException("DSA signing is not supported");
    }

    /**
     * Verify all the data thus far updated.
     *
     * @param signature the alleged signature, encoded using the
     * Canonical Encoding Rules, as a sequence of integers, r and s.
     *
     * @exception SignatureException if the signature object was not
     * properly initialized, or if another exception occurs.
     *
     * @see sun.security.DSA#engineUpdate
     */
    protected boolean engineVerify(byte[] signature)
            throws SignatureException {
        return engineVerify(signature, 0, signature.length);
    }

    /**
     * Verify all the data thus far updated.
     *
     * @param signature the alleged signature, encoded using the
     * format indicated by {@code p1363Format}. If {@code p1363Format}
     * is {@code false} (the default), then the signature is formatted
     * according to the Canonical Encoding Rules, as a DER sequence of
     * Integers, r and s. If {@code p1363Format} is {@code false},
     * the signature is in the IEEE P1363 format, which is the
     * concatenation or r and s.
     *
     * @param offset the offset to start from in the array of bytes.
     *
     * @param length the number of bytes to use, starting at offset.
     *
     * @exception SignatureException if the signature object was not
     * properly initialized, or if another exception occurs.
     *
     * @see sun.security.DSA#engineUpdate
     */
    protected boolean engineVerify(byte[] signature, int offset, int length)
            throws SignatureException {

        BigInteger r;
        BigInteger s;

        if (p1363Format) {
            if ((length & 1) == 1) {
                // length of signature byte array should be even
                throw new SignatureException("invalid signature format");
            }
            int mid = length/2;
            r = new BigInteger(Arrays.copyOfRange(signature, 0, mid));
            s = new BigInteger(Arrays.copyOfRange(signature, mid, length));
        } else {
            // first decode the signature.
            try {
                // Enforce strict DER checking for signatures
                DerInputStream in =
                    new DerInputStream(signature, offset, length, false);
                DerValue[] values = in.getSequence(2);

                // check number of components in the read sequence
                // and trailing data
                if ((values.length != 2) || (in.available() != 0)) {
                    throw new IOException("Invalid encoding for signature");
                }
                r = values[0].getBigInteger();
                s = values[1].getBigInteger();
            } catch (IOException e) {
                throw new SignatureException("Invalid encoding for signature", e);
            }
        }

        // some implementations do not correctly encode values in the ASN.1
        // 2's complement format. force r and s to be positive in order to
        // to validate those signatures
        if (r.signum() < 0) {
            r = new BigInteger(1, r.toByteArray());
        }
        if (s.signum() < 0) {
            s = new BigInteger(1, s.toByteArray());
        }

        if ((r.compareTo(presetQ) == -1) && (s.compareTo(presetQ) == -1)
                && r.signum() > 0 && s.signum() > 0) {
            BigInteger w = generateW(presetP, presetQ, presetG, s);
            BigInteger v = generateV(presetY, presetP, presetQ, presetG, w, r);
            return v.equals(r);
        } else {
            throw new SignatureException("invalid signature: out of range values");
        }
    }

    @Deprecated
    protected void engineSetParameter(String key, Object param) {
        throw new InvalidParameterException("No parameter accepted");
    }

    @Override
    protected void engineSetParameter(AlgorithmParameterSpec params)
            throws InvalidAlgorithmParameterException {
        if (params != null) {
            throw new InvalidAlgorithmParameterException("No parameter accepted");
        }
    }

    @Deprecated
    protected Object engineGetParameter(String key) {
        return null;
    }

    @Override
    protected AlgorithmParameters engineGetParameters() {
        return null;
    }


    private BigInteger generateW(BigInteger p, BigInteger q,
                         BigInteger g, BigInteger s) {
        return s.modInverse(q);
    }

    private BigInteger generateV(BigInteger y, BigInteger p,
             BigInteger q, BigInteger g, BigInteger w, BigInteger r) {

        byte[] s2 = md.digest();
        // get the leftmost min(N, outLen) bits of the digest value
        int nBytes = q.bitLength()/8;
        if (nBytes < s2.length) {
            s2 = Arrays.copyOfRange(s2, 0, nBytes);
        }
        BigInteger z = new BigInteger(1, s2);

        BigInteger u1 = z.multiply(w).mod(q);
        BigInteger u2 = (r.multiply(w)).mod(q);

        BigInteger t1 = g.modPow(u1,p);
        BigInteger t2 = y.modPow(u2,p);
        BigInteger t3 = t1.multiply(t2);
        BigInteger t5 = t3.mod(p);
        return t5.mod(q);
    }

    /**
     * Return a human-readable rendition of the engine.
     */
    public String toString() {
        String printable = "DSA Signature";
        if (presetP != null && presetQ != null && presetG != null) {
            printable += "\n\tp: " + Debug.toHexString(presetP);
            printable += "\n\tq: " + Debug.toHexString(presetQ);
            printable += "\n\tg: " + Debug.toHexString(presetG);
        } else {
            printable += "\n\t P, Q or G not initialized.";
        }
        if (presetY != null) {
            printable += "\n\ty: " + Debug.toHexString(presetY);
        }
        if (presetY == null) {
            printable += "\n\tUNINITIALIZED";
        }
        return printable;
    }

    /**
     * SHA3-224withDSA implementation.
     */
    public static final class SHA3_224withDSA extends DSA {
        public SHA3_224withDSA() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA3-224"));
        }
    }

    /**
     * SHA3-224withDSA implementation that uses the IEEE P1363 format.
     */
    public static final class SHA3_224withDSAinP1363Format extends DSA {
        public SHA3_224withDSAinP1363Format() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA3-224"), true);
        }
    }

    /**
     * Standard SHA3-256withDSA implementation.
     */
    public static final class SHA3_256withDSA extends DSA {
        public SHA3_256withDSA() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA3-256"));
        }
    }

    /**
     * Standard SHA3-256withDSA implementation that uses the IEEE P1363 format.
     */
    public static final class SHA3_256withDSAinP1363Format extends DSA {
        public SHA3_256withDSAinP1363Format() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA3-256"), true);
        }
    }

    /**
     * Standard SHA3-384withDSA implementation.
     */
    public static final class SHA3_384withDSA extends DSA {
        public SHA3_384withDSA() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA3-384"));
        }
    }

    /**
     * Standard SHA3-384withDSA implementation that uses the IEEE P1363 format.
     */
    public static final class SHA3_384withDSAinP1363Format extends DSA {
        public SHA3_384withDSAinP1363Format() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA3-384"), true);
        }
    }

    /**
     * Standard SHA3-512withDSA implementation.
     */
    public static final class SHA3_512withDSA extends DSA {
        public SHA3_512withDSA() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA3-512"));
        }
    }

    /**
     * Standard SHA3-512withDSA implementation that uses the IEEE P1363 format.
     */
    public static final class SHA3_512withDSAinP1363Format extends DSA {
        public SHA3_512withDSAinP1363Format() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA3-512"), true);
        }
    }

    /**
     * Standard SHA224withDSA implementation as defined in FIPS186-3.
     */
    public static final class SHA224withDSA extends DSA {
        public SHA224withDSA() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA-224"));
        }
    }

    /**
     * SHA224withDSA implementation that uses the IEEE P1363 format.
     */
    public static final class SHA224withDSAinP1363Format extends DSA {
        public SHA224withDSAinP1363Format() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA-224"), true);
        }
    }

    /**
     * Standard SHA256withDSA implementation as defined in FIPS186-3.
     */
    public static final class SHA256withDSA extends DSA {
        public SHA256withDSA() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA-256"));
        }
    }

    /**
     * SHA256withDSA implementation that uses the IEEE P1363 format.
     */
    public static final class SHA256withDSAinP1363Format extends DSA {
        public SHA256withDSAinP1363Format() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA-256"), true);
        }
    }

    /**
     * Standard SHA384withDSA implementation as defined in FIPS186-3.
     */
    public static final class SHA384withDSA extends DSA {
        public SHA384withDSA() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA-384"));
        }
    }

    /**
     * SHA384withDSA implementation that uses the IEEE P1363 format.
     */
    public static final class SHA384withDSAinP1363Format extends DSA {
        public SHA384withDSAinP1363Format() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA-384"), true);
        }
    }

    /**
     * Standard SHA512withDSA implementation as defined in FIPS186-3.
     */
    public static final class SHA512withDSA extends DSA {
        public SHA512withDSA() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA-512"));
        }
    }

    /**
     * SHA512withDSA implementation that uses the IEEE P1363 format.
     */
    public static final class SHA512withDSAinP1363Format extends DSA {
        public SHA512withDSAinP1363Format() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA-512"), true);
        }
    }

    /**
     * Standard SHA1withDSA implementation.
     */
    public static final class SHA1withDSA extends DSA {
        public SHA1withDSA() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA-1"));
        }
    }

    /**
     * SHA1withDSA implementation that uses the IEEE P1363 format.
     */
    public static final class SHA1withDSAinP1363Format extends DSA {
        public SHA1withDSAinP1363Format() throws NoSuchAlgorithmException {
            super(MessageDigest.getInstance("SHA-1"), true);
        }
    }
}
