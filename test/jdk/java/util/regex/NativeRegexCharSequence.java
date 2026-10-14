/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file).
 */
/*
 * @test
 * @summary Native regex preserves caller-controlled CharSequence access limits
 * @run main/othervm -Xint NativeRegexCharSequence
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch NativeRegexCharSequence
 * @run main/othervm -XX:-TieredCompilation -Xbatch NativeRegexCharSequence
 */
import java.util.regex.Pattern;

public class NativeRegexCharSequence {
    private static class AccessLimit extends RuntimeException { }
    public static void main(String[] args) {
        String value = "error" + "3".repeat(4091);
        CharSequence guarded = new CharSequence() {
            public int length() { return value.length(); }
            public char charAt(int i) { throw new AccessLimit(); }
            public CharSequence subSequence(int a, int b) { return value.subSequence(a, b); }
            public String toString() { return value; }
        };
        for (String regex : new String[]{"error([0-9]+)", "(?<level>error|warning|fatal)([0-9]+)", "[^x]+"}) {
            try {
                Pattern.compile(regex).matcher(guarded).find();
                throw new AssertionError("caller access limit bypassed for " + regex);
            } catch (AccessLimit expected) { }
        }
        System.out.println("Caller CharSequence limits preserved");
    }
}
