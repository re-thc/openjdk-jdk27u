/*
 * Copyright (c) 2026, Harry Chan <38070640+re-thc@users.noreply.github.com>
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

/*
 * @test
 * @summary Reconstituting unique and duplicate constant pools preserves the first matching index
 * @requires vm.jvmti
 * @run main/othervm/native -agentlib:ConstantPoolIndexes ConstantPoolIndexes
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;

public class ConstantPoolIndexes {
    static native byte[] constantPool(Class<?> target, int expectedCount);
    static native byte[] retransform(Class<?> target);

    static class Loader extends ClassLoader {
        Class<?> define(byte[] bytes) {
            return defineClass(null, bytes, 0, bytes.length);
        }
    }

    static void utf(DataOutputStream out, String value) throws Exception {
        out.writeByte(1);
        out.writeUTF(value);
    }

    static byte[] classFile(int entries, boolean duplicates) throws Exception {
        var bytes = new ByteArrayOutputStream();
        var out = new DataOutputStream(bytes);
        out.writeInt(0xcafebabe);
        out.writeShort(0);
        out.writeShort(61);
        out.writeShort(5 + entries * (duplicates ? 4 : 1));
        utf(out, "IndexTarget");
        out.writeByte(7);
        out.writeShort(1);
        utf(out, "java/lang/Object");
        out.writeByte(7);
        out.writeShort(3);
        for (int i = 0; i < entries; i++) {
            if (duplicates) {
                int index = 5 + 4 * i;
                utf(out, "shared_value");
                out.writeByte(8);
                out.writeShort(index);
                utf(out, "IndexTarget");
                out.writeByte(7);
                out.writeShort(index + 2);
            } else {
                utf(out, "constant_" + i);
            }
        }
        out.writeShort(0x21); // public, super
        out.writeShort(2);    // this_class
        out.writeShort(4);    // super_class
        out.writeShort(0);    // interfaces, fields, methods, attributes
        out.writeShort(0);
        out.writeShort(0);
        out.writeShort(0);
        return bytes.toByteArray();
    }

    // Every generated value and reference is checked, including the first
    // duplicate UTF8 index rather than just an equivalent string value.
    static void checkPool(DataInputStream in, int count, boolean duplicates) throws Exception {
        for (int index = 1; index < count; index++) {
            int tag = in.readUnsignedByte();
            int expectedTag = 1;
            if (index == 2 || index == 4) {
                expectedTag = 7;
            } else if (duplicates && index >= 5) {
                expectedTag = switch ((index - 5) % 4) {
                    case 1 -> 8;
                    case 3 -> 7;
                    default -> 1;
                };
            }
            if (tag != expectedTag) {
                throw new AssertionError("Unexpected tag at " + index + ": " + tag);
            }
            if (tag == 1) {
                String expected = index == 1 ? "IndexTarget"
                        : index == 3 ? "java/lang/Object"
                        : !duplicates ? "constant_" + (index - 5)
                        : (index - 5) % 4 == 0 ? "shared_value" : "IndexTarget";
                if (!in.readUTF().equals(expected)) {
                    throw new AssertionError("UTF8 value changed at " + index);
                }
            } else {
                int reference = in.readUnsignedShort();
                int expected = index == 2 ? 1 : index == 4 ? 3 : tag == 8 ? 5 : 1;
                if (reference != expected) {
                    throw new AssertionError("Wrong first UTF8 reference at " + index
                            + ": " + reference + " != " + expected);
                }
            }
        }
    }

    public static void main(String[] args) throws Exception {
        for (boolean duplicates : new boolean[] {false, true}) {
            for (int entries : new int[] {1, 512, 16000}) {
                Class<?> target = new Loader().define(classFile(entries, duplicates));
                int count = 5 + entries * (duplicates ? 4 : 1);
                for (int repeat = 0; repeat < 2; repeat++) {
                    var pool = new DataInputStream(new ByteArrayInputStream(constantPool(target, count)));
                    checkPool(pool, count, duplicates);
                    if (pool.available() != 0) {
                        throw new AssertionError("Unexpected constant-pool bytes");
                    }
                    var file = new DataInputStream(new ByteArrayInputStream(retransform(target)));
                    if (file.readInt() != 0xcafebabe) {
                        throw new AssertionError("Invalid reconstituted class file");
                    }
                    file.readInt(); // minor, major
                    if (file.readUnsignedShort() != count) {
                        throw new AssertionError("Constant-pool count changed");
                    }
                    checkPool(file, count, duplicates);
                    file.readUnsignedShort(); // access flags
                    if (file.readUnsignedShort() != 2 || file.readUnsignedShort() != 4) {
                        throw new AssertionError("Did not use the first Class index");
                    }
                }
            }
        }
    }
}
