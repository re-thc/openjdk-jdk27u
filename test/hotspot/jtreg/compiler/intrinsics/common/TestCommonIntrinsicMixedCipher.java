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
 * @summary Non-AES public Cipher calls must not poison shared C1 AES intrinsic sites
 * @requires vm.compiler1.enabled
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox jdk.test.whitebox.code.NMethod
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsicMixedCipher 1
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsicMixedCipher 3
 */

package compiler.intrinsics.common;

import java.lang.reflect.Method;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.NMethod;

public class TestCommonIntrinsicMixedCipher {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static volatile int sink;

    private static Cipher cipher(String algorithm, String mode, int direction) throws Exception {
        Cipher cipher = Cipher.getInstance(algorithm + "/" + mode + "/NoPadding", "SunJCE");
        byte[] bytes = new byte[algorithm.equals("AES") ? 16 : algorithm.equals("DES") ? 8 : 24];
        Arrays.fill(bytes, (byte) 7);
        SecretKeySpec key = new SecretKeySpec(bytes, algorithm);
        if (mode.equals("ECB")) cipher.init(direction, key);
        else cipher.init(direction, key, new IvParameterSpec(new byte[algorithm.equals("AES") ? 16 : 8]));
        return cipher;
    }

    private static void stable(Method caller, int id) {
        NMethod current = NMethod.get(caller, false);
        if (current == null || current.compile_id != id || WB.getMethodTrapCount(caller, "intrinsic") != 0) {
            throw new AssertionError("Non-AES receiver poisoned " + caller);
        }
    }

    private static void check(String mode, boolean decrypting, int level) throws Exception {
        String holder = mode.equals("ECB") ? "ElectronicCodeBook" :
                        mode.equals("CBC") ? "CipherBlockChaining" : "CounterMode";
        Class<?> klass = Class.forName("com.sun.crypto.provider." + holder);
        Class<?>[] signature = { byte[].class, int.class, int.class, byte[].class, int.class };
        String callerName = mode.equals("CTR") ? "crypt" : decrypting ? "decrypt" : "encrypt";
        String kernelName = mode.equals("CTR") ? "implCrypt" : mode.equals("ECB") ?
                            decrypting ? "implECBDecrypt" : "implECBEncrypt" :
                            decrypting ? "implDecrypt" : "implEncrypt";
        Method caller = klass.getDeclaredMethod(callerName, signature);
        Method kernel = klass.getDeclaredMethod(kernelName, signature);
        WB.testSetDontInlineMethod(caller, true);
        int direction = decrypting ? Cipher.DECRYPT_MODE : Cipher.ENCRYPT_MODE;
        Cipher aes = cipher("AES", mode, direction);
        byte[] small = new byte[256];
        Arrays.fill(small, (byte) 19);
        aes.doFinal(small); // Link the provider kernel and publish optional backend layout.
        if (!WB.isIntrinsicAvailable(kernel, caller, level)) {
            System.out.println("SKIP unavailable " + kernel);
            return;
        }
        for (int i = 0; i < 2000; i++) sink ^= aes.doFinal(small)[0];
        WB.deoptimizeMethod(caller);
        if (!WB.enqueueMethodForCompilation(caller, level) || WB.getMethodCompilationLevel(caller) != level) {
            throw new AssertionError("C1 compilation failed: " + caller);
        }
        int id = NMethod.get(caller, false).compile_id;
        for (String algorithm : new String[] { "DES", "DESede" }) {
            Cipher other = cipher(algorithm, mode, direction);
            for (int length : new int[] { 256, 196608 }) {
                byte[] input = new byte[length];
                Arrays.fill(input, (byte) 23);
                byte[] output = other.doFinal(input);
                stable(caller, id);
                byte[] recovered = cipher(algorithm, mode,
                        decrypting ? Cipher.ENCRYPT_MODE : Cipher.DECRYPT_MODE).doFinal(output);
                if (!Arrays.equals(input, recovered)) throw new AssertionError("Incorrect " + algorithm);
                sink ^= aes.doFinal(small)[0];
                stable(caller, id);
            }
        }
        System.out.println("PASS " + mode + " decrypt=" + decrypting + " level=" + level);
    }

    public static void main(String[] args) throws Exception {
        int level = Integer.parseInt(args[0]);
        for (String mode : new String[] { "ECB", "CBC", "CTR" }) {
            check(mode, false, level);
            if (!mode.equals("CTR")) check(mode, true, level);
        }
    }
}
