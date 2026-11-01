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
 * @summary Mixed digest receivers and ordinary size misses retain available C1 MB routes
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox jdk.test.whitebox.code.NMethod
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xint -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonDigestPartialBackends 0
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xint -XX:+UseCommonIntrinsics -XX:-UseSHA3Intrinsics compiler.intrinsics.common.TestCommonDigestPartialBackends 0
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xint -XX:+UseCommonIntrinsics -XX:-UseSHA1Intrinsics -XX:-UseSHA256Intrinsics -XX:-UseSHA512Intrinsics -XX:-UseSHA3Intrinsics compiler.intrinsics.common.TestCommonDigestPartialBackends 0
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xint -XX:+UseCommonIntrinsics -XX:-UseMD5Intrinsics -XX:-UseSHA1Intrinsics -XX:-UseSHA256Intrinsics -XX:-UseSHA512Intrinsics -XX:-UseSHA3Intrinsics compiler.intrinsics.common.TestCommonDigestPartialBackends 0
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xint -XX:+UseCommonIntrinsics -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonDigestPartialBackends 0
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,sun.security.provider.DigestBase::implCompressMultiBlock  compiler.intrinsics.common.TestCommonDigestPartialBackends 1
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,sun.security.provider.DigestBase::implCompressMultiBlock -XX:-UseMD5Intrinsics compiler.intrinsics.common.TestCommonDigestPartialBackends 1
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,sun.security.provider.DigestBase::implCompressMultiBlock -XX:-UseSHA1Intrinsics compiler.intrinsics.common.TestCommonDigestPartialBackends 1
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,sun.security.provider.DigestBase::implCompressMultiBlock -XX:-UseSHA256Intrinsics compiler.intrinsics.common.TestCommonDigestPartialBackends 1
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,sun.security.provider.DigestBase::implCompressMultiBlock -XX:-UseSHA512Intrinsics compiler.intrinsics.common.TestCommonDigestPartialBackends 1
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,sun.security.provider.DigestBase::implCompressMultiBlock -XX:-UseSHA3Intrinsics compiler.intrinsics.common.TestCommonDigestPartialBackends 1
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,sun.security.provider.DigestBase::implCompressMultiBlock -XX:DisableIntrinsic=_sha3_implCompress compiler.intrinsics.common.TestCommonDigestPartialBackends 1
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,sun.security.provider.DigestBase::implCompressMultiBlock  compiler.intrinsics.common.TestCommonDigestPartialBackends 3
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,sun.security.provider.DigestBase::implCompressMultiBlock -XX:-UseMD5Intrinsics compiler.intrinsics.common.TestCommonDigestPartialBackends 3
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,sun.security.provider.DigestBase::implCompressMultiBlock -XX:-UseSHA1Intrinsics compiler.intrinsics.common.TestCommonDigestPartialBackends 3
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,sun.security.provider.DigestBase::implCompressMultiBlock -XX:-UseSHA256Intrinsics compiler.intrinsics.common.TestCommonDigestPartialBackends 3
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,sun.security.provider.DigestBase::implCompressMultiBlock -XX:-UseSHA512Intrinsics compiler.intrinsics.common.TestCommonDigestPartialBackends 3
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,sun.security.provider.DigestBase::implCompressMultiBlock -XX:-UseSHA3Intrinsics compiler.intrinsics.common.TestCommonDigestPartialBackends 3
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,sun.security.provider.DigestBase::implCompressMultiBlock -XX:DisableIntrinsic=_sha3_implCompress compiler.intrinsics.common.TestCommonDigestPartialBackends 3
 */

package compiler.intrinsics.common;

import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.util.HexFormat;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.NMethod;

