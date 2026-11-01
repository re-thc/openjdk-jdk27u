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
 *
 */

/*
 * @test
 * @summary Existing character search entries preserve code units, code points and ranges
 * @run main/othervm -Xint TestCharacterSearch
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestCharacterSearch
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestCharacterSearch
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestCharacterSearch
 */
import java.util.Arrays;
public class TestCharacterSearch {
    private static int expected(String s, int ch, int from, int end) {
        if (!Character.isValidCodePoint(ch)) return -1;
        for (int i=from; i<end; i++) {
            if (ch<65536 ? s.charAt(i)==ch : i+1<end && s.charAt(i)==Character.highSurrogate(ch) &&
                    s.charAt(i+1)==Character.lowSurrogate(ch)) return i;
        }
        return -1;
    }
    private static void check(String s, int ch, int from, int end, int repeats) {
        int expected = expected(s,ch,from,end);
        for (int i=0; i<repeats; i++) {
            int actual = s.indexOf(ch,from,end);
            if (actual != expected)
                throw new AssertionError("ch="+ch+" range="+from+":"+end+
                        " expected="+expected+" actual="+actual);
        }
    }
    public static void main(String[] args) {
        for (int length : new int[]{0,1,15,16,31,255,256,257,2047,2048,2063,2064,2065,8192,1048576,1048600}) {
            for (char fill : new char[]{'a','\u20ac'}) {
                char[] chars = new char[length]; Arrays.fill(chars,fill);
                for (int at : new int[]{0,Math.min(16,length-1),length-1}) {
                    if (at>=0 && at<length) chars[at]='z';
                    String text = new String(chars);
                    for (int ch : new int[]{'z',fill,'q',-1,0x10000,0x110000}) {
                        check(text,ch,0,length,length<=8192?100:1);
                        check(text,ch,Math.min(length,17),length,1);
                    }
                    if (at>=0 && at<length) chars[at]=fill;
                }
            }
        }
        String supplementary = "€".repeat(4096)+"\ud83d\ude00"+"€".repeat(32);
        for(int ch:new int[]{0x1f600,0xd83d,0xde00,-1,0x110000}) {
            check(supplementary,ch,0,supplementary.length(),100);
            check(supplementary,ch,0,4097,100);
            check(supplementary,ch,4097,supplementary.length(),100);
        }
        // The String-needle overload remains the existing substring operation.
        if (supplementary.indexOf("😀")!=4096 || supplementary.indexOf("€😀")!=4095)
            throw new AssertionError("substring overload");
    }
}
