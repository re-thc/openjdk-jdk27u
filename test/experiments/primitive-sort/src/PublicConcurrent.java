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
import java.util.concurrent.*;
public class PublicConcurrent {
    public static void main(String[] args)throws Exception{
        var executor=Executors.newFixedThreadPool(4);List<Future<Integer>> tasks=new ArrayList<>();
        for(int thread=0;thread<4;thread++){
            final int id=thread;
            tasks.add(executor.submit(()->{int checks=0;
                for(int round=0;round<12;round++)for(int width:new int[]{4,8}){
                    int n=new int[]{4096,65536,1048576}[round%3];
                    String p=new String[]{"random","low","reverse","skew","prefix","extremes"}[(round+id)%6];
                    Object a=SortData.input(width,n,17,p,20261019+round+id),expected=SortData.oracle(a,17,n,width);
                    if(a instanceof int[]x)Arrays.sort(x,17,n+17);else Arrays.sort((long[])a,17,n+17);
                    if(!SortData.same(a,expected))throw new AssertionError();checks++;
                }
                return checks;
            }));
        }
        Thread gc=new Thread(()->{for(int i=0;i<24;i++){System.gc();Thread.yield();}});gc.start();
        int count=0;for(var task:tasks)count+=task.get();gc.join();executor.shutdown();
        System.out.println("PASS "+count+" concurrent public API sorts with GC");
    }
}
