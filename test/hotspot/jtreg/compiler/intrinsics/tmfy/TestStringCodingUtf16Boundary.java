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
 * @summary Unicode typed natives preserve bounds, replacement and prewrite rejection
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.compiler1.enabled & vm.compiler2.enabled
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @run main/othervm -Xint -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingUtf16Boundary leaf
 * @run main/othervm -Xint -XX:-UseTmfyStringCoding -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingUtf16Boundary jni
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingUtf16Boundary leaf
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:-UseTmfyStringCoding -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingUtf16Boundary jni
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingUtf16Boundary leaf
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:-UseTmfyStringCoding -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingUtf16Boundary jni
 */
package compiler.intrinsics.tmfy;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;

public class TestStringCodingUtf16Boundary {
    private static final byte SENTINEL = 0x5a;
    private static byte[] utf16(char[] chars) {
        ByteBuffer b = ByteBuffer.allocate(chars.length * 2).order(ByteOrder.nativeOrder());
        for (char c : chars) b.putChar(c);
        return b.array();
    }
    private static int call(boolean encode, byte[] in, int off, int len, byte[] out, int pos, int cap) {
        return encode ? StringCodingAccess.encodeUtf16Utf80(in, off, len, out, pos, cap)
                : StringCodingAccess.decodeUtf8Utf160(in, off, len, out, pos, cap);
    }
    public static void main(String[] args) throws Exception {
        if (!StringCodingAccess.ready()) throw new AssertionError("registration");
        byte[] warm = utf16(new char[64]), target = new byte[192];
        for (int i = 0; i < 20_000; i++) {
            call(true, warm, 0, warm.length, target, 0, target.length);
            call(false, target, 0, 64, warm, 0, warm.length);
        }
        long[] before = StringCodingAccess.counters0();
        for (int units : new int[] {0,1,15,16,17,31,32,63,64,65,2047,2048}) {
            for (char c : new char[] {0,'A','\u00e9','\u4e2d','\ud800','\udc00'}) {
                char[] chars = new char[units]; Arrays.fill(chars,c);
                ByteBuffer encoded = StandardCharsets.UTF_8.newEncoder()
                        .onMalformedInput(CodingErrorAction.REPLACE).encode(CharBuffer.wrap(chars));
                byte[] expected = new byte[encoded.remaining()]; encoded.get(expected);
                conversion(true, utf16(chars), expected, expected.length);
            }
        }
        for (int n : new int[] {0,1,15,16,255,256,257,1023,1024,4095,4096}) {
            for (int pattern = 0; pattern < 3; pattern++) {
                byte[] bytes = new byte[n];
                for (int i = 0; i < n; i++) bytes[i] = pattern == 0 ? (byte) 'A'
                        : pattern == 1 ? new byte[] {(byte)0xe4,(byte)0xb8,(byte)0xad}[i%3] : (byte) (i*37);
                CharBuffer decoded = StandardCharsets.UTF_8.newDecoder()
                        .onMalformedInput(CodingErrorAction.REPLACE).decode(ByteBuffer.wrap(bytes));
                char[] chars = new char[decoded.remaining()]; decoded.get(chars);
                conversion(false, bytes, utf16(chars), chars.length);
            }
        }
        long[] after = StringCodingAccess.counters0();
        int route = args[0].equals("leaf") ? 0 : 1;
        if (after[route] <= before[route] || after[1-route] != before[1-route] || after[2] != before[2]) {
            throw new AssertionError("direct Unicode route " + Arrays.toString(before) + " -> " + Arrays.toString(after));
        }
        for (boolean encode : new boolean[] {true,false}) {
            byte[] input = new byte[4100], output = new byte[12300];
            bad(encode,null,0,0,output,0,0,-2);
            bad(encode,input,0,0,null,0,0,-2);
            bad(encode,input,-1,1,output,0,3,-2);
            bad(encode,input,0,-1,output,0,3,-2);
            bad(encode,input,0,8,output,-1,24,-2);
            bad(encode,input,0,8,output,0,1,-2);
            bad(encode,input,0,0,input,0,0,-2);
            bad(encode,input,0,4098,output,0,encode?6147:8196,-1);
            if (encode) bad(true,input,0,3,output,0,6,-2);
            else bad(false,input,0,8,output,1,16,-2);
        }
        System.out.println("STRING_CODING_UTF16_BOUNDARY_OK " + args[0]);
    }
    private static void conversion(boolean encode, byte[] input, byte[] expected, int result) {
        int offset = encode ? 4 : 3, position = 6;
        byte[] source = new byte[offset + input.length + 7];
        System.arraycopy(input,0,source,offset,input.length);
        byte[] original = source.clone();
        int capacity = encode ? input.length / 2 * 3 : input.length * 2;
        byte[] output = new byte[position + capacity + 13]; Arrays.fill(output,SENTINEL);
        byte[] wanted = output.clone(); System.arraycopy(expected,0,wanted,position,expected.length);
        int actual = call(encode,source,offset,input.length,output,position,capacity);
        if (actual != result || !Arrays.equals(output,wanted) || !Arrays.equals(source,original)) {
            throw new AssertionError("Unicode conversion bounds/replacement " + encode + "/" + input.length);
        }
    }
    private static void bad(boolean encode, byte[] input, int offset, int length,
                            byte[] output, int position, int capacity, int expected) {
        if (output != null) Arrays.fill(output,SENTINEL);
        byte[] a = input == null ? null : input.clone(), b = output == null ? null : output.clone();
        int actual = call(encode,input,offset,length,output,position,capacity);
        if (actual != expected || !Arrays.equals(a,input) || !Arrays.equals(b,output)) {
            throw new AssertionError("Unicode prewrite rejection " + actual + " expected " + expected);
        }
    }
}
