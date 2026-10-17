/* Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0 */
import java.lang.management.*;
import java.nio.CharBuffer;
import java.time.*;
import java.time.format.*;
import java.util.*;

/** Proposed qualification fixture. Not executed when this source was prepared. */
public final class QualificationProbe {
    static volatile Object sink;
    static final String[] HAPPY = {
        "2026-10-16T12:34:56Z", "2000-02-29T01:02:03.123456Z",
        "1969-12-31T23:59:59.999999Z", "0000-02-29T12:34:56.000001Z",
        "9999-12-31T23:59:59.9Z", "1970-01-01T00:00:00.01Z",
        "1900-01-01T01:01:01.123Z", "2400-02-29T12:34:56.12345Z"
    };
    static final String[] FALLBACK = {
        "2000-01-01T00:00:00.1234567Z", "2000-01-01T00:00:00.12345678Z",
        "2000-01-01T00:00:00.123456789Z", "2000-01-01t00:00:00z",
        "2000-01-01T24:00:00Z", "2016-12-31T23:59:60.5Z",
        "2000-01-01T00:00:00+00:00", "2000-01-01T12:34:56-07:30",
        "+10000-01-01T00:00:00Z", "-0001-01-01T00:00:00Z",
        "2000-01-01T00:00:00+00:00:30", "2000-01-01T00:00:00.000000000Z"
    };
    static final String[] SYNTAX = {
        "2000-00-01T00:00:00Z", "2000-01-00T00:00:00Z",
        "2000-01-01T24:00:01Z", "2000-01-01T00:00:60Z",
        "2000-01-01T00:00:00,1Z", "2000-01-01 00:00:00Z",
        " 2000-01-01T00:00:00Z", "2000-01-01T00:00:00Z ", "", "garbage"
    };
    static final String[] CALENDAR = {"1900-02-29T00:00:00Z", "2000-04-31T00:00:00.1Z"};
    static CharSequence[] corpus(String name) {
        return switch(name) {
            case "happy" -> HAPPY;
            case "mostly" -> new String[] {HAPPY[0],HAPPY[1],HAPPY[2],HAPPY[3],HAPPY[4],HAPPY[5],HAPPY[6],FALLBACK[0]};
            case "mixed" -> new String[] {HAPPY[0],HAPPY[1],FALLBACK[0],CALENDAR[0],HAPPY[2],HAPPY[3],FALLBACK[6],CALENDAR[1]};
            case "fallback" -> FALLBACK;
            case "syntax" -> SYNTAX;
            case "calendar" -> CALENDAR;
            case "custom" -> new CharSequence[] {new StringBuilder(HAPPY[0]),CharBuffer.wrap(HAPPY[1]),
                new StringBuilder(HAPPY[2]),CharBuffer.wrap(HAPPY[3])};
            default -> throw new IllegalArgumentException(name);
        };
    }
    static Object outcome(CharSequence input, boolean original) {
        try {return original ? DateTimeFormatter.ISO_INSTANT.parse(input,Instant::from) : Instant.parse(input);}
        catch(DateTimeParseException e) {return List.of(e.getClass().getName(),e.getErrorIndex(),e.getParsedString(),e.getMessage());}
    }
    static long checksum(Object value) {
        return value instanceof Instant i ? i.getEpochSecond() ^ i.getNano() : (Integer)((List<?>)value).get(1);
    }
    static long loop(CharSequence[] values, int count) {
        long sum=0;
        for(int i=0;i<count;i++) {
            try {Instant v=Instant.parse(values[i%values.length]);sink=v;sum+=v.getEpochSecond() ^ v.getNano();}
            catch(DateTimeParseException e) {sink=e;sum+=e.getErrorIndex();}
        }
        return sum;
    }
    static long gcTime(List<GarbageCollectorMXBean> collectors) {
        long result=0;for(var gc:collectors)result+=gc.getCollectionTime();return result;
    }
    static void audit(boolean nativeRoute) throws Exception {
        java.lang.reflect.Method eligible=null,fast=null;
        if(nativeRoute) {
            var parser=Class.forName("java.time.InstantParser");
            eligible=parser.getDeclaredMethod("eligible",String.class);eligible.setAccessible(true);
            fast=parser.getDeclaredMethod("tryParse",String.class);fast.setAccessible(true);
        }
        String[] names={"happy","mostly","mixed","fallback","syntax","calendar","custom"};
        int[] attempts={8,7,6,0,0,2,0},hits={8,7,4,0,0,0,0};
        for(int n=0;n<names.length;n++) {
            String name=names[n];var values=corpus(name);long cycle=0;int a=0,h=0;
            for(CharSequence input:values) {
                Object expected=outcome(input,true),actual=outcome(input,false);
                if(!expected.equals(actual))throw new AssertionError(name+": "+input);
                boolean success=expected instanceof Instant;
                if((name.equals("happy")||name.equals("mostly")||name.equals("fallback")||name.equals("custom"))&&!success)
                    throw new AssertionError("Successful corpus contains failure: "+input);
                if((name.equals("syntax")||name.equals("calendar"))&&success)throw new AssertionError("Expected invalid input");
                if(nativeRoute&&input instanceof String s) {
                    if((boolean)eligible.invoke(null,s))a++;
                    if(fast.invoke(null,s)!=null)h++;
                }
                cycle+=checksum(expected);
            }
            // Independent oracle checksum for exactly 500000 calls, including a partial final cycle.
            long expected=cycle*(500000/values.length);
            for(int i=0;i<500000%values.length;i++)expected+=checksum(outcome(values[i],true));
            if(nativeRoute&&(a!=attempts[n]||h!=hits[n]))throw new AssertionError("Route distribution: "+name);
            System.out.println("oracle,"+name+","+expected+","+a+","+h);
        }
    }
    static void bench(String name, boolean diagnostic) {
        var values=corpus(name);
        var alloc=(com.sun.management.ThreadMXBean)ManagementFactory.getThreadMXBean();
        if(!alloc.isThreadAllocatedMemorySupported())throw new AssertionError("Allocation counter unavailable");
        alloc.setThreadAllocatedMemoryEnabled(true);
        var compiler=ManagementFactory.getCompilationMXBean();var collectors=ManagementFactory.getGarbageCollectorMXBeans();
        long thread=Thread.currentThread().threadId();
        long[] ns=new long[6],bytes=new long[6],before=new long[6],after=new long[6],gc=new long[6],sum=new long[6];
        for(int i=0;i<10000;i++)sink=alloc.getThreadAllocatedBytes(thread)+compiler.getTotalCompilationTime()+gcTime(collectors);
        // Multiple normal entries and loop exits are warmed; never warm until a result passes.
        for(int i=0;i<64;i++)loop(values,125000);
        for(int i=0;i<6;i++) {
            before[i]=compiler.getTotalCompilationTime();long g=gcTime(collectors),b=alloc.getThreadAllocatedBytes(thread);
            if(diagnostic)sum[i]=loop(values,500000);
            else {long start=System.nanoTime();sum[i]=loop(values,500000);ns[i]=System.nanoTime()-start;}
            bytes[i]=alloc.getThreadAllocatedBytes(thread)-b;gc[i]=gcTime(collectors)-g;after[i]=compiler.getTotalCompilationTime();
        }
        StringBuilder report=new StringBuilder();
        for(int i=0;i<6;i++)report.append("block,").append(i).append(',').append(ns[i]).append(',').append(bytes[i])
            .append(',').append(before[i]).append(',').append(after[i]).append(',').append(gc[i]).append(',').append(sum[i]).append('\n');
        System.out.print(report);
    }
    static void cold(String name) {
        CharSequence input=switch(name) {case "happy"->"1969-12-31T23:59:59.000001Z";
            case "fallback"->"1969-12-31T23:59:59.123456789Z";case "calendar"->"1900-02-29T00:00:00Z";
            default->throw new IllegalArgumentException(name);};
        long begin=System.nanoTime();Object value;
        try {value=Instant.parse(input);}catch(DateTimeParseException e){value=e;}
        long elapsed=System.nanoTime()-begin;
        // Check after timing without initializing an oracle formatter on native hits.
        if(name.equals("calendar")) {
            if(!(value instanceof DateTimeParseException error)||error.getErrorIndex()!=0||!error.getParsedString().contentEquals(input))
                throw new AssertionError("Wrong cold calendar outcome");
        } else if(!(value instanceof Instant instant)||instant.getEpochSecond()!=-1||
                instant.getNano()!=(name.equals("happy")?1000:123456789))throw new AssertionError("Wrong cold Instant");
        sink=value;System.out.println("cold,"+elapsed);
    }
    public static void main(String[] args) throws Exception {
        switch(args[0]) {case "audit"->audit(args.length>1&&args[1].equals("native"));
            case "bench"->bench(args[1],false);case "diagnostic"->bench(args[1],true);case "cold"->cold(args[1]);
            default->throw new IllegalArgumentException(args[0]);}
    }
}
