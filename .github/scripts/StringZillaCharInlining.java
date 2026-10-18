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

    public static void main(String[] args) {
        int length = Integer.parseInt(args[0]);
        String coder = args.length < 3 ? "UTF16" : args[2];
        if (!coder.equals("LATIN1") && !coder.equals("UTF16")) {
            throw new IllegalArgumentException("Expected LATIN1 or UTF16: " + coder);
        }
        boolean latin1 = coder.equals("LATIN1");
        value = (latin1 ? "a" : "\u0401").repeat(length);
        character = latin1 ? 'b' : 0x0402;
        from = args.length == 1 ? 0 : Integer.parseInt(args[1]);
        int total = 0;
        for (int i = 0; i < 50000; i++) {
            total += search();
        }
        result = total;
        if (result != -50000) {
            throw new AssertionError("Character-search diagnostic result: " + result);
        }
        System.out.println("Character-search compilation check passed: length=" + length + " from=" + from
                + (args.length < 3 ? "" : " coder=" + coder));
    }
}
