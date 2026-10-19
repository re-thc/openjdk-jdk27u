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

import java.util.concurrent.atomic.*;
public class SafepointBench {
    static volatile boolean stop;
    static final AtomicBoolean active=new AtomicBoolean();
    static final AtomicLong generation=new AtomicLong();
    public static void main(String[] args) throws Exception {
        int width=Integer.getInteger("width",8),n=Integer.getInteger("n",1048576);
        Object source=SortData.input(width,n,17,"random",7459),work=SortData.cloneArray(source);
        Thread sorter=new Thread(()->{
            SortData.pin();
            while(!stop){
                System.arraycopy(source,0,work,0,SortData.length(source));
                active.set(true);generation.incrementAndGet();PublicBench.sort(work,17,n,false,false);active.set(false);
            }
        });
        sorter.start();
        while(generation.get()<100)Thread.onSpinWait();
        for(int i=0;i<40;i++) {
            long prior=generation.get();while(generation.get()==prior||!active.get())Thread.onSpinWait();
            long startGen=generation.get(),start=System.nanoTime();
            System.gc();
            System.out.println("GC "+i+" wall_ns="+(System.nanoTime()-start)+" start_generation="+startGen+" end_generation="+generation.get()+" active_after="+active.get());
        }
        stop=true;sorter.join();
        if(!SortData.same(work,SortData.oracle(source,17,n,width)))throw new AssertionError();
        System.out.println("PASS GC overlap sorted output");
    }
}
