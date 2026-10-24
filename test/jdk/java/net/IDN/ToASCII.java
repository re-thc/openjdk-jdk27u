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
 * @summary Check unchanged ASCII names and conversion fallback semantics
 * @run main ToASCII
 */

import java.net.IDN;

public class ToASCII {
    private static final int[] FLAGS = {
            0, IDN.ALLOW_UNASSIGNED, IDN.USE_STD3_ASCII_RULES,
            IDN.ALLOW_UNASSIGNED | IDN.USE_STD3_ASCII_RULES,
            4, 5, 6, 7, Integer.MIN_VALUE, Integer.MIN_VALUE | 3,
            Integer.MAX_VALUE, -1
    };

    public static void main(String[] args) {
        String longest = "a".repeat(63);
        // There is no total name length limit in IDN.toASCII.
        for (String name : new String[] {
                "a", "Z", "0", "localhost", "WWW.Example.COM", "a-b.example.",
                "xn--a", "XN--bcher-kva.Example.", longest, longest + ".",
                (longest + ".").repeat(5) + longest
        }) {
            String input = new String(name);
            if (IDN.toASCII(input) != input) {
                throw new RuntimeException("Did not reuse ASCII input: " + name);
            }
            for (int flag : FLAGS) {
                check(name, name, flag);
            }
        }

        for (int flag : FLAGS) {
            check("", "", flag);
            for (String dot : new String[] {".", "\u3002", "\uff0e", "\uff61"}) {
                check(dot, ".", flag);
                check("Example" + dot + "COM" + dot, "Example.COM.", flag);
            }
            check("b\u00fccher.Example", "xn--bcher-kva.Example", flag);
            check("B\u00dcCHER.Example", "xn--bcher-kva.Example", flag);
            check("\uff21.example", "a.example", flag);
            check("a\u00adb.example", "ab.example", flag);

            // Flag zero accepts ASCII that is not a DNS host name. Unknown
            // bits do not change this; only USE_STD3_ASCII_RULES matters.
            for (String name : new String[] {
                    "-", "-a", "a-", "xn--", "XN--", "a-.example"
            }) {
                if ((flag & IDN.USE_STD3_ASCII_RULES) == 0) {
                    check(name, name, flag);
                } else {
                    fails(name, flag, "Has leading or trailing hyphen");
                }
            }
            for (String name : new String[] {
                    "_service._tcp", "a:b", "a b", "a/b", "a@b", "\u0000", "a\u007f"
            }) {
                if ((flag & IDN.USE_STD3_ASCII_RULES) == 0) {
                    check(name, name, flag);
                } else {
                    fails(name, flag, "Contains non-LDH ASCII characters");
                }
            }
            for (String name : new String[] {
                    ".a", "..", "a..", "a..b", "." + longest,
                    "a.\u00ad", "\u00ad", "a\u3002\uff0eb"
            }) {
                fails(name, flag, "Empty label is not a legal name");
            }
            for (String name : new String[] {
                    longest + "a", "a." + longest + "a.", longest + "a.."
            }) {
                fails(name, flag, "The label in the input is too long");
            }
            fails("a.." + longest + "a", flag, "Empty label is not a legal name");
            fails("xn--\u00e9", flag, "The input starts with the ACE Prefix");
            fails("\ud800", flag, null);
            fails("\udc00", flag, null);
            try {
                IDN.toASCII(null, flag);
                throw new RuntimeException("Accepted null");
            } catch (NullPointerException expected) {
            }
        }

        try {
            IDN.toASCII(null);
            throw new RuntimeException("Accepted null in one-argument overload");
        } catch (NullPointerException expected) {
        }

        // Preserve STD3 checks before the length check, and conversion of
        // earlier labels before any failure in a later label.
        int strict = IDN.USE_STD3_ASCII_RULES;
        fails(longest + "_", strict, "Contains non-LDH ASCII characters");
        fails(longest + "-", strict, "Has leading or trailing hyphen");
        fails("_.\ud800", strict, "Contains non-LDH ASCII characters");
        fails("-." + longest + "a", strict, "Has leading or trailing hyphen");

        // Every ASCII character, including punctuation and controls, both
        // alone and embedded between valid labels.
        for (int c = 0; c < 128; c++) {
            String s = Character.toString(c);
            boolean ldh = s.matches("[a-zA-Z0-9-]");
            for (int flag : FLAGS) {
                if ((flag & strict) == 0 || ldh || c == '.') {
                    if (c == '-' && (flag & strict) != 0) {
                        fails(s, flag, "Has leading or trailing hyphen");
                    } else {
                        check(s, s, flag);
                    }
                } else {
                    fails(s, flag, "Contains non-LDH ASCII characters");
                }
                if (c == '.') {
                    fails("a." + s + ".b", flag, "Empty label is not a legal name");
                } else if ((flag & strict) == 0 || (ldh && c != '-')) {
                    check("a." + s + ".b", "a." + s + ".b", flag);
                } else {
                    fails("a." + s + ".b", flag, ldh
                            ? "Has leading or trailing hyphen"
                            : "Contains non-LDH ASCII characters");
                }
            }
        }
    }

    private static void check(String input, String expected, int flag) {
        String actual = IDN.toASCII(input, flag);
        if (!expected.equals(actual)) {
            throw new RuntimeException("flag=" + flag + ": expected " + expected
                    + ", got " + actual);
        }
        if (flag == 0 && !expected.equals(IDN.toASCII(input))) {
            throw new RuntimeException("Different one-argument result");
        }
    }

    private static void fails(String input, int flag, String message) {
        fails(input, flag, message, false);
        if (flag == 0) {
            fails(input, flag, message, true);
        }
    }

    private static void fails(String input, int flag, String message,
                              boolean convenience) {
        try {
            if (convenience) {
                IDN.toASCII(input);
            } else {
                IDN.toASCII(input, flag);
            }
            throw new RuntimeException("Accepted invalid input with flag=" + flag);
        } catch (IllegalArgumentException expected) {
            if (message != null && !message.equals(expected.getMessage())) {
                throw new RuntimeException("flag=" + flag + ": expected " + message
                        + ", got " + expected.getMessage(), expected);
            }
        }
    }
}
