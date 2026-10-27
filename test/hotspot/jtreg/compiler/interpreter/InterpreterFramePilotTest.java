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
 * @summary Bounded integer codelets retain interpreter frames and ordinary fallback
 * @requires (os.arch == "amd64" | os.arch == "x86_64") & vm.compiler1.enabled & vm.hasJFR
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver InterpreterFramePilotTest
 */
import java.lang.reflect.Method;
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import jdk.jfr.Recording;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class InterpreterFramePilotTest {
    static WhiteBox WB;
    static int calls;
    static int arithmetic(int x,int y) {
        int z=x*3+y-16384;
        z=((z^y)&x)|(z>>>5);
        return z+(x<<y)-(y>>x);
    }
    static int division(int x,int y) { int z=x+7;try { return z/y; }catch(ArithmeticException e){return -991;} }
    static int array(int[] a,int x) { int z=x+1;return a[z]; }
    static int branch(int x) { int z=x+1;return z<0?-1:z; }
    static int call(int x) { int z=x+3;return callee(z); }
    static int callee(int x) { calls++;return x*7; }
    static Object keepAlive(Object keep,int x,int y) { int z=x+y;gc(z);return keep; }
    static void gc(int z) {
        check(z==37,"fallback argument");System.gc();
        check(StackWalker.getInstance().walk(s -> s.anyMatch(f -> f.getMethodName().equals("keepAlive"))),"walked interpreter frame");
    }
    static Object unsupported(Object keep) { return keep; }
    static synchronized int synchronizedRoot(int x) { return x+1; }
    static void check(boolean ok,String why) { if(!ok)throw new AssertionError(why); }
    static Method method(String name,Class<?>... args)throws Exception {
        return InterpreterFramePilotTest.class.getDeclaredMethod(name,args);
    }
    static long[] stats(Method m) { return WB.interpreterFramePilot(m,3); }
    static long hits(Method m) { return stats(m)[9]; }
    static long[] prepare(Method m) {
        long[] data=WB.interpreterFramePilot(m,0);
        check(data[0]==1 && data[3]>0 && data[3]<4096 && data[4]>0 && data[5]>0 && data[5]<=64 && data[8]!=0,"prepare "+m+Arrays.toString(data));
        check(!WB.isMethodCompiled(m),"pilot creates no nmethod");
        return data;
    }
    static class Loader extends ClassLoader {
        Class<?> define(byte[] bytes) { return defineClass(null,bytes,0,bytes.length); }
    }
    static WeakReference<Loader> ephemeral(int index,boolean bounded,int[] accepted)throws Exception {
        byte[] bytes=ClassFile.of().build(ClassDesc.of("PilotEphemeral"+index),c ->
            c.withFlags(ClassFile.ACC_PUBLIC).withMethodBody("body",MethodTypeDesc.ofDescriptor("(II)I"),ClassFile.ACC_PUBLIC|ClassFile.ACC_STATIC,m -> {
                if(bounded)for(int n=0;n<32;n++)m.iload(0).iconst_1().iadd().istore(0);
                m.iload(0).iload(1).iadd().ireturn();
            }));
        Loader loader=new Loader();Class<?> klass=loader.define(bytes);Method method=klass.getDeclaredMethod("body",int.class,int.class);
        check((int)method.invoke(null,17,20)==37+(bounded?32:0),"uncompiled ephemeral oracle");
        long[] data=WB.interpreterFramePilot(method,0);
        if(data[0]==1) {
            accepted[0]++;if(bounded)check(data[5]==64,"bounded prefix length");
            check((int)method.invoke(null,17,20)==37+(bounded?32:0),"ephemeral codelet semantics");
            check(hits(method)>0,"ephemeral execution");
        } else check(!bounded && data[8]==0,"arena capacity fallback");
        return new WeakReference<>(loader);
    }
    static void child(String mode)throws Exception {
        WB=WhiteBox.getWhiteBox();
        Method arithmetic=method("arithmetic",int.class,int.class);
        int[] xs={0,1,-1,Integer.MIN_VALUE,Integer.MAX_VALUE,0x76543210,-991};
        int[] ys={-97,32,63,-1,0,19,127};
        int[] expected=new int[xs.length];
        for(int n=0;n<32;n++)for(int i=0;i<xs.length;i++)expected[i]=arithmetic(xs[i],ys[i]);
        prepare(arithmetic);
        for(int n=0;n<100;n++)for(int i=0;i<xs.length;i++)check(arithmetic(xs[i],ys[i])==expected[i],"integer semantics");
        check(hits(arithmetic)>=700,"executed generated prefix");
        if(mode.equals("handoff")) {
            check(WB.enqueueMethodForCompilation(arithmetic,1),"C1 enqueue");
            long end=System.nanoTime()+20_000_000_000L;
            while(!WB.isMethodCompiled(arithmetic)) { if(System.nanoTime()>end)throw new AssertionError("C1 handoff");Thread.sleep(2); }
            long before=hits(arithmetic);
            for(int i=0;i<100;i++)check(arithmetic(xs[i%xs.length],ys[i%ys.length])==expected[i%xs.length],"compiled successor");
            check(hits(arithmetic)==before,"ordinary code replaces pilot entry");
            WB.deoptimizeMethod(arithmetic);check(arithmetic(xs[0],ys[0])==expected[0],"post deopt");
            check(hits(arithmetic)>before,"interpreter pilot resumes after deopt");
            System.out.println("PILOT_HANDOFF_OK");return;
        }
        if(mode.equals("tooling")) {
            long before=hits(arithmetic);
            try(Recording rec=new Recording()) {
                rec.enable("jdk.ExecutionSample");rec.start();
                for(int i=0;i<100;i++)check(arithmetic(xs[0],ys[0])==expected[0],"tool fallback semantics");
                check(hits(arithmetic)==before,"dynamic tooling stops pilot execution");
            }
            System.out.println("PILOT_TOOLING_OK");return;
        }
        long before=hits(arithmetic);WB.interpreterFramePilot(arithmetic,2);
        for(int i=0;i<100;i++)check(arithmetic(xs[0],ys[0])==expected[0],"disabled original interpreter");
        check(hits(arithmetic)==before,"disable publication");
        WB.interpreterFramePilot(arithmetic,1);arithmetic(0,0);check(hits(arithmetic)>before,"reenable publication");
        check(WB.interpreterFramePilot(arithmetic,0)[0]==0,"no duplicate generation");
        Method division=method("division",int.class,int.class);prepare(division);
        check(division(5,0)==-991 && division(5,3)==4,"exception and handler fallback");
        Method array=method("array",int[].class,int.class);prepare(array);
        check(array(new int[]{17,37},0)==37,"array boundary");
        try { array(null,0);throw new AssertionError("null"); }catch(NullPointerException ok) { }
        try { array(new int[1],0);throw new AssertionError("bounds"); }catch(ArrayIndexOutOfBoundsException ok) { }
        Method branch=method("branch",int.class);prepare(branch);
        check(branch(-2)==-1 && branch(4)==5,"branch fallback");
        Method call=method("call",int.class);prepare(call);calls=0;
        check(call(2)==35 && calls==1,"once-only call and argument fallback");
        Method keep=method("keepAlive",Object.class,int.class,int.class);prepare(keep);
        Object token=new byte[1<<20];check(keepAlive(token,17,20)==token,"GC and frame identity");
        check(WB.interpreterFramePilot(method("unsupported",Object.class),0)[0]==0,"unsupported first opcode");
        check(WB.interpreterFramePilot(method("synchronizedRoot",int.class),0)[0]==0,"synchronized root");
        for(Method m:new Method[]{division,array,branch,call,keep})check(hits(m)>0 && !WB.isMethodCompiled(m),"used real interpreted codelet "+m);
        int[] accepted={6};ArrayList<WeakReference<Loader>> loaders=new ArrayList<>();
        loaders.add(ephemeral(0,true,accepted));
        for(int i=1;i<25;i++)loaders.add(ephemeral(i,false,accepted));
        check(accepted[0]==16,"bounded arena never reuses slots");
        for(int n=0;n<5 && loaders.stream().anyMatch(w -> w.get()!=null);n++){WB.fullGC();Thread.sleep(20);}
        check(loaders.stream().allMatch(w -> w.get()==null),"codelets do not pin class loaders");
        System.out.println("PILOT_SEMANTICS_OK");
    }
    public static void main(String[] args)throws Exception {
        if(args.length>0){child(args[0]);return;}
        String[] common={"-Xbootclasspath/a:.","-XX:+UnlockExperimentalVMOptions","-XX:+UnlockDiagnosticVMOptions",
                "-XX:+WhiteBoxAPI","-XX:+UseInterpreterFramePilot","-Xmx64m"};
        for(String gc:new String[]{"-XX:+UseSerialGC","-XX:+UseG1GC"}) {
            ProcessTools.executeTestJava(concat(common,"-Xint",gc,InterpreterFramePilotTest.class.getName(),"semantics"))
                    .shouldHaveExitValue(0).shouldContain("PILOT_SEMANTICS_OK");
        }
        ProcessTools.executeTestJava(concat(common,"-Xint",InterpreterFramePilotTest.class.getName(),"tooling"))
                .shouldHaveExitValue(0).shouldContain("PILOT_TOOLING_OK");
        ProcessTools.executeTestJava(concat(common,"-XX:CompileThresholdScaling=100","-XX:CompileCommand=dontinline,InterpreterFramePilotTest::*",InterpreterFramePilotTest.class.getName(),"handoff"))
                .shouldHaveExitValue(0).shouldContain("PILOT_HANDOFF_OK");
    }
    static String[] concat(String[] first,String... last) {
        String[] all=Arrays.copyOf(first,first.length+last.length);System.arraycopy(last,0,all,first.length,last.length);return all;
    }
}
