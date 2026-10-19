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
import java.lang.invoke.*;
import java.lang.management.ManagementFactory;
public class ReviewFocusedBench {
  static final com.sun.management.ThreadMXBean MX=(com.sun.management.ThreadMXBean)ManagementFactory.getThreadMXBean();
  record Case(int n,int lo,String pattern,long seed){}
  static volatile long sink;
  static void sort(long[] a,int lo,int n){Arrays.sort(a,lo,lo+n);}
  static final Case[] CASES={new Case(16381,29,"skew",2026101909L),new Case(65537,17,"skew",123456789L),new Case(65536,17,"random",123456789L),new Case(1048576,17,"random",123456789L),new Case(65536,17,"sorted",123456789L),new Case(65536,17,"reverse",123456789L),new Case(5101,5,"runs",2026101909L),new Case(65536,17,"low",123456789L),new Case(65536,17,"two",123456789L),new Case(1048577,17,"random",123456789L)};
  public static void main(String[] args)throws Throwable{
    SortData.pin();System.out.println("n,offset,pattern,phase,window,calls,nanos,javaBytes");
    // Reproduce the existing mixed driver warmup before focused case warmup.
    for(int width:new int[]{4,8}){
      Object[] inputs=new Object[10],works=new Object[10];int k=0;
      for(int n:new int[]{4093,4096})for(String p:new String[]{"random","reverse","sorted","low","skew"}){inputs[k]=SortData.input(width,n,17,p,57);works[k]=SortData.cloneArray(inputs[k]);k++;}
      for(int i=0;i<60000;i++){k=i%10;int n=k<5?4093:4096;System.arraycopy(inputs[k],0,works[k],0,SortData.length(inputs[k]));PublicBench.sort(works[k],17,n,false,false);}
    }
    for(Case c:CASES){
      long[] source=(long[])SortData.input(8,c.n,c.lo,c.pattern,c.seed+c.n*13L+c.lo),work=source.clone(),expected=(long[])SortData.oracle(source,c.lo,c.n,8);
      try{
        Class<?> type=Class.forName("java.util.PrimitiveSort");var method=type.getDeclaredMethod("preferJava",long[].class,int.class,int.class);method.setAccessible(true);
        System.err.println("admission n="+c.n+" pattern="+c.pattern+" preferJava="+method.invoke(null,source,c.lo,c.n));
      }catch(ClassNotFoundException|NoSuchMethodException ignored){System.err.println("admission helper absent");}
      for(int i=0;i<10;i++){System.arraycopy(source,0,work,0,source.length);sort(work,c.lo,c.n);}
      measure(c,source,work,expected,"short",5,10);
      long until=System.nanoTime()+750_000_000L;
      do{System.arraycopy(source,0,work,0,source.length);sort(work,c.lo,c.n);if(!Arrays.equals(work,expected))throw new AssertionError();}while(System.nanoTime()<until);
      measure(c,source,work,expected,"steady",5,50);
    }
  }
  static void measure(Case c,long[] source,long[] work,long[] expected,String phase,int windows,int ms){
    for(int w=0;w<windows;w++){
      int calls=0;long total=0,bytes=0,start=System.nanoTime();
      do{System.arraycopy(source,0,work,0,source.length);long b=MX.getThreadAllocatedBytes(Thread.currentThread().threadId()),t=System.nanoTime();sort(work,c.lo,c.n);total+=System.nanoTime()-t;bytes+=MX.getThreadAllocatedBytes(Thread.currentThread().threadId())-b;calls++;if(!Arrays.equals(work,expected))throw new AssertionError(c);}while(System.nanoTime()-start<ms*1000000L);
      System.out.println(c.n+","+c.lo+","+c.pattern+","+phase+","+w+","+calls+","+total/calls+","+bytes/calls);sink+=work[c.lo];
    }
  }
}
