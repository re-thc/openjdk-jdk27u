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
import java.lang.management.ManagementFactory;
public class ReviewWarmStructuredBench {
 public static void main(String[]args){SortData.pin();System.out.println("pattern,n,window,calls,nanos");for(String p:new String[]{"organ","runs"}){int lo=17,n=32768;long[] small=(long[])SortData.input(8,n,lo,p,123456789L+n*13+lo),temp=small.clone();for(int i=0;i<10000;i++){System.arraycopy(small,0,temp,0,small.length);Arrays.sort(temp,lo,lo+n);}n=1048576;long[] source=(long[])SortData.input(8,n,lo,p,123456789L+n*13+lo),work=source.clone(),expected=(long[])SortData.oracle(source,lo,n,8);for(int i=0;i<20;i++){System.arraycopy(source,0,work,0,source.length);Arrays.sort(work,lo,lo+n);if(!Arrays.equals(work,expected))throw new AssertionError();}System.err.println("MEASURE "+p+" uptime_ms="+ManagementFactory.getRuntimeMXBean().getUptime());for(int w=0;w<5;w++){long total=0;for(int i=0;i<10;i++){System.arraycopy(source,0,work,0,source.length);long t=System.nanoTime();Arrays.sort(work,lo,lo+n);total+=System.nanoTime()-t;if(!Arrays.equals(work,expected))throw new AssertionError();}System.out.println(p+","+n+","+w+",10,"+total/10);}}}
}
