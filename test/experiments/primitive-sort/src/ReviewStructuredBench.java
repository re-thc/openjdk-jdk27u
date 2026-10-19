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
public class ReviewStructuredBench {
 record Case(String pattern,int n,int offset){}
 public static void main(String[]args){SortData.pin();System.out.println("pattern,n,offset,window,calls,nanos");for(Case c:new Case[]{new Case("nearly",65536,17),new Case("nearly",1048576,17),new Case("organ",1048576,17),new Case("prefix",1048576,17),new Case("runs",1048576,17),new Case("equal",1048576,17),new Case("saw",1048576,17),new Case("extremes",1048576,17)}){long[] source=(long[])SortData.input(8,c.n,c.offset,c.pattern,123456789L+c.n*13L+c.offset),work=source.clone(),expected=(long[])SortData.oracle(source,c.offset,c.n,8);long end=System.nanoTime()+750_000_000L;do{System.arraycopy(source,0,work,0,source.length);Arrays.sort(work,c.offset,c.offset+c.n);if(!Arrays.equals(work,expected))throw new AssertionError();}while(System.nanoTime()<end);for(int w=0;w<5;w++){int calls=0;long total=0,start=System.nanoTime();do{System.arraycopy(source,0,work,0,source.length);long t=System.nanoTime();Arrays.sort(work,c.offset,c.offset+c.n);total+=System.nanoTime()-t;calls++;if(!Arrays.equals(work,expected))throw new AssertionError();}while(System.nanoTime()-start<50_000_000L);System.out.println(c.pattern+","+c.n+","+c.offset+","+w+","+calls+","+total/calls);}}}
}
