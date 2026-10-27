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

/* @test
 * @summary Direct backward branches preserve roots, safepoint progress and ordinary interpreter OSR handoff
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver DirectBaselineLoopTest
 */
import java.lang.reflect.Method;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselineLoopTest {
    static volatile boolean stop=true;
    static class Side { volatile int started; Object seen; int result; }
    static int sum(Object token,Side side,int n) {
        int r=0;for(int i=0;i<n;i++) r+=i;
        side.seen=token;return r;
    }
    static int down(int n) { int r=0;do { r+=n; } while(--n>0);return r; }
    static int spin(Object token,Side side) {
        side.started=1;
        int r=0;while(!stop) r++;
        side.seen=token;side.result=r;return r;
    }
    static int migrate(Object token,Side side) {
        side.started=1;
        int r=0;while(!stop) r++;
        side.seen=token;side.result=r;return r;
    }
    static void check(boolean b) { if(!b) throw new AssertionError(); }
    static void await(WhiteBox wb,Method m,int level,boolean osr) throws Exception {
        long end=System.nanoTime()+20_000_000_000L;
        while(osr ? wb.getMethodCompilationLevel(m,true)==0 : wb.getMethodCompilationLevel(m)!=level) {
            if(System.nanoTime()>end) throw new AssertionError("missing compilation "+m+" OSR="+osr);
            Thread.sleep(5);
        }
    }
    static void child() throws Exception {
        WhiteBox wb=WhiteBox.getWhiteBox();Side side=new Side();Object token=new Object();
        Method sum=DirectBaselineLoopTest.class.getDeclaredMethod("sum",Object.class,Side.class,int.class);
        Method down=DirectBaselineLoopTest.class.getDeclaredMethod("down",int.class);
        Method spin=DirectBaselineLoopTest.class.getDeclaredMethod("spin",Object.class,Side.class);
        Method migrate=DirectBaselineLoopTest.class.getDeclaredMethod("migrate",Object.class,Side.class);
        for(int i=0;i<64;i++) {
            check(sum(token,side,4)==6 && side.seen==token);
            check(down(3)==6 && spin(token,side)==0 && migrate(token,side)==0 && side.seen==token);
            Thread.sleep(1);
        }
        await(wb,sum,1,false);await(wb,down,1,false);await(wb,spin,1,false);await(wb,migrate,1,false);
        // C1 aliases its OSR/non-OSR refusal flag. Pin this fixture only after
        // its direct nmethod has installed, keeping GC/poll coverage in direct.
        wb.makeMethodNotCompilable(spin,3,true);wb.makeMethodNotCompilable(spin,4,true);
        check(down(100)==5050);
        side.started=0;side.seen=null;stop=false;
        Thread worker=new Thread(() -> spin(token,side));worker.start();
        long end=System.nanoTime()+20_000_000_000L;
        while(side.started==0) {
            if(System.nanoTime()>end) throw new AssertionError("spin not entered");
            Thread.sleep(1);
        }
        try {
            wb.fullGC();
            check(wb.getMethodCompilationLevel(spin)==1);
        } finally { stop=true; }
        worker.join(20000);check(!worker.isAlive() && side.seen==token && side.result!=0);
        int n=5_000_000;
        check(sum(token,side,n)==(int)((long)n*(n-1)/2) && side.seen==token);
        // Observe OSR while the activation is still running. A finite loop's
        // OSR nmethod can retire at its exit after C2 uncommon-trap reprofiling.
        side.started=0;side.seen=null;stop=false;
        Thread migrating=new Thread(() -> migrate(token,side));migrating.start();
        try {
            await(wb,migrate,0,true);
            check(wb.getMethodCompilationLevel(migrate,true)>=3);
        } finally { stop=true; }
        migrating.join(20000);check(!migrating.isAlive() && side.seen==token && side.result!=0);
        System.out.println("DIRECT_LOOP_OSR_OK");
    }
    public static void main(String[] args) throws Exception {
        if(args.length!=0) { child();return; }
        for(String gc:new String[]{"-XX:+UseSerialGC","-XX:+UseG1GC"}) {
            ProcessTools.executeTestJava("-Xbootclasspath/a:.","-XX:+UnlockExperimentalVMOptions",
                "-XX:+UnlockDiagnosticVMOptions","-XX:+WhiteBoxAPI","-XX:+UseDirectBaseline",
                "-XX:-DirectBaselineDedicatedWorker","-XX:+TraceDirectBaseline",
                "-XX:HeapBaseMinAddress=32g","-Xmx64m",gc,
                "-XX:CompileCommand=compileonly,DirectBaselineLoopTest*::*",
                "-XX:CompileCommand=dontinline,DirectBaselineLoopTest*::*",
                DirectBaselineLoopTest.class.getName(),"child")
                .shouldHaveExitValue(0).shouldContain("DIRECT_LOOP_OSR_OK")
                .shouldContain("direct install sum(").shouldContain("direct install down(")
                .shouldContain("direct install spin(").shouldContain("direct install migrate(");
        }
    }
}
