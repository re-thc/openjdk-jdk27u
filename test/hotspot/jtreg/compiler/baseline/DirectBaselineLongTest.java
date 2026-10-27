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
 * @summary Direct long slots, arithmetic, mixed calling conventions, roots, deoptimization and exceptions
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver DirectBaselineLongTest
 */
import java.lang.classfile.ClassFile;
import java.lang.classfile.CodeBuilder;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.lang.invoke.MethodHandles;
import java.lang.reflect.Executable;
import java.lang.reflect.Method;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselineLongTest {
    static WhiteBox wb;
    static Method callerMethod;
    static volatile boolean stop=true;
    static long staticLong=0x89abcdef01234567L;
    static class Side { volatile int started;int mode,calls,before;Object token,other,third,seen;long seenLong; }
    static class Box {
        long value;volatile long ordered;final long finalValue;final Object marker;
        Box(Object token,long value,int mode) {
            this.value=value;ordered=value;finalValue=value;marker=token;
            if(mode!=0)System.gc();
        }
    }
    interface Op { long apply(Object token,Side side,long a,int b,Object other,long c,int d,long e,Object third,long f,long g); }
    static class A implements Op {
        public long apply(Object token,Side side,long a,int b,Object other,long c,int d,long e,Object third,long f,long g) {
            return target(token,side,a,b,other,c,d,e,third,f,g);
        }
    }
    static class B implements Op {
        public long apply(Object token,Side side,long a,int b,Object other,long c,int d,long e,Object third,long f,long g) {
            return target(token,side,a,b,other,c,d,e,third,f,g)^0x5566778899aabbccL;
        }
    }
    static long arithmetic(long a,long b,int n) {
        return (a+b)*17+(a-b)*31+(a*b)*7+(a&b)*11+(a|b)*12+(a^b)*19-(a<<n)*23+(a>>n)*29+(a>>>n)*30;
    }
    static long expected(long a,long b,int n) {
        return (a+b)*17+(a-b)*31+(a*b)*7+(a&b)*11+(a|b)*12+(a^b)*19-(a<<n)*23+(a>>n)*29+(a>>>n)*30;
    }
    static int expectedCompare(long a,long b) { return a<b ? -1 : a==b ? 0 : 1; }
    static long divide(Side side,long a,long b) { side.before++;return a/b; }
    static long remainder(Side side,long a,long b) { side.before++;return a%b; }
    static int compare(long a,long b) { if(a<b)return -1;if(a==b)return 0;return 1; }
    static long conversions(int a,long b) { return (long)a+(int)b; }
    static long staticRead() { return staticLong; }
    static long fields(Box box,long value) { box.value=value;box.ordered=~value;return box.value^box.ordered; }
    static long fieldAssignment(Box box,long value) { return box.value=value; }
    static long ordered(Box box) { return box.ordered; }
    static long arrays(long[] array,int index,long value) { return array[index]=value; }
    static long arrayCompound(long[] array,int index,long value) { return array[index]+=value; }
    static Box allocate(Object token,long value,int mode) { return new Box(token,value,mode); }
    static Object pass(Object token) { System.gc();return token; }
    static long joins(Object token,long value,int branch) {
        long result;
        if(branch==0) { long reused=value+1;result=reused^2; }
        else { Object reused=token;pass(reused);result=value-3; }
        pass(token);return result;
    }
    static long loop(Object token,Side side,long n) {
        long result=0;for(long i=0;i<n;i++)result+=i;
        side.seen=token;return result;
    }
    static long migrate(Side side,Object token) {
        side.started=1;long result=0;while(!stop)result++;
        side.seen=token;side.seenLong=result;return result;
    }
    static long target(Object token,Side side,long a,int b,Object other,long c,int d,long e,Object third,long f,long g) {
        if(token!=side.token || other!=side.other || third!=side.third)throw new AssertionError("argument identity");
        side.calls++;side.seen=token;side.seenLong=a^c^e^f^g;
        if(side.mode!=0)System.gc();
        if(side.mode==2 && wb.deoptimizeMethod(callerMethod)==0)throw new AssertionError("caller not deoptimized");
        return a+b+3*c+d+5*e+7*f+11*g;
    }
    static long caller(Object token,Side side,long a,int b,Object other,long c,int d,long e,Object third,long f,long g) {
        long retained=a^0x1234567887654321L;
        return retained+target(token,side,a,b,other,c,d,e,third,f,g);
    }
    static long dynamic(Op op,Object token,Side side,long a,int b,Object other,long c,int d,long e,Object third,long f,long g) {
        return op.apply(token,side,a,b,other,c,d,e,third,f,g);
    }
    static void check(boolean b) { if(!b)throw new AssertionError(); }
    static void await(Executable method,int level) throws Exception {
        long end=System.nanoTime()+20_000_000_000L;
        while(wb.getMethodCompilationLevel(method)!=level) {
            if(System.nanoTime()>end)throw new AssertionError("missing level "+level+": "+method);
            Thread.sleep(5);
        }
    }
    static void foldInt(CodeBuilder m) { m.bipush(31).imul().iadd(); }
    static void foldLong(CodeBuilder m) { m.ldc(31L).lmul().ladd(); }
    static Class<?> raw() throws Exception {
        ClassDesc owner=ClassDesc.of("DirectBaselineLongTest");MethodTypeDesc pass=MethodTypeDesc.ofDescriptor("(Ljava/lang/Object;)Ljava/lang/Object;");
        return MethodHandles.lookup().defineClass(ClassFile.of().build(ClassDesc.of("DirectBaselineLongRaw"),c -> {
            int flags=ClassFile.ACC_PUBLIC|ClassFile.ACC_STATIC;
            c.withMethodBody("head",MethodTypeDesc.ofDescriptor("(JLjava/lang/Object;)J"),flags,
                m -> m.iconst_4().istore(0).aload(2).invokestatic(owner,"pass",pass).pop().iload(0).i2l().lreturn());
            c.withMethodBody("tail",MethodTypeDesc.ofDescriptor("(JLjava/lang/Object;)J"),flags,
                m -> m.iconst_5().istore(1).aload(2).invokestatic(owner,"pass",pass).pop().iload(1).i2l().lreturn());
            c.withMethodBody("overlap",MethodTypeDesc.ofDescriptor("(JJLjava/lang/Object;)J"),flags,
                m -> m.lconst_1().lstore(1).aload(4).invokestatic(owner,"pass",pass).pop().lload(1).lreturn());
            c.withMethodBody("dupLong",MethodTypeDesc.ofDescriptor("()J"),flags,
                m -> m.ldc(7L).dup2().ladd().lreturn());
            c.withMethodBody("dupX2",MethodTypeDesc.ofDescriptor("()J"),flags,
                m -> { m.ldc(7L).iconst_3().dup_x2().pop().l2i();foldInt(m);m.i2l().lreturn(); });
            c.withMethodBody("dup2X1Long",MethodTypeDesc.ofDescriptor("()J"),flags,
                m -> { m.iconst_3().ldc(7L).dup2_x1().l2i();foldInt(m);m.i2l();foldLong(m);m.lreturn(); });
            c.withMethodBody("dup2X1Ints",MethodTypeDesc.ofDescriptor("()J"),flags,
                m -> { m.iconst_3().iconst_5().bipush(7).dup2_x1();for(int j=0;j<4;j++)foldInt(m);m.i2l().lreturn(); });
            c.withMethodBody("dup2X2Longs",MethodTypeDesc.ofDescriptor("()J"),flags,
                m -> { m.ldc(7L).ldc(11L).dup2_x2();foldLong(m);foldLong(m);m.lreturn(); });
            c.withMethodBody("dup2X2LongTop",MethodTypeDesc.ofDescriptor("()J"),flags,
                m -> { m.iconst_3().iconst_5().ldc(13L).dup2_x2().l2i();foldInt(m);foldInt(m);m.i2l();foldLong(m);m.lreturn(); });
            c.withMethodBody("dup2X2IntsTop",MethodTypeDesc.ofDescriptor("()J"),flags,
                m -> { m.ldc(7L).iconst_3().iconst_5().dup2_x2();foldInt(m);m.i2l();foldLong(m);m.l2i();foldInt(m);foldInt(m);m.i2l().lreturn(); });
            c.withMethodBody("dup2X2Ints",MethodTypeDesc.ofDescriptor("()J"),flags,
                m -> { m.iconst_2().iconst_3().iconst_5().bipush(7).dup2_x2();for(int j=0;j<5;j++)foldInt(m);m.i2l().lreturn(); });
            c.withMethodBody("popLong",MethodTypeDesc.ofDescriptor("()J"),flags,
                m -> m.ldc(7L).ldc(11L).pop2().lreturn());
        }));
    }
    static void child() throws Exception {
        wb=WhiteBox.getWhiteBox();
        Method expected=DirectBaselineLongTest.class.getDeclaredMethod("expected",long.class,long.class,int.class);
        wb.makeMethodNotCompilable(expected,3);wb.makeMethodNotCompilable(expected,4);
        Method expectedCompare=DirectBaselineLongTest.class.getDeclaredMethod("expectedCompare",long.class,long.class);
        wb.makeMethodNotCompilable(expectedCompare,3);wb.makeMethodNotCompilable(expectedCompare,4);
        Side side=new Side();side.token=new Object();side.other=new Object();side.third=new Object();
        Object token=side.token,other=side.other,third=side.third;
        Class<?>[] types={Object.class,Side.class,long.class,int.class,Object.class,long.class,int.class,long.class,Object.class,long.class,long.class};
        callerMethod=DirectBaselineLongTest.class.getDeclaredMethod("caller",types);
        Method target=DirectBaselineLongTest.class.getDeclaredMethod("target",types);
        Method aMethod=A.class.getDeclaredMethod("apply",types),bMethod=B.class.getDeclaredMethod("apply",types);
        check(wb.enqueueMethodForCompilation(target,4));await(target,4);
        check(wb.enqueueMethodForCompilation(aMethod,3));await(aMethod,3);
        check(wb.enqueueMethodForCompilation(bMethod,4));await(bMethod,4);
        Op oa=new A(),ob=new B();Box box=new Box(token,0,0);long[] array=new long[3];
        long x=0x1122334455667788L,y=-0x123456789abcdefL,z=0x7766554433221100L,f=Long.MIN_VALUE,g=Long.MAX_VALUE;
        int b=-17,d=0x55667788;long targetValue=x+b+3*y+d+5*z+7*f+11*g;
        Class<?> raw=raw();String[] names={"dupLong","dupX2","dup2X1Long","dup2X1Ints","dup2X2Longs","dup2X2LongTop","dup2X2IntsTop","dup2X2Ints","popLong"};
        long[] rawExpected={14,220,6827,6616707,10799,392194,4713863,205113179,7};Method[] shuffles=new Method[names.length];
        for(int i=0;i<names.length;i++)shuffles[i]=raw.getMethod(names[i]);
        Method head=raw.getMethod("head",long.class,Object.class),tail=raw.getMethod("tail",long.class,Object.class),overlap=raw.getMethod("overlap",long.class,long.class,Object.class);
        for(int i=0;i<64;i++) {
            check(arithmetic(x,y,i)==expected(x,y,i));check(divide(side,-17,3)==-5 && remainder(side,-17,3)==-2);
            check(compare(x,y)==1 && conversions(-7,0x1122334455667788L)==-7L+(int)0x1122334455667788L);
            check(staticRead()==0x89abcdef01234567L && fields(box,x)==-1 && ordered(box)==~x);
            check(fieldAssignment(box,y)==y && box.value==y);
            check(arrays(array,1,x)==x && array[1]==x && arrayCompound(array,1,y)==x+y);
            Box made=allocate(token,x,0);check(made.finalValue==x && made.value==x && made.ordered==x && made.marker==token);
            check(joins(token,x,i&1)==((i&1)==0 ? ((x+1)^2):x-3));
            check(loop(token,side,4)==6 && migrate(side,token)==0 && side.seen==token);
            check(caller(token,side,x,b,other,y,d,z,third,f,g)==(x^0x1234567887654321L)+targetValue);
            check(dynamic((i&1)==0 ? oa:ob,token,side,x,b,other,y,d,z,third,f,g)==((i&1)==0 ? targetValue:targetValue^0x5566778899aabbccL));
            check((long)head.invoke(null,x,token)==4 && (long)tail.invoke(null,x,token)==5 && (long)overlap.invoke(null,x,y,token)==1);
            for(int j=0;j<shuffles.length;j++)check((long)shuffles[j].invoke(null)==rawExpected[j]);
            Thread.sleep(1);
        }
        for(Method method:DirectBaselineLongTest.class.getDeclaredMethods()) {
            if(java.util.Set.of("arithmetic","divide","remainder","compare","conversions","staticRead","fields","ordered","fieldAssignment","arrays","arrayCompound","allocate","joins","loop","migrate","caller","dynamic").contains(method.getName()))await(method,1);
        }
        for(Method method:raw.getDeclaredMethods())await(method,1);
        long[] values={Long.MIN_VALUE,Long.MAX_VALUE,-1,0,1,0x100000001L,-0x100000001L,x,y};int[] shifts={-129,-65,-64,-1,0,1,31,32,63,64,65,127};
        // Hold arithmetic in direct code throughout all edge cases.
        Method arithmetic=DirectBaselineLongTest.class.getDeclaredMethod("arithmetic",long.class,long.class,int.class);
        wb.makeMethodNotCompilable(arithmetic,3);wb.makeMethodNotCompilable(arithmetic,4);
        for(long v:values)for(long w:values) {
            check(compare(v,w)==expectedCompare(v,w));
            for(int n:shifts)check(arithmetic(v,w,n)==expected(v,w,n));
        }
        check(wb.getMethodCompilationLevel(arithmetic)==1);
        check(divide(side,Long.MIN_VALUE,-1)==Long.MIN_VALUE && remainder(side,Long.MIN_VALUE,-1)==0);
        check(divide(side,Long.MAX_VALUE,3)==Long.MAX_VALUE/3 && remainder(side,Long.MIN_VALUE,3)==Long.MIN_VALUE%3);
        int before=side.before;
        try { divide(side,x,0);throw new AssertionError(); } catch(ArithmeticException e) { check(side.before==++before && e.getStackTrace()[0].getMethodName().equals("divide")); }
        try { remainder(side,x,0);throw new AssertionError(); } catch(ArithmeticException e) { check(side.before==++before); }
        try { fieldAssignment(null,x);throw new AssertionError(); } catch(NullPointerException expectedException) {}
        long prior=array[1];try { arrays(array,-1,y);throw new AssertionError(); } catch(ArrayIndexOutOfBoundsException e) {check(array[1]==prior);}
        try { arrays(null,0,x);throw new AssertionError(); } catch(NullPointerException expectedException) {}
        side.mode=1;int calls=side.calls;
        check(caller(token,side,x,b,other,y,d,z,third,f,g)==(x^0x1234567887654321L)+targetValue && side.calls==calls+1 && side.seen==token && side.seenLong==(x^y^z^f^g));
        check(wb.enqueueMethodForCompilation(aMethod,4));await(aMethod,4);
        check(dynamic(oa,token,side,x,b,other,y,d,z,third,f,g)==targetValue);
        check(wb.getMethodCompilationLevel(callerMethod)==1);
        calls=side.calls;side.mode=2;
        check(caller(token,side,x,b,other,y,d,z,third,f,g)==(x^0x1234567887654321L)+targetValue && side.calls==calls+1);
        check(wb.getMethodCompilationLevel(callerMethod)==0);side.mode=0;
        Box made=allocate(token,y,1);check(made.finalValue==y && made.marker==token);
        long n=2_000_000;check(loop(token,side,n)==n*(n-1)/2 && side.seen==token);
        Method migrate=DirectBaselineLongTest.class.getDeclaredMethod("migrate",Side.class,Object.class);
        stop=false;side.started=0;side.seen=null;
        Thread worker=new Thread(() -> migrate(side,token));worker.start();
        try {
            long end=System.nanoTime()+20_000_000_000L;
            while(wb.getMethodCompilationLevel(migrate,true)==0) {
                if(System.nanoTime()>end)throw new AssertionError("long OSR not installed");
                Thread.sleep(1);
            }
            check(side.started==1 && wb.getMethodCompilationLevel(migrate,true)>=3);
            wb.fullGC();
        } finally { stop=true; }
        worker.join(20000);check(!worker.isAlive() && side.seen==token && side.seenLong>0);
        System.out.println("DIRECT_LONG_OK");
    }
    public static void main(String[] args) throws Exception {
        if(args.length!=0) { child();return; }
        for(String gc:new String[]{"-XX:+UseSerialGC","-XX:+UseG1GC"}) {
            ProcessTools.executeTestJava("-Xbootclasspath/a:.","-XX:+UnlockExperimentalVMOptions","-XX:+UnlockDiagnosticVMOptions","-XX:+WhiteBoxAPI",
                "-XX:+UseDirectBaseline","-XX:-DirectBaselineDedicatedWorker","-XX:+TraceDirectBaseline","-XX:HeapBaseMinAddress=32g","-Xmx64m",gc,
                "-XX:CompileCommand=dontinline,DirectBaselineLongTest*::*","-XX:CompileCommand=dontinline,DirectBaselineLongRaw::*",
                DirectBaselineLongTest.class.getName(),"child").shouldHaveExitValue(0).shouldContain("DIRECT_LONG_OK")
                .shouldContain("direct install caller(").shouldContain("direct install dynamic(")
                .shouldContain("direct install arrayCompound(").shouldContain("direct install overlap(")
                .shouldContain("direct install dup2X2Longs(").shouldContain("direct install loop(");
        }
    }
}
