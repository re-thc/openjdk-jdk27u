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
 * @summary Acquiring NativeMethodBind capability revokes compiled Unicode origin policies
 * @requires os.family == "linux" & os.arch == "amd64" & vm.jvmti & vm.gc.G1 & vm.compiler1.enabled & vm.compiler2.enabled
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:StringCodingLateTooling compiler.intrinsics.tmfy.TestStringCodingLateTooling encode 1
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:StringCodingLateTooling compiler.intrinsics.tmfy.TestStringCodingLateTooling decode 1
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:-TieredCompilation -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:StringCodingLateTooling compiler.intrinsics.tmfy.TestStringCodingLateTooling encode 4
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:-TieredCompilation -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:StringCodingLateTooling compiler.intrinsics.tmfy.TestStringCodingLateTooling decode 4
 */
package compiler.intrinsics.tmfy;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.NMethod;
public class TestStringCodingLateTooling {
    static { System.loadLibrary("StringCodingLateTooling"); }
    private static native int acquire();
    private static final WhiteBox WB=WhiteBox.getWhiteBox();
    private static final String TEXT="\u4e2d".repeat(128);
    private static final byte[] BYTES=bytes(128);
    private static byte[] bytes(int n) {
        byte[] b=new byte[n*3];
        for (int i=0;i<b.length;i+=3) { b[i]=(byte)0xe4;b[i+1]=(byte)0xb8;b[i+2]=(byte)0xad; }
        return b;
    }
    private static void convert(boolean encoding) {
        if (encoding ? !Arrays.equals(BYTES,TEXT.getBytes(StandardCharsets.UTF_8))
                : !TEXT.equals(new String(BYTES,StandardCharsets.UTF_8))) throw new AssertionError("conversion");
    }
    public static void main(String[] args) throws Exception {
        boolean encode=args[0].equals("encode"); int level=Integer.parseInt(args[1]);
        Class<?> holder=Class.forName("java.lang.StringCoding");
        Field field=holder.getDeclaredField("utf8Ready");field.setAccessible(true);
        if (field.getBoolean(null)) throw new AssertionError("premature initialization");
        Method origin=encode?String.class.getDeclaredMethod("encodeUTF8_UTF16",byte[].class,Class.class)
                :String.class.getDeclaredMethod("decodeUTF8_UTF16Stable",byte[].class,int.class,int.class,byte[].class,int.class);
        WB.testSetDontInlineMethod(origin,true);
        for (int i=0;i<30_000;i++) convert(encode);
        if (field.getBoolean(null)) throw new AssertionError("small warmup initialized converter");
        if (WB.getMethodCompilationLevel(origin)!=level && !WB.enqueueMethodForCompilation(origin,level)) {
            throw new AssertionError("origin compilation refused");
        }
        if (NMethod.get(origin,false)==null) throw new AssertionError("origin nmethod missing");
        int error=acquire();
        if (error!=0) throw new AssertionError("late NativeMethodBind capability error "+error);
        if (NMethod.get(origin,false)!=null) throw new AssertionError("late tooling retained origin policy");
        if (!StringCodingAccess.ready()) throw new AssertionError("late setup");
        long[] before=StringCodingAccess.counters0();
        for (int i=0;i<1000;i++) convert(encode);
        long[] after=StringCodingAccess.counters0();
        if (after[0]!=before[0] || after[1]-before[1]!=1000 || after[2]!=before[2]) {
            throw new AssertionError("late tooling did not retain exact JNI observability");
        }
        System.out.println("STRING_CODING_LATE_TOOLING_OK "+String.join(" ",args));
    }
}
