/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

// Manual stage CPU probe; requires the test WhiteBox classes on bootclasspath.
import java.lang.management.ManagementFactory;
import java.lang.reflect.Method;
import jdk.test.whitebox.WhiteBox;
public class StageProbe {
    static final WhiteBox WB=WhiteBox.getWhiteBox();
    static class Box { int value; }
    static volatile long sink;
    static int target(Box b,int[] a,int i) {
        if ((i&1)==0) b.value=a[i&7]+i;
        else b.value=b.value-i;
        a[i&7]=b.value;
        return b.value;
    }
    static long batch(Box b,int[] a,int n) {
        long sum=0;
        for(int i=0;i<n;i++) sum+=target(b,a,i);
        return sum;
    }
    static void check(boolean c) { if(!c) throw new AssertionError(); }
    static void await(Method m,int min) throws Exception {
        long end=System.nanoTime()+10_000_000_000L;
        while(WB.getMethodCompilationLevel(m)<min) {
            if(System.nanoTime()>end) throw new AssertionError("missing level "+min);
            Thread.sleep(1);
        }
    }
    static void measure(String stage,Method target,Method batch,Box b,int[] a,int expected) {
        var cpu=ManagementFactory.getThreadMXBean();
        sink=batch(b,a,10000);
        check(WB.getMethodCompilationLevel(target)==expected && WB.getMethodCompilationLevel(batch)==4);
        for(int sample=0;sample<5;sample++) {
            long start=cpu.getCurrentThreadCpuTime(),wall=System.nanoTime();
            sink=batch(b,a,200000);
            long elapsed=System.nanoTime()-wall,used=cpu.getCurrentThreadCpuTime()-start;
            check(WB.getMethodCompilationLevel(target)==expected && WB.getMethodCompilationLevel(batch)==4);
            System.out.println(stage+"\t"+sample+"\t"+expected+"\t200000\t"+used+"\t"+elapsed);
        }
    }
    public static void main(String[] args) throws Exception {
        Method target=StageProbe.class.getDeclaredMethod("target",Box.class,int[].class,int.class);
        Method batch=StageProbe.class.getDeclaredMethod("batch",Box.class,int[].class,int.class);
        Box b=new Box();int[] a=new int[8];
        for(int i=0;i<64;i++) { target(b,a,i);Thread.sleep(1); }
        boolean direct=args[0].equals("direct");
        if(direct) await(target,1);
        check(WB.enqueueMethodForCompilation(batch,4));await(batch,4);
        WB.lockCompilation();
        try { measure(direct?"direct":"interpreter",target,batch,b,a,direct?1:0); }
        finally { WB.unlockCompilation(); }
        await(target,2);int c1=WB.getMethodCompilationLevel(target);check(c1==2||c1==3);
        WB.lockCompilation();
        try { measure("C1",target,batch,b,a,c1); }
        finally { WB.unlockCompilation(); }
        for(int i=0;WB.getMethodCompilationLevel(target)!=4 && i<100;i++) {sink=batch(b,a,1000);Thread.sleep(1);}
        await(target,4);measure("C2",target,batch,b,a,4);
        System.out.println("STAGE_PROBE_OK");
    }
}
