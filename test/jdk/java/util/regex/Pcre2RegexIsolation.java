/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 */
/*
 * @test
 * @summary Replay and transient exclusions preserve shared Pattern eligibility
 * @modules java.base/java.util.regex:open java.base/jdk.internal.util.regex
 * @run main/othervm Pcre2RegexIsolation
 * @run main/othervm -Xint Pcre2RegexIsolation
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch Pcre2RegexIsolation
 * @run main/othervm -XX:-TieredCompilation -Xbatch Pcre2RegexIsolation
 * @run main/othervm -XX:-UsePcre2RegexIntrinsics Pcre2RegexIsolation
 * @run main/othervm -XX:-CompactStrings Pcre2RegexIsolation
 */
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Pcre2RegexIsolation {
    static Field backend;
    static Constructor<Pattern> parser;
    static void equal(Matcher a, Matcher b, boolean av, boolean bv) {
        if (av != bv) throw new AssertionError("result " + a);
        if (av) for (int g=0; g<=a.groupCount(); g++)
            if (a.start(g)!=b.start(g) || a.end(g)!=b.end(g) || !Objects.equals(a.group(g),b.group(g)))
                throw new AssertionError("capture " + a);
        if (a.hitEnd()!=b.hitEnd() || a.requireEnd()!=b.requireEnd()) throw new AssertionError("flags " + a);
    }
    public static void main(String[] args) throws Exception {
        backend=Pattern.class.getDeclaredField("pcre2Regex"); backend.setAccessible(true);
        parser=Pattern.class.getDeclaredConstructor(String.class,int.class,boolean.class); parser.setAccessible(true);
        for (String expression : new String[]{"(?=error)(error)([0-9]+)","a+(?=a)","(?=e)e(?=B)","(a)?b"}) {
            Pattern p=Pattern.compile(expression), ref=parser.newInstance(expression,0,false);
            Object owner=backend.get(p);
            if (owner==null) throw new AssertionError("missing backend");
            Matcher peer=p.matcher("error"+"3".repeat(4091));
            for (CharSequence input : new CharSequence[]{"error1error2","aa","oeB","error\ud8001",new StringBuilder("error123")}) {
                Matcher a=p.matcher(input), b=ref.matcher(input);
                equal(a,b,a.matches(),b.matches());
                equal(a,b,a.find(),b.find());
                equal(a,b,a.reset().lookingAt(),b.reset().lookingAt());
                equal(a,b,a.find(),b.find());
                if (backend.get(p)!=owner) throw new AssertionError("observer/input disabled peer");
                boolean hit=peer.reset().find();
                Matcher r=ref.matcher("error"+"3".repeat(4091));
                if (hit!=r.find()) throw new AssertionError("peer result");
            }
        }
        // A failed lookahead updates Java continuation even without observers.
        Pattern p=Pattern.compile("(?=error)error[0-9]+"), ref=parser.newInstance(p.pattern(),0,false);
        Matcher a=p.matcher("error1error2"), b=ref.matcher("error1error2");
        if (a.matches()!=b.matches() || a.find()!=b.find() || a.start()!=6 || a.start()!=b.start())
            throw new AssertionError("failed anchored continuation");
        if (backend.get(p)==null) throw new AssertionError("failed anchor disabled Pattern");
    }
}
