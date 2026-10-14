/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 */
/*
 * @test
 * @summary Actual JIT entry for find/lookingAt, per-width/mode recent admission
 * @modules java.base/java.util.regex:open java.base/jdk.internal.util.regex
 * @run main/othervm Pcre2RegexJit 32
 * @run main/othervm -Xint Pcre2RegexJit 32
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch Pcre2RegexJit 32
 * @run main/othervm -XX:-TieredCompilation -Xbatch Pcre2RegexJit 32
 * @run main/othervm -XX:-UsePcre2RegexIntrinsics Pcre2RegexJit 32
 * @run main/othervm -XX:Pcre2RegexJITThreshold=1 Pcre2RegexJit 1
 * @run main/othervm -XX:-UsePcre2RegexJIT Pcre2RegexJit 0
 * @run main/othervm -XX:-CompactStrings Pcre2RegexJit 32
 */
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.Objects;
import java.util.ArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.internal.util.regex.Pcre2Regex;

public class Pcre2RegexJit {
    static Field backend;
    static Constructor<Pattern> parser;
    static boolean apply(Matcher m,int mode) { return mode==0 ? m.find() : mode==1 ? m.lookingAt() : m.matches(); }
    static void same(Matcher a,Matcher b,int mode) {
        boolean av=apply(a,mode),bv=apply(b,mode);
        if (av!=bv) throw new AssertionError("result");
        if (av) for(int g=0;g<=a.groupCount();g++)
            if(a.start(g)!=b.start(g)||a.end(g)!=b.end(g)||!Objects.equals(a.group(g),b.group(g))) throw new AssertionError("capture");
    }
    public static void main(String[] args) throws Exception {
        int threshold=Integer.parseInt(args[0]);
        backend=Pattern.class.getDeclaredField("pcre2Regex"); backend.setAccessible(true);
        parser=Pattern.class.getDeclaredConstructor(String.class,int.class,boolean.class); parser.setAccessible(true);
        boolean compact=java.lang.management.ManagementFactory.getRuntimeMXBean().getInputArguments().stream().noneMatch(s->s.equals("-XX:-CompactStrings"));
        for(int width:new int[]{8,16}) for(int mode=0;mode<3;mode++) {
            String regex=width==8 ? "(?=error)(?<e"+mode+">error)([0-9]+)" : "(?<w"+mode+">[^x]+)(x+)";
            String body=width==8 ? "error"+"3".repeat(4091) : "\u0100".repeat(4095)+"x";
            Pattern p=Pattern.compile(regex),ref=parser.newInstance(regex,0,false);
            Pcre2Regex engine=(Pcre2Regex)backend.get(p);
            Matcher a=p.matcher("!!"+body+"?"),b=ref.matcher("!!"+body+"?");
            int offset=width==8&&compact ? 0:12;
            for(int call=0;call<(threshold==0?32:threshold);call++) same(a.reset().region(2,4098),b.reset().region(2,4098),mode);
            long[] before=engine.nativeRouteStats();
            if(before[offset+3+mode]!=0 || before[offset+6]+before[offset+7]!=0) throw new AssertionError("premature/unexecutable JIT");
            same(a.reset().region(2,4098),b.reset().region(2,4098),mode);
            long[] after=engine.nativeRouteStats();
            if(mode!=2 && threshold!=0 && (after[offset+3+mode]!=1 || after[offset+6+mode]!=1))
                throw new AssertionError("JIT did not enter width="+width+" mode="+mode+" "+java.util.Arrays.toString(after));
            if(mode==2 && (after[offset+5]!=0 || after[offset+6]+after[offset+7]!=0)) throw new AssertionError("matches prepared JIT");
            if(a.hitEnd()!=b.hitEnd() || a.requireEnd()!=b.requireEnd()) throw new AssertionError("flags");
            if(backend.get(p)!=engine) throw new AssertionError("observer demoted Pattern");
        }
        Pattern p=Pattern.compile("(?<phase>a+)(b+)"),ref=parser.newInstance(p.pattern(),0,false);
        Pcre2Regex engine=(Pcre2Regex)backend.get(p);
        String hit="a".repeat(4095)+"b",miss="A".repeat(4096);
        Matcher a=p.matcher(hit),b=ref.matcher(hit);
        int offset=compact?0:12;
        for(int round=0;round<32;round++) {
            same(a.reset(hit),b.reset(hit),0);
            for(int i=0;i<1024;i++) if(a.reset(miss).find()) throw new AssertionError("miss");
        }
        if(threshold!=1 && engine.nativeRouteStats()[offset+6]!=0) throw new AssertionError("stale hits admitted JIT");
        for(int i=0;i<100;i++) same(a.reset(hit),b.reset(hit),0);
        long entered=engine.nativeRouteStats()[offset+3];
        for(int i=0;i<200;i++) if(a.reset(miss).find()) throw new AssertionError("phase miss");
        if(engine.nativeRouteStats()[offset+3]-entered>17) throw new AssertionError("unbounded miss-heavy dispatch");
        if(threshold!=0 && entered==0) throw new AssertionError("hit phase did not recover");
        for(int i=0;i<100;i++) same(a.reset(hit),b.reset(hit),0);
        // Compile-time anchoring must retain the backtracked endpoint.
        p=Pattern.compile("a+(?=a)"); a=p.matcher("a".repeat(512));
        for(int i=0;i<100;i++) if(!a.reset().lookingAt() || a.end()!=511) throw new AssertionError("backtracked anchor");
        // More Matchers than native slots, sharing immutable code; resource
        // saturation must remain operation-local and preserve captures.
        Pattern shared=Pattern.compile("(?=error)(?<shared>error)([0-9]+)");
        Object owner=backend.get(shared); CountDownLatch go=new CountDownLatch(1);
        AtomicReference<Throwable> failure=new AtomicReference<>(); ArrayList<Thread> workers=new ArrayList<>();
        for(int n=0;n<32;n++) { Thread t=new Thread(()->{try{go.await(); Matcher m=shared.matcher("error"+"3".repeat(65531));
            for(int i=0;i<100;i++) if(!m.reset().find() || m.end(2)!=65536) throw new AssertionError("concurrent captures");
        }catch(Throwable ex){failure.compareAndSet(null,ex);}});workers.add(t);t.start(); }
        go.countDown();for(Thread t:workers)t.join();if(failure.get()!=null)throw new AssertionError(failure.get());
        if(backend.get(shared)!=owner)throw new AssertionError("resource exclusion demoted peers");
        System.out.println("JIT mode/width boundaries, phase shifts and 32-Matcher sharing passed");
    }
}
