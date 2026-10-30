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
 * @summary Existing Base64 block entries retain padding, MIME, tails and alias behavior
 * @run main/othervm -Xint TestBase64Operations
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestBase64Operations
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestBase64Operations
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestBase64Operations
 */

/*
 * @test id=avx2
 * @summary AVX2 Base64 block stores preserve the destination suffix
 * @requires vm.compiler2.enabled & os.simpleArch == "x64" & vm.cpu.features ~= ".*avx2.*"
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:UseAVX=2 TestBase64Operations
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:UseAVX=2 -XX:-UseSIMDUTFIntrinsics TestBase64Operations
 */
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Base64;
import java.util.Random;

public class TestBase64Operations {
    private static void check(byte[] input, Base64.Encoder encoder, Base64.Decoder decoder) throws Exception {
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        try (OutputStream out = encoder.wrap(stream)) { out.write(input); }
        byte[] expected = stream.toByteArray(); // Independent streaming implementation.
        int repeats = input.length <= 8192 ? 50 : 1;
        for (int i = 0; i < repeats; i++) {
            if (!Arrays.equals(expected, encoder.encode(input)) ||
                    !Arrays.equals(input, decoder.decode(expected))) throw new AssertionError("round trip");
            byte[] output = new byte[input.length + 16]; Arrays.fill(output, (byte)0x55);
            int written = decoder.decode(expected, output);
            if (written != input.length || !Arrays.equals(input, Arrays.copyOf(output, written)))
                throw new AssertionError("destination result");
            for (int j = written; j < output.length; j++) if (output[j] != (byte)0x55)
                throw new AssertionError("destination suffix: length=" + input.length +
                        " written=" + written + " at=" + j);
            byte[] alias = expected.clone();
            if (decoder.decode(alias, alias) != input.length ||
                    !Arrays.equals(input, Arrays.copyOf(alias, input.length))) throw new AssertionError("alias");
        }
        byte[] paddedInput = new byte[input.length + 6];
        System.arraycopy(input, 0, paddedInput, 3, input.length);
        ByteBuffer source = ByteBuffer.wrap(paddedInput, 3, input.length);
        ByteBuffer encodedBuffer = encoder.encode(source);
        byte[] bufferBytes = new byte[encodedBuffer.remaining()]; encodedBuffer.get(bufferBytes);
        if (source.position() != input.length + 3 || !Arrays.equals(bufferBytes, expected))
            throw new AssertionError("array buffer encode offset");
        byte[] paddedEncoded = new byte[expected.length + 6];
        System.arraycopy(expected, 0, paddedEncoded, 3, expected.length);
        source = ByteBuffer.wrap(paddedEncoded, 3, expected.length);
        ByteBuffer decodedBuffer = decoder.decode(source);
        bufferBytes = new byte[decodedBuffer.remaining()]; decodedBuffer.get(bufferBytes);
        if (source.position() != expected.length + 3 || !Arrays.equals(bufferBytes, input))
            throw new AssertionError("array buffer decode offset");
        ByteBuffer direct = ByteBuffer.allocateDirect(expected.length + 6);
        direct.position(3).put(expected).flip().position(3);
        ByteBuffer decoded = decoder.decode(direct.asReadOnlyBuffer());
        byte[] result = new byte[decoded.remaining()]; decoded.get(result);
        if (!Arrays.equals(result, input)) throw new AssertionError("read-only direct input");
        if (input.length > 0) {
            try { decoder.decode(expected, new byte[input.length - 1]); throw new AssertionError("capacity"); }
            catch (IllegalArgumentException expectedException) { }
        }
    }
    public static void main(String[] args) throws Exception {
        Random random = new Random(4261);
        // AVX2 consumes 32 encoded characters per iteration. Padded inputs of
        // 31 + 24*k bytes expose stores beyond the final decoded byte.
        for (int length : new int[]{0,1,2,3,30,31,32,33,54,55,56,57,78,79,80,81,
                255,256,257,1023,1024,1025,8192,786432,786435,1048576,1048577,1048578}) {
            byte[] input = new byte[length]; random.nextBytes(input);
            check(input, Base64.getEncoder(), Base64.getDecoder());
            check(input, Base64.getEncoder().withoutPadding(), Base64.getDecoder());
            check(input, Base64.getUrlEncoder(), Base64.getUrlDecoder());
            check(input, Base64.getUrlEncoder().withoutPadding(), Base64.getUrlDecoder());
            check(input, Base64.getMimeEncoder(), Base64.getMimeDecoder());
            check(input, Base64.getMimeEncoder(6000, new byte[]{'\r','\n'}), Base64.getMimeDecoder());
        }
        // A late native error must return through this block's Java fallback,
        // rather than return zero and retry the same long suffix per quartet.
        for (Base64.Decoder decoder : new Base64.Decoder[]{Base64.getDecoder(), Base64.getUrlDecoder()}) {
            for (byte bad : new byte[]{'!', ' ', '\t', '\r', '\n', '\f'}) {
                for (int at : new int[]{63,64,127,128,1023,1024,65528,65529,65530,65531}) {
                    byte[] invalid = new byte[65536]; Arrays.fill(invalid, (byte)'A');
                    invalid[at] = bad;
                    try { decoder.decode(invalid); throw new AssertionError("late invalid input"); }
                    catch (IllegalArgumentException expectedException) {
                        String message = "Illegal base64 character " + Integer.toString(bad, 16);
                        if (!message.equals(expectedException.getMessage())) throw new AssertionError(expectedException);
                    }
                }
            }
        }
        byte[] spaces = new byte[8192]; Arrays.fill(spaces, (byte)' ');
        if (Base64.getMimeDecoder().decode(spaces).length != 0) throw new AssertionError("MIME spaces");
        byte[] input = new byte[8192]; random.nextBytes(input);
        byte[] encoded = Base64.getEncoder().encode(input);
        for (int at : new int[]{0,1024,encoded.length-8,encoded.length-7,encoded.length-4}) {
            byte[] invalid = encoded.clone(); invalid[at] = '!';
            try { Base64.getDecoder().decode(invalid); throw new AssertionError("invalid alphabet"); }
            catch (IllegalArgumentException expectedException) { }
            byte[] spaced = new byte[encoded.length + 1];
            System.arraycopy(encoded,0,spaced,0,at); spaced[at]=' ';
            System.arraycopy(encoded,at,spaced,at+1,encoded.length-at);
            if (!Arrays.equals(input,Base64.getMimeDecoder().decode(spaced))) throw new AssertionError("MIME space");
            try { Base64.getDecoder().decode(spaced); throw new AssertionError("basic space"); }
            catch (IllegalArgumentException expectedException) { }
        }
    }
}
