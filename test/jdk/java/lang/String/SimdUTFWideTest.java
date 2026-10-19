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
 * @summary Wide String, non-array charset buffers and segment conversion preserve fallback semantics
 * @modules java.base/jdk.internal.access java.base/jdk.internal.util:+open java.base/java.lang:+open java.base/sun.nio.cs
 * @run main/othervm SimdUTFWideTest
 * @run main/othervm -XX:SIMDUTFMinLength=16 SimdUTFWideTest
 * @run main/othervm -Xint -XX:SIMDUTFMinLength=16 SimdUTFWideTest
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics SimdUTFWideTest
 * @run main/othervm -XX:-CompactStrings -XX:SIMDUTFMinLength=16 SimdUTFWideTest
 * @run main/othervm -XX:-CompactStrings SimdUTFWideTest
 */

/*
 * @test id=tiny-segment
 * @summary UTF-32 staging makes progress for one supplementary character
 * @modules java.base/jdk.internal.access java.base/java.lang:+open java.base/sun.nio.cs
 * @run main/othervm -XX:SIMDUTFMinLength=1 SimdUTFWideTest tinySegment
 */

/*
 * @test id=compiled
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @modules java.base/jdk.internal.access java.base/jdk.internal.util:+open java.base/java.lang:+open java.base/sun.nio.cs
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 SimdUTFWideTest
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:SIMDUTFMinLength=16 SimdUTFWideTest
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:SIMDUTFMinLength=16 SimdUTFWideTest
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_simdutf_process -XX:SIMDUTFMinLength=16 SimdUTFWideTest
 */

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.VarHandle;
import java.lang.reflect.Field;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.ReadOnlyBufferException;
import java.nio.charset.*;
import java.util.Arrays;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import jdk.internal.access.JavaLangAccess;
import jdk.internal.access.SharedSecrets;

public class SimdUTFWideTest {
    private static final JavaLangAccess JLA = SharedSecrets.getJavaLangAccess();
    private static final String[] CHARSETS = {"UTF-16BE", "UTF-16LE", "UTF-16", "x-UTF-16LE-BOM",
            "UTF-32BE", "UTF-32LE", "UTF-32", "X-UTF-32BE-BOM", "X-UTF-32LE-BOM"};
    private static int checks;

    private static void check(boolean condition, String message) {
        checks++;
        if (!condition) throw new AssertionError(message);
    }

    // Feed at most one new byte/char per call, keeping the reference below
    // the test's explicit native threshold, including incomplete sequences.
    private static String decodeReference(byte[] bytes, Charset cs, CodingErrorAction action)
            throws CharacterCodingException {
        CharsetDecoder decoder = cs.newDecoder().onMalformedInput(action).onUnmappableCharacter(action);
        ByteBuffer input = ByteBuffer.wrap(bytes);
        input.limit(0);
        CharBuffer output = CharBuffer.allocate(bytes.length + 8);
        for (int limit = 0; limit <= bytes.length; limit++) {
            input.limit(limit);
            CoderResult cr = decoder.decode(input, output, limit == bytes.length);
            if (!cr.isUnderflow()) cr.throwException();
        }
        CoderResult flush = decoder.flush(output);
        if (!flush.isUnderflow()) flush.throwException();
        return output.flip().toString();
    }

    private static byte[] encodeReference(String text, Charset cs, CodingErrorAction action)
            throws CharacterCodingException {
        CharsetEncoder encoder = cs.newEncoder().onMalformedInput(action).onUnmappableCharacter(action);
        CharBuffer input = CharBuffer.wrap(text);
        input.limit(0);
        ByteBuffer output = ByteBuffer.allocate(text.length() * 8 + 16);
        for (int limit = 0; limit <= text.length(); limit++) {
            input.limit(limit);
            CoderResult cr = encoder.encode(input, output, limit == text.length());
            if (!cr.isUnderflow()) cr.throwException();
        }
        CoderResult cr = encoder.flush(output);
        if (!cr.isUnderflow()) cr.throwException();
        return Arrays.copyOf(output.array(), output.position());
    }

