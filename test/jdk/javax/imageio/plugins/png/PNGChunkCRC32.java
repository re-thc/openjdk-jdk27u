/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Verify PNG chunk CRC32 values and pixel round trips
 * @run main/othervm -Djava.awt.headless=true PNGChunkCRC32
 */
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Random;
import javax.imageio.ImageIO;

public class PNGChunkCRC32 {
    private static int integer(byte[] data, int offset) {
        return ((data[offset] & 255) << 24) | ((data[offset + 1] & 255) << 16)
                | ((data[offset + 2] & 255) << 8) | (data[offset + 3] & 255);
    }

    public static void main(String[] args) throws Exception {
        Random random = new Random(12345);
        for (int size : new int[] {1, 37, 257}) {
            BufferedImage image = new BufferedImage(size, size, BufferedImage.TYPE_INT_ARGB);
            for (int y = 0; y < size; y++) {
                for (int x = 0; x < size; x++) {
                    image.setRGB(x, y, random.nextInt());
                }
            }
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            if (!ImageIO.write(image, "png", output)) {
                throw new AssertionError("PNG writer unavailable");
            }
            byte[] data = output.toByteArray();
            int offset = 8;
            int chunks = 0;
            while (offset < data.length) {
                int length = integer(data, offset);
                if (length < 0 || length > data.length - offset - 12) {
                    throw new AssertionError("Invalid PNG chunk length");
                }
                int crc = -1;
                for (int i = offset + 4; i < offset + 8 + length; i++) {
                    crc ^= data[i] & 255;
                    for (int bit = 0; bit < 8; bit++) {
                        crc = (crc >>> 1) ^ ((crc & 1) == 0 ? 0 : 0xedb88320);
                    }
                }
                if (~crc != integer(data, offset + 8 + length)) {
                    throw new AssertionError("PNG chunk CRC32 at " + offset);
                }
                offset += length + 12;
                chunks++;
            }
            if (offset != data.length || chunks < 3) {
                throw new AssertionError("Incomplete PNG");
            }
            BufferedImage restored = ImageIO.read(new ByteArrayInputStream(data));
            for (int y = 0; y < size; y++) {
                for (int x = 0; x < size; x++) {
                    if (image.getRGB(x, y) != restored.getRGB(x, y)) {
                        throw new AssertionError("PNG pixel at " + x + "," + y);
                    }
                }
            }
        }
    }
}
