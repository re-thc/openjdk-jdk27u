/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

import java.util.*;
import java.lang.management.ManagementFactory;
public class PublicBench {
    static final com.sun.management.ThreadMXBean MX=(com.sun.management.ThreadMXBean)ManagementFactory.getThreadMXBean();
    static volatile long sink;
    static void sort(Object a,int lo,int n,boolean whole,boolean parallel) {
        if(a instanceof int[] x) {
            if(parallel) {if(whole)Arrays.parallelSort(x);else Arrays.parallelSort(x,lo,lo+n);}
            else {if(whole)Arrays.sort(x);else Arrays.sort(x,lo,lo+n);}
        } else {
            long[] x=(long[])a;
            if(parallel) {if(whole)Arrays.parallelSort(x);else Arrays.parallelSort(x,lo,lo+n);}
            else {if(whole)Arrays.sort(x);else Arrays.sort(x,lo,lo+n);}
        }
    }
    static int[] ints(String name,String value) {return Arrays.stream(System.getProperty(name,value).split(",")).mapToInt(Integer::parseInt).toArray();}
    public static void main(String[] args) {
        SortData.pin();
        boolean parallel=Boolean.getBoolean("parallel"),whole=Boolean.getBoolean("whole");int windows=Integer.getInteger("windows",5);
        System.out.println("width,n,pattern,offset,window,nanos,javaBytes,whole,parallel");
        // Warm both overloads/types before collecting any case; source resets are outside timing.
        for(int width:new int[]{4,8}) {
            Object source=SortData.input(width,4096,17,"random",57),work=SortData.cloneArray(source);
            for(int i=0;i<20000;i++){System.arraycopy(source,0,work,0,SortData.length(source));sort(work,17,4096,false,false);}
            if(Boolean.getBoolean("warmMixed")) {
                Object[] mixed=new Object[10],works=new Object[10];int index=0;
                for(int size:new int[]{4093,4096}) for(String p:new String[]{"random","reverse","sorted","low","skew"}) {
                    mixed[index]=SortData.input(width,size,17,p,57);works[index]=SortData.cloneArray(mixed[index]);index++;
                }
                for(int i=0;i<60000;i++) {
                    int k=i%10,size=k<5?4093:4096;
                    System.arraycopy(mixed[k],0,works[k],0,SortData.length(mixed[k]));sort(works[k],17,size,false,false);
                }
            }
        }
        for(int width:ints("widths","4,8"))for(int n:ints("sizes","257,4095,4096,4097,16384,65535,65536,65537,1048576,16777216"))
        for(String pattern:System.getProperty("patterns","random,two,low,equal,sorted,reverse,nearly,runs,organ,saw,skew,extremes,stagger,prefix").split(","))
        for(int offset:ints("offsets","0,17")) {
            int lo=whole?0:offset;
            Object source=SortData.input(width,n,lo,pattern,Long.getLong("inputSeed",123456789L)+n*13+lo);
            if(whole)source=source instanceof int[] x?Arrays.copyOf(x,n):Arrays.copyOf((long[])source,n);
            Object expected=SortData.oracle(source,lo,n,width),work=SortData.cloneArray(source);
            int warmCases=Integer.getInteger("caseWarmup",10);
            for(int i=0;i<warmCases;i++){System.arraycopy(source,0,work,0,SortData.length(source));sort(work,lo,n,whole,parallel);}
            int reps=Math.max(1,Math.min(256,1000000/Math.max(1,n)));
            for(int window=0;window<windows;window++) {
                long elapsed=0,bytes=0;int calls=0;long windowStart=System.nanoTime();
                long minWindow=Integer.getInteger("minWindowMillis",0)*1000000L;
                for(int i=0;i<reps || System.nanoTime()-windowStart<minWindow;i++) {
                    System.arraycopy(source,0,work,0,SortData.length(source));
                    long b=MX.getThreadAllocatedBytes(Thread.currentThread().threadId()),t=System.nanoTime();
                    sort(work,lo,n,whole,parallel);elapsed+=System.nanoTime()-t;
                    bytes+=MX.getThreadAllocatedBytes(Thread.currentThread().threadId())-b;
                    calls++;
                    if(!SortData.same(work,expected))throw new AssertionError(width+"/"+n+"/"+pattern+"/"+lo);
                }
                System.out.printf("%d,%d,%s,%d,%d,%d,%d,%s,%s%n",width,n,pattern,lo,window,elapsed/calls,bytes/calls,whole,parallel);
            }
        }
    }
}
