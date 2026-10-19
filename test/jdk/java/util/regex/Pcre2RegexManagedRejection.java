/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 */
/*
 * @test
 * @summary Proved prefix rejection and asserted-digit positives retain API state
 * @modules java.base/java.util.regex:open java.base/jdk.internal.util.regex:+open
 * @run main/othervm Pcre2RegexManagedRejection
 * @run main/othervm -Xint Pcre2RegexManagedRejection
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch Pcre2RegexManagedRejection
 * @run main/othervm -XX:-TieredCompilation -Xbatch Pcre2RegexManagedRejection
 * @run main/othervm -XX:-UsePcre2RegexIntrinsics Pcre2RegexManagedRejection
 * @run main/othervm -XX:-CompactStrings Pcre2RegexManagedRejection
 */
import java.lang.reflect.*;
import java.util.*;
import java.util.regex.*;
import jdk.internal.util.regex.Pcre2Regex;

public class Pcre2RegexManagedRejection {
    static Constructor<Pattern> parser;
    static void equal(Matcher a,Matcher b,boolean av,boolean bv,boolean flags) {
        if(av!=bv)throw new AssertionError("result "+a);
        if(av)for(int g=0;g<=a.groupCount();g++)if(a.start(g)!=b.start(g)||a.end(g)!=b.end(g)||!Objects.equals(a.group(g),b.group(g)))throw new AssertionError("capture "+a);
        if(flags&&(a.hitEnd()!=b.hitEnd()||a.requireEnd()!=b.requireEnd()))throw new AssertionError("flags "+a);
    }
    public static void main(String[] args)throws Exception {
        parser=Pattern.class.getDeclaredConstructor(String.class,int.class,boolean.class);parser.setAccessible(true);
        Field backend=Pattern.class.getDeclaredField("pcre2Regex");backend.setAccessible(true);
        for(String regex:new String[]{"(?<word>error)(?<digits>[0-9]+)","error[0-9]+","[0-9]+","(?=error)(error)([0-9]+)","(?=error)error[0-9]+"}) {
            Pattern p=Pattern.compile(regex),ref=parser.newInstance(regex,0,false);
            for(String input:new String[]{"!".repeat(4096),"\u0100".repeat(4096),"error123"+"!".repeat(4088),"!".repeat(4088)+"error123",
                    "errorx".repeat(682),"errorx".repeat(680)+"error1error2","error1error2","error","err","error123", "1".repeat(4096)})
                for(int lo:new int[]{0,Math.min(1,input.length()),input.length()/2})for(int hi:new int[]{input.length(),Math.max(lo,input.length()-1)})
                    for(boolean transparent:new boolean[]{false,true})for(boolean anchoring:new boolean[]{false,true}) {
                        Matcher a=p.matcher(input).region(lo,hi).useTransparentBounds(transparent).useAnchoringBounds(anchoring);
                        Matcher b=ref.matcher(input).region(lo,hi).useTransparentBounds(transparent).useAnchoringBounds(anchoring);
                        equal(a,b,a.matches(),b.matches(),false);
                        equal(a,b,a.find(),b.find(),true);
                        equal(a,b,a.reset().region(lo,hi).lookingAt(),b.reset().region(lo,hi).lookingAt(),false);
                        equal(a,b,a.find(),b.find(),true);
                        a=p.matcher(input).region(lo,hi);b=ref.matcher(input).region(lo,hi);
                        for(int i=0;i<10000;i++){boolean av=a.find(),bv=b.find();equal(a,b,av,bv,false);if(!av)break;}
                        if(a.hitEnd()!=b.hitEnd()||a.requireEnd()!=b.requireEnd())throw new AssertionError("final flags");
                    }
        }
        // Fresh unique preparations prove absence avoids native preparation
        // and entry, independently of native caches left by earlier fixtures.
        for(String regex:new String[]{"(?<absent>ready)([0-9]+)","(?=absent)(absent)([0-9]+)"}) {
            Pattern p=Pattern.compile(regex);Pcre2Regex engine=(Pcre2Regex)backend.get(p);
            Matcher m=p.matcher("!".repeat(65536));for(int i=0;i<1000;i++)if(m.reset().find())throw new AssertionError("absent");
            for(long count:engine.nativeRouteStats())if(count!=0)throw new AssertionError("managed absence entered native");
            Field handle=Pcre2Regex.class.getDeclaredField("handle");handle.setAccessible(true);
            Field wide=Pcre2Regex.class.getDeclaredField("handle16");wide.setAccessible(true);
            if(handle.getLong(engine)!=0||wide.getLong(engine)!=0)throw new AssertionError("managed absence prepared native");
        }
    }
}
