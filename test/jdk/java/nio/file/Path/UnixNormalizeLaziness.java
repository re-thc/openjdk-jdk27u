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

/* @test
 * @summary Normalizing an ordinary Unix path preserves lazy name offsets
 * @requires (os.family != "windows")
 * @modules java.base/sun.nio.fs:+open
 * @run main UnixNormalizeLaziness
 */

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.List;

public class UnixNormalizeLaziness {
    public static void main(String[] args) throws Exception {
        Class<?> pathClass = Class.forName("sun.nio.fs.UnixPath");
        Constructor<?> constructor = pathClass.getDeclaredConstructor(
                Class.forName("sun.nio.fs.UnixFileSystem"), byte[].class);
        constructor.setAccessible(true);
        Field offsets = pathClass.getDeclaredField("offsets");
        offsets.setAccessible(true);

        for (byte[] input : List.of(bytes(""), bytes("/"), bytes("a"),
                bytes("/srv/app/config.yaml"), bytes("assets/css/main.css"),
                bytes(".git/config"), bytes("foo/.../bar"), bytes("..foo/.x"),
                bytes("x".repeat(255)), bytes("/" + "x".repeat(255)),
                new byte[] {(byte) 0xff, '/', '.', (byte) 0x80},
                new byte[] {'/', (byte) 0x80, '/', (byte) 0xff})) {
            Path path = (Path) constructor.newInstance(FileSystems.getDefault(), input);
            if (offsets.get(path) != null)
                throw new AssertionError("Offsets already initialized");
            if (path.normalize() != path || offsets.get(path) != null)
                throw new AssertionError("Ordinary normalization initialized offsets");
            path.getNameCount();
            Object cached = offsets.get(path);
            if (cached == null || path.normalize() != path || offsets.get(path) != cached)
                throw new AssertionError("Ordinary normalization replaced cached offsets");
        }
    }

    private static byte[] bytes(String text) {
        return text.getBytes(StandardCharsets.US_ASCII);
    }
}
