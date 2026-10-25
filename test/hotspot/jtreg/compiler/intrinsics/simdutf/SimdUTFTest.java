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
 * @test id=portable
 * @summary Bulk simdutf conversion, range, capacity and fallback contracts in every execution tier
 * @modules java.base/jdk.internal.util:+open
 *          jdk.management
 * @run main/othervm -Xint SimdUTFTest
 * @run main/othervm -XX:-CompactStrings SimdUTFTest
 * @run main/othervm -Xint -XX:SIMDUTFMinLength=1 SimdUTFTest
 * @run main/othervm -Xint -XX:ReservedCodeCacheSize=48M SimdUTFTest
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_simdutf_process -XX:SIMDUTFMinLength=64 SimdUTFTest
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics SimdUTFTest false
 */

/*
 * @test id=compiled
 * @summary Bulk simdutf contracts in C1, C2 and compiled JNI fallback
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @modules java.base/jdk.internal.util:+open
 *          jdk.management
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 SimdUTFTest
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:SIMDUTFMinLength=1 SimdUTFTest
 * @run main/othervm -Xbatch -XX:ReservedCodeCacheSize=48M SimdUTFTest
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 SimdUTFTest
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:SIMDUTFMinLength=1 SimdUTFTest
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:-UseBASE64Intrinsics SimdUTFTest
 * @run main/othervm -Xbatch -XX:SIMDUTFMinLength=64 -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_simdutf_process SimdUTFTest
 */

/*
 * @test id=sse
 * @summary simdutf Base64 in C2 without AVX2 HotSpot stubs
 * @requires (os.arch == "amd64" | os.arch == "x86_64") & vm.compiler2.enabled
 * @modules java.base/jdk.internal.util:+open
 *          jdk.management
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:UseAVX=0 SimdUTFTest
 */

/*
 * @test id=checked-oops
 * @summary Raw object-pointer ABI with fastdebug oop checking in every tier
 * @requires vm.debug & vm.compiler1.enabled & vm.compiler2.enabled
 * @modules java.base/jdk.internal.util:+open
 *          jdk.management
 * @run main/othervm -Xint -XX:+CheckUnhandledOops SimdUTFTest
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+CheckUnhandledOops SimdUTFTest
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:+CheckUnhandledOops SimdUTFTest
 * @run main/othervm -Xint -XX:+CheckUnhandledOops -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_simdutf_process -XX:SIMDUTFMinLength=64 SimdUTFTest
 */

/*
 * @test id=search
 * @summary Single-code-unit String needles and native search when C2 string intrinsics are disabled
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @modules java.base/jdk.internal.util:+open
 *          jdk.management
 * @run main/othervm -Xint -Dsimdutf.searchOnly=true SimdUTFTest
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -Dsimdutf.searchOnly=true SimdUTFTest
 * @run main/othervm -Xbatch -XX:-TieredCompilation -Dsimdutf.searchOnly=true SimdUTFTest
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:-CompactStrings -Dsimdutf.searchOnly=true SimdUTFTest
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_indexOfL_char,_indexOfU_char -Dsimdutf.searchOnly=true -Dsimdutf.requireSearch=true SimdUTFTest
 */

import com.sun.management.HotSpotDiagnosticMXBean;
import jdk.internal.util.SimdUTF;
import java.io.ByteArrayOutputStream;
import java.lang.management.ManagementFactory;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Base64;
import java.util.Random;
import java.util.concurrent.atomic.AtomicBoolean;

public class SimdUTFTest {
    private static final Random RANDOM = new Random(9271);
    private static final int[] LENGTHS = {0, 1, 2, 3, 15, 16, 31, 32, 63, 64, 65, 127, 128,
                                          255, 256, 257, 511, 512, 513, 1023, 1024, 4097};
    private static boolean accelerationAvailable;
    private static final byte SENTINEL = 0x55;

    public static void main(String[] args) throws Exception {
        String expectedFlag = args.length == 0 ? "true" : args[0];
        String flag = ManagementFactory.getPlatformMXBean(HotSpotDiagnosticMXBean.class)
                .getVMOption("UseSIMDUTFIntrinsics").getValue();
        check(flag.equals(expectedFlag), "UseSIMDUTFIntrinsics=" + flag + ", expected " + expectedFlag);
        var threshold = SimdUTF.class.getDeclaredField("minLength");
        threshold.setAccessible(true);
        accelerationAvailable = threshold.getInt(null) > 0;
        check(!flag.equals("false") || !accelerationAvailable, "opt-out left simdutf active");
        if (Boolean.getBoolean("simdutf.searchOnly")) {
            indexOf();
            for (int length : new int[]{(1 << 20) + 15, (1 << 20) + 16, (1 << 20) + 17}) {
                for (String unit : new String[]{"a", "漢"}) {
                    String text = unit.repeat(length - 1) + "z";
                    check(text.indexOf('z') == length - 1, "search leaf-limit match");
                    check(text.indexOf('q', 7, length) == -1, "search leaf-limit absent");
                }
            }
            if (accelerationAvailable && Boolean.getBoolean("simdutf.requireSearch")) {
                byte[] latin1 = new byte[4096];
                char[] utf16 = new char[4096];
                latin1[4095] = (byte)0xe9;
                utf16[4095] = '\u6f22';
                for (int i = 0; i < 20000; i++) {
                    check(nativeSearchLatin1(latin1) == 4095, "native Latin1 search activation");
                    check(nativeSearchUTF16(utf16) == 4095, "native UTF16 search activation");
                }
            }
            return;
        }
        for (int iteration = 0; iteration < 20; iteration++) {
            for (int length : LENGTHS) {
                for (String alphabet : new String[]{"aAZ09\0", "a\u00e9\u00ff", "\u6f22\u6587a", "a\ud83d\ude03"}) {
                    StringBuilder text = new StringBuilder();
                    for (int i = 0; i < length; i++) {
                        int codePoints = alphabet.codePointCount(0, alphabet.length());
                        int index = alphabet.offsetByCodePoints(0, RANDOM.nextInt(codePoints));
                        text.appendCodePoint(alphabet.codePointAt(index));
                    }
                    checkUTF(text.toString());
                }
                byte[] input = new byte[length];
                RANDOM.nextBytes(input);
                checkBase64(input);
            }
        }
        narrowing();
        unicode();
        utf32();
        base64EncodeBoundaries();
        base64Streams();
        malformed();
        nativeRanges();
        compactLatin1();
        utf16Copies();
        utf8EncodeCapacity();
        tightBuffers();
        decoderBuffers();
        codePointCounts();
        indexOf();
        System.out.println("simdutf contracts passed");
    }

