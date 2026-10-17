/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * This code is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License version 2 only, as published by
 * the Free Software Foundation. See the LICENSE file for details.
 */
import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;
import java.util.Arrays;

/** A first public comparison in a fresh VM, without benchmark setup warmup. */
public class ColdMismatch {
    public static void main(String[] args) {
        String operation = args[0];
        int size = Integer.parseInt(args[1]);
        int at = Integer.parseInt(args[2]);
        try (Arena arena = Arena.ofConfined()) {
            long actual;
            if (operation.equals("array")) {
                byte[] a = new byte[size], b = new byte[size];
                if (at >= 0) b[at] = 1;
                actual = Arrays.mismatch(a, b);
            } else {
                MemorySegment a = arena.allocate(size + 8).asSlice(1, size);
                MemorySegment b = arena.allocate(size + 8).asSlice(3, size);
                if (at >= 0) b.set(ValueLayout.JAVA_BYTE, at, (byte) 1);
                actual = switch (operation) {
                    case "segment" -> a.mismatch(b);
                    case "buffer" -> a.asByteBuffer().mismatch(b.asByteBuffer());
                    case "int" -> a.asByteBuffer().asIntBuffer().mismatch(b.asByteBuffer().asIntBuffer());
                    default -> throw new IllegalArgumentException(operation);
                };
            }
            int expected = operation.equals("int") && at >= 0 ? at / Integer.BYTES : at;
            if (actual != expected) throw new AssertionError(actual + " != " + expected);
            System.out.println(operation + " " + size + " " + at + " passed");
        }
    }
}
