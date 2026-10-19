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
public class NativeISA {
    static {System.load(System.getProperty("probe.lib"));}
    static native long[] probe(String path,long getter,long table32,long table64);
    static native void force(String path,long setter);
    public static void main(String[] args) {
        String path=System.getProperty("java.home")+"/lib/libprimitivesort.so";
        long getter=Long.decode(args[0]),table32=Long.decode(args[1]),table64=Long.decode(args[2]),setter=Long.decode(args[3]);
        if(Boolean.getBoolean("forceAVX2"))force(path,setter);
        SortData.pin();
        System.out.println("width,n,pattern,offset,window,nanos");
        for(int width:new int[]{4,8})for(int n:new int[]{4096,65536,1048576})for(String p:new String[]{"random","low","reverse","skew"}) {
            Object source=SortData.input(width,n,17,p,20261019),work=SortData.cloneArray(source),expected=SortData.oracle(source,17,n,width);
            for(int window=-5;window<5;window++) {
                System.arraycopy(source,0,work,0,SortData.length(source));long start=System.nanoTime();PublicBench.sort(work,17,n,false,false);long time=System.nanoTime()-start;
                if(!SortData.same(work,expected))throw new AssertionError();
                if(window>=0)System.out.println(width+","+n+","+p+",17,"+window+","+time);
            }
        }
        long[] actual=probe(path,getter,table32,table64);
        if(actual==null)throw new AssertionError("probe");
        System.err.println("Actual product dispatch index="+actual[0]+" int32_entry_offset=0x"+Long.toHexString(actual[1])+" int64_entry_offset=0x"+Long.toHexString(actual[2]));
    }
}
