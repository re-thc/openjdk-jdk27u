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
 * @summary The Charset coder bulk conversions are intrinsics in the interpreter, C1 and C2
 *          and decline when the intrinsics are disabled
 * @requires (os.arch == "aarch64") | (os.arch == "amd64" & vm.cpu.features ~= ".*sse4.2.*")
 * @requires vm.compiler1.enabled & vm.compMode != "Xint"
 * @library /test/lib
 * @modules java.base/jdk.internal.misc
 *          java.base/sun.nio.cs:open
 *          java.base/java.lang:open
 *
 * @run main/othervm -Xint
 *      --add-exports java.base/jdk.internal.misc=ALL-UNNAMED --add-opens java.base/sun.nio.cs=ALL-UNNAMED
 *      --add-opens java.base/java.lang=ALL-UNNAMED
 *      TestCharsetBulkActivation active
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics
 *      --add-exports java.base/jdk.internal.misc=ALL-UNNAMED --add-opens java.base/sun.nio.cs=ALL-UNNAMED
 *      --add-opens java.base/java.lang=ALL-UNNAMED
 *      TestCharsetBulkActivation declined
 * @run main/othervm TestCharsetBulkActivation inlined
 */

import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import jdk.internal.misc.Unsafe;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class TestCharsetBulkActivation {
    private static final String TEXT = "héllo wörld € 漢字 😀 ".repeat(8);

    /**
     * One bulk method with arguments that it must convert completely. A decoder bounds
     * its chunks by the worst case of one unit per byte or two per code point, so its
     * capacity is given with that room.
     */
    private record Bulk(String name, Method method, Object src, long srcOffset, int srcLength,
                        Object dst, long dstOffset, int dstCapacity, int consumed, int produced) {
        long call() throws Exception {
            return (long) method.invoke(null, src, srcOffset, srcLength, dst, dstOffset, dstCapacity);
        }
    }

    private static Method method(String cls, String name) throws Exception {
        Method m = Class.forName(cls).getDeclaredMethod(name, Object.class, long.class, int.class,
                Object.class, long.class, int.class);
        m.setAccessible(true);
        return m;
    }

    private static List<Bulk> bulks() throws Exception {
        char[] chars = TEXT.toCharArray();
        byte[] utf8 = TEXT.getBytes(StandardCharsets.UTF_8);
        Charset le = Charset.forName("UTF-32LE");
        byte[] utf32 = TEXT.getBytes(le);
        int codePoints = TEXT.codePointCount(0, TEXT.length());
        long bytes = Unsafe.ARRAY_BYTE_BASE_OFFSET;
        long chr = Unsafe.ARRAY_CHAR_BASE_OFFSET;
        List<Bulk> list = new ArrayList<>();
        list.add(new Bulk("UTF-8 decode", method("sun.nio.cs.UTF_8$Decoder", "decodeBulk"),
                utf8, bytes, utf8.length, new char[utf8.length], chr, utf8.length, utf8.length, chars.length));
        list.add(new Bulk("UTF-8 encode", method("sun.nio.cs.UTF_8$Encoder", "encodeBulk"),
                chars, chr, chars.length, new byte[utf8.length + 16], bytes, utf8.length + 16, chars.length, utf8.length));
        list.add(new Bulk("UTF-32 decode", method("sun.nio.cs.UTF_32Coder$Decoder", "decodeBulk"),
                utf32, bytes, codePoints, new char[2 * codePoints], chr, 2 * codePoints, codePoints, chars.length));
        list.add(new Bulk("UTF-32 encode", method("sun.nio.cs.UTF_32Coder$Encoder", "encodeBulk"),
                chars, chr, chars.length, new byte[utf32.length + 16], bytes, chars.length, chars.length, codePoints));
        Charset be = Charset.forName("UTF-32BE");
        byte[] utf32be = TEXT.getBytes(be);
        list.add(new Bulk("UTF-32BE decode", method("sun.nio.cs.UTF_32Coder$Decoder", "decodeBulkBE"),
                utf32be, bytes, codePoints, new char[2 * codePoints], chr, 2 * codePoints, codePoints, chars.length));
        list.add(new Bulk("UTF-32BE encode", method("sun.nio.cs.UTF_32Coder$Encoder", "encodeBulkBE"),
                chars, chr, chars.length, new byte[utf32be.length + 16], bytes, chars.length, chars.length, codePoints));
        String latin1Text = "h\u00e9llo w\u00f6rld \u00fcber ".repeat(8);
        byte[] latin1Utf8 = latin1Text.getBytes(StandardCharsets.UTF_8);
        // UTF-16 counts 16-bit units, and the bytes are in the order of the method
        for (boolean big : new boolean[]{false, true}) {
            String order = big ? "BE" : "LE";
            Charset charset = Charset.forName("UTF-16" + order);
            byte[] data = TEXT.getBytes(charset);
            list.add(new Bulk("UTF-16" + order + " decode", method("sun.nio.cs.UnicodeDecoder", "decodeBulk" + order),
                    data, bytes, chars.length, new char[chars.length], chr, chars.length,
                    chars.length, chars.length));
            list.add(new Bulk("UTF-16" + order + " encode", method("sun.nio.cs.UnicodeEncoder", "encodeBulk" + order),
                    chars, chr, chars.length, new byte[2 * chars.length + 16], bytes, chars.length + 8,
                    chars.length, chars.length));
        }
        // The single-byte charsets convert one char per byte
        byte[] latin1 = latin1Text.getBytes(StandardCharsets.ISO_8859_1);
        char[] latin1Chars = latin1Text.toCharArray();
        String asciiText = "hello world, plain text ".repeat(8);
        byte[] ascii = asciiText.getBytes(StandardCharsets.US_ASCII);
        char[] asciiChars = asciiText.toCharArray();
        // A compact string is Latin-1 bytes that become one or two bytes of UTF-8
        list.add(new Bulk("Latin-1 to UTF-8", method("sun.nio.cs.UTF_8$Encoder", "encodeLatin1Bulk"),
                latin1, bytes, latin1.length, new byte[latin1Utf8.length + 16], bytes, latin1Utf8.length + 16,
                latin1.length, latin1Utf8.length));
        list.add(new Bulk("ISO-8859-1 decode", method("sun.nio.cs.ISO_8859_1$Decoder", "decodeBulk"),
                latin1, bytes, latin1.length, new char[latin1.length], chr, latin1.length,
                latin1.length, latin1.length));
        list.add(new Bulk("ISO-8859-1 encode", method("sun.nio.cs.ISO_8859_1$Encoder", "encodeBulk"),
                latin1Chars, chr, latin1Chars.length, new byte[latin1Chars.length], bytes, latin1Chars.length,
                latin1Chars.length, latin1Chars.length));
        list.add(new Bulk("US-ASCII decode", method("sun.nio.cs.US_ASCII$Decoder", "decodeBulk"),
                ascii, bytes, ascii.length, new char[ascii.length], chr, ascii.length,
                ascii.length, ascii.length));
        list.add(new Bulk("US-ASCII encode", method("sun.nio.cs.US_ASCII$Encoder", "encodeBulk"),
                asciiChars, chr, asciiChars.length, new byte[asciiChars.length], bytes, asciiChars.length,
                asciiChars.length, asciiChars.length));
        list.add(new Bulk("UTF-8 to Latin-1", method("java.lang.String", "utf8ToLatin1Bulk"),
                latin1Utf8, bytes, latin1Utf8.length, new byte[latin1Utf8.length], bytes, latin1Utf8.length,
                latin1Utf8.length, latin1Text.length()));
        return list;
    }

    private static void check(Bulk bulk, boolean active) throws Exception {
        long result = bulk.call();
        int consumed = (int) (result >>> 32);
        int produced = (int) result;
        if (active) {
            if (consumed != bulk.consumed || produced != bulk.produced) {
                throw new AssertionError(bulk.name + " consumed " + consumed + " produced " + produced
                        + ", expected " + bulk.consumed + " and " + bulk.produced);
            }
        } else if (result != 0) {
            throw new AssertionError(bulk.name + " must decline: " + result);
        }
    }

    private static void probe(boolean active) throws Exception {
        for (Bulk bulk : bulks()) {
            check(bulk, active);
        }
    }

    private static void inlined() throws Exception {
        for (String mode : new String[]{"-XX:TieredStopAtLevel=1", "-XX:-TieredCompilation"}) {
            OutputAnalyzer output = ProcessTools.executeTestJava("-Xbatch", mode,
                    "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintInlining",
                    "-cp", System.getProperty("test.classes"), "CharsetBulkWork");
            output.shouldHaveExitValue(0);
            for (String method : new String[]{"UTF_8$Decoder::decodeBulk", "UTF_8$Encoder::encodeBulk",
                                              "UTF_32Coder$Decoder::decodeBulk", "UTF_32Coder$Encoder::encodeBulk",
                                              "UTF_32Coder$Decoder::decodeBulkBE", "UTF_32Coder$Encoder::encodeBulkBE",
                                              "String::utf8ToLatin1Bulk",
                                              "UnicodeDecoder::decodeBulkLE", "UnicodeDecoder::decodeBulkBE",
                                              "UnicodeEncoder::encodeBulkLE", "UnicodeEncoder::encodeBulkBE",
                                              "ISO_8859_1$Decoder::decodeBulk", "ISO_8859_1$Encoder::encodeBulk",
                                              "US_ASCII$Decoder::decodeBulk", "US_ASCII$Encoder::encodeBulk",
                                              "UTF_8$Encoder::encodeLatin1Bulk"}) {
                output.shouldMatch(Pattern.quote(method) + " \\(\\d+ bytes\\)\\s+\\(?intrinsic\\)?");
            }
        }
    }

    public static void main(String[] args) throws Exception {
        switch (args[0]) {
            case "active" -> probe(true);
            case "declined" -> probe(false);
            case "inlined" -> inlined();
            default -> throw new IllegalArgumentException(args[0]);
        }
    }
}

