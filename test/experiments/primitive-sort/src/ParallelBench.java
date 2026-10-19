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
public class ParallelBench {
    static {System.load(System.getProperty("parallel.lib"));}
    static native boolean sortCopy(Object a,int lo,int n,int width,boolean reuse);
    public static void main(String[] args) {
        System.out.println("width,n,pattern,offset,round,algo,nanos");
        for(int width:new int[]{4,8})for(int n:new int[]{65536,1048576,16777216})for(String p:new String[]{"random","low","reverse","skew"}) {
            Object source=SortData.input(width,n,17,p,20261019),work=SortData.cloneArray(source),expected=SortData.oracle(source,17,n,width);
            for(int round=0;round<5;round++)for(int k=0;k<3;k++) {
                int algo=(round%2==0?k:2-k);System.arraycopy(source,0,work,0,SortData.length(source));long start=System.nanoTime();
                if(algo==0){if(work instanceof int[] x)Arrays.parallelSort(x,17,17+n);else Arrays.parallelSort((long[])work,17,17+n);}
                else if(!sortCopy(work,17,n,width,algo==2))throw new AssertionError("native failure");
                long time=System.nanoTime()-start;
                if(!SortData.same(work,expected))throw new AssertionError(width+"/"+n+"/"+p+"/"+algo);
                System.out.println(width+","+n+","+p+",17,"+round+","+new String[]{"jdk-parallel","ips-parallel-cold","ips-parallel-reuse"}[algo]+","+time);
            }
        }
    }
}