    private static void strings(Charset cs) throws Exception {
        Field coder = String.class.getDeclaredField("coder");
        coder.setAccessible(true);
        Field compact = String.class.getDeclaredField("COMPACT_STRINGS");
        compact.setAccessible(true);
        for (int length : new int[]{0, 1, 15, 16, 17, 8191, 8192, 8193}) {
            for (String pattern : new String[]{"é", "漢", "😃", "\ufeff\ufffe"}) {
                String text = pattern.repeat(length);
                byte[] bytes = encodeReference(text, cs, CodingErrorAction.REPLACE);
                check(Arrays.equals(text.getBytes(cs), bytes), cs + " getBytes " + length);
                String expectedText = decodeReference(bytes, cs, CodingErrorAction.REPLACE);
                for (int offset : new int[]{0, 1, 4}) {
                    byte[] padded = new byte[bytes.length + offset + 7];
                    System.arraycopy(bytes, 0, padded, offset, bytes.length);
                    String decoded = new String(padded, offset, bytes.length, cs);
                    check(decoded.equals(expectedText), cs + " constructor offset " + offset);
                    if (!text.isEmpty()) {
                        check(coder.getByte(decoded) == (compact.getBoolean(null) && pattern.equals("é") ? 0 : 1),
                                cs + " final String coder");
                    }
                }
                check(JLA.uncheckedNewStringOrThrow(bytes, cs).equals(expectedText), cs + " throwing decode");
                check(Arrays.equals(JLA.uncheckedGetBytesOrThrow(text, cs), bytes), cs + " throwing encode");
            }
        }
        for (String text : new String[]{"a".repeat(32) + "\ud800", "\udc00" + "a".repeat(32),
                "a".repeat(32) + "\ud800x", "a".repeat(32) + "\udc00"}) {
            check(Arrays.equals(text.getBytes(cs), encodeReference(text, cs, CodingErrorAction.REPLACE)),
                    cs + " replacement encode");
            try {
                JLA.uncheckedGetBytesOrThrow(text, cs);
                throw new AssertionError("Missing malformed encode");
            } catch (MalformedInputException expected) {
                check(expected.getInputLength() == 1, cs + " malformed encode length");
            }
        }
        for (byte[] bytes : new byte[][]{new byte[33], new byte[35],
                concat(encodeReference("a".repeat(32), cs, CodingErrorAction.REPLACE),
                        new byte[]{(byte)0xd8, 0, 0, 1, (byte)0xff})}) {
            check(new String(bytes, cs).equals(decodeReference(bytes, cs, CodingErrorAction.REPLACE)),
                    cs + " replacement decode");
            CharacterCodingException expected = null;
            try { decodeReference(bytes, cs, CodingErrorAction.REPORT); }
            catch (CharacterCodingException ex) { expected = ex; }
            try {
                JLA.uncheckedNewStringOrThrow(bytes, cs);
                check(expected == null, cs + " missing malformed decode");
            } catch (CharacterCodingException ex) {
                check(expected != null && ex.getClass() == expected.getClass(), cs + " throwing decode type");
                check(((MalformedInputException)ex).getInputLength() == ((MalformedInputException)expected).getInputLength(),
                        cs + " throwing decode length");
            }
        }
    }

    private static byte[] concat(byte[] a, byte[] b) {
        byte[] result = Arrays.copyOf(a, a.length + b.length);
        System.arraycopy(b, 0, result, a.length, b.length);
        return result;
    }

    private static ByteBuffer byteBuffer(byte[] bytes, int kind, Arena arena) {
        ByteBuffer buffer = switch (kind) {
            case 0, 2 -> ByteBuffer.allocate(bytes.length + 8);
            case 1 -> ByteBuffer.allocateDirect(bytes.length + 8);
            case 3 -> arena.allocate(bytes.length + 8, 8).asByteBuffer();
            default -> throw new AssertionError();
        };
        buffer.position(3).put(bytes).flip().position(3);
        return kind == 2 ? buffer.asReadOnlyBuffer() : buffer;
    }

    private static CharBuffer charBuffer(String text, int kind, Arena arena) {
        CharBuffer buffer = switch (kind) {
            case 0, 2 -> CharBuffer.allocate(text.length() + 8);
            case 1 -> ByteBuffer.allocateDirect((text.length() + 8) * 2).asCharBuffer();
            case 3 -> arena.allocate((text.length() + 8) * 2, 8).asByteBuffer().asCharBuffer();
            default -> throw new AssertionError();
        };
        buffer.position(3).put(text).flip().position(3);
        return kind == 2 ? buffer.asReadOnlyBuffer() : buffer;
    }

