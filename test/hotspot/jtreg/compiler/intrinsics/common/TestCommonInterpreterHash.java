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
 * @summary Generate interpreter hash entries without metadata relocations and check each array representation
 * @requires vm.compiler2.enabled
 * @requires vm.opt.final.UseVectorizedHashCodeIntrinsic == true
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @modules java.base/jdk.internal.util
 * @run main/othervm -Xint -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonInterpreterHash
 * @run main/othervm -Xint -XX:+UseCommonIntrinsics -XX:-UseFourByteObjectHeaders compiler.intrinsics.common.TestCommonInterpreterHash
 * @run main/othervm -Xint -XX:+UseCommonIntrinsics -XX:-UseFourByteObjectHeaders -XX:-UseCompactObjectHeaders -XX:-UseCompressedClassPointers compiler.intrinsics.common.TestCommonInterpreterHash
 * @run main/othervm -Xint -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonInterpreterHash
 */

package compiler.intrinsics.common;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import jdk.internal.util.ArraysSupport;

public class TestCommonInterpreterHash {
    public static void main(String[] args) {
        byte[] bytes = new byte[65545];
        short[] shorts = new short[bytes.length];
        char[] chars = new char[bytes.length];
        int[] ints = new int[bytes.length];
        byte[] utf16 = new byte[2 * bytes.length];
        ByteBuffer encoded = ByteBuffer.wrap(utf16).order(ByteOrder.nativeOrder());
        for (int i = 0; i < bytes.length; i++) {
            int value = i * 0x31415927 ^ 0x89abcdef;
            bytes[i] = (byte) value;
            shorts[i] = (short) value;
            chars[i] = (char) value;
            ints[i] = value;
            encoded.putChar(2 * i, chars[i]);
        }
        for (int offset : new int[] {0, 1, 5}) {
            for (int length : new int[] {0, 1, 2, 7, 31, 257, 65536, 65537}) {
                for (int seed : new int[] {0, 1, -1729, Integer.MAX_VALUE}) {
                    int byteHash = seed;
                    int unsignedHash = seed;
                    int shortHash = seed;
                    int charHash = seed;
                    int intHash = seed;
                    for (int i = offset; i < offset + length; i++) {
                        byteHash = 31 * byteHash + bytes[i];
                        unsignedHash = 31 * unsignedHash + Byte.toUnsignedInt(bytes[i]);
                        shortHash = 31 * shortHash + shorts[i];
                        charHash = 31 * charHash + chars[i];
                        intHash = 31 * intHash + ints[i];
                    }
                    check("byte", byteHash, ArraysSupport.hashCode(bytes, offset, length, seed));
                    check("unsigned byte", unsignedHash, ArraysSupport.hashCodeOfUnsigned(bytes, offset, length, seed));
                    check("short", shortHash, ArraysSupport.hashCode(shorts, offset, length, seed));
                    check("char", charHash, ArraysSupport.hashCode(chars, offset, length, seed));
                    check("UTF16 byte", charHash, ArraysSupport.hashCodeOfUTF16(utf16, offset, length, seed));
                    check("int", intHash, ArraysSupport.hashCode(ints, offset, length, seed));
                }
            }
        }
    }

    private static void check(String representation, int expected, int actual) {
        if (actual != expected) {
            throw new AssertionError(representation + ": " + actual + " != " + expected);
        }
    }
}
