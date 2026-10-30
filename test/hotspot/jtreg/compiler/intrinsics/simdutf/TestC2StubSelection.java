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
 * @summary C2 selects simdutf only at the measured stub replacement boundaries
 * @requires vm.compiler2.enabled & vm.compMode != "Xint"
 * @requires (os.arch == "aarch64") | (os.arch == "amd64" & vm.cpu.features ~= ".*sse4.2.*")
 * @library /test/lib /
 * @modules java.base/jdk.internal.access
 * @run driver TestC2StubSelection
 */

import java.util.Base64;
import compiler.lib.ir_framework.*;
import jdk.internal.access.JavaLangAccess;
import jdk.internal.access.SharedSecrets;
import jdk.test.lib.Asserts;
import jdk.test.lib.Platform;

public class TestC2StubSelection {
    private static final JavaLangAccess JLA = SharedSecrets.getJavaLangAccess();
    private static final byte[] INPUT = new byte[8193];
    private static final byte[] ENCODED = Base64.getEncoder().encode(INPUT);
    private static final byte[] ENCODE_OUTPUT = new byte[ENCODED.length];
    private static final byte[] DECODE_OUTPUT = new byte[INPUT.length];

    public static void main(String[] args) {
        TestFramework framework = new TestFramework()
                // Inspect the block calls inside the large public API wrappers.
                .addFlags("--add-exports=java.base/jdk.internal.access=ALL-UNNAMED",
                          "-XX:+UseBASE64Intrinsics",
                          "-XX:CompileCommand=inline,java.util.Base64$Encoder::encode0",
                          "-XX:CompileCommand=inline,java.util.Base64$Decoder::decode0")
                .addScenarios(new Scenario(0, "-XX:+UseSIMDUTFIntrinsics"),
                              new Scenario(1, "-XX:-UseSIMDUTFIntrinsics"),
                              new Scenario(2, "-XX:SIMDUTFMinLength=2000000000"));
        if (Platform.isX64()) {
            framework.addScenarios(new Scenario(3, "-XX:UseAVX=2"),
                                   new Scenario(4, "-XX:+UseSIMDUTFIntrinsics", "-XX:SIMDUTFMinLength=1"));
        }
        framework.start();
    }

    @Test
    @IR(applyIfNot = {"SIMDUTFMinLength", "1"},
        failOn = {IRNode.CALL_OF, "simdutf_count_positives"})
    @IR(applyIfPlatform = {"x64", "true"}, applyIf = {"SIMDUTFMinLength", "1"},
        counts = {IRNode.CALL_OF, "simdutf_count_positives", "1"})
    public static int countBelowFloor() {
        return JLA.countPositives(INPUT, 0, 1023);
    }

    @Test
    @IR(applyIfPlatform = {"x64", "true"},
        applyIfAnd = {"UseSIMDUTFIntrinsics", "true", "SIMDUTFMinLength", "256"},
        counts = {IRNode.CALL_OF, "simdutf_count_positives", "1"})
    @IR(applyIfPlatform = {"aarch64", "true"},
        failOn = {IRNode.CALL_OF, "simdutf_count_positives"})
    @IR(applyIf = {"UseSIMDUTFIntrinsics", "false"},
        failOn = {IRNode.CALL_OF, "simdutf_count_positives"})
    @IR(applyIf = {"SIMDUTFMinLength", "> 1048576"},
        failOn = {IRNode.CALL_OF, "simdutf_count_positives"})
    public static int countAtFloor() {
        return JLA.countPositives(INPUT, 0, 1024);
    }

    @Test
    @IR(applyIfPlatform = {"x64", "true"},
        applyIfAnd = {"UseSIMDUTFIntrinsics", "true", "SIMDUTFMinLength", "256"},
        counts = {IRNode.CALL_OF, "simdutf_encode_base64", "> 0"})
    @IR(applyIfPlatform = {"aarch64", "true"},
        failOn = {IRNode.CALL_OF, "simdutf_encode_base64"})
    @IR(applyIf = {"UseSIMDUTFIntrinsics", "false"},
        failOn = {IRNode.CALL_OF, "simdutf_encode_base64"})
    @IR(applyIf = {"SIMDUTFMinLength", "> 1048576"},
        failOn = {IRNode.CALL_OF, "simdutf_encode_base64"})
    public static int encode() {
        return Base64.getEncoder().encode(INPUT, ENCODE_OUTPUT);
    }

    @Test
    @IR(applyIfPlatform = {"x64", "true"},
        applyIfAnd = {"UseSIMDUTFIntrinsics", "true", "SIMDUTFMinLength", "256"},
        applyIfCPUFeature = {"avx512_vbmi", "false"},
        counts = {IRNode.CALL_OF, "simdutf_decode_base64", "> 0"})
    @IR(applyIf = {"SIMDUTFMinLength", "256"},
        applyIfCPUFeatureAnd = {"avx512_vbmi", "true", "avx512bw", "true", "bmi2", "true"},
        failOn = {IRNode.CALL_OF, "simdutf_decode_base64"})
    @IR(applyIfPlatform = {"x64", "true"}, applyIf = {"SIMDUTFMinLength", "1"},
        counts = {IRNode.CALL_OF, "simdutf_decode_base64", "> 0"})
    @IR(applyIfPlatform = {"aarch64", "true"},
        failOn = {IRNode.CALL_OF, "simdutf_decode_base64"})
    @IR(applyIf = {"UseSIMDUTFIntrinsics", "false"},
        failOn = {IRNode.CALL_OF, "simdutf_decode_base64"})
    @IR(applyIf = {"SIMDUTFMinLength", "> 1048576"},
        failOn = {IRNode.CALL_OF, "simdutf_decode_base64"})
    public static int decode() {
        return Base64.getDecoder().decode(ENCODED, DECODE_OUTPUT);
    }

    @Run(test = {"countBelowFloor", "countAtFloor", "encode", "decode"})
    public static void check() {
        Asserts.assertEQ(countBelowFloor(), 1023);
        Asserts.assertEQ(countAtFloor(), 1024);
        Asserts.assertEQ(encode(), ENCODED.length);
        Asserts.assertEQ(decode(), INPUT.length);
        Asserts.assertTrue(java.util.Arrays.equals(ENCODE_OUTPUT, ENCODED));
        Asserts.assertTrue(java.util.Arrays.equals(DECODE_OUTPUT, INPUT));
    }
}
