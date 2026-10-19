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

import java.nio.file.*;
import java.util.*;
public class NativeMemory {
    static {if(System.getProperty("trace.lib")!=null)System.load(System.getProperty("trace.lib"));}
    static native long[] stats();
    static native void trimAllocator();
    static void memory(String phase)throws Exception{
        System.gc();Thread.sleep(50);
        for(String line:Files.readAllLines(Path.of("/proc/self/status")))if(line.startsWith("VmRSS:")||line.startsWith("VmHWM:"))System.out.println(phase+" "+line);
        if(System.getProperty("trace.lib")!=null)System.out.println(phase+" malloc_calls,total,live,peak="+Arrays.toString(stats()));
    }
    public static void main(String[] args)throws Exception{
        memory("before");
        exercise();
        memory("after");
        if(Boolean.getBoolean("trimAllocator")){trimAllocator();memory("after_trim");}
    }
    static void exercise(){for(int width:new int[]{4,8}) {
            Object source=SortData.input(width,1048576,17,"random",20261019),work=SortData.cloneArray(source);
            for(int i=0;i<20;i++){System.arraycopy(source,0,work,0,SortData.length(source));PublicBench.sort(work,17,1048576,false,false);}
            if(!SortData.same(work,SortData.oracle(source,17,1048576,width)))throw new AssertionError();
        }}
}
