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

public class NativeActivation {
    public static void main(String[] args) throws Exception {
        boolean enabled=!Boolean.getBoolean("jdk.util.Arrays.disableNativeSort");
        for(int width:new int[]{4,8}) {
            boolean expected=enabled&&(width==8||Boolean.getBoolean("nativeInt"));
            Object source=SortData.input(width,1048576,17,"random",20261019),work=SortData.cloneArray(source);
            Thread worker=new Thread(()->{for(int i=0;i<20;i++){System.arraycopy(source,0,work,0,SortData.length(source));PublicBench.sort(work,17,1048576,false,false);}});
            worker.start();int observations=0;
            while(worker.isAlive()) {
                for(var frame:worker.getStackTrace()) if(frame.getClassName().equals("java.util.PrimitiveSort")&&frame.isNativeMethod()&&frame.getMethodName().equals(width==4?"sortInts":"sortLongs"))observations++;
                Thread.sleep(1);
            }
            worker.join();
            if(!SortData.same(work,SortData.oracle(source,17,1048576,width)))throw new AssertionError("output");
            if((observations>0)!=expected)throw new AssertionError("activation width="+width+" observations="+observations+" expected="+expected);
            System.out.println("PASS native activation width="+width+" observed_native_frames="+observations+" expected="+expected);
        }
    }
}
