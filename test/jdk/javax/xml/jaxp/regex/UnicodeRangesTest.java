/*
 * Copyright (c) 2015, 2018, Oracle and/or its affiliates. All rights reserved.
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 */
/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.sun.org.apache.xerces.internal.impl.xpath.regex;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.Set;
import static com.sun.org.apache.xerces.internal.impl.xpath.regex.Token.*;

/*
 * @test
 * @summary Compare every generated XML regex category, block, alias and complement
 *          with the original target-runtime computation
 * @modules java.xml/com.sun.org.apache.xerces.internal.impl.xpath.regex
 * @compile --patch-module java.xml=${test.src} UnicodeRangesTest.java
 * @run main/othervm --patch-module java.xml=${test.classes} com.sun.org.apache.xerces.internal.impl.xpath.regex.UnicodeRangesTest
 */
public class UnicodeRangesTest {
    private static final String[] categoryNames = field("categoryNames");
    private static final String[] blockNames = field("blockNames");
    private static final String blockRanges = field("blockRanges");
    private static final int[] nonBMPBlockRanges = field("nonBMPBlockRanges");
    private static final Set<String> nonxs = new HashSet<>();

    public static void main(String[] args) throws Exception {
        // Literal and range patterns must not initialize the category maps.
        if (!new RegularExpression("[a-z]+", "X").matches("literal")) {
            throw new AssertionError("Literal control failed");
        }
        if (field("categories") != null || field("categories2") != null) {
            throw new AssertionError("Literal control initialized categories");
        }
        Token.getRange("Cn", true);
        Map<String, Token> positive = field("categories");
        Map<String, Token> negative = field("categories2");
        Map<String, Token>[] expected = originalRanges();
        compare(positive, expected[0]);
        compare(negative, expected[1]);
        IdentityHashMap<Token, Token> tokens = new IdentityHashMap<>();
        IdentityHashMap<int[], int[]> arrays = new IdentityHashMap<>();
        identities(positive, expected[0], tokens, arrays);
        identities(negative, expected[1], tokens, arrays);
        if (new HashSet<>(tokens.values()).size() != tokens.size()
                || new HashSet<>(arrays.values()).size() != arrays.size()) {
            throw new AssertionError("Distinct expected ranges were aliased");
        }
        long payload = arrays.values().stream().mapToLong(a -> 4L * a.length).sum();
        System.out.println(arrays.size() + " retained arrays, " + payload + " payload bytes");
        if (!Token.nonxs.equals(nonxs)) {
            throw new AssertionError("Non-XML-Schema aliases differ");
        }
        // Check ownership too: each invocation must return fresh mutable arrays.
        RangeToken[] first = UnicodeRanges.create();
        RangeToken[] second = UnicodeRanges.create();
        for (int i = 0; i < first.length; i++) {
            if (!Arrays.equals(first[i].ranges, second[i].ranges)
                    || first[i] == second[i]
                    || first[i].ranges != null && first[i].ranges == second[i].ranges) {
                throw new AssertionError("Factory shares mutable data: " + i);
            }
        }
        System.out.println("Compared " + (positive.size() + negative.size()) + " named ranges");
    }

    private static void identities(Map<String, Token> actual, Map<String, Token> expected,
                                   IdentityHashMap<Token, Token> tokens,
                                   IdentityHashMap<int[], int[]> arrays) {
        for (String name : expected.keySet()) {
            RangeToken a = (RangeToken) actual.get(name);
            RangeToken e = (RangeToken) expected.get(name);
            if (tokens.putIfAbsent(e, a) != null && tokens.get(e) != a) {
                throw new AssertionError("Alias identity differs: " + name);
            }
            if (e.ranges != null && arrays.putIfAbsent(e.ranges, a.ranges) != null
                    && arrays.get(e.ranges) != a.ranges) {
                throw new AssertionError("Array identity differs: " + name);
            }
        }
    }