/** A caller whose inlining of the bulk methods is reported by PrintInlining. */
class CharsetBulkWork {
    private static final String TEXT = "h\u00e9llo w\u00f6rld \u20ac \u6f22\u5b57 \ud83d\ude00 ".repeat(8);

    public static void main(String[] args) throws Exception {
        byte[] utf8 = TEXT.getBytes(StandardCharsets.UTF_8);
        Charset le = Charset.forName("UTF-32LE");
        byte[] utf32 = TEXT.getBytes(le);
        char[] chars = TEXT.toCharArray();
        CharsetDecoder utf8Decoder = StandardCharsets.UTF_8.newDecoder();
        CharsetEncoder utf8Encoder = StandardCharsets.UTF_8.newEncoder();
        CharsetDecoder utf32Decoder = le.newDecoder();
        CharsetEncoder utf32Encoder = le.newEncoder();
        Charset be = Charset.forName("UTF-32BE");
        byte[] utf32be = TEXT.getBytes(be);
        CharsetDecoder utf32beDecoder = be.newDecoder();
        CharsetEncoder utf32beEncoder = be.newEncoder();
        Charset u16le = Charset.forName("UTF-16LE");
        Charset u16be = Charset.forName("UTF-16BE");
        byte[] utf16le = TEXT.getBytes(u16le);
        byte[] utf16be = TEXT.getBytes(u16be);
        CharsetDecoder utf16leDecoder = u16le.newDecoder();
        CharsetDecoder utf16beDecoder = u16be.newDecoder();
        CharsetEncoder utf16leEncoder = u16le.newEncoder();
        CharsetEncoder utf16beEncoder = u16be.newEncoder();
        byte[] latin1Utf8 = "h\u00e9llo w\u00f6rld \u00fcber ".repeat(8).getBytes(StandardCharsets.UTF_8);
        // Array-backed buffers take the array loops of the single-byte charsets, which have
        // their own intrinsics; the bulk steps serve direct buffers
        String latin1Text = "h\u00e9llo w\u00f6rld \u00fcber ".repeat(8);
        String asciiText = "hello world, plain text ".repeat(8);
        CharsetDecoder isoDecoder = StandardCharsets.ISO_8859_1.newDecoder();
        CharsetEncoder isoEncoder = StandardCharsets.ISO_8859_1.newEncoder();
        CharsetDecoder asciiDecoder = StandardCharsets.US_ASCII.newDecoder();
        CharsetEncoder asciiEncoder = StandardCharsets.US_ASCII.newEncoder();
        ByteBuffer isoBytes = direct(latin1Text.getBytes(StandardCharsets.ISO_8859_1));
        ByteBuffer asciiBytes = direct(asciiText.getBytes(StandardCharsets.US_ASCII));
        ByteBuffer singleOut = ByteBuffer.allocateDirect(latin1Text.length() + 8);
        long sum = 0;
        for (int i = 0; i < 20000; i++) {
            sum += new String(latin1Utf8, StandardCharsets.UTF_8).length();
            CharBuffer out = CharBuffer.allocate(chars.length + 8);
            utf8Decoder.reset().decode(ByteBuffer.wrap(utf8), out, true);
            sum += out.position();
            out.clear();
            utf32Decoder.reset().decode(ByteBuffer.wrap(utf32), out, true);
            sum += out.position();
            ByteBuffer bytes = ByteBuffer.allocate(utf32.length + 8);
            utf8Encoder.reset().encode(CharBuffer.wrap(chars), bytes, true);
            sum += bytes.position();
            bytes.clear();
            utf32Encoder.reset().encode(CharBuffer.wrap(chars), bytes, true);
            sum += bytes.position();
            out.clear();
            utf32beDecoder.reset().decode(ByteBuffer.wrap(utf32be), out, true);
            sum += out.position();
            bytes.clear();
            utf32beEncoder.reset().encode(CharBuffer.wrap(chars), bytes, true);
            sum += bytes.position();
            out.clear();
            utf16leDecoder.reset().decode(ByteBuffer.wrap(utf16le), out, true);
            sum += out.position();
            out.clear();
            utf16beDecoder.reset().decode(ByteBuffer.wrap(utf16be), out, true);
            sum += out.position();
            bytes.clear();
            utf16leEncoder.reset().encode(CharBuffer.wrap(chars), bytes, true);
            sum += bytes.position();
            bytes.clear();
            utf16beEncoder.reset().encode(CharBuffer.wrap(chars), bytes, true);
            sum += bytes.position();
            out.clear();
            isoDecoder.reset().decode(isoBytes.duplicate(), out, true);
            sum += out.position();
            out.clear();
            asciiDecoder.reset().decode(asciiBytes.duplicate(), out, true);
            sum += out.position();
            singleOut.clear();
            isoEncoder.reset().encode(CharBuffer.wrap(latin1Text.toCharArray()), singleOut, true);
            sum += singleOut.position();
            // A buffer made by wrapping a string has no array: its compact string is
            // converted from the bytes of the string itself
            bytes.clear();
            utf8Encoder.reset().encode(CharBuffer.wrap(latin1Text), bytes, true);
            sum += bytes.position();
            singleOut.clear();
            asciiEncoder.reset().encode(CharBuffer.wrap(asciiText.toCharArray()), singleOut, true);
            sum += singleOut.position();
        }
        System.out.println(sum);
    }

    private static ByteBuffer direct(byte[] data) {
        ByteBuffer b = ByteBuffer.allocateDirect(data.length);
        b.put(data).flip();
        return b;
    }
}
