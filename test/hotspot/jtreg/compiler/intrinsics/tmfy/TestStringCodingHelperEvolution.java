/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

/*
 * @test
 * @summary Redefining StringCoding revokes origin admission while an unrelated nmethod survives
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.jvmti & vm.compiler1.enabled & vm.compiler2.enabled
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:StringCodingHelperEvolution compiler.intrinsics.tmfy.TestStringCodingHelperEvolution encode cold 1
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:StringCodingHelperEvolution compiler.intrinsics.tmfy.TestStringCodingHelperEvolution encode ready 1
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:StringCodingHelperEvolution compiler.intrinsics.tmfy.TestStringCodingHelperEvolution decode cold 1
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:StringCodingHelperEvolution compiler.intrinsics.tmfy.TestStringCodingHelperEvolution decode ready 1
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:-TieredCompilation -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:StringCodingHelperEvolution compiler.intrinsics.tmfy.TestStringCodingHelperEvolution encode cold 4
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:-TieredCompilation -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:StringCodingHelperEvolution compiler.intrinsics.tmfy.TestStringCodingHelperEvolution encode ready 4
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:-TieredCompilation -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:StringCodingHelperEvolution compiler.intrinsics.tmfy.TestStringCodingHelperEvolution decode cold 4
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:-TieredCompilation -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:StringCodingHelperEvolution compiler.intrinsics.tmfy.TestStringCodingHelperEvolution decode ready 4
 */
package compiler.intrinsics.tmfy;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.NMethod;
public class TestStringCodingHelperEvolution {
    static { System.loadLibrary("StringCodingHelperEvolution"); }
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static native int redefine(Class<?> holder, byte[] bytes);
    private static final String TEXT = "\u4e2d".repeat(128);
    private static final byte[] BYTES = bytes();
    private static byte[] bytes() {
        byte[] b = new byte[384];
        for (int i=0;i<b.length;i+=3) { b[i]=(byte)0xe4; b[i+1]=(byte)0xb8; b[i+2]=(byte)0xad; }
        return b;
    }
    private static int unrelated(int x) { return (x*31)^0x123456; }
    private static void convert(boolean encode) {
        if (encode ? !Arrays.equals(BYTES,TEXT.getBytes(StandardCharsets.UTF_8))
                : !TEXT.equals(new String(BYTES,StandardCharsets.UTF_8))) throw new AssertionError("public conversion");
    }
    public static void main(String[] args) throws Exception {
        boolean encode=args[0].equals("encode"), ready=args[1].equals("ready");
        int level=Integer.parseInt(args[2]);
        Class<?> holder=Class.forName("java.lang.StringCoding");
        Field field=holder.getDeclaredField("utf8Ready"); field.setAccessible(true);
        if (field.getBoolean(null)) throw new AssertionError("premature registration");
        Method origin=encode ? String.class.getDeclaredMethod("encodeUTF8_UTF16",byte[].class,Class.class)
                : String.class.getDeclaredMethod("decodeUTF8_UTF16Stable",byte[].class,int.class,int.class,byte[].class,int.class);
        Method nativeMethod=holder.getDeclaredMethod(encode?"encodeUtf16Utf80":"decodeUtf8Utf160",
                byte[].class,int.class,int.class,byte[].class,int.class,int.class);
        Method control=TestStringCodingHelperEvolution.class.getDeclaredMethod("unrelated",int.class);
        WB.testSetDontInlineMethod(origin,true); WB.testSetDontInlineMethod(control,true);
        if (!WB.isIntrinsicAvailable(nativeMethod,level)) throw new AssertionError("native intrinsic unavailable before redefinition");
        if (ready && !StringCodingAccess.ready()) throw new AssertionError("registration");
        for (int i=0;i<30_000;i++) {
            convert(encode);
            if (unrelated(i)!=((i*31)^0x123456)) throw new AssertionError("control");
        }
        if (!ready && field.getBoolean(null)) throw new AssertionError("cold warmup registered");
        for (Method m : new Method[] {origin,control}) {
            if (WB.getMethodCompilationLevel(m)!=level && !WB.enqueueMethodForCompilation(m,level)) {
                throw new AssertionError("compilation refused");
            }
        }
        NMethod old=NMethod.get(origin,false), other=NMethod.get(control,false);
        if (old==null || other==null) throw new AssertionError("nmethods missing");
        byte[] definition;
        try (var stream=holder.getResourceAsStream("/java/lang/StringCoding.class")) {
            if (stream==null) throw new AssertionError("original class resource missing");
            definition=stream.readAllBytes();
        }
        if (redefine(holder,definition)!=0) throw new AssertionError("StringCoding redefinition failed");
        if (NMethod.get(origin,false)!=null) throw new AssertionError("origin admission survived helper evolution");
        NMethod surviving=NMethod.get(control,false);
        if (surviving==null || surviving.compile_id!=other.compile_id) throw new AssertionError("unrelated compiled control invalidated");
        if (!WB.isIntrinsicAvailable(nativeMethod,level)) throw new AssertionError("helper evolution disabled intrinsic globally");
        for (int i=0;i<100;i++) convert(encode);
        System.out.println("STRING_CODING_HELPER_EVOLUTION_OK "+String.join(" ",args));
    }
}
