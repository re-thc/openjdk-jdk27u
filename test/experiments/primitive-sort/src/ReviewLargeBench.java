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
public class ReviewLargeBench {
 static volatile long sink;
 public static void main(String[]args){SortData.pin();System.out.println("n,offset,window,calls,nanos");for(int n:new int[]{1048577,16777216}){int lo=n==16777216?0:17;long[] source=(long[])SortData.input(8,n,lo,"random",123456789L+n*13L+lo),work=source.clone(),expected=(long[])SortData.oracle(source,lo,n,8);int warm=n==16777216?8:40;for(int i=0;i<warm;i++){System.arraycopy(source,0,work,0,source.length);Arrays.sort(work,lo,lo+n);if(!Arrays.equals(work,expected))throw new AssertionError();}for(int w=0;w<5;w++){int calls=n==16777216?1:4;long total=0;for(int i=0;i<calls;i++){System.arraycopy(source,0,work,0,source.length);long t=System.nanoTime();Arrays.sort(work,lo,lo+n);total+=System.nanoTime()-t;if(!Arrays.equals(work,expected))throw new AssertionError();}System.out.println(n+","+lo+","+w+","+calls+","+total/calls);sink+=work[lo];}}}
}
