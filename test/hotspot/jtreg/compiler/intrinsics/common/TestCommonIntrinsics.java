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
 * @summary Compare shared leaf intrinsics and their Java fallbacks in all tiers
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xint -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsics
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xint -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsics
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsics
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xbatch -XX:TieredStopAtLevel=1 -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsics
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsics
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xbatch -XX:TieredStopAtLevel=3 -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsics
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xbatch -XX:-TieredCompilation -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsics
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xbatch -XX:-TieredCompilation -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsics
 */

package compiler.intrinsics.common;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.KeyPairGenerator;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.security.Signature;
import java.security.spec.NamedParameterSpec;
import java.util.Arrays;
import java.util.HexFormat;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.KEM;
import javax.crypto.spec.ChaCha20ParameterSpec;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;


public class TestCommonIntrinsics {
    // Fixed transcript from the pristine Java implementations, checked in
    // separate jtreg VMs for every compilation mode and flag state.
    private static final String EXPECTED =
            "f459f5ec15a357973e2e84ab16ca7cff567fe4cad8f169d6cf63bb1e3b57d6c4";

    public static void main(String[] args) throws Exception {
        workload();
    }

    private static final MessageDigest transcript = digest("SHA-256");

    private static MessageDigest digest(String name) {
        try {
            return MessageDigest.getInstance(name);
        } catch (Exception e) {
            throw new AssertionError(e);
        }
    }

    private static void record(byte[] value) {
        transcript.update((byte) (value.length >>> 24));
        transcript.update((byte) (value.length >>> 16));
        transcript.update((byte) (value.length >>> 8));
        transcript.update((byte) value.length);
        transcript.update(value);
    }

    private static void record(BigInteger value) {
        record(value.toByteArray());
    }

    private static void record(int value) {
        record(new byte[] {(byte) (value >>> 24), (byte) (value >>> 16),
                           (byte) (value >>> 8), (byte) value});
    }

    private static byte[] bytes(int size, Random random) {
        byte[] result = new byte[size];
        random.nextBytes(result);
        return result;
    }