public class TestCommonDigestPartialBackends {
    static final WhiteBox WB = WhiteBox.getWhiteBox();
    static final String[] ALGORITHMS = {"MD5", "SHA-1", "SHA-224", "SHA-256", "SHA-384", "SHA-512",
                                       "SHA3-224", "SHA3-256", "SHA3-384", "SHA3-512"};
    static final int[] LENGTHS = {4096, 1048704};
    static final String[][] EXPECTED = {
        {"14a5ca6a7d6b02a5c88750738e18d683", "cd6f3fc6a35f90ef67bb842201b4a9d83c85c5ce", "9648b78183773e4c9c98e09cebb67f86c36843fd200587485673b31a", "92a4ca3823807c8e78b70bf9270c58d236de4eae5d5f5f8df9a77baf68181b04", "8b67ea3164054d0daeab7668fc8ea5434819dc1ff1a4c18c97964fe29a378878f5b6b4e89382031caf8d5d3fcfc7e140", "fde9e885e7435cd47594398bd011f03596e1716006037f4a4e18c2de9bb9c0ecdcc99c61f46ec609594f43a63d444d29d981ae9901581e149d889a70a9603098", "19977638f3ca6f88d905db3d9a4c2466c13d9a80b1bea4313db16ca1", "8fa530d8986d2108b413114130068fc80e6c1e291ed4710f9425c07559d76025", "d34d642faa2320d83cf3c2ba7a8c40c3f13db6f35a5c5ccfd339839f9fa578e2a128b086dd34ffda443fa7ef02ac06c7", "9ba6261ea8f7b8f2dd2e58d57c5989ff99c8e75117b0836b27267f7ce00276762a355a169be3d2d2a446386fa35bd35d934eb5606830ce62c3033708e19c73ed"},
        {"db3c55ff3a375aaebdbf525651dc33c0", "179004fc111a2654a9e01ce7a234c51af3c4ae93", "ccbe828e8da41ff150e82eb51ca0a35708523f652f2e624bfab453f4", "0b8caf37ac31edb4aed784c57f931bfb4525468d565ef69bcb2e86660f892f4f", "095d51c35aab3808419d1061cd16adc92abefcdf350fac0b90428ec293ed24612f281c29c8217cb0f71ed40084ac0f34", "f95a27d11df25532120ed1234282e7682f83b1ad8afe121814546dcce107f746620a939294d66971506548a533193871244c4917da1f5981038af26ba1a44f5f", "698eb76c0f18eb4fd03d59fee2d0aadc25d013161264096784a11e90", "1803429ed4982272747b534ec3aec156d4ba351d618a5a170f9a47270a28e491", "ebb954a97c7cb8d3aadc426c24124d8f7a8dde424a9c29353a58eac7d243f97daf750895180450f7f07218a3f67becc9", "99373d0c7c0dafbc0aebd9a5ffc7bb3e19570ffd2d240245f6535a01945ec94441cd5d280e1bbb18cd8486a5db75e9bf64925d2129143ce6fab5c9761e7de3f8"}
    };
    static final byte[][] INPUTS = new byte[LENGTHS.length][];
    static {
        for (int n=0; n<LENGTHS.length; n++) {
            INPUTS[n] = new byte[LENGTHS[n]];
            for (int i=0; i<INPUTS[n].length; i++) INPUTS[n][i]=(byte)(i*73+(i>>>5));
        }
    }
    static void check(String algorithm, int a, int n) throws Exception {
        MessageDigest md = MessageDigest.getInstance(algorithm);
        String actual = HexFormat.of().formatHex(md.digest(INPUTS[n]));
        if (!EXPECTED[n][a].equals(actual)) throw new AssertionError(algorithm+" length="+LENGTHS[n]+": "+actual);
    }
    public static void main(String[] args) throws Exception {
        int level=Integer.parseInt(args[0]);
        if (level == 0) {
            for (int a = 0; a < ALGORITHMS.length; a++) check(ALGORITHMS[a], a, 0);
            check("MD5", 0, 1);
            check("SHA-256", 3, 1);
            System.out.println("Interpreter partial-backend digest checks passed");
            return;
        }
        // Two distinct implementations avoid unique-implementor CHA dependencies.
        check("MD5",0,0); check("SHA-256",3,0);
        Class<?> base=Class.forName("sun.security.provider.DigestBase");
        Method kernel=base.getDeclaredMethod("implCompressMultiBlock0",byte[].class,int.class,int.class);
        Method update=base.getDeclaredMethod("engineUpdate",byte[].class,int.class,int.class);
        boolean available=WB.isIntrinsicAvailable(kernel,level);
        System.out.println("MB_AVAILABLE="+available+" DisableIntrinsic="+WB.getStringVMFlag("DisableIntrinsic"));
        for(String f:new String[]{"UseMD5Intrinsics","UseSHA1Intrinsics","UseSHA256Intrinsics","UseSHA512Intrinsics","UseSHA3Intrinsics"})
            System.out.println(f+"="+WB.getBooleanVMFlag(f));
        // On machines with no remaining MB backend, retain correctness coverage
        // but do not claim that a nonexistent intrinsic survived the operation.
        boolean require = available;
        WB.testSetDontInlineMethod(update,true);
        WB.deoptimizeMethod(update); WB.clearMethodState(update);
        if(!WB.enqueueMethodForCompilation(update,level)||WB.getMethodCompilationLevel(update)!=level)
            throw new AssertionError("Failed compilation");
        int before=NMethod.get(update,false).compile_id;
        for(int a=0;a<ALGORITHMS.length;a++) {
            check(ALGORITHMS[a],a,0); // load later providers / unsupported backend
            NMethod now=NMethod.get(update,false);
            System.out.println("AFTER_SMALL "+ALGORITHMS[a]+" compile_id="+(now==null?-1:now.compile_id));
            if(require && (now==null||now.compile_id!=before)) throw new AssertionError("Small mixed receiver invalidated site: "+ALGORITHMS[a]);
        }
        for(int a=0;a<ALGORITHMS.length;a++) {
            check(ALGORITHMS[a],a,1); // normal valid oversized eligibility miss
            check(ALGORITHMS[a],a,0); // same engineUpdate BCI must still be intrinsic
            NMethod now=NMethod.get(update,false);
            System.out.println("AFTER_LARGE_SMALL "+ALGORITHMS[a]+" compile_id="+(now==null?-1:now.compile_id));
            if(require && (now==null||now.compile_id!=before)) throw new AssertionError("Size miss invalidated site: "+ALGORITHMS[a]);
        }
        System.out.println("Mixed digest provider and size fallback checks passed");
    }
}
