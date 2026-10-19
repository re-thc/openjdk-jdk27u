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
public class UnaffectedBench {
    static Object make(String type,int n,String p) {
        Object a=switch(type){case "float"->new float[n];case "double"->new double[n];case "byte"->new byte[n];case "short"->new short[n];default->new char[n];};
        for(int i=0;i<n;i++) {
            long v=p.equals("random")?SortData.mix(i+20261019):p.equals("reverse")?n-i:i;
            if(a instanceof float[] x)x[i]=p.equals("random")?Float.intBitsToFloat((int)v):(float)v;
            else if(a instanceof double[] x)x[i]=p.equals("random")?Double.longBitsToDouble(v):(double)v;
            else if(a instanceof byte[] x)x[i]=(byte)v;else if(a instanceof short[] x)x[i]=(short)v;else ((char[])a)[i]=(char)v;
        }
        return a;
    }
    static void sort(Object a){if(a instanceof float[]x)Arrays.sort(x);else if(a instanceof double[]x)Arrays.sort(x);else if(a instanceof byte[]x)Arrays.sort(x);else if(a instanceof short[]x)Arrays.sort(x);else Arrays.sort((char[])a);}
    static Object cloneArray(Object a){if(a instanceof float[]x)return x.clone();if(a instanceof double[]x)return x.clone();if(a instanceof byte[]x)return x.clone();if(a instanceof short[]x)return x.clone();return ((char[])a).clone();}
    static boolean equal(Object a,Object b){if(a instanceof float[]x)return Arrays.equals(x,(float[])b);if(a instanceof double[]x)return Arrays.equals(x,(double[])b);if(a instanceof byte[]x)return Arrays.equals(x,(byte[])b);if(a instanceof short[]x)return Arrays.equals(x,(short[])b);return Arrays.equals((char[])a,(char[])b);}
    public static void main(String[] args) {
        SortData.pin();System.out.println("width,n,pattern,offset,window,nanos");
        for(String type:new String[]{"float","double","byte","short","char"}) {
            Object src=make(type,4096,"random"),work=cloneArray(src);
            for(int i=0;i<20000;i++){System.arraycopy(src,0,work,0,4096);sort(work);}
            for(int n:new int[]{257,4096,65536,1048576})for(String p:new String[]{"random","sorted","reverse"}) {
                src=make(type,n,p);work=cloneArray(src);Object expected=cloneArray(src);sort(expected);
                for(int i=0;i<10;i++){System.arraycopy(src,0,work,0,n);sort(work);}
                int reps=Math.max(1,Math.min(128,1000000/n));
                for(int window=0;window<5;window++) {
                    long time=0;for(int i=0;i<reps;i++){System.arraycopy(src,0,work,0,n);long start=System.nanoTime();sort(work);time+=System.nanoTime()-start;if(!equal(work,expected))throw new AssertionError();}
                    System.out.println(type+","+n+","+p+",0,"+window+","+time/reps);
                }
            }
        }
    }
}
