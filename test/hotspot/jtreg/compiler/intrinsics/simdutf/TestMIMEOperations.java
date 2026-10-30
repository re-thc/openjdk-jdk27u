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
 * @summary MIME decoding matches the original Java operation across padding and capacity boundaries
 * @library /test/lib
 * @run driver TestMIMEOperations
 */
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Base64;
import java.util.HexFormat;
import jdk.test.lib.process.ProcessTools;

public class TestMIMEOperations {
    public static void main(String[] args) throws Exception {
        if (args.length == 0) {
            String expected = run("-XX:-UseSIMDUTFIntrinsics");
            for (String mode : new String[]{"-Xint", "-XX:TieredStopAtLevel=1", "-XX:-TieredCompilation"}) {
                if (!expected.equals(run(mode))) throw new AssertionError("MIME mismatch: " + mode);
            }
            return;
        }
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        Base64.Decoder decoder = Base64.getMimeDecoder();
        for (int size : new int[]{0,60,64,256,1024,8192}) {
            for (String tail : new String[]{"", "AA", "AAA", "AA==", "AAA=", "A", "=", "AA==A", "AA= =", "A===", "AA=", "A!A==", "AA==!", "AA===", "!!", "AA==!AAAA"}) {
                for (boolean garbage : new boolean[]{false,true}) {
                    String prefix = garbage ? "AA!AA\r\n".repeat(size / 4) : "A".repeat(size);
                    byte[] input = (prefix + tail).getBytes(StandardCharsets.ISO_8859_1);
                    for (int capacity : new int[]{0,size / 4 * 3,size / 4 * 3 + 1,size / 4 * 3 + 16}) {
                        byte[] output = new byte[capacity]; Arrays.fill(output, (byte)0x55);
                        try { mark(digest, "ok:" + decoder.decode(input, output)); }
                        catch (IllegalArgumentException e) { mark(digest, e.getMessage()); }
                        digest.update(output);
                    }
                    // decode(byte[]) sizes MIME output by a bound and trims it, the other forms by a scan
                    String bounded;
                    try { bounded = Arrays.toString(decoder.decode(input)); }
                    catch (IllegalArgumentException e) { bounded = e.getMessage(); }
                    String exact;
                    byte[] room = new byte[input.length];
                    try { exact = Arrays.toString(Arrays.copyOf(room, decoder.decode(input, room))); }
                    catch (IllegalArgumentException e) { exact = e.getMessage(); }
                    if (!bounded.equals(exact)) {
                        throw new AssertionError("decode(byte[]) of size " + size + " tail " + tail + ": "
                                + bounded + " and " + exact);
                    }
                    mark(digest, bounded);
                    byte[] wrapped = new byte[input.length + 6];
                    System.arraycopy(input, 0, wrapped, 3, input.length);
                    ByteBuffer source = ByteBuffer.wrap(wrapped, 3, input.length);
                    try {
                        ByteBuffer result = decoder.decode(source);
                        byte[] output = new byte[result.remaining()]; result.get(output);
                        mark(digest, "buffer-ok"); digest.update(output);
                    } catch (IllegalArgumentException e) { mark(digest, e.getMessage()); }
                    mark(digest, "position:" + source.position());
                }
            }
        }
        System.out.println(HexFormat.of().formatHex(digest.digest()));
    }
    private static void mark(MessageDigest digest, String text) {
        digest.update(text.getBytes(StandardCharsets.UTF_8)); digest.update((byte)0);
    }
    private static String run(String mode) throws Exception {
        return ProcessTools.executeTestJava("-Xbatch", mode, "TestMIMEOperations", "child")
                .shouldHaveExitValue(0).getStdout().trim();
    }
}
