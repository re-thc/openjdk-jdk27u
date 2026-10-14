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
 * @summary Differential PCRE2 syntax, UTF-16 and failed-operation continuation
 * @modules java.base/java.util.regex:open java.base/jdk.internal.util.regex
 * @run main/othervm -Xint Pcre2RegexCompatibility
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch Pcre2RegexCompatibility
 * @run main/othervm -XX:-TieredCompilation -Xbatch Pcre2RegexCompatibility
 * @run main/othervm -XX:-UsePcre2RegexIntrinsics Pcre2RegexCompatibility
 * @run main/othervm -XX:-UsePcre2RegexJIT Pcre2RegexCompatibility
 * @run main/othervm -XX:Pcre2RegexJITThreshold=1 Pcre2RegexCompatibility
 * @run main/othervm -XX:-CompactStrings Pcre2RegexCompatibility
 * @run main/othervm -XX:-UsePcre2Regex Pcre2RegexCompatibility
 */
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.Objects;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.internal.util.regex.Pcre2Regex;

public class Pcre2RegexCompatibility {
    static Constructor<Pattern> javaParser;
    static long observations;
    static Pattern original(String regex, int flags) throws Exception {
        return javaParser.newInstance(regex, flags, false);
    }
    static void equal(Matcher a, Matcher b, boolean x, boolean y, boolean flags) {
        observations++;
        if (x != y || a.groupCount() != b.groupCount()) fail(a, "result");
        if (x) for (int g = 0; g <= a.groupCount(); g++) {
            if (a.start(g) != b.start(g) || a.end(g) != b.end(g) || !Objects.equals(a.group(g), b.group(g))) fail(a, "capture " + g);
        }
        if (flags && (a.hitEnd() != b.hitEnd() || a.requireEnd() != b.requireEnd())) fail(a, "end flags");
    }
    static void fail(Matcher a, String kind) { throw new AssertionError(kind + " / " + a.pattern() + " / " + a); }
    static void sequence(String regex, int flags, String text, int lo, int hi,
                         boolean transparent, boolean anchoring, boolean observe) throws Exception {
        Pattern selected = Pattern.compile(regex, flags), ref = original(regex, flags);
        Matcher a = selected.matcher(text).region(lo, hi).useTransparentBounds(transparent).useAnchoringBounds(anchoring);
        Matcher b = ref.matcher(text).region(lo, hi).useTransparentBounds(transparent).useAnchoringBounds(anchoring);
        equal(a, b, a.matches(), b.matches(), observe);
        // Observe immediate continuation both with and without intervening end flags.
        equal(a, b, a.find(), b.find(), observe);
        equal(a, b, a.find(), b.find(), true);
        a.reset().region(lo, hi); b.reset().region(lo, hi);
        equal(a, b, a.lookingAt(), b.lookingAt(), observe);
        equal(a, b, a.find(), b.find(), observe);
        a.reset().region(lo, hi); b.reset().region(lo, hi);
        for (int i = 0; i <= text.length() + 1; i++) {
            boolean x = a.find(), y = b.find(); equal(a,b,x,y,observe); if (!x) break;
        }
        equal(a,b,a.find(lo),b.find(lo),true);
        a.reset(); b.reset();
        if (!a.replaceAll("<$0>").equals(b.replaceAll("<$0>"))) fail(a,"replacement");
        a.usePattern(Pattern.compile("(?<word>a+)")).reset(text);
        b.usePattern(original("(?<word>a+)",0)).reset(text);
        equal(a,b,a.find(),b.find(),true);
        if (a.hasMatch() && !Objects.equals(a.group("word"), b.group("word"))) fail(a,"named capture");
    }
    public static void main(String[] ignored) throws Exception {
        javaParser = Pattern.class.getDeclaredConstructor(String.class, int.class, boolean.class);
        javaParser.setAccessible(true);
        Field backend = Pattern.class.getDeclaredField("pcre2Regex"); backend.setAccessible(true);
        String[] qualified = {"(?=error)(error)([0-9]+)", "(?!warn)(error|fatal)[0-9]+", "a+(?=a)",
                "(a)\\1", "(?<x>a)\\k<x>", "a++a", "(?>a|aa)a", "(?=e)e(?=B)"};
        for (String regex : qualified) if (Pcre2Regex.ENABLED && backend.get(Pattern.compile(regex)) == null)
            throw new AssertionError("qualified pattern routed away: " + regex);
        String[] expressions = {"(?=error)error[0-9]+", "(?=error)(error)([0-9]+)", "a+(?=a)", "(?!b)a+",
                "(?=(a+))(a+)", "(?=e)e(?=B)", "(a)\\1", "(?<x>a)\\k<x>", "a++a", "a?+a", "(?>a|aa)a",
                "(a)?b", "(a|ab)+", "a.*?b", "[^x]+x", "^a+$", "\\ba+\\b", "(?i:a+)", "(?i)a+",
                "(?=(a))b|a", "(?>(a))b|a", "(a)++b|a", "(?<=a{1,2})b", "\\p{L}+", "(?<a>\\p{L}+)", "(a(b)?)+", "[a-z&&[^b]]+"};
        String[] inputs = {"", "a", "aa", "aab", "ababa", "b", "error1error2", "error123x", "oeB", "warn1error2",
                "\u00ffa\u0100x", "a\u2028b", "a\ud83d\ude00b", "a\ud800b", "a\udc00b", "a\r\nb"};
        for (String regex : expressions) for (String text : inputs) for (int flags : new int[]{0,Pattern.CASE_INSENSITIVE,Pattern.MULTILINE,Pattern.UNICODE_CHARACTER_CLASS})
            for (boolean bounds : new boolean[]{false,true}) for (boolean observe : new boolean[]{false,true}) {
                sequence(regex,flags,text,0,text.length(),bounds,!bounds,observe);
                if (text.length()>1) sequence(regex,flags,text,1,text.length()-1,bounds,!bounds,observe);
            }
        Random random = new Random(0x5043524532L);
        String[] atoms={"a","b","[ab]","[^x]","\\d","(?:a|ab)","(?=a)a","(?!b)a","(a)","a++"};
        for(int seed=0;seed<1000;seed++) {
            String regex=atoms[random.nextInt(atoms.length)]+atoms[random.nextInt(atoms.length)];
            StringBuilder text=new StringBuilder();int size=random.nextInt(24);
            for(int i=0;i<size;i++)text.append("abx19\u00ff\u0100".charAt(random.nextInt(7)));
            sequence(regex,0,text.toString(),0,size,false,true,(seed&1)==0);
        }
        String longText="error"+"3".repeat(4091);
        for(int i=0;i<100;i++) sequence("(?=error)(error)([0-9]+)",0,longText,0,4096,false,true,(i&1)==0);
        CharSequence guarded = new CharSequence() {
            final String value = "error" + "3".repeat(1024);
            public int length() { return value.length(); }
            public char charAt(int i) { return value.charAt(i); }
            public CharSequence subSequence(int a, int b) { return value.subSequence(a, b); }
            public String toString() { throw new AssertionError("caller access guard bypassed"); }
        };
        Pattern guardedPattern = Pattern.compile("(?=error)(error)([0-9]+)");
        Matcher selected = guardedPattern.matcher(guarded);
        Matcher reference = original(guardedPattern.pattern(), 0).matcher(guarded);
        equal(selected, reference, selected.find(), reference.find(), true);
        System.out.println("PCRE2 differential observations="+observations);
    }
}