    private static void compare(Map<String, Token> actual, Map<String, Token> expected) {
        if (!actual.keySet().equals(expected.keySet())) {
            throw new AssertionError("Category names differ");
        }
        for (String name : expected.keySet()) {
            RangeToken a = (RangeToken) actual.get(name);
            RangeToken e = (RangeToken) expected.get(name);
            if (!Arrays.equals(a.ranges, e.ranges) || a.type != e.type
                    || a.sorted != e.sorted || a.compacted != e.compacted) {
                throw new AssertionError("Category differs: " + name
                        + "\nactual=" + Arrays.toString(a.ranges)
                        + "\nexpected=" + Arrays.toString(e.ranges));
            }
        }
    }

    @SuppressWarnings("unchecked")
    private static <T> T field(String name) {
        try {
            Field f = Token.class.getDeclaredField(name);
            f.setAccessible(true);
            return (T) f.get(null);
        } catch (ReflectiveOperationException e) {
            throw new AssertionError(e);
        }
    }

    private static void setAlias(Map<String, Token> positive, Map<String, Token> negative,
                                 String alias, String name, boolean same) {
        positive.put(alias, (same ? positive : negative).get(name));
        negative.put(alias, (same ? negative : positive).get(name));
    }

    // Deliberately retain the old runtime algorithm as an independent oracle.
    // In particular, do not replace its BMP loop with generated endpoints or
    // extend it to classify supplementary characters with Character.getType.
    @SuppressWarnings("unchecked")
    private static Map<String, Token>[] originalRanges() {
        Map<String, Token> tmpCat = new HashMap<>();
        Map<String, Token> tmpCat2 = new HashMap<>();
        Token[] ranges = new Token[categoryNames.length];
        for (int i = 0;  i < ranges.length;  i ++) {
            ranges[i] = Token.createRange();
        }
        int type;
        for (int i = 0;  i < 0x10000;  i ++) {
            type = Character.getType((char)i);
            if (type == Character.START_PUNCTUATION ||
                type == Character.END_PUNCTUATION) {
                //build table of Pi values
                if (i == 0x00AB || i == 0x2018 || i == 0x201B || i == 0x201C ||
                    i == 0x201F || i == 0x2039) {
                    type = CHAR_INIT_QUOTE;
                }
                //build table of Pf values
                if (i == 0x00BB || i == 0x2019 || i == 0x201D || i == 0x203A ) {
                    type = CHAR_FINAL_QUOTE;
                }
            }
            ranges[type].addRange(i, i);
            switch (type) {
              case Character.UPPERCASE_LETTER:
              case Character.LOWERCASE_LETTER:
              case Character.TITLECASE_LETTER:
              case Character.MODIFIER_LETTER:
              case Character.OTHER_LETTER:
                type = CHAR_LETTER;
                break;
              case Character.NON_SPACING_MARK:
              case Character.COMBINING_SPACING_MARK:
              case Character.ENCLOSING_MARK:
                type = CHAR_MARK;
                break;
              case Character.DECIMAL_DIGIT_NUMBER:
              case Character.LETTER_NUMBER:
              case Character.OTHER_NUMBER:
                type = CHAR_NUMBER;
                break;
              case Character.SPACE_SEPARATOR:
              case Character.LINE_SEPARATOR:
              case Character.PARAGRAPH_SEPARATOR:
                type = CHAR_SEPARATOR;
                break;
              case Character.CONTROL:
              case Character.FORMAT:
              case Character.SURROGATE:
              case Character.PRIVATE_USE:
              case Character.UNASSIGNED:
                type = CHAR_OTHER;
                break;
              case Character.CONNECTOR_PUNCTUATION:
              case Character.DASH_PUNCTUATION:
              case Character.START_PUNCTUATION:
              case Character.END_PUNCTUATION:
              case CHAR_INIT_QUOTE:
              case CHAR_FINAL_QUOTE:
              case Character.OTHER_PUNCTUATION:
                type = CHAR_PUNCTUATION;
                break;
              case Character.MATH_SYMBOL:
              case Character.CURRENCY_SYMBOL:
              case Character.MODIFIER_SYMBOL:
              case Character.OTHER_SYMBOL:
                type = CHAR_SYMBOL;
                break;
              default:
                throw new RuntimeException("org.apache.xerces.utils.regex.Token#getRange(): Unknown Unicode category: "+type);
            }
            ranges[type].addRange(i, i);
        } // for all characters
        ranges[Character.UNASSIGNED].addRange(0x10000, Token.UTF16_MAX);

        for (int i = 0;  i < ranges.length;  i ++) {
            if (categoryNames[i] != null) {
                if (i == Character.UNASSIGNED) { // Unassigned
                    ranges[i].addRange(0x10000, Token.UTF16_MAX);
                }
                tmpCat.put(categoryNames[i], ranges[i]);
                tmpCat2.put(categoryNames[i],
                                      Token.complementRanges(ranges[i]));
            }
        }
        //REVISIT: do we really need to support block names as in Unicode 3.1
        //         or we can just create all the names in IsBLOCKNAME format (XML Schema REC)?
        //
        StringBuilder buffer = new StringBuilder(50);
        for (int i = 0;  i < blockNames.length;  i ++) {
            Token r1 = Token.createRange();
            int location;
            if (i < 84) {
                location = i*2;
                int rstart = blockRanges.charAt(location);
                int rend = blockRanges.charAt(location+1);
                //DEBUGING
                //System.out.println(n+" " +Integer.toHexString(rstart)
                //                     +"-"+ Integer.toHexString(rend));
                r1.addRange(rstart, rend);
            } else {
                location = (i - 84) * 2;
                r1.addRange(nonBMPBlockRanges[location],
                            nonBMPBlockRanges[location + 1]);
            }
            String n = blockNames[i];
            if (n.equals("Specials"))
                r1.addRange(0xfff0, 0xfffd);
            if (n.equals("Private Use")) {
                r1.addRange(0xF0000,0xFFFFD);
                r1.addRange(0x100000,0x10FFFD);
            }
            tmpCat.put(n, r1);
            tmpCat2.put(n, Token.complementRanges(r1));
            buffer.setLength(0);
            buffer.append("Is");
            if (n.indexOf(' ') >= 0) {
                for (int ci = 0;  ci < n.length();  ci ++)
                    if (n.charAt(ci) != ' ')  buffer.append(n.charAt(ci));
            }
            else {
                buffer.append(n);
            }
            setAlias(tmpCat, tmpCat2, buffer.toString(), n, true);
        }

        // TR#18 1.2
        setAlias(tmpCat, tmpCat2, "ASSIGNED", "Cn", false);
        setAlias(tmpCat, tmpCat2, "UNASSIGNED", "Cn", true);
        Token all = Token.createRange();
        all.addRange(0, Token.UTF16_MAX);
        tmpCat.put("ALL", all);
        tmpCat2.put("ALL", Token.complementRanges(all));
        nonxs.add("ASSIGNED");
        nonxs.add("UNASSIGNED");
        nonxs.add("ALL");

        Token isalpha = Token.createRange();
        isalpha.mergeRanges(ranges[Character.UPPERCASE_LETTER]); // Lu
        isalpha.mergeRanges(ranges[Character.LOWERCASE_LETTER]); // Ll
        isalpha.mergeRanges(ranges[Character.OTHER_LETTER]); // Lo
        tmpCat.put("IsAlpha", isalpha);
        tmpCat2.put("IsAlpha", Token.complementRanges(isalpha));
        nonxs.add("IsAlpha");

        Token isalnum = Token.createRange();
        isalnum.mergeRanges(isalpha);   // Lu Ll Lo
        isalnum.mergeRanges(ranges[Character.DECIMAL_DIGIT_NUMBER]); // Nd
        tmpCat.put("IsAlnum", isalnum);
        tmpCat2.put("IsAlnum", Token.complementRanges(isalnum));
        nonxs.add("IsAlnum");

        Token isspace = Token.createRange();
        isspace.mergeRanges(Token.token_spaces);
        isspace.mergeRanges(ranges[CHAR_SEPARATOR]); // Z
        tmpCat.put("IsSpace", isspace);
        tmpCat2.put("IsSpace", Token.complementRanges(isspace));
        nonxs.add("IsSpace");

        Token isword = Token.createRange();
        isword.mergeRanges(isalnum);     // Lu Ll Lo Nd
        isword.addRange('_', '_');
        tmpCat.put("IsWord", isword);
        tmpCat2.put("IsWord", Token.complementRanges(isword));
        nonxs.add("IsWord");

        Token isascii = Token.createRange();
        isascii.addRange(0, 127);
        tmpCat.put("IsASCII", isascii);
        tmpCat2.put("IsASCII", Token.complementRanges(isascii));
        nonxs.add("IsASCII");

        Token isnotgraph = Token.createRange();
        isnotgraph.mergeRanges(ranges[CHAR_OTHER]);
        isnotgraph.addRange(' ', ' ');
        tmpCat.put("IsGraph", Token.complementRanges(isnotgraph));
        tmpCat2.put("IsGraph", isnotgraph);
        nonxs.add("IsGraph");

        Token isxdigit = Token.createRange();
        isxdigit.addRange('0', '9');
        isxdigit.addRange('A', 'F');
        isxdigit.addRange('a', 'f');
        tmpCat.put("IsXDigit", Token.complementRanges(isxdigit));
        tmpCat2.put("IsXDigit", isxdigit);
        nonxs.add("IsXDigit");

        setAlias(tmpCat, tmpCat2, "IsDigit", "Nd", true);
        setAlias(tmpCat, tmpCat2, "IsUpper", "Lu", true);
        setAlias(tmpCat, tmpCat2, "IsLower", "Ll", true);
        setAlias(tmpCat, tmpCat2, "IsCntrl", "C", true);
        setAlias(tmpCat, tmpCat2, "IsPrint", "C", false);
        setAlias(tmpCat, tmpCat2, "IsPunct", "P", true);
        nonxs.add("IsDigit");
        nonxs.add("IsUpper");
        nonxs.add("IsLower");
        nonxs.add("IsCntrl");
        nonxs.add("IsPrint");
        nonxs.add("IsPunct");

        setAlias(tmpCat, tmpCat2, "alpha", "IsAlpha", true);
        setAlias(tmpCat, tmpCat2, "alnum", "IsAlnum", true);
        setAlias(tmpCat, tmpCat2, "ascii", "IsASCII", true);
        setAlias(tmpCat, tmpCat2, "cntrl", "IsCntrl", true);
        setAlias(tmpCat, tmpCat2, "digit", "IsDigit", true);
        setAlias(tmpCat, tmpCat2, "graph", "IsGraph", true);
        setAlias(tmpCat, tmpCat2, "lower", "IsLower", true);
        setAlias(tmpCat, tmpCat2, "print", "IsPrint", true);
        setAlias(tmpCat, tmpCat2, "punct", "IsPunct", true);
        setAlias(tmpCat, tmpCat2, "space", "IsSpace", true);
        setAlias(tmpCat, tmpCat2, "upper", "IsUpper", true);
        setAlias(tmpCat, tmpCat2, "word", "IsWord", true); // Perl extension
        setAlias(tmpCat, tmpCat2, "xdigit", "IsXDigit", true);
        nonxs.add("alpha");
        nonxs.add("alnum");
        nonxs.add("ascii");
        nonxs.add("cntrl");
        nonxs.add("digit");
        nonxs.add("graph");
        nonxs.add("lower");
        nonxs.add("print");
        nonxs.add("punct");
        nonxs.add("space");
        nonxs.add("upper");
        nonxs.add("word");
        nonxs.add("xdigit");
        return new Map[] {tmpCat, tmpCat2};
    }
}