    private static void decoderBuffers() {
        for (int length : new int[]{0, 1, 2, 3, 4, 31, 128, 255, 256, 257,
                                   511, 512, 513, 1023, 1024, 1025, 4096}) {
            byte[] trailing = new byte[Math.max(1, length)];
            Arrays.fill(trailing, (byte)'a');
            for (int i = 0; i + 3 < length; i += 3) {
                trailing[i] = (byte)0xe6;
                trailing[i + 1] = (byte)0xbc;
                trailing[i + 2] = (byte)0xa2;
            }
            trailing[Math.max(0, length - 1)] = (byte)0x80;
            byte[] truncated = trailing.clone();
            truncated[Math.max(0, length - 1)] = (byte)0xe2;
            byte[][] patterns = {
                {'a'}, {(byte)0xc3, (byte)0xa9}, {(byte)0xe6, (byte)0xbc, (byte)0xa2},
                {(byte)0xf0, (byte)0x9f, (byte)0x98, (byte)0x83},
                {(byte)0x80}, {(byte)0xc1, (byte)0x80},
                {(byte)0xe0, (byte)0x80, (byte)0x80},
                {(byte)0xed, (byte)0xa0, (byte)0x80},
                {(byte)0xf4, (byte)0x90, (byte)0x80, (byte)0x80},
                {(byte)0xf5, (byte)0x80, (byte)0x80, (byte)0x80},
                {(byte)0xc3, 'x'}, {(byte)0xe2, 'x'}, {(byte)0xe2, (byte)0x82, 'x'},
                {(byte)0xf0, 'x'}, {(byte)0xf0, (byte)0x90, 'x'},
                {(byte)0xf0, (byte)0x90, (byte)0x80, 'x'},
                {'a', (byte)0x80}, {'a', (byte)0xe2}, trailing, truncated
            };
            for (byte[] pattern : patterns) {
                byte[] bytes = new byte[length + 14];
                Arrays.fill(bytes, SENTINEL);
                for (int i = 0; i < length; i++) bytes[7 + i] = pattern[i % pattern.length];
                for (int capacity : new int[]{0, 1, length / 3, length, length + 1}) {
                    for (var action : new CodingErrorAction[]{CodingErrorAction.REPORT,
                            CodingErrorAction.REPLACE, CodingErrorAction.IGNORE}) {
                        for (boolean end : new boolean[]{false, true}) {
                            char[][] output = {new char[capacity + 14], new char[capacity + 14]};
                            int position = -1;
                            int written = -1;
                            String result = null;
                            for (int mode = 0; mode < 2; mode++) {
                                Arrays.fill(output[mode], '\u5555');
                                ByteBuffer source = ByteBuffer.wrap(bytes).position(3).limit(7 + length).slice();
                                source.position(4);
                                // Read-only input selects the buffer decoder as the reference.
                                if (mode == 0) source = source.asReadOnlyBuffer();
                                CharBuffer target = CharBuffer.wrap(output[mode]).position(3).slice();
                                target.position(4).limit(4 + capacity);
                                var decoder = StandardCharsets.UTF_8.newDecoder().onMalformedInput(action);
                                var status = decoder.decode(source, target, end);
                                if (mode == 0) {
                                    position = source.position();
                                    written = target.position();
                                    result = status.toString();
                                } else {
                                    check(position == source.position() && written == target.position()
                                            && result.equals(status.toString()), "UTF8 decoder buffer positions and result");
                                    check(Arrays.equals(output[0], output[1]), "UTF8 decoder output and guards");
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private static void tightBuffers() {
        for (String pattern : new String[]{"漢", "😃", "aé漢😃"}) {
            String text = pattern.repeat(4096);
            byte[] input = utf8(text);
            char[] output = new char[text.length() + 14];
            Arrays.fill(output, '\u5555');
            int n = SimdUTF.decodeUTF8(input, 0, input.length, output, 7, text.length());
            if (SimdUTF.isEligible(input.length)) {
                check(n == text.length(), "tight UTF8 acceleration");
                check(text.equals(new String(output, 7, n)), "tight UTF8 contents");
                for (int i = 0; i < output.length; i++) {
                    if (i < 7 || i >= 7 + n) check(output[i] == '\u5555', "tight UTF8 canary");
                }
            }
            byte[] scratch = guardedBytes(input.length * 2, 14);
            int units = SimdUTF.decodeUTF8(input, 0, input.length, scratch, 7, input.length);
            if (SimdUTF.isEligible(input.length)) {
                check(units == text.length(), "String scratch UTF8 length");
                ByteBuffer view = ByteBuffer.wrap(scratch).order(java.nio.ByteOrder.nativeOrder());
                for (int i = 0; i < units; i++) {
                    check(view.getChar(14 + i * 2) == text.charAt(i), "String scratch UTF8 content");
                }
            }
            guards(scratch, 14, input.length * 2);
            for (boolean big : new boolean[]{false, true}) {
                byte[] expected = utf32Bytes(text, big, false);
                byte[] bytes = new byte[expected.length + 16];
                Arrays.fill(bytes, SENTINEL);
                n = SimdUTF.encodeUTF32Bytes(text.toCharArray(), 0, text.length(), bytes, 8,
                        expected.length, big);
                if (SimdUTF.isEligible(text.length())) {
                    check(n == expected.length, "tight UTF32 acceleration");
                    equal(expected, Arrays.copyOfRange(bytes, 8, 8 + n));
                    guards(bytes, 8, n);
                }
            }
            CharBuffer tight = CharBuffer.allocate(text.length());
            ByteBuffer source = ByteBuffer.wrap(input);
            var result = StandardCharsets.UTF_8.newDecoder().decode(source, tight, true);
            check(result.isUnderflow() && !source.hasRemaining() && !tight.hasRemaining(), "tight decoder positions");
            tight.flip();
            check(text.contentEquals(tight), "tight decoder contents");
            for (int capacity : new int[]{0, 1, text.length() - 1}) {
                source.rewind();
                CharBuffer small = CharBuffer.allocate(capacity);
                result = StandardCharsets.UTF_8.newDecoder().decode(source, small, true);
                check(result.isOverflow(), "small decoder overflow");
                check(text.startsWith(small.flip().toString()), "small decoder prefix");
            }
        }
    }

    private static int nativeSearchLatin1(byte[] input) {
        return SimdUTF.indexOfLatin1(input, 0, input.length, 0xe9);
    }

    private static int nativeSearchUTF16(char[] input) {
        return SimdUTF.indexOfUTF16(input, 0, input.length, 0x6f22);
    }

    private static void indexOf() {
        for (int length : new int[]{0, 1, 2, 15, 16, 17, 31, 32, 63, 64, 65, 79, 80, 81,
                                   127, 128, 255, 256, 257, 271, 272, 273, 1024, 2063, 2064, 2065, 4097}) {
            for (String pattern : new String[]{"abcé\0", "漢x\ud800y\udc00😃"}) {
                String text = pattern.repeat(length / pattern.length() + 1).substring(0, length);
                char[] chars = text.toCharArray();
                byte[] latin1 = pattern.charAt(0) == 'a' ? text.getBytes(StandardCharsets.ISO_8859_1) : null;
                for (int ch : new int[]{-1, 0, 'a', 'é', '漢', 'z', 0xd800, 0xdc00, 0x1f603, 0x110000}) {
                    for (int from : new int[]{-1, 0, 1, 15, 16, 17, 31, 127, length - 1, length, length + 1}) {
                        int begin = Math.min(length, Math.max(0, from));
                        for (int end : new int[]{length, Math.max(begin, length - 1)}) {
                            int expected = -1;
                            for (int i = begin; i < end; i++) {
                                if (ch <= 0xffff ? text.charAt(i) == ch
                                        : i + 1 < end && Character.isSurrogatePair(text.charAt(i), text.charAt(i + 1))
                                          && Character.toCodePoint(text.charAt(i), text.charAt(i + 1)) == ch) {
                                    expected = i;
                                    break;
                                }
                            }
                            check(text.indexOf(ch, begin, end) == expected, "String indexOf bounded range");
                            if (ch >= 0 && ch <= 0xffff) {
                                String needle = String.valueOf((char)ch);
                                check(text.indexOf(needle, begin, end) == expected, "single-unit needle bounded range");
                                if (end == length) {
                                    check(text.indexOf(needle, from) == expected, "single-unit needle from index");
                                    if (from == 0) {
                                        check(text.indexOf(needle) == expected, "single-unit needle");
                                    }
                                }
                            }
                            int relative = expected < 0 ? end - begin : expected - begin;
                            int index = SimdUTF.indexOfUTF16(chars, begin, end - begin, ch);
                            if (index >= 0) {
                                check(index == relative, "UTF16 native search");
                            }
                            if (latin1 != null) {
                                index = SimdUTF.indexOfLatin1(latin1, begin, end - begin, ch);
                                if (index >= 0) {
                                    check(index == relative, "Latin1 native search");
                                }
                            }
                            if (end == length) {
                                check(text.indexOf(ch, from) == expected, "String indexOf from index");
                            }
                        }
                    }
                }
            }
        }
    }

    private static void codePointCounts() {
        for (String pattern : new String[]{"aé漢", "a\ud83d\ude03", "\ud800x\udc00", "\udc00\ud800"}) {
            String text = pattern.repeat(600);
            char[] chars = text.toCharArray();
            for (int begin : new int[]{0, 1, 2, 63, 256}) {
                for (int end : new int[]{chars.length, chars.length - 1, chars.length - 2}) {
                    int expected = end - begin;
                    for (int i = begin; i + 1 < end; i++) {
                        if (chars[i] >= '\ud800' && chars[i] <= '\udbff'
                                && chars[i + 1] >= '\udc00' && chars[i + 1] <= '\udfff') {
                            expected--;
                            i++;
                        }
                    }
                    if (text.codePointCount(begin, end) != expected
                            || Character.codePointCount(chars, begin, end - begin) != expected
                            || Character.codePointCount((CharSequence)text, begin, end) != expected
                            || Character.codePointCount(new StringBuilder(text), begin, end) != expected
                            || Character.codePointCount(new StringBuffer(text), begin, end) != expected
                            || new StringBuilder(text).codePointCount(begin, end) != expected
                            || new StringBuffer(text).codePointCount(begin, end) != expected) {
                        throw new AssertionError("code-point count or split-surrogate range");
                    }
                }
            }
        }
        int length = 1024;
        for (int edge : new int[]{0, length - 1}) {
            for (char surrogate : new char[]{'\ud800', '\udc00'}) {
                char[] chars = new char[length + 6];
                Arrays.fill(chars, '\u6f22');
                chars[3 + edge] = surrogate;
                byte[] bytes = new byte[chars.length * 2];
                for (int i = 0; i < chars.length; i++) {
                    putUnit(bytes, i * 2, chars[i], 2, ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN);
                }
                if (accelerationAvailable) {
                    check(SimdUTF.countCodePoints(chars, 3, length) == length, "isolated count edge in char storage");
                    check(SimdUTF.countCodePoints(bytes, 3, length) == length, "isolated count edge in byte storage");
                }
                check(Character.codePointCount(chars, 3, length) == length, "isolated count edge fallback");
                chars[3 + edge] = '\u6f22';
                int pair = edge == 0 ? 3 : length + 1;
                chars[pair] = '\ud83d';
                chars[pair + 1] = '\ude03';
                int count = SimdUTF.countCodePoints(chars, 3, length);
                if (accelerationAvailable) check(count == length - 1, "valid count edge pair");
                check(Character.codePointCount(chars, 3, length) == length - 1, "valid edge pair count");
            }
        }
    }

    private static void compactLatin1() {
        for (int length : new int[]{127, 128, 255, 256, 257, 511, 512, 4097}) {
            String text = "éÿa".repeat(length);
            byte[] input = utf8(text);
            byte[] expected = new byte[text.length()];
            for (int i = 0; i < expected.length; i++) expected[i] = (byte)text.charAt(i);
            byte[] output = new byte[input.length + 14];
            Arrays.fill(output, SENTINEL);
            int n = SimdUTF.decodeLatin1(input, 0, input.length, output, 7, input.length);
            if (n >= 0) {
                check(n == expected.length, "UTF8 to Latin1 native conversion");
                equal(expected, Arrays.copyOfRange(output, 7, 7 + n));
                guards(output, 7, n);
            } else {
                guards(output, 7, 0);
            }
            byte[] inPlace = input.clone();
            n = SimdUTF.decodeLatin1(inPlace, 0, inPlace.length, inPlace, 0, inPlace.length);
            if (n >= 0) {
                check(n == expected.length, "UTF8 to Latin1 in-place conversion");
                equal(expected, Arrays.copyOf(inPlace, n));
            } else {
                equal(input, inPlace);
            }
            check(text.equals(new String(input, StandardCharsets.UTF_8)), "compact Latin1 String");
            String mixed = text + "漢😃";
            byte[] mixedBytes = utf8(mixed);
            byte[] copy = mixedBytes.clone();
            check(SimdUTF.decodeLatin1(copy, 0, copy.length, copy, 0, copy.length) < 0,
                    "non-Latin1 UTF8 declines");
            equal(mixedBytes, copy);
            check(mixed.equals(new String(mixedBytes, StandardCharsets.UTF_8)), "Latin1 prefix fallback");
        }
    }

    private static void utf16Copies() {
        for (int length : LENGTHS) {
            char[] original = new char[length];
            for (int i = 0; i < length; i++) original[i] = switch (i % 4) {
                case 0 -> '漢';
                case 1 -> '\ud800';
                case 2 -> '\udc00';
                default -> '\udc01';
            };
            String text = new String(original);
            check(Arrays.equals(original, text.toCharArray()), "UTF16 raw code-unit copy");
            char[] copied = new char[length + 8];
            Arrays.fill(copied, (char)SENTINEL);
            int result = SimdUTF.copyUTF16(original, 0, length, copied, 3);
            if (result >= 0) {
                check(result == length, "UTF16 native raw copy length");
                check(Arrays.equals(original, Arrays.copyOfRange(copied, 3, 3 + length)),
                        "UTF16 native raw copy including isolated surrogates");
                for (int i = 0; i < copied.length; i++) {
                    if (i < 3 || i >= 3 + length) check(copied[i] == SENTINEL, "UTF16 native copy guard");
                }
            }
            for (int off = 0; off < Math.min(4, length); off++) {
                char[] output = new char[length + 8];
                Arrays.fill(output, (char)SENTINEL);
                text.getChars(off, length, output, 3);
                check(Arrays.equals(Arrays.copyOfRange(original, off, length),
                        Arrays.copyOfRange(output, 3, 3 + length - off)), "UTF16 range copy");
                for (int i = 0; i < output.length; i++) {
                    if (i < 3 || i >= 3 + length - off) check(output[i] == SENTINEL, "UTF16 copy guard");
                }
            }
        }
    }

    // Independent scalar oracle, including Java's '?' surrogate replacement.
    private static byte[] utf8(String text) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            int cp = c;
            if (Character.isHighSurrogate(c) && i + 1 < text.length()
                    && Character.isLowSurrogate(text.charAt(i + 1))) {
                cp = Character.toCodePoint(c, text.charAt(++i));
            } else if (Character.isSurrogate(c)) {
                cp = '?';
            }
            if (cp < 0x80) {
                out.write(cp);
            } else if (cp < 0x800) {
                out.write(0xc0 | cp >> 6); out.write(0x80 | cp & 63);
            } else if (cp < 0x10000) {
                out.write(0xe0 | cp >> 12); out.write(0x80 | cp >> 6 & 63); out.write(0x80 | cp & 63);
            } else {
                out.write(0xf0 | cp >> 18); out.write(0x80 | cp >> 12 & 63);
                out.write(0x80 | cp >> 6 & 63); out.write(0x80 | cp & 63);
            }
        }
        return out.toByteArray();
    }

    private static void checkUTF(String text) throws Exception {
        byte[] expected = utf8(text);
        equal(expected, text.getBytes(StandardCharsets.UTF_8));
        check(text.equals(new String(expected, StandardCharsets.UTF_8)), "String decode");
        byte[] padded = new byte[expected.length + 17];
        System.arraycopy(expected, 0, padded, 7, expected.length);
        check(text.equals(new String(padded, 7, expected.length, StandardCharsets.UTF_8)), "String offset");
        char[] chars = new char[text.length() + 13];
        text.getChars(0, text.length(), chars, 5);
        ByteBuffer bytes = ByteBuffer.allocate(expected.length + 21);
        bytes.position(9);
        CharBuffer source = CharBuffer.wrap(chars, 5, text.length());
        var encoder = StandardCharsets.UTF_8.newEncoder();
        var result = encoder.encode(source, bytes, true);
        check(result.isUnderflow() && source.position() == 5 + text.length(), "encoder positions");
        equal(expected, Arrays.copyOfRange(bytes.array(), 9, bytes.position()));
        CharBuffer target = CharBuffer.allocate(expected.length + 11);
        target.position(3);
        var decoder = StandardCharsets.UTF_8.newDecoder();
        ByteBuffer input = ByteBuffer.wrap(padded, 7, expected.length);
        result = decoder.decode(input, target, true);
        check(result.isUnderflow() && input.position() == 7 + expected.length, "decoder positions");
        check(text.equals(new String(target.array(), 3, target.position() - 3)), "decoder contents");
        // Direct and read-only buffers retain their Java path and exact semantics.
        ByteBuffer direct = ByteBuffer.allocateDirect(expected.length);
        direct.put(expected).flip();
        check(text.equals(StandardCharsets.UTF_8.decode(direct.asReadOnlyBuffer()).toString()), "direct decode");
        byte[] output = new byte[expected.length + 16];
        Arrays.fill(output, SENTINEL);
        int written = SimdUTF.encodeUTF16(chars, 5, text.length(), output, 7, expected.length);
        if (accelerationAvailable && SimdUTF.isEligible(text.length()) && text.length() >= 128)
            check(written >= 0, "encoding acceleration not taken");
        if (written >= 0) {
            check(written == expected.length, "native encode length");
            equal(expected, Arrays.copyOfRange(output, 7, 7 + written));
            guards(output, 7, written);
        }
        char[] decoded = new char[expected.length + 17];
        Arrays.fill(decoded, '\u5555');
        written = SimdUTF.decodeUTF8(padded, 7, expected.length, decoded, 5, expected.length);
        if (accelerationAvailable && SimdUTF.isEligible(expected.length) && expected.length >= 512)
            check(written >= 0, "decoding acceleration not taken");
        if (written >= 0) {
            check(text.equals(new String(decoded, 5, written)), "native decode contents");
            for (int i = 0; i < decoded.length; i++) {
                if (i < 5 || i >= 5 + written) check(decoded[i] == '\u5555', "char canary");
            }
        }
    }

    private static void checkBase64(byte[] input) {
        for (boolean url : new boolean[]{false, true}) {
            var encoder = url ? Base64.getUrlEncoder() : Base64.getEncoder();
            var decoder = url ? Base64.getUrlDecoder() : Base64.getDecoder();
            byte[] encoded = encoder.encode(input);
            equal(input, decoder.decode(encoded));
            equal(input, decoder.decode(encoder.withoutPadding().encode(input)));
            byte[] target = new byte[input.length + 19];
            Arrays.fill(target, SENTINEL);
            int length = encoded.length & ~3;
            if (length >= 4 && encoded[length - 1] == '=') length -= 4;
            int written = SimdUTF.decodeBase64(encoded, 0, length, target, 7, url);
            if (written >= 0) {
                equal(Arrays.copyOf(input, written), Arrays.copyOfRange(target, 7, 7 + written));
                guards(target, 7, written);
            }
            byte[] inplace = encoded.clone();
            int n = decoder.decode(inplace, inplace);
            equal(input, Arrays.copyOf(inplace, n));
        }
        equal(input, Base64.getMimeDecoder().decode(Base64.getMimeEncoder().encode(input)));
    }

    private static void narrowing() {
        for (int index : new int[]{0, 63, 64, 255, 256, 511, 512, 513, 1023}) {
            char[] chars = new char[1024];
            Arrays.fill(chars, '\u00ff');
            chars[index] = '\u0100';
            String text = new String(chars);
            byte[] expected = new byte[chars.length];
            Arrays.fill(expected, (byte)0xff);
            expected[index] = '?';
            equal(expected, text.getBytes(StandardCharsets.ISO_8859_1));
            byte[] output = new byte[chars.length];
            Arrays.fill(output, SENTINEL);
            int n = SimdUTF.encodeLatin1FromUTF16(chars, 0, chars.length, output, 0);
            if (n >= 0) {
                check(n == index, "narrowing prefix");
                for (int i = 0; i < n; i++) check(output[i] == (byte)0xff, "narrowing prefix bytes");
                guards(output, 0, n);
            }
        }
        equal("a?".repeat(32768).getBytes(StandardCharsets.ISO_8859_1),
                "a漢".repeat(32768).getBytes(StandardCharsets.ISO_8859_1));
        String text = "é".repeat(4097);
        for (char c : text.toCharArray()) check(c == '\u00e9', "inflate character");
        byte[] latin1 = text.getBytes(StandardCharsets.ISO_8859_1);
        char[] output = new char[latin1.length + 17];
        Arrays.fill(output, '\u5555');
        int n = SimdUTF.inflateLatin1(latin1, 0, latin1.length, output, 7);
        if (n >= 0) {
            check(text.equals(new String(output, 7, n)), "native inflate");
            for (int i = 0; i < output.length; i++) {
                if (i < 7 || i >= 7 + n) check(output[i] == '\u5555', "inflate canary");
            }
        }
    }

    private static byte[] utf32Bytes(String text, boolean big, boolean bom) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        if (bom) {
            for (int shift : big ? new int[]{24, 16, 8, 0} : new int[]{0, 8, 16, 24}) {
                out.write(0xfeff >> shift);
            }
        }
        text.codePoints().forEach(cp -> {
            for (int shift : big ? new int[]{24, 16, 8, 0} : new int[]{0, 8, 16, 24}) {
                out.write(cp >> shift);
            }
        });
        return out.toByteArray();
    }

    private static void utf32() throws Exception {
        for (String name : new String[]{"UTF-32", "UTF-32BE", "UTF-32LE",
                "X-UTF-32BE-BOM", "X-UTF-32LE-BOM"}) {
            var cs = java.nio.charset.Charset.forName(name);
            boolean big = !name.contains("LE");
            for (String text : new String[]{"a".repeat(1024), "漢".repeat(1024),
                    "a😃".repeat(513)}) {
                byte[] expected = utf32Bytes(text, big, name.endsWith("BOM"));
                equal(expected, text.getBytes(cs));
                check(cs.newEncoder().canEncode(text), "UTF32 validation");
                check(text.equals(new String(expected, cs)), "UTF32 decode");
                byte[] raw = utf32Bytes(text, big, false);
                char[] exact = new char[text.length() + 8];
                Arrays.fill(exact, (char)SENTINEL);
                int converted = SimdUTF.decodeUTF32Bytes(raw, 0, raw.length,
                        exact, 3, text.length(), big);
                if (accelerationAvailable) {
                    check(converted == text.length(), "UTF32 exactly sized native output");
                    check(text.equals(new String(exact, 3, converted)), "UTF32 tight output contents");
                    for (int i = 0; i < exact.length; i++) {
                        if (i < 3 || i >= 3 + converted) check(exact[i] == SENTINEL, "UTF32 tight guard");
                    }
                }
                for (int offset : new int[]{0, 1, 4, 7}) {
                    byte[] padded = new byte[expected.length + offset];
                    System.arraycopy(expected, 0, padded, offset, expected.length);
                    ByteBuffer src = ByteBuffer.wrap(padded, offset, expected.length);
                    CharBuffer dst = CharBuffer.allocate(text.length());
                    var result = cs.newDecoder().decode(src, dst, true);
                    check(result.isUnderflow() && src.position() == padded.length, "UTF32 positions");
                    dst.flip();
                    check(text.contentEquals(dst), "UTF32 offset decode");
                }
                CharBuffer src = CharBuffer.wrap(text.toCharArray());
                ByteBuffer dst = ByteBuffer.allocate(text.length() * 4 + 4);
                var result = cs.newEncoder().encode(src, dst, true);
                check(result.isUnderflow() && !src.hasRemaining(), "UTF32 encode positions");
                equal(expected, Arrays.copyOf(dst.array(), dst.position()));
            }
            byte[] dialect = utf32Bytes("a".repeat(513) + "\ud800", big, false);
            check(new String(dialect, cs).equals("a".repeat(513) + "\ud800"), "UTF32 surrogate dialect");
            byte[] invalid = utf32Bytes("a".repeat(513) + "x", big, false);
            int at = invalid.length - 4;
            byte[] bad = big ? new byte[]{0, 0x11, 0, 0} : new byte[]{0, 0, 0x11, 0};
            System.arraycopy(bad, 0, invalid, at, 4);
            ByteBuffer src = ByteBuffer.wrap(invalid);
            CharBuffer dst = CharBuffer.allocate(invalid.length / 2);
            var result = cs.newDecoder().decode(src, dst, true);
            check(result.isMalformed() && src.position() == at && dst.position() == 513,
                    "UTF32 malformed positions");
        }
    }

    private static void base64EncodeBoundaries() throws Exception {
        // Cover masked tails, full-width loads and eight-block encoding batches.
        for (int boundary : new int[]{48, 64, 96, 384, 400, 768, 784, 1024, 4096}) {
            for (int delta = -2; delta <= 2; delta++) {
                byte[] input = new byte[boundary + delta];
                RANDOM.nextBytes(input);
                for (boolean url : new boolean[]{false, true}) {
                    String alphabet = url
                            ? "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"
                            : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
                    StringBuilder reference = new StringBuilder();
                    for (int i = 0; i < input.length; i += 3) {
                        int remaining = input.length - i;
                        int bits = (input[i] & 255) << 16;
                        if (remaining > 1) bits |= (input[i + 1] & 255) << 8;
                        if (remaining > 2) bits |= input[i + 2] & 255;
                        reference.append(alphabet.charAt(bits >>> 18));
                        reference.append(alphabet.charAt((bits >>> 12) & 63));
                        reference.append(remaining > 1 ? alphabet.charAt((bits >>> 6) & 63) : '=');
                        reference.append(remaining > 2 ? alphabet.charAt(bits & 63) : '=');
                    }
                    if (input.length % 3 == 0) {
                        byte[] source = new byte[input.length + 5];
                        System.arraycopy(input, 0, source, 5, input.length);
                        byte[] target = new byte[reference.length() + 19];
                        Arrays.fill(target, SENTINEL);
                        int written = SimdUTF.encodeBase64(source, 5, input.length, target, 7, url);
                        if (written >= 0) {
                            equal(reference.toString().getBytes(StandardCharsets.ISO_8859_1),
                                    Arrays.copyOfRange(target, 7, 7 + written));
                            guards(target, 7, written);
                        }
                    }
                    for (int lineLength : new int[]{0, 76, 512, 1024}) {
                        if (url && lineLength != 0) continue;
                        var encoder = url ? Base64.getUrlEncoder() : lineLength == 0
                                ? Base64.getEncoder()
                                : Base64.getMimeEncoder(lineLength, new byte[]{'\r', '\n'});
                        for (boolean padding : new boolean[]{true, false}) {
                            String expected = reference.toString();
                            if (!padding) expected = expected.replace("=", "");
                            StringBuilder lines = new StringBuilder();
                            for (int i = 0; i < expected.length(); i++) {
                                if (lineLength != 0 && i != 0 && i % lineLength == 0) {
                                    lines.append("\r\n");
                                }
                                lines.append(expected.charAt(i));
                            }
                            byte[] bytes = lines.toString().getBytes(StandardCharsets.ISO_8859_1);
                            var selected = padding ? encoder : encoder.withoutPadding();
                            equal(bytes, selected.encode(input));
                            var output = new ByteArrayOutputStream();
                            try (var stream = selected.wrap(output)) {
                                stream.write(input);
                            }
                            equal(bytes, output.toByteArray());
                        }
                    }
                }
            }
        }
    }

    private static void base64Streams() throws Exception {
        byte[] input = new byte[32771];
        RANDOM.nextBytes(input);
        for (var encoder : new Base64.Encoder[]{Base64.getEncoder(), Base64.getUrlEncoder(),
                Base64.getMimeEncoder(), Base64.getEncoder().withoutPadding()}) {
            for (int chunk : new int[]{1, 2, 3, 57, 1024, 10000}) {
                var output = new ByteArrayOutputStream();
                try (var stream = encoder.wrap(output)) {
                    for (int off = 0; off < input.length; off += chunk) {
                        stream.write(input, off, Math.min(chunk, input.length - off));
                    }
                }
                equal(encoder.encode(input), output.toByteArray());
            }
        }
    }

    private static void unicode() throws Exception {
        for (String text : new String[]{"a".repeat(1024), "é".repeat(1024), "漢".repeat(1024),
                "😃".repeat(512), "a".repeat(513) + "\ud800", "\udc00" + "a".repeat(513)}) {
            boolean valid = !text.contains("\ud800") && !text.contains("\udc00");
            for (var cs : new java.nio.charset.Charset[]{StandardCharsets.UTF_8,
                    StandardCharsets.UTF_16, StandardCharsets.UTF_16BE, StandardCharsets.UTF_16LE}) {
                check(cs.newEncoder().canEncode(text) == valid, "String Unicode validation");
                check(cs.newEncoder().canEncode(CharBuffer.wrap(text.toCharArray())) == valid, "array validation");
                check(cs.newEncoder().canEncode(new StringBuilder(text)) == valid, "CharSequence fallback");
                if (!valid) continue;
                byte[] expected;
                if (cs == StandardCharsets.UTF_8) {
                    expected = utf8(text);
                } else {
                    ByteArrayOutputStream out = new ByteArrayOutputStream();
                    boolean big = cs != StandardCharsets.UTF_16LE;
                    if (cs == StandardCharsets.UTF_16) { out.write(0xfe); out.write(0xff); }
                    for (char c : text.toCharArray()) {
                        out.write(big ? c >> 8 : c & 255);
                        out.write(big ? c & 255 : c >> 8);
                    }
                    expected = out.toByteArray();
                }
                equal(expected, text.getBytes(cs));
                check(text.equals(new String(expected, cs)), "UTF16 byte order/BOM decode");
                for (int offset : new int[]{0, 1, 6, 7}) {
                    byte[] padded = new byte[expected.length + offset];
                    System.arraycopy(expected, 0, padded, offset, expected.length);
                    check(text.equals(cs.newDecoder().decode(ByteBuffer.wrap(padded, offset, expected.length)).toString()),
                            "UTF16 offset decode");
                }
            }
            boolean ascii = text.chars().allMatch(c -> c < 128);
            boolean latin1 = text.chars().allMatch(c -> c < 256);
            check(StandardCharsets.US_ASCII.newEncoder().canEncode(text) == ascii, "ASCII validation");
            check(StandardCharsets.ISO_8859_1.newEncoder().canEncode(text) == latin1, "Latin1 validation");
            check(text.encodedLength(StandardCharsets.UTF_8) == utf8(text).length, "encodedLength");
        }
    }

    private static void malformed() throws Exception {
        for (int bad : new int[]{0, 64, 255, 256, 511, 512}) {
            char[] chars = new char[1024];
            Arrays.fill(chars, 'a');
            chars[bad] = 'ÿ';
            byte[] bytes = new byte[chars.length + 14];
            Arrays.fill(bytes, SENTINEL);
            int n = SimdUTF.encodeAscii(chars, 0, chars.length, bytes, 7);
            if (n >= 0) {
                check(n == bad, "ASCII encoder exact prefix");
                guards(bytes, 7, n);
            }
            CharBuffer src = CharBuffer.wrap(chars);
            ByteBuffer dst = ByteBuffer.allocate(chars.length);
            var result = StandardCharsets.US_ASCII.newEncoder().encode(src, dst, true);
            check(result.isUnmappable() && src.position() == bad && dst.position() == bad,
                    "ASCII encoder error positions");
        }
        String prefix = "a".repeat(513);
        String suffix = "b".repeat(513);
        for (String invalid : new String[]{"\ud800", "\udc00", "\ud800x", "\udc00\ud800"}) {
            String text = prefix + invalid + suffix;
            equal(utf8(text), text.getBytes(StandardCharsets.UTF_8));
            int capacity = text.length() * 3;
            byte[] output = guardedBytes(capacity, 7);
            check(SimdUTF.encodeUTF16(text.toCharArray(), 0, text.length(), output, 7, capacity) < 0,
                    "malformed UTF16 fallback");
            // Failed conversion may write within its declared output range.
            guards(output, 7, capacity);
        }
        for (byte[] invalid : new byte[][]{{(byte)0xc0,(byte)0x80}, {(byte)0xe0,(byte)0x80,(byte)0x80},
                {(byte)0xed,(byte)0xa0,(byte)0x80}, {(byte)0xf4,(byte)0x90,(byte)0x80,(byte)0x80}, {(byte)0xe2}}) {
            for (int prefixLength : new int[]{0, 513, 1023, 1024, 4095}) {
                byte[] input = new byte[prefixLength + invalid.length];
                Arrays.fill(input, 0, prefixLength, (byte)'a');
                System.arraycopy(invalid, 0, input, prefixLength, invalid.length);
                char[] output = new char[input.length];
                check(SimdUTF.decodeUTF8(input, 0, input.length, output, 0, output.length) < 0, "invalid UTF8 fallback");
                // String scratch permits partial output, but never writes outside
                // the declared UTF-16 destination range on malformed input.
                byte[] scratch = new byte[(input.length + 14) * 2];
                Arrays.fill(scratch, SENTINEL);
                int scratchResult = SimdUTF.decodeUTF8(input, 0, input.length,
                        scratch, 7, input.length);
                check(scratchResult < 0, "invalid UTF8 String scratch fallback");
                guards(scratch, 14, input.length * 2);
                check(("a".repeat(prefixLength) + new String(invalid, StandardCharsets.UTF_8))
                        .equals(new String(input, StandardCharsets.UTF_8)), "String malformed fallback");
                var decoder = StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT);
                ByteBuffer source = ByteBuffer.wrap(input);
                CharBuffer target = CharBuffer.allocate(input.length);
                var result = decoder.decode(source, target, true);
                check(result.isMalformed() && source.position() == prefixLength && target.position() == prefixLength,
                        "malformed result positions");
            }
        }
        byte[] ascii = new byte[1024];
        Arrays.fill(ascii, (byte)'a');
        for (int bad : new int[]{0, 63, 64, 255, 256, 513, 1023}) {
            ascii[bad] = (byte)0xff;
            int n = SimdUTF.countAscii(ascii, 0, ascii.length);
            check(n < 0 || n == bad, "ASCII prefix");
            ascii[bad] = 'a';
        }
        ByteBuffer source = ByteBuffer.wrap(ascii);
        CharBuffer target = CharBuffer.allocate(17);
        check(StandardCharsets.UTF_8.newDecoder().decode(source, target, true).isOverflow(), "short output");
        check(source.position() == 17 && target.position() == 17, "overflow positions");
        for (boolean url : new boolean[]{false, true}) {
            for (byte invalid : new byte[]{' ', '!', '=', '\t', (byte)0xff}) {
                for (int at : new int[]{0, 513, 1023}) {
                    byte[] encoded = new byte[1024];
                    Arrays.fill(encoded, (byte)'A');
                    encoded[at] = invalid;
                    byte[] decoded = guardedBytes(768, 7);
                    check(SimdUTF.decodeBase64(encoded, 0, encoded.length, decoded, 7, url) < 0,
                            "Base64 full block rejects nonalphabet input");
                    guards(decoded, 7, 768);
                }
            }
        }
        for (String invalid : new String[]{" ", "!", "=", "\t", "\n", "\u00ff"}) {
            String encoded = "YWFh".repeat(200) + invalid + "YWFh".repeat(200);
            try {
                Base64.getDecoder().decode(encoded);
                throw new AssertionError("strict Base64 accepted invalid input");
            } catch (IllegalArgumentException expected) { }
        }
    }

    private static void utf8EncodeCapacity() {
        for (String text : new String[]{"a".repeat(513), "é".repeat(513), "漢".repeat(513), "😃".repeat(257),
                "a".repeat(257) + "漢".repeat(513), "a".repeat(257) + "😃".repeat(257)}) {
            byte[] expected = utf8(text);
            char[] input = ("xxxxx" + text + "yyyyy").toCharArray();
            for (int capacity : new int[]{expected.length - 1, expected.length, text.length() * 3}) {
                byte[] output = new byte[capacity + 14];
                Arrays.fill(output, SENTINEL);
                int written = SimdUTF.encodeUTF16(input, 5, text.length(), output, 7, capacity);
                if (capacity < expected.length || !accelerationAvailable) {
                    check(written == -1, "UTF16 encoder accepted insufficient capacity");
                    // The capacity-bounded converter may commit complete chars.
                    guards(output, 7, accelerationAvailable ? capacity : 0);
                } else {
                    check(written == expected.length, "UTF16 encoder full conversion length");
                    equal(expected, Arrays.copyOfRange(output, 7, 7 + written));
                    guards(output, 7, written);
                }
                var encoder = StandardCharsets.UTF_8.newEncoder();
                CharBuffer source = CharBuffer.wrap(input, 5, text.length());
                ByteBuffer target = ByteBuffer.allocate(capacity);
                var result = encoder.encode(source, target, true);
                if (capacity < expected.length) {
                    check(result.isOverflow() && source.hasRemaining(), "UTF8 encode overflow positions");
                    equal(utf8(text.substring(0, source.position() - 5)),
                            Arrays.copyOf(target.array(), target.position()));
                } else {
                    check(result.isUnderflow() && !source.hasRemaining(), "UTF8 encode complete positions");
                    equal(expected, Arrays.copyOf(target.array(), target.position()));
                }
            }
        }
    }

    private static void nativeLatin1(Method process) throws Exception {
        for (int boundary : new int[]{4095, 4096, 4097}) {
            // Exercise exact input lengths and two-byte sequences straddling
            // successive private-output chunks.
            for (String text : new String[]{"a".repeat(boundary - 2) + "é",
                    "a".repeat(boundary) + "é" + "ÿ".repeat(4096)}) {
                byte[] expected = new byte[text.length()];
                for (int i = 0; i < expected.length; i++) expected[i] = (byte)text.charAt(i);
                nativeLatin1Case(process, utf8(text), expected);
            }
        }
        for (int prefix : new int[]{0, 4095, 4096, 4097, 8193}) {
            for (String suffix : new String[]{"漢", "😃"}) {
                nativeLatin1Case(process, utf8("a".repeat(prefix) + suffix + "é".repeat(32)), null);
            }
            for (byte invalid : new byte[]{(byte)0x80, (byte)0xc3}) {
                byte[] input = new byte[prefix + 1];
                Arrays.fill(input, (byte)'a');
                input[prefix] = invalid;
                nativeLatin1Case(process, input, null);
            }
        }
    }

    private static void nativeLatin1Case(Method process, byte[] input, byte[] decoded) throws Exception {
        // DECODE_LATIN1 is operation 24. Its conservative capacity contract
        // requires input.length even when the decoded output would be shorter.
        for (boolean shortCapacity : new boolean[]{false, true}) {
            for (int mode = 0; mode < 4; mode++) {
                byte[] source = new byte[input.length + 32];
                Arrays.fill(source, SENTINEL);
                System.arraycopy(input, 0, source, 7, input.length);
                byte[] sourceBefore = source.clone();
                byte[] output = mode == 0 ? new byte[source.length] : source;
                if (mode == 0) Arrays.fill(output, SENTINEL);
                int dp = switch (mode) { case 0 -> 5; case 1 -> 7; case 2 -> 3; default -> 8; };
                int capacity = input.length - (shortCapacity ? 1 : 0);
                byte[] expected = output.clone();
                boolean success = accelerationAvailable && decoded != null && !shortCapacity && mode != 3;
                if (success) System.arraycopy(decoded, 0, expected, dp, decoded.length);
                int result = mode == 3
                        ? SimdUTF.decodeLatin1(source, 7, input.length, output, dp, capacity)
                        : (int)process.invoke(null, source, 7, input.length, output, dp, capacity, 24);
                String label = "native Latin1 length=" + input.length + " mode=" + mode
                        + " short=" + shortCapacity + " valid=" + (decoded != null);
                check(result == (success ? decoded.length : -1), label + " result");
                if (!success && mode == 0 && !shortCapacity && accelerationAvailable) {
                    guards(output, dp, capacity);
                } else {
                    check(Arrays.equals(output, expected), label + " output and guards");
                }
                if (mode == 0) check(Arrays.equals(source, sourceBefore), label + " unchanged input");
            }
        }
    }

    private static void mutableUTF8Conversions(Method process) throws Exception {
        // Exercise compressed prefixes followed by overlapping ASCII tails.
        // Validate only bounds during mutation: no consistent text is promised.
        for (int prefix : new int[]{0, 4096}) {
            byte[] input = new byte[prefix + 81];
            Arrays.fill(input, (byte)'a');
            byte[] output = guardedBytes(input.length, 7);
            byte[] utf16 = guardedBytes(input.length * 2, 14);
            char[] chars = new char[input.length + 14];
            Arrays.fill(chars, (char)0x5555);
            AtomicBoolean stop = new AtomicBoolean();
            Thread mutator = new Thread(() -> {
                while (!stop.get()) {
                    for (int i = prefix; i < prefix + 60; i += 2) {
                        input[i] = (byte)0xc3;
                        input[i + 1] = (byte)0xa9;
                    }
                    Arrays.fill(input, prefix, prefix + 60, (byte)'a');
                }
            });
            mutator.start();
            try {
                for (int i = 0; i < 1000; i++) {
                    int valid = (int)process.invoke(null, input, 0, input.length,
                            input, 0, 0, 29);
                    check(valid >= -1 && valid <= 1, "mutable Latin1 validation result");
                    int count = (int)process.invoke(null, input, 0, input.length,
                            output, 7, input.length, 24);
                    check(count >= -1 && count <= input.length, "mutable Latin1 conversion bounds");
                    guards(output, 7, input.length);
                    int units = (int)process.invoke(null, input, 0, input.length,
                            utf16, 7, input.length, 1);
                    check(units >= -input.length - 1 && units <= input.length,
                            "mutable UTF8 String conversion bounds");
                    guards(utf16, 14, input.length * 2);
                    units = (int)process.invoke(null, input, 0, input.length,
                            chars, 7, input.length, 1);
                    check(units >= -input.length - 1 && units <= input.length,
                            "mutable UTF8 char array conversion bounds");
                    for (int j = 0; j < 7; j++) {
                        check(chars[j] == 0x5555 && chars[chars.length - 1 - j] == 0x5555,
                                "mutable UTF8 char array guards");
                    }
                }
            } finally {
                stop.set(true);
                mutator.join();
            }
        }
    }

    private static void nativeRanges() throws Exception {
        Method process = SimdUTF.class.getDeclaredMethod("process0", Object.class, int.class,
                int.class, Object.class, int.class, int.class, int.class);
        process.setAccessible(true);
        byte[] src = new byte[1024];
        byte[] dst = new byte[4096];
        Object[][] invalid = {
            {null, 0, 1024, dst, 0, dst.length, 2},
            {new int[1024], 0, 1024, dst, 0, dst.length, 2},
            {src, -1, 1024, dst, 0, dst.length, 2},
            {src, 1, 1024, dst, 0, dst.length, 2},
            {src, 0, Integer.MAX_VALUE, dst, 0, dst.length, 2},
            {src, 0, 1024, dst, -1, dst.length, 2},
            {src, 0, 1024, dst, 0, Integer.MAX_VALUE, 2},
            {src, 0, 1024, new Object[4096], 0, 4096, 2},
            {src, 0, 1024, src, 0, src.length, 2},
            {src, 0, 1024, dst, 0, dst.length, 99}
        };
        Method checked = SimdUTF.class.getDeclaredMethod("process", Object.class, int.class,
                int.class, Object.class, int.class, int.class, int.class);
        checked.setAccessible(true);
        for (Object[] arguments : invalid) {
            check((int)checked.invoke(null, arguments) == -1, "Java boundary accepted invalid arguments");
        }
        check(SimdUTF.copyUTF16(src, 1, src.length, dst, 0) == -1, "copy source bounds");
        check(SimdUTF.copyUTF16(src, 0, src.length / 2, dst, dst.length / 2) == -1, "copy destination bounds");
        check(SimdUTF.encodeBase64(src, 1, src.length, dst, 0, false) == -1, "Base64 source bounds");
        check(SimdUTF.encodeBase64(src, 0, src.length, src, 0, false) == -1, "Base64 overlap");
        Arrays.fill(src, (byte)0x80);
        for (int capacity : new int[]{0, src.length, 2 * src.length - 1}) {
            Arrays.fill(dst, SENTINEL);
            check((int)process.invoke(null, src, 0, src.length, dst, 7, capacity, 2) == -1,
                    "Latin1 encoder accepted insufficient capacity");
            check(SimdUTF.encodeLatin1(src, 0, src.length, dst, 7, capacity) == -1,
                    "Latin1 encoder returned a truncated prefix");
            guards(dst, 0, 0);
        }
        Arrays.fill(dst, SENTINEL);
        int written = (int)process.invoke(null, src, 0, src.length, dst, 7, 2 * src.length, 2);
        if (accelerationAvailable) {
            check(written == 2 * src.length, "Latin1 encoder full conversion length");
            equal(utf8(new String(src, StandardCharsets.ISO_8859_1)),
                    Arrays.copyOfRange(dst, 7, 7 + written));
            guards(dst, 7, written);
        }
        nativeLatin1(process);
        mutableUTF8Conversions(process);
        nativeWideConversions(process);
    }

    private static void nativeWideConversions(Method process) throws Exception {
        int units = 1024;
        for (boolean supplementary : new boolean[]{false, true}) {
            for (boolean big : new boolean[]{false, true}) {
                byte[] storage = guardedBytes(2 * units, 6);
                byte[] utf16 = guardedBytes(2 * units, 4);
                int points = supplementary ? units / 2 : units;
                byte[] utf32 = guardedBytes(4 * points, 4);
                for (int i = 0; i < units; i++) {
                    int c = supplementary ? ((i & 1) == 0 ? 0xd83d : 0xde03) : 0x6f22;
                    putUnit(storage, 6 + 2 * i, c, 2, ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN);
                    putUnit(utf16, 4 + 2 * i, c, 2, big);
                }
                for (int i = 0; i < points; i++) {
                    putUnit(utf32, 4 + 4 * i, supplementary ? 0x1f603 : 0x6f22, 4, big);
                }
                nativeWideConversion(process, storage, 3, units, utf16, 4,
                        2 * units, big ? 15 : 16, "UTF16 byte-array encode");
                nativeWideConversion(process, utf16, 4, 2 * units, storage, 3,
                        units, big ? 17 : 18, "UTF16 byte-array decode");
                nativeWideConversion(process, storage, 3, units, utf32, 4,
                        4 * points, big ? 20 : 21, "UTF32 byte-array encode");
                nativeWideConversion(process, utf32, 4, 4 * points, storage, 3,
                        units, big ? 22 : 23, "UTF32 byte-array decode");
            }
        }
    }

    private static void nativeWideConversion(Method process, byte[] input, int offset, int length,
                                             byte[] expected, int outputOffset, int capacity,
                                             int operation, String message) throws Exception {
        byte[] output = new byte[expected.length];
        Arrays.fill(output, SENTINEL);
        int written = (int)process.invoke(null, input, offset, length,
                output, outputOffset, capacity, operation);
        check(written == (accelerationAvailable ? capacity : -1), message + " count");
        if (accelerationAvailable) {
            equal(expected, output);
        } else {
            guards(output, 0, 0);
        }
    }

    private static byte[] guardedBytes(int payload, int padding) {
        byte[] bytes = new byte[payload + 2 * padding];
        Arrays.fill(bytes, SENTINEL);
        return bytes;
    }

    private static void putUnit(byte[] bytes, int offset, int value, int width, boolean big) {
        for (int i = 0; i < width; i++) {
            bytes[offset + (big ? width - 1 - i : i)] = (byte)(value >>> (8 * i));
        }
    }

    private static void guards(byte[] buffer, int offset, int written) {
        for (int i = 0; i < buffer.length; i++) {
            if (i < offset || i >= offset + written) check(buffer[i] == SENTINEL, "byte canary");
        }
    }
    private static void equal(byte[] expected, byte[] actual) {
        check(Arrays.equals(expected, actual), "byte array mismatch");
    }
    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
