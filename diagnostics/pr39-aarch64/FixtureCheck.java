/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License version 2 only, as published by
 * the Free Software Foundation. See the LICENSE file for details.
 */
import java.nio.CharBuffer;
import org.openjdk.bench.java.util.ArraysMismatchEarlyExit;
import org.openjdk.bench.java.nio.MemoryMismatch;
import org.openjdk.bench.java.nio.CharBufferPutString;

/** Checks benchmark fixtures without taking timings. */
public class FixtureCheck {
    public static void main(String[] args) throws Exception {
        for (String kind : new String[] {"BYTE", "BOOLEAN", "CHAR", "SHORT", "INT", "LONG", "FLOAT", "DOUBLE"}) {
            for (int offset : new int[] {0, 1, 7}) {
                for (int at = -1; at < 8; at++) {
                    ArraysMismatchEarlyExit fixture = new ArraysMismatchEarlyExit();
                    fixture.kind = kind;
                    fixture.size = 128;
                    fixture.offset = offset;
                    fixture.difference = at;
                    fixture.setup();
                    if (fixture.mismatch() != at) throw new AssertionError(kind);
                }
            }
        }
        for (String storage : new String[] {"HEAP", "NATIVE", "HEAP_NATIVE", "NATIVE_HEAP", "DIRECT", "MAPPED", "DIRECT_MAPPED"}) {
            for (int size : new int[] {7, 8, 9, 64, 127, 128, 129, 4096, 65535, 65536, 65537, 1048576}) {
                for (String difference : new String[] {"MATCH", "FIRST", "FIRST_WORD", "MIDDLE", "LAST"}) {
                    MemoryMismatch fixture = new MemoryMismatch();
                    fixture.storage = storage;
                    fixture.size = size;
                    fixture.alignment = 1;
                    fixture.difference = difference;
                    try {
                        fixture.setup();
                    } finally {
                        fixture.tearDown();
                    }
                }
            }
        }
        for (String kind : new String[] {"DIRECT", "DIRECT_SWAPPED", "VIEW", "VIEW_SWAPPED", "HEAP"}) {
            for (String coder : new String[] {"LATIN1", "UTF16"}) {
                for (int length : new int[] {31, 32, 63, 64, 1025}) {
                    CharBufferPutString fixture = new CharBufferPutString();
                    fixture.kind = kind;
                    fixture.coder = coder;
                    fixture.length = length;
                    fixture.setup();
                    verify(fixture.put(), length, coder);
                    verify(fixture.append(), length, coder);
                }
            }
        }
        for (String storage : new String[] {"NATIVE", "HEAP_NATIVE", "NATIVE_HEAP"}) {
            for (String difference : new String[] {"10", "25", "82", "1267"}) {
                MemoryMismatch fixture = new MemoryMismatch();
                fixture.storage = storage;
                fixture.size = 131072;
                fixture.alignment = 1;
                fixture.difference = difference;
                try {
                    fixture.setup();
                } finally {
                    fixture.tearDown();
                }
            }
        }
        System.out.println("All qualification fixtures passed");
    }

    private static void verify(CharBuffer buffer, int length, String coder) {
        if (buffer.position() != length) throw new AssertionError("position");
        for (int i = 0; i < length; i++) {
            char expected = (char) ((coder.equals("LATIN1") ? 'a' : 0x3b1) + i % 26);
            if (buffer.get(i) != expected) throw new AssertionError("content at " + i);
        }
    }
}
