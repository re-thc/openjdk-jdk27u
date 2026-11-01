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
 * @summary Compiler stubs are deferred at startup and safely published on concurrent first use
 * @requires vm.compiler2.enabled
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @library /test/lib
 * @run driver compiler.intrinsics.common.TestCommonIntrinsicInitialization
 */

package compiler.intrinsics.common;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HexFormat;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import jdk.test.lib.process.ProcessTools;

public class TestCommonIntrinsicInitialization {
    private static final String GENERATION = "StubRoutines generation compiler stubs";

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            exercise();
            return;
        }
        for (String mode : new String[] {"-Xint", "-XX:TieredStopAtLevel=1"}) {
            ProcessTools.executeTestJava("-XX:+UseCommonIntrinsics", mode,
                    "-Xlog:startuptime", "-version")
                    .shouldHaveExitValue(0).shouldNotContain(GENERATION);
        }
        for (String mode : new String[] {"-Xint", "-XX:TieredStopAtLevel=1", "-XX:-TieredCompilation"}) {
            String output = ProcessTools.executeTestJava("-XX:+UseCommonIntrinsics", mode,
                    "-Xlog:startuptime", TestCommonIntrinsicInitialization.class.getName(), "exercise")
                    .shouldHaveExitValue(0).getOutput();
            int first = output.indexOf(GENERATION);
            if (first < 0 || output.indexOf(GENERATION, first + GENERATION.length()) >= 0) {
                throw new AssertionError("Expected exactly one compiler-stub generation: " + output);
            }
        }
    }

    private static void exercise() throws Exception {
        CountDownLatch ready = new CountDownLatch(8);
        CountDownLatch start = new CountDownLatch(1);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread[] threads = new Thread[8];
        for (int i = 0; i < threads.length; i++) {
            final int operation = i % 3;
            threads[i] = new Thread(() -> {
                ready.countDown();
                try {
                    start.await();
                    for (int iteration = 0; iteration < 100; iteration++) {
                        switch (operation) {
                            case 0 -> {
                                byte[] digest = MessageDigest.getInstance("SHA-256")
                                        .digest(new byte[] {97, 98, 99});
                                String expected = "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad";
                                if (!HexFormat.of().formatHex(digest).equals(expected)) {
                                    throw new AssertionError("SHA-256");
                                }
                            }
                            case 1 -> {
                                Cipher cipher = Cipher.getInstance("AES/ECB/NoPadding");
                                SecretKeySpec key = new SecretKeySpec(new byte[16], "AES");
                                cipher.init(Cipher.ENCRYPT_MODE, key);
                                byte[] encrypted = cipher.doFinal(new byte[16]);
                                cipher.init(Cipher.DECRYPT_MODE, key);
                                if (!Arrays.equals(cipher.doFinal(encrypted), new byte[16])) {
                                    throw new AssertionError("AES round trip");
                                }
                            }
                            case 2 -> {
                                BigInteger value = BigInteger.ONE.shiftLeft(2048).subtract(BigInteger.ONE);
                                BigInteger expected = BigInteger.ONE.shiftLeft(4096)
                                        .subtract(BigInteger.ONE.shiftLeft(2049)).add(BigInteger.ONE);
                                if (!value.multiply(value).equals(expected)) {
                                    throw new AssertionError("BigInteger multiplication");
                                }
                            }
                        }
                    }
                } catch (Throwable t) {
                    failure.compareAndSet(null, t);
                }
            });
            threads[i].start();
        }
        ready.await();
        start.countDown();
        for (Thread thread : threads) thread.join();
        if (failure.get() != null) throw new AssertionError(failure.get());
    }
}
