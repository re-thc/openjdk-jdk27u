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
import java.lang.foreign.*;
class SortData {
    static void pin() {
        try(var arena=Arena.ofConfined()) {
            var mask=arena.allocate(8);mask.set(ValueLayout.JAVA_LONG,0,1L<<Integer.getInteger("cpu",2));
            var f=Linker.nativeLinker().downcallHandle(Linker.nativeLinker().defaultLookup().find("sched_setaffinity").orElseThrow(),FunctionDescriptor.of(ValueLayout.JAVA_INT,ValueLayout.JAVA_INT,ValueLayout.JAVA_LONG,ValueLayout.ADDRESS));
            if((int)f.invokeExact(0,8L,mask)!=0)throw new AssertionError("Affinity");
        }catch(Throwable e){throw new AssertionError(e);}
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
}