    private static void workload() throws Exception {
        Random random = new Random(0x5eed);
        // Warm up the callers as well as the intrinsic methods. Include odd
        // lengths, nonzero offsets, and outputs returned as references.
        for (int iteration = 0; iteration < 400; iteration++) {
            int length = 17 + iteration % 193;
            BigInteger x = new BigInteger(1, bytes(length, random));
            BigInteger y = new BigInteger(1, bytes(length + 1, random));
            record(x.multiply(y));
            record(x.multiply(x));
            record(x.shiftLeft(iteration % 31 + 1));
            record(x.shiftRight(iteration % 31 + 1));
            if (iteration % 40 == 0) {
                BigInteger modulus = new BigInteger(1, bytes(128, random)).setBit(0);
                record(x.modPow(BigInteger.valueOf(65537), modulus));
            }
            byte[] b = bytes(length, random);
            short[] s = new short[length];
            char[] c = new char[length];
            int[] ints = new int[length];
            for (int i = 0; i < length; i++) {
                s[i] = (short) random.nextInt();
                c[i] = (char) random.nextInt();
                ints[i] = random.nextInt();
            }
            record(Arrays.hashCode(b));
            record(Arrays.hashCode(s));
            record(Arrays.hashCode(c));
            record(Arrays.hashCode(ints));
            record(new String(c).hashCode());
            record(new String(b, StandardCharsets.ISO_8859_1).hashCode());
        }

        for (String name : new String[] {"MD5", "SHA-1", "SHA-224", "SHA-256",
                                        "SHA-384", "SHA-512", "SHA3-224", "SHA3-256",
                                        "SHA3-384", "SHA3-512"}) {
            MessageDigest md = digest(name);
            for (int size : new int[] {0, 1, 63, 64, 65, 127, 128, 129, 511, 4096}) {
                byte[] input = bytes(size + 11, random);
                for (int repeat = 0; repeat < 20; repeat++) {
                    md.update(input, 7, size / 2);
                    md.update(input, 7 + size / 2, size - size / 2);
                    record(md.digest());
                }
            }
        }

        for (int keyLength : new int[] {16, 24, 32}) {
            SecretKeySpec key = new SecretKeySpec(bytes(keyLength, random), "AES");
            for (String mode : new String[] {"ECB", "CBC", "CTR", "GCM"}) {
                for (int size : new int[] {16, 32, 256, 4096}) {
                    byte[] input = bytes(size, random);
                    Cipher enc = Cipher.getInstance("AES/" + mode + "/NoPadding");
                    Cipher dec = Cipher.getInstance("AES/" + mode + "/NoPadding");
                    byte[] iv = bytes(mode.equals("GCM") ? 12 : 16, random);
                    if (mode.equals("ECB")) {
                        enc.init(Cipher.ENCRYPT_MODE, key);
                        dec.init(Cipher.DECRYPT_MODE, key);
                    } else if (mode.equals("GCM")) {
                        GCMParameterSpec params = new GCMParameterSpec(128, iv);
                        enc.init(Cipher.ENCRYPT_MODE, key, params);
                        dec.init(Cipher.DECRYPT_MODE, key, params);
                    } else {
                        IvParameterSpec params = new IvParameterSpec(iv);
                        enc.init(Cipher.ENCRYPT_MODE, key, params);
                        dec.init(Cipher.DECRYPT_MODE, key, params);
                    }
                    byte[] ciphertext = enc.doFinal(input);
                    record(ciphertext);
                    if (!Arrays.equals(input, dec.doFinal(ciphertext))) {
                        throw new AssertionError("AES round trip: " + mode + "/" + keyLength + "/" + size);
                    }
                }
            }
        }
        for (String name : new String[] {"ChaCha20", "ChaCha20-Poly1305"}) {
            SecretKeySpec key = new SecretKeySpec(bytes(32, random), "ChaCha20");
            for (int size : new int[] {0, 1, 15, 16, 17, 63, 64, 65, 1023, 1024, 4096}) {
                Cipher cipher = Cipher.getInstance(name);
                byte[] nonce = bytes(12, random);
                if (name.equals("ChaCha20")) {
                    cipher.init(Cipher.ENCRYPT_MODE, key, new ChaCha20ParameterSpec(nonce, 7));
                } else {
                    cipher.init(Cipher.ENCRYPT_MODE, key, new IvParameterSpec(nonce));
                }
                record(cipher.doFinal(bytes(size, random)));
            }
        }

        SecureRandom secure = SecureRandom.getInstance("SHA1PRNG");
        secure.setSeed(new byte[] {1, 3, 5, 7, 9});
        for (String algorithm : new String[] {"ML-KEM", "ML-DSA", "EC"}) {
            KeyPairGenerator generator = KeyPairGenerator.getInstance(algorithm);
            if (algorithm.equals("ML-KEM")) generator.initialize(NamedParameterSpec.ML_KEM_768, secure);
            else if (algorithm.equals("ML-DSA")) generator.initialize(NamedParameterSpec.ML_DSA_65, secure);
            else generator.initialize(256, secure);
            var pair = generator.generateKeyPair();
            record(pair.getPublic().getEncoded());
            if (algorithm.equals("ML-KEM")) {
                KEM kem = KEM.getInstance(algorithm);
                var encapsulated = kem.newEncapsulator(pair.getPublic(), secure).encapsulate();
                var secret = kem.newDecapsulator(pair.getPrivate()).decapsulate(encapsulated.encapsulation());
                if (!Arrays.equals(secret.getEncoded(), encapsulated.key().getEncoded())) {
                    throw new AssertionError("ML-KEM round trip");
                }
                record(secret.getEncoded());
            } else {
                byte[] message = bytes(128, random);
                Signature signature = Signature.getInstance(algorithm.equals("EC") ? "SHA256withECDSA" : algorithm);
                signature.initSign(pair.getPrivate(), secure);
                signature.update(message);
                byte[] signed = signature.sign();
                record(signed);
                signature.initVerify(pair.getPublic());
                signature.update(message);
                if (!signature.verify(signed)) throw new AssertionError(algorithm + " signature");
            }
        }
        guards();
        String result = HexFormat.of().formatHex(transcript.digest());
        if (!result.equals(EXPECTED)) throw new AssertionError("unexpected transcript: " + result);
        System.out.println("RESULT " + result);
    }

    private static void guards() throws Exception {
        Method multiply = BigInteger.class.getDeclaredMethod("implMultiplyToLen",
                int[].class, int.class, int[].class, int.class, int[].class);
        multiply.setAccessible(true);
        for (int repeat = 0; repeat < 300; repeat++) {
            int[] x = {0x12345678, 0xffffffff};
            int[] y = {0x87654321, 0xfedcba98};
            for (int kind = 0; kind < 6; kind++) {
                int[] out = {13, 17, 19, 23, 29};
                Object[] args = {x.clone(), 2, y.clone(), 2, out};
                if (kind == 1) args[4] = null;
                if (kind == 2) args[4] = new int[1];
                if (kind == 3) args[1] = 0;
                if (kind == 4) args[0] = null;
                if (kind == 5) args[1] = Integer.MAX_VALUE;
                try {
                    record(Arrays.hashCode((int[]) multiply.invoke(null, args)));
                } catch (InvocationTargetException e) {
                    record(e.getCause().getClass().getName().getBytes(StandardCharsets.UTF_8));
                }
                record(Arrays.hashCode(out));
            }
        }
    }
}
