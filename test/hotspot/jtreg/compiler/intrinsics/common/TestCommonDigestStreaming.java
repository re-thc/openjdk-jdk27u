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
 * @summary Verify digest multi-block offsets across streaming updates and compilation tiers
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @run main/othervm -Xint -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonDigestStreaming
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonDigestStreaming
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonDigestStreaming
 * @run main/othervm -Xbatch -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonDigestStreaming
 * @run main/othervm -Xbatch -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonDigestStreaming
 */

package compiler.intrinsics.common;

import java.security.MessageDigest;
import java.util.HexFormat;

public class TestCommonDigestStreaming {
    private static final int LENGTH = 32768 + 308;
    private static final int OFFSET = 19;
    // Independently computed known answers for byte i = (i * 73 + (i >>> 5)).
    private static final String[][] ANSWERS = {
        {"MD5", "4ae2f0ee1eb9f1c6cfe3a98df1502bb5"},
        {"SHA-1", "4705b36a04aa4d95dd241c29527b600d4b7c0fa9"},
        {"SHA-224", "3d748a87e37a008540ef66382946ae322a8f492caf7184eed1ba52c3"},
        {"SHA-256", "b55482e53dd36dc02b9de555971d38816b4dfe0cf69c89b338b6886e534eab5b"},
        {"SHA-384", "18aa588398701b23c51b8f8ad7101a5adb389ca9612a0fd9e0f1e4b68c5e6a4e543500f217ed79a338a8de5770a9ccd3"},
        {"SHA-512", "04dbb2dd7f0d48edc0c867d50d723617cfcf4d3274691e22a3506fe57107a1d44478006fc049629efcb58bae1c980c22a919ff4b8b2ad533d6cf6a4696b3db44"},
        {"SHA3-224", "dd7baff78b9b638fdc830d4eb9653808b0c06a6226b17d5f16e75658"},
        {"SHA3-256", "f868d1a833c4811d9f20e1a0a48c2d7585cbdfa74000951d250b381e3b2d9c7c"},
        {"SHA3-384", "7dece50d3837d55b03203a0218b19336b5842d9c6b96bbd2222b48a479609d3a37719b7ec33281c9479c0bda59df421b"},
        {"SHA3-512", "edce1ec570027a57cf16a85adfc1a7ef56577a2cab31214c2de94f2d70bbc642918a87fa69c6f45273b4b1119cdd63b70725e97a6746f800dc2c2be981c7ef0f"},
    };

    public static void main(String[] args) throws Exception {
        byte[] input = new byte[OFFSET + LENGTH + 17];
        for (int i = 0; i < LENGTH; i++) {
            input[OFFSET + i] = (byte) (i * 73 + (i >>> 5));
        }
        for (String[] answer : ANSWERS) {
            MessageDigest digest = MessageDigest.getInstance(answer[0]);
            for (int repeat = 0; repeat < 40; repeat++) {
                for (int chunk : new int[] {63, 257, 4096, 8192}) {
                    for (int pos = 0; pos < LENGTH; pos += chunk) {
                        digest.update(input, OFFSET + pos, Math.min(chunk, LENGTH - pos));
                    }
                    String actual = HexFormat.of().formatHex(digest.digest());
                    if (!actual.equals(answer[1])) {
                        throw new AssertionError(answer[0] + " chunk " + chunk +
                                                 ": " + actual + " != " + answer[1]);
                    }
                }
            }
        }
    }
}
