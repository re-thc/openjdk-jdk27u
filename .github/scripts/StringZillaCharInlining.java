/*
 * Copyright (c) 2026, re-thc. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only
 */

/** Application-only warmup for character-search compilation diagnostics. */
public class StringZillaCharInlining {
    private static volatile String value;
    private static volatile int character;
    private static volatile int from;
    private static volatile int result;

    private static int search() {
        return value.indexOf(character, from);
    }

    private static int searchReverse() {
        return value.lastIndexOf(character);
    }

    public static void main(String[] args) {
        int length = Integer.parseInt(args[0]);
        String coder = args.length < 3 ? "UTF16" : args[2];
        if (!coder.equals("LATIN1") && !coder.equals("UTF16")) {
            throw new IllegalArgumentException("Expected LATIN1 or UTF16: " + coder);
        }
        boolean reverse = args.length > 3;
        if (reverse && !args[3].equals("reverse")) {
            throw new IllegalArgumentException("Expected reverse: " + args[3]);
        }
        boolean latin1 = coder.equals("LATIN1");
        character = latin1 ? 'b' : 0x0402;
        from = args.length == 1 ? 0 : Integer.parseInt(args[1]);
        int expected = -1;
        if (reverse) {
            if (length < 4 || from != length - 1) {
                throw new IllegalArgumentException("Reverse diagnostic requires length >= 4 and from = length - 1");
            }
            char[] chars = new char[length];
            int base = latin1 ? 'a' : 0x400;
            java.util.Random random = new java.util.Random(12345);
            for (int i = 0; i < length; i++) {
                chars[i] = (char)(base + random.nextInt(16));
            }
            character = base + 31;
            for (int i = 0; i < 4; i++) {
                chars[length - 4 + i] = (char)(character - i);
            }
            value = new String(chars);
            for (int i = chars.length - 1; i >= 0; i--) {
                if (chars[i] == character) {
                    expected = i;
                    break;
                }
            }
            if (expected != length - 4) {
                throw new AssertionError("Reverse diagnostic fixture: " + expected);
            }
        } else {
            value = (latin1 ? "a" : "\u0401").repeat(length);
        }
        int total = 0;
        if (reverse) {
            for (int i = 0; i < 50000; i++) {
                total += searchReverse();
            }
        } else {
            for (int i = 0; i < 50000; i++) {
                total += search();
            }
        }
        result = total;
        if (result != 50000 * expected) {
            throw new AssertionError("Character-search diagnostic result: " + result);
        }
        System.out.println((reverse ? "Reverse character-search" : "Character-search")
                + " compilation check passed: length=" + length + " from=" + from
                + (args.length < 3 ? "" : " coder=" + coder)
                + (reverse ? " expected=" + expected : ""));
    }
}
