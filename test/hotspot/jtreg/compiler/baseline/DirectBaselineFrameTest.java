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
 * @summary Use verified frames for dead/reused locals and uninitialized aliases at direct forward joins
 * @requires vm.compiler1.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver DirectBaselineFrameTest
 */
import java.lang.reflect.Method;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselineFrameTest {
    static WhiteBox WB;
    static Method joinMethod;
    static class Side { int calls, sum; Object seen; }
    static class Pair {
        final Object token;
        Pair(Side side,Object token) { side.seen=this;System.gc();this.token=token; }
    }
    static void integer(Side side,int value) { side.sum+=value; }
    static void reference(Side side,Object value) { side.seen=value; }
    static Object touch(Side side,Object token,int mode) {
        side.calls++;
        if(mode!=0) WB.deoptimizeMethod(joinMethod);
        System.gc();return token;
    }
    static Object join(Side side,Object token,int branch,int mode) {
        if(branch==0) { int reused=19;integer(side,reused); }
        else { Object reused=token;reference(side,reused); }
        return touch(side,token,mode);
    }
    static Pair aliases(Side side,boolean choose,Object left,Object right) {
        return new Pair(side,choose ? left : right);
    }
    static Object select(Side side,int branch,Object token) {
        Object result;
        if(branch==0) { reference(side,token);result=token; }
        else { integer(side,3);result=null; }
        return result;
    }
    static void check(boolean b) { if(!b) throw new AssertionError(); }
    static void await(Method method) throws Exception {
        long end=System.nanoTime()+20_000_000_000L;
        while(WB.getMethodCompilationLevel(method)!=1) {
            if(System.nanoTime()>end) throw new AssertionError("missing direct method "+method);
            Thread.sleep(5);
        }
    }
    static void child() throws Exception {
        WB=WhiteBox.getWhiteBox();
        Side side=new Side();Object left=new Object(),right=new Object();
        joinMethod=DirectBaselineFrameTest.class.getDeclaredMethod("join",Side.class,Object.class,int.class,int.class);
        Method aliases=DirectBaselineFrameTest.class.getDeclaredMethod("aliases",Side.class,boolean.class,Object.class,Object.class);
        Method select=DirectBaselineFrameTest.class.getDeclaredMethod("select",Side.class,int.class,Object.class);
        for(int i=0;i<64;i++) {
            check(join(side,left,i&1,0)==left);
            Pair pair=aliases(side,(i&1)==0,left,right);
            check(pair.token==((i&1)==0 ? left:right) && side.seen==pair);
            check(select(side,i&1,right)==((i&1)==0 ? right:null));
            Thread.sleep(1);
        }
        await(joinMethod);await(aliases);await(select);
        int calls=side.calls,sum=side.sum;
        check(join(side,left,0,1)==left && side.calls==calls+1 && side.sum==sum+19);
        check(WB.getMethodCompilationLevel(joinMethod)==0);
        check(aliases(side,true,left,right).token==left && aliases(side,false,left,right).token==right);
        System.out.println("DIRECT_FRAME_OK");
    }
    public static void main(String[] args) throws Exception {
        if(args.length!=0) { child();return; }
        for(String gc:new String[]{"-XX:+UseSerialGC","-XX:+UseG1GC"}) {
            ProcessTools.executeTestJava("-Xbootclasspath/a:.","-XX:+UnlockExperimentalVMOptions",
                "-XX:+UnlockDiagnosticVMOptions","-XX:+WhiteBoxAPI","-XX:+UseDirectBaseline",
                "-XX:-DirectBaselineDedicatedWorker","-XX:+TraceDirectBaseline",
                "-XX:HeapBaseMinAddress=32g","-Xmx64m",gc,
                "-XX:CompileCommand=dontinline,DirectBaselineFrameTest*::*",
                DirectBaselineFrameTest.class.getName(),"child")
                .shouldHaveExitValue(0).shouldContain("DIRECT_FRAME_OK")
                .shouldContain("direct install join(").shouldContain("direct install aliases(")
                .shouldContain("direct install select(");
        }
    }
}
