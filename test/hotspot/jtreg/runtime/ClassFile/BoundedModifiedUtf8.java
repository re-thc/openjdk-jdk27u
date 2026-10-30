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
 * @summary Bounded modified UTF8 constant-pool decoding and format checks
 * @run main/othervm -Xverify:all BoundedModifiedUtf8
 * @run main/othervm -Xverify:all -Xint BoundedModifiedUtf8
 * @run main/othervm -Xverify:all -XX:TieredStopAtLevel=1 BoundedModifiedUtf8
 * @run main/othervm -Xverify:all -XX:-TieredCompilation -Xbatch BoundedModifiedUtf8
 */

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;

public class BoundedModifiedUtf8 {
    private static final String NAME = "MutfPayload";

    private static class Loader extends ClassLoader {
        Class<?> load(byte[] bytes) {
            return defineClass(null, bytes, 0, bytes.length);
        }
    }

    // Emit raw CONSTANT_Utf8 bytes so malformed encodings are not normalized by
    // an encoder. A ConstantValue String makes the VM consume count and coder.
    static byte[] classBytes(String name, int version, byte[] payload) throws IOException {
        var bytes = new ByteArrayOutputStream();
        try (var out = new DataOutputStream(bytes)) {
            out.writeInt(0xcafebabe);
            out.writeShort(0);
            out.writeShort(version);
            out.writeShort(10);
            utf(out, name);                       // 1
            out.writeByte(7); out.writeShort(1);  // 2: Class
            utf(out, "java/lang/Object");         // 3
            out.writeByte(7); out.writeShort(3);  // 4: Class
            utf(out, "value");                    // 5
            utf(out, "Ljava/lang/String;");       // 6
            utf(out, "ConstantValue");            // 7
            out.writeByte(1);                    // 8: raw UTF8
            out.writeShort(payload.length);
            out.write(payload);
            out.writeByte(8); out.writeShort(8);  // 9: String
            out.writeShort(0x21);                // public, super
            out.writeShort(2);
            out.writeShort(4);
            out.writeShort(0);                   // interfaces
            out.writeShort(1);                   // fields
            out.writeShort(0x19);                // public static final
            out.writeShort(5);
            out.writeShort(6);
            out.writeShort(1);                   // field attributes
            out.writeShort(7);
            out.writeInt(2);
            out.writeShort(9);
            out.writeShort(0);                   // methods
            out.writeShort(0);                   // class attributes
        }
        return bytes.toByteArray();
    }

    private static void utf(DataOutputStream out, String value) throws IOException {
        out.writeByte(1);
        out.writeUTF(value);
    }

    static byte[] mutf(String value) throws IOException {
        var bytes = new ByteArrayOutputStream();
        try (var out = new DataOutputStream(bytes)) {
            out.writeUTF(value);
        }
        byte[] encoded = bytes.toByteArray();
        return java.util.Arrays.copyOfRange(encoded, 2, encoded.length);
    }

    static List<String> values() {
        var values = new ArrayList<String>();
        for (int length : new int[] {0, 1, 7, 8, 15, 16, 17, 31, 32, 33, 63, 64, 65, 256, 4096, 65535}) {
            values.add("a".repeat(length));
        }
        for (int prefix = 0; prefix <= 33; prefix++) {
            for (String unit : new String[] {"\0", "\u007f", "\u0080", "\u00ff", "\u0100",
                    "\u07ff", "\u0800", "\ud800", "\udfff", "\ud800\udc00"}) {
                values.add("a".repeat(prefix) + unit);
                values.add("a".repeat(prefix) + unit + "b".repeat(33));
            }
        }
        return values;
    }

    private static void check(byte[] payload, int version, String expected) throws Exception {
        Class<?> c = new Loader().load(classBytes(NAME, version, payload));
        String actual = (String) c.getField("value").get(null);
        if (!expected.equals(actual)) {
            throw new AssertionError("MUTF contents/count mismatch, version " + version);
        }
    }

    private static void malformed(byte[] payload, int version) throws Exception {
        try {
            new Loader().load(classBytes(NAME, version, payload));
            throw new AssertionError("Accepted malformed MUTF, version " + version);
        } catch (ClassFormatError expected) {
            if (!expected.getMessage().contains("Illegal UTF8 string")) {
                throw expected;
            }
        }
    }

    static void writeArchiveJar(Path jar) throws Exception {
        try (var out = new JarOutputStream(Files.newOutputStream(jar))) {
            for (String name : new String[] {"BoundedModifiedUtf8", "BoundedModifiedUtf8$Loader"}) {
                out.putNextEntry(new JarEntry(name + ".class"));
                try (var in = BoundedModifiedUtf8.class.getResourceAsStream(name + ".class")) {
                    in.transferTo(out);
                }
                out.closeEntry();
            }
            int i = 0;
            for (String value : values()) {
                String name = NAME + i++;
                out.putNextEntry(new JarEntry(name + ".class"));
                out.write(classBytes(name, Runtime.version().feature() + 44, mutf(value)));
                out.closeEntry();
            }
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            int i = 0;
            for (String expected : values()) {
                String actual = (String) Class.forName(NAME + i++).getField("value").get(null);
                if (!actual.equals(expected)) {
                    throw new AssertionError("Archived MUTF mismatch");
                }
            }
            System.out.println("Archived MUTF passed");
            return;
        }
        for (int version : new int[] {47, 48, Runtime.version().feature() + 44}) {
            for (String value : values()) {
                check(mutf(value), version, value);
            }
            int[][] errors = {{0}, {0x80}, {0xbf}, {0xc0}, {0xc2, 0x41}, {0xc2, 0xc2},
                    {0xe0}, {0xe0, 0xa0}, {0xe1, 0x41, 0x80}, {0xe1, 0x80, 0x41},
                    {0xf0, 0x90, 0x80, 0x80}, {0xf4, 0x8f, 0xbf, 0xbf}, {0xf5}, {0xff}};
            for (int prefix = 0; prefix < 33; prefix++) {
                for (int[] error : errors) {
                    byte[] bytes = new byte[prefix + error.length];
                    java.util.Arrays.fill(bytes, 0, prefix, (byte) 'a');
                    for (int j = 0; j < error.length; j++) {
                        bytes[prefix + j] = (byte) error[j];
                    }
                    malformed(bytes, version);
                }
                for (int[] overlong : new int[][] {{0xc0, 0x81}, {0xc1, 0xbf},
                        {0xe0, 0x80, 0x80}, {0xe0, 0x9f, 0xbf}}) {
                    byte[] bytes = new byte[prefix + overlong.length];
                    java.util.Arrays.fill(bytes, 0, prefix, (byte) 'a');
                    int unit = overlong[0] & (overlong.length == 2 ? 31 : 15);
                    for (int j = 0; j < overlong.length; j++) {
                        bytes[prefix + j] = (byte) overlong[j];
                        if (j > 0) unit = unit * 64 + (overlong[j] & 63);
                    }
                    if (version <= 47) {
                        check(bytes, version, "a".repeat(prefix) + (char) unit);
                    } else {
                        malformed(bytes, version);
                    }
                }
            }
        }
        System.out.println("Bounded MUTF passed");
    }
}
