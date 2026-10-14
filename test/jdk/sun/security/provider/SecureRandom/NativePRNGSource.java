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
 * @summary NativePRNG gets random bytes and seeds of any length from the OS,
 *          and reads the seed from the file named by java.security.egd
 *          unless it is /dev/random or /dev/urandom
 * @requires os.family != "windows"
 * @run main/othervm NativePRNGSource default
 * @run main/othervm -Djava.security.egd=file:/dev/urandom NativePRNGSource default
 * @run main/othervm NativePRNGSource file
 * @run main/othervm NativePRNGSource missing
 * @run main/othervm NativePRNGSource unsupported
 */

import java.io.File;
import java.nio.file.Files;
import java.security.ProviderException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.stream.IntStream;

public class NativePRNGSource {

    private static final String[] ALGORITHMS = {
        "NativePRNG", "NativePRNGNonBlocking", "NativePRNGBlocking"
    };

    // the native code fills the arrays in chunks of this size
    private static final int CHUNK = 8192;

    private static final int[] LENGTHS = IntStream.concat(
            IntStream.rangeClosed(0, 300),
            IntStream.of(CHUNK - 1, CHUNK, CHUNK + 1, 2 * CHUNK - 1,
                    2 * CHUNK, 2 * CHUNK + 1, 70000)).toArray();

    private static final int FILE_SIZE = 256;

    public static void main(String[] args) throws Exception {
        String mode = args[0];
        byte[] content = null;
        switch (mode) {
            case "default" -> {
                String def = new SecureRandom().getAlgorithm();
                if (!def.equals("NativePRNG")) {
                    throw new Exception("Default is " + def);
                }
            }
            case "file" -> {
                content = new byte[FILE_SIZE];
                for (int i = 0; i < content.length; i++) {
                    content[i] = (byte) (i * 7 + 3);
                }
                File f = new File("egd.bin");
                Files.write(f.toPath(), content);
                System.setProperty("java.security.egd", f.toURI().toString());
            }
            case "missing" -> System.setProperty("java.security.egd",
                    new File("no-such-egd.bin").toURI().toString());
            case "unsupported" -> System.setProperty("java.security.egd",
                    "http://localhost/egd");
            default -> throw new IllegalArgumentException(mode);
        }

        for (String alg : ALGORITHMS) {
            System.out.println("Testing " + alg);
            SecureRandom sr = SecureRandom.getInstance(alg);
            for (int len : LENGTHS) {
                byte[] b = new byte[len];
                sr.nextBytes(b);
                checkRandom(b, "nextBytes");
                if (content == null || !alg.equals("NativePRNG")) {
                    checkRandom(sr.generateSeed(len), "generateSeed");
                }
            }
        }

        if (content != null) {
            checkFile(content);
        }
    }

    // NativePRNG reads the seed from the file, while the bytes and the seeds
    // of the other algorithms still come from the OS
    private static void checkFile(byte[] content) throws Exception {
        SecureRandom sr = SecureRandom.getInstance("NativePRNG");
        byte[] first = sr.generateSeed(100);
        byte[] second = sr.generateSeed(100);
        if (!Arrays.equals(first, 0, 100, content, 0, 100)
                || !Arrays.equals(second, 0, 100, content, 100, 200)) {
            throw new RuntimeException("Seed is not read from the file");
        }
        byte[] bytes = new byte[100];
        sr.nextBytes(bytes);
        if (Arrays.equals(bytes, 0, 100, content, 0, 100)
                || Arrays.equals(bytes, 0, 100, content, 100, 200)) {
            throw new RuntimeException("Bytes are read from the file");
        }
        for (String alg : new String[] {"NativePRNGNonBlocking",
                "NativePRNGBlocking"}) {
            byte[] seed = SecureRandom.getInstance(alg).generateSeed(56);
            if (Arrays.equals(seed, 0, 56, content, 200, 256)) {
                throw new RuntimeException(alg + " seed is read from the file");
            }
        }

        // the rest of the file is read, then it is exhausted
        sr.generateSeed(FILE_SIZE - 200);
        try {
            sr.generateSeed(1);
            throw new RuntimeException("Seed beyond the end of the file");
        } catch (ProviderException expected) {
        }
    }

    // No 8 bytes in a row are all zero (a probability of 2^-64 for random
    // bytes), so the whole array was filled, and no chunk repeats the
    // previous one.
    private static void checkRandom(byte[] b, String what) {
        for (int i = 0; i + 8 <= b.length; i += 8) {
            if (isZero(b, i, i + 8)) {
                throw new RuntimeException(what + " zeros at " + i
                        + " of " + b.length);
            }
        }
        if (b.length >= 8 && isZero(b, b.length - 8, b.length)) {
            throw new RuntimeException(what + " zeros at the end of "
                    + b.length);
        }
        for (int i = 0; i + 2 * CHUNK <= b.length; i += CHUNK) {
            if (Arrays.equals(b, i, i + CHUNK, b, i + CHUNK, i + 2 * CHUNK)) {
                throw new RuntimeException(what + " repeated chunk at "
                        + i + " of " + b.length);
            }
        }
    }

    private static boolean isZero(byte[] b, int from, int to) {
        for (int i = from; i < to; i++) {
            if (b[i] != 0) {
                return false;
            }
        }
        return true;
    }
}
