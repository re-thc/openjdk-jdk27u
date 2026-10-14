/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 */
/*
 * @test
 * @summary UTF-16 qualification copies only the immutable String region
 * @modules java.base/java.util.regex:open java.base/jdk.internal.util.regex
 * @run main/othervm Pcre2RegexUTF16
 * @run main/othervm -Xint Pcre2RegexUTF16
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch Pcre2RegexUTF16
 * @run main/othervm -XX:-TieredCompilation -Xbatch Pcre2RegexUTF16
 * @run main/othervm -XX:-UsePcre2RegexIntrinsics Pcre2RegexUTF16
 * @run main/othervm -XX:-CompactStrings Pcre2RegexUTF16
 */
import java.lang.management.ManagementFactory;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import com.sun.management.ThreadMXBean;

public class Pcre2RegexUTF16 {
    static void equal(Matcher a, Matcher b) {
        boolean av=a.find(), bv=b.find();
        if (av!=bv) throw new AssertionError("result");
        if (av) for (int g=0; g<=a.groupCount(); g++)
            if (a.start(g)!=b.start(g) || a.end(g)!=b.end(g) || !Objects.equals(a.group(g),b.group(g)))
                throw new AssertionError("capture");
        if (a.hitEnd()!=b.hitEnd() || a.requireEnd()!=b.requireEnd()) throw new AssertionError("end flags");
    }
    public static void main(String[] args) throws Exception {
        Constructor<Pattern> parser=Pattern.class.getDeclaredConstructor(String.class,int.class,boolean.class);
        parser.setAccessible(true);
        Field backend=Pattern.class.getDeclaredField("pcre2Regex"); backend.setAccessible(true);
        Pattern p=Pattern.compile("([^x]+)(x+)"), ref=parser.newInstance(p.pattern(),0,false);
        Object owner=backend.get(p);
        Field qualification=Matcher.class.getDeclaredField("nativeQualifiedInput"); qualification.setAccessible(true);
        String qualified="\u0100".repeat(511)+"x\ud800";
        Matcher reused=p.matcher(qualified).region(0,512);
        if (!reused.find() || qualification.get(reused)!=qualified) throw new AssertionError("qualification missing");
        if (!reused.reset().region(1,512).find() || qualification.get(reused)!=qualified) throw new AssertionError("subset invalidated qualification");
        // Expanding into an excluded unit must requalify, without poisoning a
        // subsequent return to the previously qualified opaque interval.
        Matcher r=ref.matcher(qualified);
        boolean av=reused.reset().find(), bv=r.find();
        if (av!=bv || av && reused.end()!=r.end()) throw new AssertionError("expanded region");
        if (!reused.reset().region(0,512).find()) throw new AssertionError("return to qualified region");
        String replacement=new String("\u0100".repeat(511)+"x");
        reused.reset(replacement);
        if (qualification.get(reused)!=null) throw new AssertionError("new reset retained old input");
        if (!reused.find() || qualification.get(reused)!=replacement) throw new AssertionError("new input qualification");
        reused.reset(replacement);
        if (qualification.get(reused)!=replacement) throw new AssertionError("same input reset discarded qualification");
        for (int i=0;i<4;i++) { System.gc(); if(!reused.reset().find() || reused.end(2)!=512)throw new AssertionError("GC cached input"); }
        for (String input : new String[]{"\u0100".repeat(4095)+"x","\u0100".repeat(4096),"\u0100\ud800x",
                "\u0100\udc00x","\u0100\ud83d\ude00x","\u0100\u2028x","\u0100\u2029x","latinxx"}) {
            Matcher a=p.matcher(input), b=ref.matcher(input);
            equal(a,b); a.reset(); b.reset(); equal(a,b);
            a.reset(input+"!"); b.reset(input+"!"); equal(a,b);
            if (backend.get(p)!=owner) throw new AssertionError("input exclusion demoted peers");
        }
        String large="\ud800"+"\u0100".repeat(500_000)+"x"+"\udc00";
        Matcher a=p.matcher(large), b=ref.matcher(large);
        for (int i=0; i<3; i++) {
            equal(a.reset().region(499_990,500_002),b.reset().region(499_990,500_002));
            System.gc();
        }
        // Measure capture offsets only; group text allocation is outside this
        // assertion. The native snapshot must not allocate a Java char array.
        Matcher warm=p.matcher("\u0100".repeat(4095)+"x");
        for (int i=0;i<3000;i++) if (!warm.reset().find()) throw new AssertionError("warm result");
        ThreadMXBean bean=(ThreadMXBean)ManagementFactory.getThreadMXBean();
        long before=bean.getCurrentThreadAllocatedBytes();
        for (int i=0;i<1000;i++) if (!warm.reset().find() || warm.end(2)!=4096) throw new AssertionError("reuse");
        long allocated=bean.getCurrentThreadAllocatedBytes()-before;
        if (allocated!=0) throw new AssertionError("intermediate Java allocation: "+allocated);
        System.out.println("UTF-16 native snapshot Java bytes="+allocated);
    }
}
