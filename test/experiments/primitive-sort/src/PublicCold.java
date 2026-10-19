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

public class PublicCold {
    public static void main(String[] args) {
        int width=Integer.getInteger("width",4),n=Integer.getInteger("n",65536);
        String pattern=System.getProperty("pattern","random");
        Object a=SortData.input(width,n,17,pattern,20261019);
        SortData.pin();
        if(Boolean.getBoolean("markStart")) System.err.println("FIRST_PUBLIC_SORT_START");
        long start=System.nanoTime();
        if(a instanceof int[]x)java.util.Arrays.sort(x,17,17+n);else java.util.Arrays.sort((long[])a,17,17+n);
        long time=System.nanoTime()-start;
        if(!SortData.same(a,SortData.oracle(SortData.input(width,n,17,pattern,20261019),17,n,width)))throw new AssertionError();
        System.out.println("first,"+width+","+n+","+time);
    }
}
