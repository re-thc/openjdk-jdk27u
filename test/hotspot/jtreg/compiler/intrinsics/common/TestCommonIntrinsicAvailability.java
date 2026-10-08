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
 * @summary The catalogue is available in C1 and respects feature and per-intrinsic flags
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsicAvailability enabled
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsicAvailability disabled
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseCommonIntrinsics -XX:DisableIntrinsic=_multiplyToLen,_vectorizedHashCode,_addExactI compiler.intrinsics.common.TestCommonIntrinsicAvailability selective
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseCommonIntrinsics -XX:-UseSHA3Intrinsics compiler.intrinsics.common.TestCommonIntrinsicAvailability enabled
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseCommonIntrinsics -XX:DisableIntrinsic=_sha3_implCompress compiler.intrinsics.common.TestCommonIntrinsicAvailability no_sha3
 */

package compiler.intrinsics.common;

import java.lang.invoke.MethodType;
import java.lang.reflect.Method;
import java.util.Set;
import jdk.test.whitebox.WhiteBox;

public class TestCommonIntrinsicAvailability {
    private record Entry(String id, String holder, String name, String descriptor, String flags) { }

    private static final Entry[] ENTRIES = {
        new Entry("_multiplyToLen", "java.math.BigInteger", "implMultiplyToLen", "([II[II[I)[I", "UseMultiplyToLenIntrinsic"),
        new Entry("_squareToLen", "java.math.BigInteger", "implSquareToLen", "([II[II)[I", "UseSquareToLenIntrinsic"),
        new Entry("_mulAdd", "java.math.BigInteger", "implMulAdd", "([I[IIII)I", "UseMulAddIntrinsic"),
        new Entry("_montgomeryMultiply", "java.math.BigInteger", "implMontgomeryMultiply", "([I[I[IIJ[I)[I", "UseMontgomeryMultiplyIntrinsic"),
        new Entry("_montgomerySquare", "java.math.BigInteger", "implMontgomerySquare", "([I[IIJ[I)[I", "UseMontgomerySquareIntrinsic"),
        new Entry("_bigIntegerRightShiftWorker", "java.math.BigInteger", "shiftRightImplWorker", "([I[IIII)V", ""),
        new Entry("_bigIntegerLeftShiftWorker", "java.math.BigInteger", "shiftLeftImplWorker", "([I[IIII)V", ""),
        new Entry("_ghash_processBlocks", "com.sun.crypto.provider.GHASH", "processBlocks", "([BII[J[J)V", "UseGHASHIntrinsics"),
        new Entry("_chacha20Block", "com.sun.crypto.provider.ChaCha20Cipher", "implChaCha20Block", "([I[B)I", "UseChaCha20Intrinsics"),
        new Entry("_poly1305_processBlocks", "com.sun.crypto.provider.Poly1305", "processMultipleBlocks", "([BII[J[J)V", "UsePoly1305Intrinsics"),
        new Entry("_intpoly_montgomeryMult_P256", "sun.security.util.math.intpoly.MontgomeryIntegerPolynomialP256", "mult", "([J[J[J)V", "UseIntPolyIntrinsics"),
        new Entry("_intpoly_assign", "sun.security.util.math.intpoly.IntegerPolynomial", "conditionalAssign", "(I[J[J)V", "UseIntPolyIntrinsics"),
        new Entry("_double_keccak", "sun.security.provider.SHA3Parallel", "doubleKeccak", "([J[J)I", "UseSHA3Intrinsics"),
        new Entry("_quad_keccak", "sun.security.provider.SHA3Parallel", "quadKeccak", "([J[J[J[J)I", "UseSHA3Intrinsics"),
        new Entry("_kyberNtt", "com.sun.crypto.provider.ML_KEM", "implKyberNtt", "([S[S)I", "UseKyberIntrinsics"),
        new Entry("_kyberInverseNtt", "com.sun.crypto.provider.ML_KEM", "implKyberInverseNtt", "([S[S)I", "UseKyberIntrinsics"),
        new Entry("_kyberNttMult", "com.sun.crypto.provider.ML_KEM", "implKyberNttMult", "([S[S[S[S)I", "UseKyberIntrinsics"),
        new Entry("_kyberAddPoly_2", "com.sun.crypto.provider.ML_KEM", "implKyberAddPoly", "([S[S[S)I", "UseKyberIntrinsics"),
        new Entry("_kyberAddPoly_3", "com.sun.crypto.provider.ML_KEM", "implKyberAddPoly", "([S[S[S[S)I", "UseKyberIntrinsics"),
        new Entry("_kyber12To16", "com.sun.crypto.provider.ML_KEM", "implKyber12To16", "([BI[SI)I", "UseKyberIntrinsics"),
        new Entry("_kyberBarrettReduce", "com.sun.crypto.provider.ML_KEM", "implKyberBarrettReduce", "([S)I", "UseKyberIntrinsics"),
        new Entry("_dilithiumAlmostNtt", "sun.security.provider.ML_DSA", "implDilithiumAlmostNtt", "([I[I)I", "UseDilithiumIntrinsics"),
        new Entry("_dilithiumAlmostInverseNtt", "sun.security.provider.ML_DSA", "implDilithiumAlmostInverseNtt", "([I[I)I", "UseDilithiumIntrinsics"),
        new Entry("_dilithiumNttMult", "sun.security.provider.ML_DSA", "implDilithiumNttMult", "([I[I[I)I", "UseDilithiumIntrinsics"),
        new Entry("_dilithiumMontMulByConstant", "sun.security.provider.ML_DSA", "implDilithiumMontMulByConstant", "([II)I", "UseDilithiumIntrinsics"),
        new Entry("_dilithiumDecomposePoly", "sun.security.provider.ML_DSA", "implDilithiumDecomposePoly", "([I[I[III)I", "UseDilithiumIntrinsics"),
        new Entry("_aescrypt_encryptBlock", "com.sun.crypto.provider.AES_Crypt", "implEncryptBlock", "([BI[BI)V", "UseAESIntrinsics"),
        new Entry("_electronicCodeBook_encryptAESCrypt", "com.sun.crypto.provider.ElectronicCodeBook", "implECBEncrypt", "([BII[BI)I", "UseAESIntrinsics"),
        new Entry("_cipherBlockChaining_encryptAESCrypt", "com.sun.crypto.provider.CipherBlockChaining", "implEncrypt", "([BII[BI)I", "UseAESIntrinsics"),
        new Entry("_aescrypt_decryptBlock", "com.sun.crypto.provider.AES_Crypt", "implDecryptBlock", "([BI[BI)V", "UseAESIntrinsics"),
        new Entry("_electronicCodeBook_decryptAESCrypt", "com.sun.crypto.provider.ElectronicCodeBook", "implECBDecrypt", "([BII[BI)I", "UseAESIntrinsics"),
        new Entry("_cipherBlockChaining_decryptAESCrypt", "com.sun.crypto.provider.CipherBlockChaining", "implDecrypt", "([BII[BI)I", "UseAESIntrinsics"),
        new Entry("_counterMode_AESCrypt", "com.sun.crypto.provider.CounterMode", "implCrypt", "([BII[BI)I", "UseAESCTRIntrinsics"),
        new Entry("_md5_implCompress", "sun.security.provider.MD5", "implCompress0", "([BI)V", "UseMD5Intrinsics"),
        new Entry("_sha_implCompress", "sun.security.provider.SHA", "implCompress0", "([BI)V", "UseSHA1Intrinsics"),
        new Entry("_sha2_implCompress", "sun.security.provider.SHA2", "implCompress0", "([BI)V", "UseSHA256Intrinsics"),
        new Entry("_sha5_implCompress", "sun.security.provider.SHA5", "implCompress0", "([BI)V", "UseSHA512Intrinsics"),
        new Entry("_sha3_implCompress", "sun.security.provider.SHA3", "implCompress0", "([BI)V", "UseSHA3Intrinsics"),
        new Entry("_digestBase_implCompressMB", "sun.security.provider.DigestBase", "implCompressMultiBlock0", "([BII)I", "UseMD5Intrinsics,UseSHA1Intrinsics,UseSHA256Intrinsics,UseSHA512Intrinsics,UseSHA3Intrinsics"),
        new Entry("_galoisCounterMode_AESCrypt", "com.sun.crypto.provider.GaloisCounterMode", "implGCMCrypt0", "([BII[BI[BILcom/sun/crypto/provider/GCTR;Lcom/sun/crypto/provider/GHASH;)I", "UseAESIntrinsics"),
        new Entry("_vectorizedHashCode", "jdk.internal.util.ArraysSupport", "vectorizedHashCode", "(Ljava/lang/Object;IIII)I", "UseVectorizedHashCodeIntrinsic"),
        new Entry("_numberOfLeadingZeros_i", "java.lang.Integer", "numberOfLeadingZeros", "(I)I", ""),
        new Entry("_numberOfLeadingZeros_l", "java.lang.Long", "numberOfLeadingZeros", "(J)I", ""),
        new Entry("_numberOfTrailingZeros_i", "java.lang.Integer", "numberOfTrailingZeros", "(I)I", ""),
        new Entry("_numberOfTrailingZeros_l", "java.lang.Long", "numberOfTrailingZeros", "(J)I", ""),
        new Entry("_bitCount_i", "java.lang.Integer", "bitCount", "(I)I", "UsePopCountInstruction"),
        new Entry("_bitCount_l", "java.lang.Long", "bitCount", "(J)I", "UsePopCountInstruction"),
        new Entry("_reverse_i", "java.lang.Integer", "reverse", "(I)I", ""),
        new Entry("_reverse_l", "java.lang.Long", "reverse", "(J)J", ""),
        new Entry("_reverseBytes_i", "java.lang.Integer", "reverseBytes", "(I)I", ""),
        new Entry("_reverseBytes_l", "java.lang.Long", "reverseBytes", "(J)J", ""),
        new Entry("_reverseBytes_s", "java.lang.Short", "reverseBytes", "(S)S", ""),
        new Entry("_reverseBytes_c", "java.lang.Character", "reverseBytes", "(C)C", ""),
        new Entry("_iabs", "java.lang.Math", "abs", "(I)I", "InlineMathNatives"),
        new Entry("_labs", "java.lang.Math", "abs", "(J)J", "InlineMathNatives"),
        new Entry("_negateExactI", "java.lang.Math", "negateExact", "(I)I", "UseMathExactIntrinsics,InlineMathNatives"),
        new Entry("_negateExactL", "java.lang.Math", "negateExact", "(J)J", "UseMathExactIntrinsics,InlineMathNatives"),
        new Entry("_incrementExactI", "java.lang.Math", "incrementExact", "(I)I", "UseMathExactIntrinsics,InlineMathNatives"),
        new Entry("_incrementExactL", "java.lang.Math", "incrementExact", "(J)J", "UseMathExactIntrinsics,InlineMathNatives"),
        new Entry("_decrementExactI", "java.lang.Math", "decrementExact", "(I)I", "UseMathExactIntrinsics,InlineMathNatives"),
        new Entry("_decrementExactL", "java.lang.Math", "decrementExact", "(J)J", "UseMathExactIntrinsics,InlineMathNatives"),
        new Entry("_min", "java.lang.Math", "min", "(II)I", "InlineMathNatives"),
        new Entry("_max", "java.lang.Math", "max", "(II)I", "InlineMathNatives"),
        new Entry("_min_strict", "java.lang.StrictMath", "min", "(II)I", "InlineMathNatives"),
        new Entry("_max_strict", "java.lang.StrictMath", "max", "(II)I", "InlineMathNatives"),
        new Entry("_compareUnsigned_i", "java.lang.Integer", "compareUnsigned", "(II)I", ""),
        new Entry("_divideUnsigned_i", "java.lang.Integer", "divideUnsigned", "(II)I", ""),
        new Entry("_remainderUnsigned_i", "java.lang.Integer", "remainderUnsigned", "(II)I", ""),
        new Entry("_minL", "java.lang.Math", "min", "(JJ)J", ""),
        new Entry("_maxL", "java.lang.Math", "max", "(JJ)J", ""),
        new Entry("_multiplyHigh", "java.lang.Math", "multiplyHigh", "(JJ)J", ""),
        new Entry("_unsignedMultiplyHigh", "java.lang.Math", "unsignedMultiplyHigh", "(JJ)J", ""),
        new Entry("_divideUnsigned_l", "java.lang.Long", "divideUnsigned", "(JJ)J", ""),
        new Entry("_remainderUnsigned_l", "java.lang.Long", "remainderUnsigned", "(JJ)J", ""),
        new Entry("_compareUnsigned_l", "java.lang.Long", "compareUnsigned", "(JJ)I", ""),
        new Entry("_addExactI", "java.lang.Math", "addExact", "(II)I", "UseMathExactIntrinsics,InlineMathNatives"),
        new Entry("_addExactL", "java.lang.Math", "addExact", "(JJ)J", "UseMathExactIntrinsics,InlineMathNatives"),
        new Entry("_subtractExactI", "java.lang.Math", "subtractExact", "(II)I", "UseMathExactIntrinsics,InlineMathNatives"),
        new Entry("_subtractExactL", "java.lang.Math", "subtractExact", "(JJ)J", "UseMathExactIntrinsics,InlineMathNatives"),
        new Entry("_multiplyExactI", "java.lang.Math", "multiplyExact", "(II)I", "UseMathExactIntrinsics,InlineMathNatives"),
        new Entry("_multiplyExactL", "java.lang.Math", "multiplyExact", "(JJ)J", "UseMathExactIntrinsics,InlineMathNatives"),
        new Entry("_vectorizedHashCodeLeaf", "jdk.internal.util.ArraysSupport", "vectorizedHashCodeLeaf", "(Ljava/lang/Object;IIII)I", "UseVectorizedHashCodeIntrinsic")
    };

