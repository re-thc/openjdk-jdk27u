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
 * @summary UTF-8 must not read the next mapped page after an invalid leading byte
 * @requires (os.family == "linux")
 * @modules java.base/jdk.internal.misc
 * @run main/othervm MappedMalformedPrefix
 * @run main/othervm -Xint MappedMalformedPrefix
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 MappedMalformedPrefix
 * @run main/othervm -Xbatch -XX:-TieredCompilation MappedMalformedPrefix
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics MappedMalformedPrefix
 */
import java.lang.ref.Reference;
import java.nio.*;
import java.nio.channels.FileChannel;
import java.nio.charset.*;
import java.nio.file.*;
import jdk.internal.misc.Unsafe;

public class MappedMalformedPrefix {
    static CoderResult decode(CharsetDecoder d, ByteBuffer s, CharBuffer t) {
        return d.decode(s, t, false);
    }
    public static void main(String[] args) throws Exception {
        int page = Unsafe.getUnsafe().pageSize();
        Path file = Files.createTempFile("mapped-utf8-prefix", ".bin");
        MappedByteBuffer mapped = null;
        try (FileChannel fc = FileChannel.open(file, StandardOpenOption.READ,
                                              StandardOpenOption.WRITE)) {
            fc.position(2L * page - 1);
            fc.write(ByteBuffer.wrap(new byte[1]));
            mapped = fc.map(FileChannel.MapMode.READ_WRITE, 0, 2L * page);
            mapped.put(page - 1, (byte) 0xff);
            mapped.put(page, (byte) 'A');
            CharBuffer dst = CharBuffer.allocate(64);
            CharsetDecoder decoder = StandardCharsets.UTF_8.newDecoder()
                    .onMalformedInput(CodingErrorAction.REPORT);
            mapped.limit(page - 1 + 64);
            for (int i = 0; i < 10000; i++) {
                mapped.position(page - 1); dst.clear(); decoder.reset();
                decode(decoder, mapped, dst);
            }
            mapped.position(page - 1); dst.clear(); decoder.reset();
            fc.truncate(page);
            CoderResult result = decode(decoder, mapped, dst);
            if (!result.isMalformed() || result.length() != 1
                    || mapped.position() != page - 1 || dst.position() != 0) {
                throw new AssertionError(result + " positions " + mapped.position()
                                         + "/" + dst.position());
            }
            System.out.println("PASS MALFORMED[1], unchanged positions");
        } finally {
            Reference.reachabilityFence(mapped);
            Files.deleteIfExists(file);
        }
    }
}
