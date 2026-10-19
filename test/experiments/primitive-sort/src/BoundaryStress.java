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
public class BoundaryStress {
    public static void main(String[] args) throws Exception {
        BackendBench.sortCopy(new int[]{1},0,1,4,1); // Load before workers.
        var pool=Executors.newFixedThreadPool(4);
        List<Future<Integer>> tasks=new ArrayList<>();
        for(int thread=0;thread<4;thread++) {
            final int id=thread;
            tasks.add(pool.submit(()-> {
                int count=0;
                for(int round=0;round<12;round++)for(int width:new int[]{4,8})for(int algo:new int[]{1,2,3,4}) {
                    int n=new int[]{4096,65536,1048576}[round%3];
                    String p=BackendBench.PATTERNS[(round+id)%BackendBench.PATTERNS.length];
                    Object a=SortData.input(width,n,17,p,20261019+id+round),want=SortData.oracle(a,17,n,width);
                    if(!BackendBench.sortCopy(a,17,n,width,algo)||!SortData.same(a,want))throw new AssertionError("concurrency/GC");
                    count++;
                }
                return count;
            }));
        }
        Thread collector=new Thread(()->{for(int i=0;i<24;i++){System.gc();Thread.yield();}});
        collector.start();int total=0;for(var t:tasks)total+=t.get();collector.join();pool.shutdown();
        System.out.println("PASS "+total+" concurrent copied sorts with GC");
    }
}
