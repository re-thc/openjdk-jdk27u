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

import java.lang.foreign.*;
import java.lang.invoke.*;
import java.util.*;
import java.lang.management.ManagementFactory;

public class BackendBench {
    static final String[] NAMES={"jdk","highway","ips-cold","ips-reuse","rust","xss-avx2","xss-avx512","std","pdq","rust-host-lto"};
    static final String[] PATTERNS={"random","two","low","equal","sorted","reverse","nearly","runs","organ","saw","skew","extremes","stagger","prefix"};
    static native boolean sortCopy(Object a,int lo,int n,int width,int algo);
    static final MethodHandle SORT;
    static final com.sun.management.ThreadMXBean MX=(com.sun.management.ThreadMXBean)ManagementFactory.getThreadMXBean();
    static {
        System.load(System.getProperty("backend.lib"));
        var lib=SymbolLookup.loaderLookup();
        SORT=Linker.nativeLinker().downcallHandle(lib.find("primitive_sort").orElseThrow(),
            FunctionDescriptor.of(ValueLayout.JAVA_INT,ValueLayout.ADDRESS,ValueLayout.JAVA_LONG,ValueLayout.JAVA_INT,ValueLayout.JAVA_INT),Linker.Option.critical(true));
        try {
            var target=Linker.nativeLinker().downcallHandle(lib.find("primitive_target").orElseThrow(),FunctionDescriptor.of(ValueLayout.ADDRESS));
            System.err.println("Highway target="+((MemorySegment)target.invokeExact()).reinterpret(100).getString(0));
        } catch(Throwable e) { throw new ExceptionInInitializerError(e); }
    }
    static long mix(long x) { x=(x^(x>>>30))*0xbf58476d1ce4e5b9L; x=(x^(x>>>27))*0x94d049bb133111ebL; return x^(x>>>31); }
    static Object input(int width,int n,int lo,String pattern,long seed) {
        long[] v=new long[n+lo+19];
        for(int i=0;i<v.length;i++) v[i]=mix(seed+i);
        for(int i=0;i<n;i++) {
            long r=mix(seed+i*0x9e3779b97f4a7c15L);
            v[lo+i]=switch(pattern) {
                case "two" -> r<0?Long.MIN_VALUE:Long.MAX_VALUE;
                case "low" -> (r&15)-8;
                case "equal" -> -17;
                case "sorted" -> i-n/2;
                case "reverse" -> n/2-i;
                case "nearly" -> i%97==0? r : i-n/2;
                case "runs" -> (i/1024%2==0?i%1024:1023-i%1024)+(i/1024%7)*1024-n/2;
                case "organ" -> Math.min(i,n-i)-n/4;
                case "saw" -> i%97-48;
                case "skew" -> (r&127)==0?r:0;
                case "extremes" -> switch(i%6) {case 0->Long.MIN_VALUE;case 1->Long.MAX_VALUE;case 2->-1;case 3->0;default->r;};
                case "stagger" -> (i*31L%n)-n/2;
                case "prefix" -> i<n/3?n-i:r;
                default -> r;
            };
        }
        if(width==8) return v;
        int[] a=new int[v.length];
        for(int i=0;i<a.length;i++) a[i]=(int)v[i];
        // Preserve full-width extremes for 32-bit cells.
        if(pattern.equals("two")||pattern.equals("extremes")) for(int i=0;i<n;i++) {
            if(v[lo+i]==Long.MIN_VALUE) a[lo+i]=Integer.MIN_VALUE;
            if(v[lo+i]==Long.MAX_VALUE) a[lo+i]=Integer.MAX_VALUE;
        }
        return a;
    }
    static Object cloneArray(Object a) { return a instanceof int[] x?x.clone():((long[])a).clone(); }
    static int length(Object a) { return a instanceof int[] x?x.length:((long[])a).length; }
    static MemorySegment segment(Object a) { return a instanceof int[] x?MemorySegment.ofArray(x):MemorySegment.ofArray((long[])a); }
    static boolean same(Object a,Object b) { return a instanceof int[] x?Arrays.equals(x,(int[])b):Arrays.equals((long[])a,(long[])b); }
    // Independent LSD radix oracle, including signed ordering and untouched guards.
    static Object oracle(Object a,int lo,int n,int width) {
        Object out=cloneArray(a); long[] keys=new long[n],tmp=new long[n];
        for(int i=0;i<n;i++) keys[i]=a instanceof int[] x?x[lo+i]:((long[])a)[lo+i];
        for(int pass=0;pass<width;pass++) {
            int[] counts=new int[256]; int shift=pass*8;
            for(long x:keys) counts[(int)(x>>>shift)&255]++;
            int sum=0;
            for(int j=0;j<256;j++) { int k=pass==width-1?j^128:j; int c=counts[k]; counts[k]=sum; sum+=c; }
            for(long x:keys) tmp[counts[(int)(x>>>shift)&255]++]=x;
            long[] swap=keys;keys=tmp;tmp=swap;
        }
        for(int i=0;i<n;i++) if(out instanceof int[] x) x[lo+i]=(int)keys[i]; else ((long[])out)[lo+i]=keys[i];
        return out;
    }
    static void sort(Object a,MemorySegment seg,int lo,int n,int width,int algo,String mode) throws Throwable {
        if(algo==0) { if(a instanceof int[] x) Arrays.sort(x,lo,lo+n); else Arrays.sort((long[])a,lo,lo+n); }
        else if(mode.equals("copy")) { if(!sortCopy(a,lo,n,width,algo)) throw new AssertionError("Native failure"); }
        else {
            if(n>65536) throw new IllegalArgumentException("Unbounded raw heap call");
            int ok=(int)SORT.invokeExact(seg.asSlice((long)lo*width,(long)n*width),(long)n,width,algo);
            if(ok==0) throw new AssertionError("Native failure");
        }
    }
    static int[] ints(String name,String fallback) { return Arrays.stream(System.getProperty(name,fallback).split(",")).mapToInt(Integer::parseInt).toArray(); }
    public static void main(String[] args) throws Throwable {
        SortData.pin();
        int[] sizes=ints("sizes","64,257,1024,4096,16384,65536,1048576"), offsets=ints("offsets","0,17"), algos=ints("algos","0,1,2,3,4,5,6,7,8");
        String[] patterns=System.getProperty("patterns",String.join(",",PATTERNS)).split(",");
        String mode=System.getProperty("mode","copy"); int rounds=Integer.getInteger("rounds",5);
        System.out.println("phase,width,n,pattern,offset,round,algo,mode,nanos,javaBytes");
        for(int width:ints("widths","4,8")) for(int algo:algos) {
            Object a=input(width,4096,17,"random",99); var s=segment(a); long start=System.nanoTime();
            sort(a,s,17,4096,width,algo,mode); long time=System.nanoTime()-start;
            if(!same(a,oracle(input(width,4096,17,"random",99),17,4096,width)))throw new AssertionError("First use");
            System.out.printf("first,%d,4096,random,17,0,%s,%s,%d,0%n",width,NAMES[algo],mode,time);
        }
        for(int width:ints("widths","4,8")) {
            Object source=input(width,1024,17,"random",123),work=cloneArray(source);var s=segment(work);
            for(int i=0;i<2000;i++)for(int algo:algos) {System.arraycopy(source,0,work,0,length(source));sort(work,s,17,1024,width,algo,mode);}
        }
        for(int width:ints("widths","4,8")) for(int n:sizes) for(String p:patterns) for(int lo:offsets) {
            Object source=input(width,n,lo,p,123456789L+n*13+lo); Object expected=oracle(source,lo,n,width);
            Object work=cloneArray(source); MemorySegment s=segment(work); int reps=n<1024?32:n<65536?4:1;
            for(int algo:algos) for(int w=0;w<4;w++) { System.arraycopy(source,0,work,0,length(source)); sort(work,s,lo,n,width,algo,mode); }
            for(int round=0;round<rounds;round++) {
                int[] order=algos.clone();
                Random rng=new Random(84537L+round*31+n+lo+width+p.hashCode());
                for(int i=order.length-1;i>0;i--){int j=rng.nextInt(i+1);int x=order[i];order[i]=order[j];order[j]=x;}
                for(int algo:order) {
                    long elapsed=0,allocated=0;
                    for(int r=0;r<reps;r++) {
                        System.arraycopy(source,0,work,0,length(source));
                        long b=MX.getThreadAllocatedBytes(Thread.currentThread().threadId());long t=System.nanoTime();
                        sort(work,s,lo,n,width,algo,mode);elapsed+=System.nanoTime()-t;
                        allocated+=MX.getThreadAllocatedBytes(Thread.currentThread().threadId())-b;
                        if(!same(work,expected))throw new AssertionError(width+"/"+n+"/"+p+"/"+lo+"/"+NAMES[algo]);
                    }
                    System.out.printf("steady,%d,%d,%s,%d,%d,%s,%s,%d,%d%n",width,n,p,lo,round,NAMES[algo],mode,elapsed/reps,allocated/reps);
                }
            }
        }
    }
}
