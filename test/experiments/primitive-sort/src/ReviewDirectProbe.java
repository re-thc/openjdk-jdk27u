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
public class ReviewDirectProbe {
 static void sort(long[] a,int lo,int n,int which){switch(which){case 0->Arrays.sort(a,lo,lo+n);case 1->PrimitiveSortReview.guarded(a,lo,lo+n);case 2->PrimitiveSortReview.direct(a,lo,lo+n);}}
 public static void main(String[]args){SortData.pin();int n=16381,lo=29;long[] source=(long[])SortData.input(8,n,lo,"skew",2026101909L+n*13+lo),work=source.clone(),expected=(long[])SortData.oracle(source,lo,n,8);long until=System.nanoTime()+2_000_000_000L;int calls=0;do{System.arraycopy(source,0,work,0,source.length);sort(work,lo,n,calls++%3);}while(System.nanoTime()<until);System.out.println("pair,path,window,calls,nanos");for(int w=0;w<5;w++)for(int k=0;k<3;k++){int path=(w+k+Integer.getInteger("pair",0))%3;long start=System.nanoTime(),total=0;calls=0;do{System.arraycopy(source,0,work,0,source.length);long t=System.nanoTime();sort(work,lo,n,path);total+=System.nanoTime()-t;calls++;if(!Arrays.equals(work,expected))throw new AssertionError();}while(System.nanoTime()-start<100_000_000L);System.out.println(Integer.getInteger("pair",0)+","+path+","+w+","+calls+","+total/calls);}}
}