    private static void buffers(Charset cs) throws Exception {
        String[] texts = {"é".repeat(9000), "漢".repeat(9000), "a".repeat(4095) + "😃" + "漢".repeat(5000),
                "a".repeat(4095) + "\ud800x", "a".repeat(9000) + "\udc00"};
        for (String text : texts) {
            byte[] valid = encodeReference(text, cs, CodingErrorAction.REPLACE);
            for (byte[] bytes : new byte[][]{valid, concat(valid, new byte[]{(byte)0xd8})}) {
                for (CodingErrorAction action : new CodingErrorAction[]{CodingErrorAction.REPLACE,
                        CodingErrorAction.IGNORE, CodingErrorAction.REPORT}) {
                    for (int kind = 0; kind < 4; kind++) {
                        try (Arena arena = Arena.ofConfined()) {
                            ByteBuffer input = byteBuffer(bytes, kind, arena);
                            CharsetDecoder decoder = cs.newDecoder().onMalformedInput(action).onUnmappableCharacter(action);
                            String expected;
                            try { expected = decodeReference(bytes, cs, action); }
                            catch (CharacterCodingException _) { expected = null; }
                            CharBuffer output = charBuffer("\0".repeat(bytes.length + 8), kind == 2 ? 0 : kind, arena);
                            output.position(3);
                            CoderResult cr = decoder.decode(input, output, true);
                            if (expected == null) {
                                check(cr.isMalformed(), cs + " buffer malformed");
                            } else {
                                check(cr.isUnderflow(), cs + " buffer underflow " + cr);
                                output.flip().position(3);
                                check(output.toString().equals(expected), cs + " buffer content kind " + kind);
                            }
                        }
                    }
                }
            }
            byte[] expected = encodeReference(text, cs, CodingErrorAction.REPLACE);
            for (int kind = 0; kind < 4; kind++) {
                try (Arena arena = Arena.ofConfined()) {
                    CharBuffer input = charBuffer(text, kind, arena);
                    CharsetEncoder encoder = cs.newEncoder().onMalformedInput(CodingErrorAction.REPLACE);
                    ByteBuffer output = byteBuffer(new byte[expected.length], kind == 2 ? 0 : kind, arena);
                    output.position(3);
                    CoderResult cr = encoder.encode(input, output, true);
                    check(cr.isUnderflow(), cs + " encode underflow " + cr);
                    output.flip().position(3);
                    byte[] actual = new byte[output.remaining()]; output.get(actual);
                    check(Arrays.equals(actual, expected), cs + " buffer encode kind " + kind);
                }
            }
        }
        // Read-only destinations must retain the scalar path and exception type.
        try {
            cs.newDecoder().decode(ByteBuffer.wrap(encodeReference("a".repeat(64), cs, CodingErrorAction.REPLACE)),
                    CharBuffer.allocate(100).asReadOnlyBuffer(), true);
            throw new AssertionError("Missing read-only failure");
        } catch (CoderMalfunctionError ex) {
            check(ex.getCause() instanceof ReadOnlyBufferException, "read-only decoder cause");
        }
    }

    private static CoderResult decodeStep(CharsetDecoder decoder, ByteBuffer src, CharBuffer dst,
                                          boolean end, boolean scalar) {
        int limit = src.limit();
        if (!scalar) return decoder.decode(src, dst, end);
        int window = src.position();
        while (true) {
            src.limit(window);
            CoderResult cr = decoder.decode(src, dst, end && window == limit);
            if (!cr.isUnderflow() || window == limit) {
                src.limit(limit);
                return cr;
            }
            window++;
        }
    }

    private static CoderResult encodeStep(CharsetEncoder encoder, CharBuffer src, ByteBuffer dst,
                                          boolean end, boolean scalar) {
        int limit = src.limit();
        if (!scalar) return encoder.encode(src, dst, end);
        int window = src.position();
        while (true) {
            src.limit(window);
            CoderResult cr = encoder.encode(src, dst, end && window == limit);
            if (!cr.isUnderflow() || window == limit) {
                src.limit(limit);
                return cr;
            }
            window++;
        }
    }

