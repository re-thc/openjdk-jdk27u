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
 * @summary Direct constants, throws, array stores, stack permutations, switches and integer division
 * @requires vm.compiler1.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver DirectBaselineCommonTest
 */
import java.lang.invoke.MethodHandles;
import java.lang.reflect.Executable;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselineCommonTest {
    static class Side { int before; Object value; }
    static int initialized;
    static class Cold { static int value = ++initialized; }
    static String string() { return "direct constant identity"; }
    static Class<?> mirror() { return Cold.class; }
    static Object retain(Object value) { System.gc(); return value; }
    static Object constantGC() { return retain("direct constant GC root"); }
    static void throwing(Side side, RuntimeException exception) { side.before++; throw exception; }
    static int bytes(byte[] a,int i,int v) { return a[i]=(byte)v; }
    static int chars(char[] a,int i,int v) { return a[i]=(char)v; }
    static int shorts(short[] a,int i,int v) { return a[i]=(short)v; }
    static Object references(Side side,Object[] a,int i,Object v) { side.before++; return a[i]=v; }
    static Object field(Side side,Object value) { return side.value=value; }
    static int compound(int[] a,int i,int v) { return a[i]+=v; }
    static int divide(Side side,int a,int b) { side.before++; return a/b; }
    static int remainder(Side side,int a,int b) { side.before++; return a%b; }
    static int dense(int key) {
        switch(key) { case -2:return 17; case -1:return 23; case 0:return 31; case 1:return 37; case 2:return 41; default:return -7; }
    }
    static int sparse(int key) {
        switch(key) { case Integer.MIN_VALUE:return 53; case -100000:return 59; case 700000:return 61; case Integer.MAX_VALUE:return 67; default:return -11; }
    }
    static void check(boolean b) { if(!b) throw new AssertionError(); }
    static void await(WhiteBox wb,Executable m) throws Exception {
        long end=System.nanoTime()+20_000_000_000L;
        while(wb.getMethodCompilationLevel(m)!=1) {
            if(System.nanoTime()>end) throw new AssertionError("missing direct method "+m);
            Thread.sleep(5);
        }
    }
    static Class<?> raw() throws Exception {
        byte[] bytes=ClassFile.of().build(ClassDesc.of("DirectBaselineRawStack"),c -> {
            c.withMethodBody("booleans",MethodTypeDesc.ofDescriptor("([ZII)V"),ClassFile.ACC_PUBLIC|ClassFile.ACC_STATIC,
                m -> m.aload(0).iload(1).iload(2).bastore().return_());
            c.withMethodBody("swap",MethodTypeDesc.ofDescriptor("(II)I"),ClassFile.ACC_PUBLIC|ClassFile.ACC_STATIC,
                m -> m.iload(0).iload(1).swap().isub().ireturn());
            c.withMethodBody("pop2",MethodTypeDesc.ofDescriptor("(III)I"),ClassFile.ACC_PUBLIC|ClassFile.ACC_STATIC,
                m -> m.iload(0).iload(1).iload(2).pop2().ireturn());
        });
        return MethodHandles.lookup().defineClass(bytes);
    }
    static void child() throws Exception {
        WhiteBox wb=WhiteBox.getWhiteBox(); Side side=new Side(); Object token=new Object();
        byte[] ba=new byte[4];char[] ca=new char[4];short[] sa=new short[4];Object[] oa=new String[4];int[] ia=new int[4];boolean[] za=new boolean[4];
        RuntimeException exception=new IllegalStateException("identity");
        Class<?> raw=raw(); Method bool=raw.getMethod("booleans",boolean[].class,int.class,int.class), swap=raw.getMethod("swap",int.class,int.class), pop2=raw.getMethod("pop2",int.class,int.class,int.class);
        for(int i=0;i<64;i++) {
            check(string()=="direct constant identity" && mirror()==Cold.class && initialized==0);
            try { throwing(side,exception); throw new AssertionError(); } catch(RuntimeException e) { check(e==exception); }
            check(bytes(ba,1,255)==-1 && ba[1]==-1);
            check(chars(ca,1,-1)==65535 && ca[1]==65535);
            check(shorts(sa,1,65535)==-1 && sa[1]==-1);
            check(references(side,oa,1,"x")=="x" && oa[1]=="x");
            check(field(side,token)==token && side.value==token);
            ia[1]=i;check(compound(ia,1,7)==i+7 && ia[1]==i+7);
            check(divide(side,-17,3)==-5 && remainder(side,-17,3)==-2);
            check(dense(1)==37 && sparse(700000)==61);
            bool.invoke(null,za,1,i);check(za[1]==((i&1)!=0));
            check((int)swap.invoke(null,11,4)==-7 && (int)pop2.invoke(null,11,4,5)==11);
            Thread.sleep(1);
        }
        for(String name:new String[]{"string","mirror"}) await(wb,DirectBaselineCommonTest.class.getDeclaredMethod(name));
        for(Method m:DirectBaselineCommonTest.class.getDeclaredMethods()) {
            if(java.util.Set.of("throwing","bytes","chars","shorts","references","field","compound","divide","remainder","dense","sparse").contains(m.getName())) await(wb,m);
        }
        await(wb,bool);await(wb,swap);await(wb,pop2);
        // The constant itself must stay a root while the callee performs GC.
        for(int i=0;i<64;i++) { check(constantGC()=="direct constant GC root");Thread.sleep(1); }
        await(wb,DirectBaselineCommonTest.class.getDeclaredMethod("constantGC"));
        check(constantGC()=="direct constant GC root");
        check(divide(side,Integer.MIN_VALUE,-1)==Integer.MIN_VALUE);
        check(remainder(side,Integer.MIN_VALUE,-1)==0 && remainder(side,17,-3)==2);
        check(dense(-2)==17 && dense(-1)==23 && dense(0)==31 && dense(2)==41 && dense(Integer.MIN_VALUE)==-7);
        check(sparse(Integer.MIN_VALUE)==53 && sparse(-100000)==59 && sparse(Integer.MAX_VALUE)==67 && sparse(0)==-11);
        int before=side.before;
        try { throwing(side,null);throw new AssertionError(); } catch(NullPointerException expected) { check(side.before==++before); }
        try { divide(side,13,0);throw new AssertionError(); } catch(ArithmeticException expected) { check(side.before==++before); }
        try { remainder(side,13,0);throw new AssertionError(); } catch(ArithmeticException expected) { check(side.before==++before); }
        try { references(side,oa,1,token);throw new AssertionError(); } catch(ArrayStoreException expected) { check(side.before==++before && oa[1]=="x"); }
        try { references(side,oa,-1,token);throw new AssertionError(); } catch(ArrayIndexOutOfBoundsException expected) { check(side.before==++before); }
        try { references(side,null,-1,token);throw new AssertionError(); } catch(NullPointerException expected) { check(side.before==++before); }
        check(references(side,oa,1,null)==null && oa[1]==null);
        // Old array / young referent exercises the collector's array-store barrier.
        Object[] old=new Object[8];System.gc();Object young=new Object();
        check(references(side,old,3,young)==young);System.gc();check(old[3]==young);
        System.out.println("DIRECT_COMMON_OK");
    }
    public static void main(String[] args) throws Exception {
        if(args.length!=0) { child();return; }
        for(String gc:new String[]{"-XX:+UseSerialGC","-XX:+UseG1GC"}) {
            ProcessTools.executeTestJava("-Xbootclasspath/a:.",
                "-XX:+UnlockExperimentalVMOptions","-XX:+UnlockDiagnosticVMOptions","-XX:+WhiteBoxAPI",
                "-XX:+UseDirectBaseline","-XX:-DirectBaselineDedicatedWorker","-XX:+TraceDirectBaseline",
                "-XX:HeapBaseMinAddress=32g","-Xmx64m",gc,
                "-XX:CompileCommand=dontinline,DirectBaselineCommonTest*::*",
                "-XX:CompileCommand=dontinline,DirectBaselineRawStack::*",
                DirectBaselineCommonTest.class.getName(),"child")
                .shouldHaveExitValue(0).shouldContain("DIRECT_COMMON_OK")
                .shouldContain("direct install throwing(").shouldContain("direct install references(")
                .shouldContain("direct install constantGC(").shouldContain("direct install dense(")
                .shouldContain("direct install sparse(").shouldContain("direct install booleans(");
        }
    }
}