    public static void main(String[] args) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        String cpuFeatures = wb.getCPUFeatures();
        boolean enabled = !args[0].equals("disabled");
        Set<String> disabled = switch (args[0]) {
            case "selective" -> Set.of("_multiplyToLen", "_vectorizedHashCode", "_vectorizedHashCodeLeaf", "_addExactI");
            case "no_sha3" -> Set.of("_sha3_implCompress", "_digestBase_implCompressMB");
            default -> Set.of();
        };
        for (Entry entry : ENTRIES) {
            Class<?> holder = Class.forName(entry.holder());
            MethodType type = MethodType.fromMethodDescriptorString(entry.descriptor(), null);
            Method method = holder.getDeclaredMethod(entry.name(), type.parameterArray());
            boolean expected = enabled && !disabled.contains(entry.id());
            // These kernels have no ARM backend. ECB still uses accelerated AES blocks.
            if (System.getProperty("os.arch").equals("aarch64") &&
                    Set.of("_electronicCodeBook_encryptAESCrypt", "_electronicCodeBook_decryptAESCrypt",
                           "_intpoly_montgomeryMult_P256", "_intpoly_assign", "_quad_keccak")
                            .contains(entry.id())) {
                expected = false;
            }
            // x86 shift stubs are generated only with AVX-512 VBMI2.
            if (System.getProperty("os.arch").equals("amd64") &&
                    Set.of("_bigIntegerRightShiftWorker", "_bigIntegerLeftShiftWorker")
                            .contains(entry.id())) {
                expected &= cpuFeatures.contains("avx512_vbmi2");
            }
            for (String flag : entry.flags().split(",")) {
                if (flag.isEmpty()) continue;
                expected &= Boolean.TRUE.equals(wb.getBooleanVMFlag(flag));
            }
            boolean actual = wb.isIntrinsicAvailable(method, 1);
            // Parallel Keccak entry points can be absent while the scalar
            // SHA3 backend is enabled. Their Java implementation returns zero.
            if (expected && !actual && Set.of("_double_keccak", "_quad_keccak").contains(entry.id())) {
                continue;
            }
            if (actual != expected) {
                throw new AssertionError(entry.id() + ": C1 available=" + actual + ", expected=" + expected);
            }
        }
    }
}