    private static void partialBuffers(Charset cs) throws Exception {
        for (CodingErrorAction action : new CodingErrorAction[]{CodingErrorAction.REPORT,
                CodingErrorAction.REPLACE, CodingErrorAction.IGNORE}) {
            for (boolean end : new boolean[]{false, true}) {
                for (String text : new String[]{"é".repeat(64), "a".repeat(4095) + "😃z",
                        "a".repeat(4095) + "\ud800", "a".repeat(4095) + "\ud800x"}) {
                    byte[] bytes = concat(encodeReference(text, cs, CodingErrorAction.REPLACE), new byte[]{(byte)0xff});
                    for (int capacity : new int[]{0, 1, 2, 15, 16, 17, 4095, 4096, 9000}) {
                        for (int kind : new int[]{1, 2, 3}) {
                            try (Arena arena = Arena.ofConfined()) {
                                ByteBuffer in = byteBuffer(bytes, kind, arena);
                                ByteBuffer referenceIn = byteBuffer(bytes, 0, arena);
                                CharBuffer out = charBuffer("\0".repeat(capacity), kind == 2 ? 0 : kind, arena);
                                CharBuffer referenceOut = charBuffer("\0".repeat(capacity), 0, arena);
                                CharsetDecoder decoder = cs.newDecoder().onMalformedInput(action).onUnmappableCharacter(action);
                                CharsetDecoder reference = cs.newDecoder().onMalformedInput(action).onUnmappableCharacter(action);
                                CoderResult actual = decodeStep(decoder, in, out, end, false);
                                CoderResult expected = decodeStep(reference, referenceIn, referenceOut, end, true);
                                check(actual.toString().equals(expected.toString()), cs + " partial decode result " + actual + "/" + expected);
                                check(in.position() == referenceIn.position(), cs + " partial decode input position");
                                check(out.position() == referenceOut.position(), cs + " partial decode output position");
                                out.flip(); referenceOut.flip();
                                check(out.equals(referenceOut), cs + " partial decode content");
                                if (actual.isOverflow()) {
                                    out = CharBuffer.allocate(bytes.length + 8);
                                    referenceOut = CharBuffer.allocate(bytes.length + 8);
                                    actual = decodeStep(decoder, in, out, end, false);
                                    expected = reference.decode(referenceIn, referenceOut, end);
                                    check(actual.toString().equals(expected.toString()), cs + " resumed decoder state");
                                    out.flip(); referenceOut.flip();
                                    check(out.equals(referenceOut) && in.position() == referenceIn.position(), cs + " resumed decoder content");
                                }

                                CharBuffer chars = charBuffer(text, kind, arena);
                                CharBuffer referenceChars = charBuffer(text, 0, arena);
                                ByteBuffer encoded = byteBuffer(new byte[capacity], kind == 2 ? 0 : kind, arena);
                                ByteBuffer referenceEncoded = byteBuffer(new byte[capacity], 0, arena);
                                CharsetEncoder encoder = cs.newEncoder().onMalformedInput(action).onUnmappableCharacter(action);
                                CharsetEncoder referenceEncoder = cs.newEncoder().onMalformedInput(action).onUnmappableCharacter(action);
                                actual = encodeStep(encoder, chars, encoded, end, false);
                                expected = encodeStep(referenceEncoder, referenceChars, referenceEncoded, end, true);
                                check(actual.toString().equals(expected.toString()), cs + " partial encode result " + actual + "/" + expected);
                                check(chars.position() == referenceChars.position(), cs + " partial encode input position");
                                check(encoded.position() == referenceEncoded.position(), cs + " partial encode output position");
                                encoded.flip(); referenceEncoded.flip();
                                check(encoded.equals(referenceEncoded), cs + " partial encode content");
                                if (actual.isOverflow()) {
                                    encoded = ByteBuffer.allocate(text.length() * 8 + 16);
                                    referenceEncoded = ByteBuffer.allocate(text.length() * 8 + 16);
                                    actual = encodeStep(encoder, chars, encoded, end, false);
                                    expected = referenceEncoder.encode(referenceChars, referenceEncoded, end);
                                    check(actual.toString().equals(expected.toString()), cs + " resumed encoder state");
                                    encoded.flip(); referenceEncoded.flip();
                                    check(encoded.equals(referenceEncoded) && chars.position() == referenceChars.position(), cs + " resumed encoder content");
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private static ByteBuffer backing(int capacity, int kind, Arena arena) {
        return switch (kind) {
            case 0 -> ByteBuffer.allocate(capacity);
            case 1 -> ByteBuffer.allocateDirect(capacity);
            case 2 -> arena.allocate(capacity, 8).asByteBuffer();
            default -> throw new AssertionError();
        };
    }

    private static void aliases(Charset cs) throws Exception {
        String text = "abé漢".repeat(2200);
        byte[] encoded = encodeReference(text, cs, CodingErrorAction.REPLACE);
        for (int kind = 0; kind < 3; kind++) {
            for (int offset : new int[]{0, 256}) {
                try (Arena arena = Arena.ofConfined()) {
                    int capacity = Math.max(encoded.length, text.length() * 8) + 1024;
                    ByteBuffer memory = backing(capacity, kind, arena);
                    ByteBuffer referenceMemory = backing(capacity, kind, arena);
                    memory.put(encoded).clear(); referenceMemory.put(encoded).clear();
                    ByteBuffer input = memory.duplicate().limit(encoded.length);
                    ByteBuffer referenceInput = referenceMemory.duplicate().limit(encoded.length);
                    CharBuffer output = memory.duplicate().position(offset).slice().asCharBuffer();
                    CharBuffer referenceOutput = referenceMemory.duplicate().position(offset).slice().asCharBuffer();
                    CoderResult actual = cs.newDecoder().decode(input, output, true);
                    CoderResult expected = decodeStep(cs.newDecoder(), referenceInput, referenceOutput, true, true);
                    check(actual.toString().equals(expected.toString()), cs + " aliased decode result");
                    check(input.position() == referenceInput.position() && output.position() == referenceOutput.position(),
                            cs + " aliased decode positions");
                    check(memory.equals(referenceMemory), cs + " aliased decode writes");

                    memory.clear(); referenceMemory.clear();
                    CharBuffer chars = memory.asCharBuffer();
                    CharBuffer referenceChars = referenceMemory.asCharBuffer();
                    chars.put(text).flip(); referenceChars.put(text).flip();
                    memory.position(offset); referenceMemory.position(offset);
                    actual = cs.newEncoder().encode(chars, memory, true);
                    expected = encodeStep(cs.newEncoder(), referenceChars, referenceMemory, true, true);
                    check(actual.toString().equals(expected.toString()), cs + " aliased encode result");
                    check(chars.position() == referenceChars.position() && memory.position() == referenceMemory.position(),
                            cs + " aliased encode positions");
                    memory.clear(); referenceMemory.clear();
                    check(memory.equals(referenceMemory), cs + " aliased encode writes");
                }
            }
        }
    }

    private static Throwable failure(Runnable action) {
        try { action.run(); throw new AssertionError("Missing failure"); }
        catch (CoderMalfunctionError | IllegalStateException | WrongThreadException ex) { return ex; }
    }

    private static void inaccessibleDestination(Charset cs, boolean wrongThread) throws Exception {
        Arena arena = Arena.ofConfined();
        ByteBuffer byteDestination = arena.allocate(1024).asByteBuffer();
        CharBuffer charDestination = arena.allocate(1024).asByteBuffer().asCharBuffer();
        if (!wrongThread) arena.close();
        Throwable[] failure = new Throwable[1];
        Runnable test = () -> {
            try {
                ByteBuffer referenceBytes = ByteBuffer.allocate(1024);
                referenceBytes.put(new byte[128]).flip();
                ByteBuffer actualBytes = referenceBytes.duplicate();
                CharsetDecoder actualDecoder = cs.newDecoder();
                CharsetDecoder referenceDecoder = cs.newDecoder();
                Throwable actual = failure(() -> actualDecoder.decode(actualBytes, charDestination, false));
                Throwable expected = failure(() -> decodeStep(referenceDecoder, referenceBytes, charDestination, false, true));
                check(actual.getClass() == expected.getClass(), "inaccessible decoder exception");
                check(actualBytes.position() == referenceBytes.position(), "inaccessible decoder position");
                if (actual instanceof CoderMalfunctionError) {
                    check(actual.getCause().getClass() == expected.getCause().getClass(), "inaccessible decoder cause");
                }
                CharBuffer chars = CharBuffer.wrap("a".repeat(128));
                CharBuffer referenceChars = chars.duplicate();
                CharsetEncoder actualEncoder = cs.newEncoder();
                CharsetEncoder referenceEncoder = cs.newEncoder();
                actual = failure(() -> actualEncoder.encode(chars, byteDestination, false));
                expected = failure(() -> encodeStep(referenceEncoder, referenceChars, byteDestination, false, true));
                check(actual.getClass() == expected.getClass(), "inaccessible encoder exception");
                check(chars.position() == referenceChars.position(), "inaccessible encoder position");
            } catch (Throwable ex) { failure[0] = ex; }
        };
        if (wrongThread) {
            Thread thread = new Thread(test);
            thread.start(); thread.join(); arena.close();
        } else {
            test.run();
        }
        if (failure[0] != null) throw new AssertionError("inaccessible destination " + cs, failure[0]);
    }

    private static void utf32Dialect(Charset cs) throws Exception {
        if (!cs.name().contains("32")) return;
        boolean little = cs.name().contains("LE");
        for (int cp : new int[]{0xd800, 0xdc00, 0x110000, -1, 0xfeff, 0xfffe}) {
            byte[] bytes = encodeReference("a".repeat(32), cs, CodingErrorAction.REPLACE);
            bytes = Arrays.copyOf(bytes, bytes.length + 4);
            for (int i = 0; i < 4; i++) bytes[bytes.length - 4 + i] = (byte)(cp >>> ((little ? i : 3-i)*8));
            String expected = decodeReference(bytes, cs, CodingErrorAction.REPLACE);
            check(new String(bytes, cs).equals(expected), cs + " UTF32 dialect " + cp);
        }
    }

    private static void subclassCharsets() throws Exception {
        Charset custom = new sun.nio.cs.UTF_16BE() {
            @Override public CharsetDecoder newDecoder() { return StandardCharsets.ISO_8859_1.newDecoder(); }
            @Override public CharsetEncoder newEncoder() { return StandardCharsets.ISO_8859_1.newEncoder(); }
        };
        String text = "é".repeat(128);
        byte[] bytes = text.getBytes(StandardCharsets.ISO_8859_1);
        check(new String(bytes, custom).equals(text), "custom charset decoder");
        check(Arrays.equals(text.getBytes(custom), bytes), "custom charset encoder");
        check(JLA.uncheckedNewStringOrThrow(bytes, custom).equals(text), "custom throwing decoder");
        check(Arrays.equals(JLA.uncheckedGetBytesOrThrow(text, custom), bytes), "custom throwing encoder");
    }

    private static void segmentRanges(Charset cs) throws Exception {
        for (String text : new String[]{"é".repeat(9001), "漢".repeat(9001),
                "a".repeat(4095) + "😃z", "a".repeat(4095) + "😃"}) {
            String wrapped = "prefix" + text + "suffix";
            try (Arena arena = Arena.ofConfined()) {
                MemorySegment memory = arena.allocate(text.length() * 8 + 128);
                for (int length : new int[]{text.length(), text.length() - 1}) {
                    byte[] expected = encodeReference(wrapped.substring(6, 6 + length), cs, CodingErrorAction.REPLACE);
                    long written = MemorySegment.copy(wrapped, cs, 6, memory, 1, length);
                    check(written == expected.length, cs + " segment range length");
                    check(Arrays.equals(memory.asSlice(1, written).toArray(ValueLayout.JAVA_BYTE), expected),
                            cs + " segment range bytes");
                }
            }
        }
    }

    private static void segments(Charset cs) throws Exception {
        if (cs.name().startsWith("x-") || cs.name().startsWith("X-")) return;
        int width = cs.name().startsWith("UTF-32") ? 4 : 2;
        for (String text : new String[]{"é".repeat(9001), "漢".repeat(9001), "a".repeat(4095) + "😃" + "漢".repeat(5001),
                "a".repeat(9000) + "\ud800"}) {
            byte[] expected = encodeReference(text, cs, CodingErrorAction.REPLACE);
            for (boolean heap : new boolean[]{false, true}) {
                try (Arena arena = Arena.ofConfined()) {
                    MemorySegment memory = heap ? MemorySegment.ofArray(new byte[expected.length + width + 8])
                            : arena.allocate(expected.length + width + 8, 8);
                    for (int offset = 0; offset < 4; offset++) {
                        memory.fill((byte)0x7f);
                        memory.setString(offset, text, cs);
                        byte[] actual = memory.asSlice(offset, expected.length).toArray(ValueLayout.JAVA_BYTE);
                        check(Arrays.equals(actual, expected), cs + " segment bytes " + offset);
                        check(memory.getString(offset, cs).equals(new String(expected, cs)), cs + " segment decode " + offset);
                        check(memory.asReadOnly().getString(offset, cs).equals(new String(expected, cs)), cs + " read-only segment");
                        byte[] before = memory.toArray(ValueLayout.JAVA_BYTE);
                        try {
                            memory.setString(memory.byteSize() - 1, text, cs);
                            throw new AssertionError("Missing segment bounds");
                        } catch (IndexOutOfBoundsException _) {
                            check(Arrays.equals(before, memory.toArray(ValueLayout.JAVA_BYTE)), "bounds must precede writes");
                        }
                    }
                }
            }
        }
        try (Arena arena = Arena.ofConfined()) {
            MemorySegment memory = arena.allocate(256);
            try { memory.asReadOnly().setString(-1, "a".repeat(64), cs); throw new AssertionError(); }
            catch (IllegalArgumentException _) { checks++; }
            MemorySegment shortTail = memory.asSlice(0, width);
            shortTail.fill((byte)0);
            try { shortTail.getString(1, cs); throw new AssertionError("Partial terminator accepted"); }
            catch (IndexOutOfBoundsException _) { checks++; }
        }
        Arena arena = Arena.ofConfined();
        MemorySegment memory = arena.allocate(256);
        arena.close();
        try { memory.setString(0, "a".repeat(64), cs); throw new AssertionError(); }
        catch (IllegalStateException _) { checks++; }
    }

    private static void tinySegment() {
        for (String name : new String[]{"UTF-32BE", "UTF-32LE", "UTF-32"}) {
            Charset cs = Charset.forName(name);
            byte[] expected = name.equals("UTF-32LE")
                    ? new byte[]{0, (byte)0xf6, 1, 0} : new byte[]{0, 1, (byte)0xf6, 0};
            try (Arena arena = Arena.ofConfined()) {
                MemorySegment memory = arena.allocate(8);
                memory.setString(0, "😀", cs);
                check(Arrays.equals(memory.asSlice(0, 4).toArray(ValueLayout.JAVA_BYTE), expected), name + " tiny bytes");
                check(memory.getString(0, cs).equals("😀"), name + " tiny round trip");
                check(MemorySegment.copy("😀", cs, 0, memory, 0, 2) == 4, name + " tiny copy length");
            }
        }
    }

    private static void concurrentStringInput() throws Exception {
        VarHandle word = MethodHandles.byteArrayViewVarHandle(int[].class, ByteOrder.LITTLE_ENDIAN);
        for (String name : new String[]{"UTF-16LE", "UTF-32LE"}) {
            Charset cs = Charset.forName(name);
            byte[] bytes = ("\u6f22" + "a".repeat(1023)).getBytes(cs);
            int suffix = name.equals("UTF-16LE") ? 'a' << 16 : 0;
            AtomicBoolean stop = new AtomicBoolean();
            AtomicReference<Throwable> failure = new AtomicReference<>();
            CountDownLatch ready = new CountDownLatch(1);
            Thread mutator = Thread.ofPlatform().unstarted(() -> {
                try {
                    word.set(bytes, 0, suffix | 0x6f22);
                    ready.countDown();
                    while (!stop.get()) {
                        word.set(bytes, 0, suffix | 0x00e9);
                        Thread.yield();
                        word.set(bytes, 0, suffix | 0x6f22);
                        Thread.yield();
                    }
                } catch (Throwable ex) {
                    failure.set(ex);
                } finally {
                    ready.countDown();
                }
            });
            mutator.start();
            try {
                ready.await();
                for (int i = 0; i < 2000; i++) {
                    String text = new String(bytes, cs);
                    check(text.equals(new String(text.toCharArray())), name + " stable String value");
                }
            } finally {
                stop.set(true);
                mutator.join();
            }
            check(failure.get() == null, name + " mutator: " + failure.get());
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length == 1 && args[0].equals("tinySegment")) {
            tinySegment();
            System.out.println("PASS tiny segment checks=" + checks);
            return;
        }
        for (String name : CHARSETS) {
            Charset cs = Charset.forName(name);
            strings(cs);
            buffers(cs);
            partialBuffers(cs);
            aliases(cs);
            inaccessibleDestination(cs, false);
            inaccessibleDestination(cs, true);
            utf32Dialect(cs);
            segmentRanges(cs);
            segments(cs);
        }
        subclassCharsets();
        concurrentStringInput();
        System.out.println("PASS wide conversion checks=" + checks);
    }
}
