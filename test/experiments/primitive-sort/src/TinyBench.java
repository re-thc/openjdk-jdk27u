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
public class TinyBench {
    static volatile long sink;
    static void sort(int[][] pool,int lo,int n){for(int[] a:pool)Arrays.sort(a,lo,lo+n);}
    static void sort(long[][] pool,int lo,int n){for(long[] a:pool)Arrays.sort(a,lo,lo+n);}
    public static void main(String[] args){
        SortData.pin();System.out.println("width,n,pattern,offset,window,nanos");
        for(int width:new int[]{4,8})for(int n:new int[]{0,1,2,8,16,31,43,44,45,64,65,127,257})for(int lo:new int[]{0,3,17}){
            Object source=SortData.input(width,n,lo,"random",20261019+n+lo),expected=SortData.oracle(source,lo,n,width);
            int count=n<32?8192:2048;
            if(width==4){
                int[][] pool=new int[count][];for(int i=0;i<count;i++)pool[i]=((int[])source).clone();
                for(int w=-5;w<5;w++){
                    for(int[] a:pool)System.arraycopy(source,0,a,0,a.length);long t=System.nanoTime();sort(pool,lo,n);long elapsed=System.nanoTime()-t;
                    for(int[] a:pool)if(!Arrays.equals(a,(int[])expected))throw new AssertionError();
                    sink+=pool[0][0];if(w>=0)System.out.println(width+","+n+",random,"+lo+","+w+","+elapsed/count);
                }
            }else{
                long[][] pool=new long[count][];for(int i=0;i<count;i++)pool[i]=((long[])source).clone();
                for(int w=-5;w<5;w++){
                    for(long[] a:pool)System.arraycopy(source,0,a,0,a.length);long t=System.nanoTime();sort(pool,lo,n);long elapsed=System.nanoTime()-t;
                    for(long[] a:pool)if(!Arrays.equals(a,(long[])expected))throw new AssertionError();
                    sink+=pool[0][0];if(w>=0)System.out.println(width+","+n+",random,"+lo+","+w+","+elapsed/count);
                }
            }
        }
    }
}
