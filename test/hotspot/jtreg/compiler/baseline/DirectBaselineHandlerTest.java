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
 * @summary Direct handler ordering, TLS entries, roots, long state, constructor unwind and recursive lookup deoptimization
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @modules jdk.management.agent
 * @library /test/lib
 * @compile DirectBaselineHandlerLookup.jasm
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver DirectBaselineHandlerTest
 */
import java.lang.invoke.MethodHandles;
import java.lang.reflect.Executable;
import java.lang.reflect.Method;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselineHandlerTest {
    public static class Side {
        public int before,calls,catches,finallys,kind,rethrows;
        public Object seen,allocated;
        public Throwable caught;
        public long value;
    }
    static class Box { long value=0x1234567887654321L; }
    static class Product {
        final Object token;final long value;
        Product(Side side,Object token,long value,int mode,RuntimeException error) {
            this.token=token;this.value=value;side.allocated=this;side.calls++;
            if(mode!=0) { System.gc();throw error; }
        }
    }
    static long callee(Side side,Object token,long value,int mode,RuntimeException error) {
        side.calls++;side.seen=token;side.value=value;
        if(mode!=0)throw error;
        return value^0x1122334455667788L;
    }
    static Object pass(Object token) { System.gc();return token; }
    static long nested(Side side,Object token,long value,int mode,RuntimeException error) {
        try {
            side.before++;return callee(side,token,value,mode,error);
        } catch(IllegalArgumentException e) {
            side.catches++;side.kind=1;side.caught=e;side.seen=pass(token);return value+1;
        } catch(RuntimeException e) {
            side.catches++;side.kind=2;side.caught=e;side.seen=pass(token);return value+2;
        } finally { side.finallys++;side.value=value^31; }
    }
    static int explicit(Side side,RuntimeException error) {
        side.before++;
        try { throw error; }
        catch(IllegalStateException e) { side.caught=e;side.kind=3;side.catches++;return 7; }
        catch(RuntimeException e) { side.caught=e;side.kind=4;side.catches++;return 8; }
    }
    static int multi(Side side,RuntimeException error) {
        side.before++;
        try { throw error; }
        catch(IllegalArgumentException|IllegalStateException e) { side.catches++;side.caught=e;return 11; }
    }
    static void rethrow(Side side,RuntimeException error) {
        try {
            try { side.before++;throw error; }
            catch(IllegalArgumentException e) { side.rethrows++;throw e; }
        } finally { side.finallys++; }
    }
    static Object retain(Object token,Object array) { if(token==null)throw new AssertionError();return array; }
    static Object arrays(Side side,Object token,int length) {
        side.before++;
        try { return retain(token,new Object[length]); }
        catch(NegativeArraySizeException e) { side.catches++;side.caught=e;side.seen=pass(token);return null; }
    }
    static long guards(Side side,Box box,int[] array,int index,int divisor) {
        side.before++;
        try { return box.value+array[index]/divisor; }
        catch(NullPointerException|IndexOutOfBoundsException|ArithmeticException e) {
            side.catches++;side.caught=e;return 63;
        } finally { side.finallys++; }
    }
    static Product constructor(Side side,Object token,long value,int mode,RuntimeException error) {
        side.before++;
        try { return new Product(side,token,value,mode,error); }
        catch(IllegalStateException e) { side.catches++;side.caught=e;side.seen=pass(token);return null; }
    }
    static void check(boolean b) { if(!b)throw new AssertionError(); }
    static void await(WhiteBox wb,Executable method,int level) throws Exception {
        long end=System.nanoTime()+20_000_000_000L;
        while(wb.getMethodCompilationLevel(method)!=level) {
            if(System.nanoTime()>end)throw new AssertionError("missing level "+level+": "+method);
            Thread.sleep(5);
        }
    }
    static void child() throws Throwable {
        WhiteBox wb=WhiteBox.getWhiteBox();Side side=new Side();Box box=new Box();Object token=new Object();
        RuntimeException argument=new IllegalArgumentException("argument"),state=new IllegalStateException("state");
        Method callee=DirectBaselineHandlerTest.class.getDeclaredMethod("callee",Side.class,Object.class,long.class,int.class,RuntimeException.class);
        var product=Product.class.getDeclaredConstructor(Side.class,Object.class,long.class,int.class,RuntimeException.class);
        check(wb.enqueueMethodForCompilation(callee,4));await(wb,callee,4);
        check(wb.enqueueMethodForCompilation(product,3));await(wb,product,3);
        int[] array={17};long value=0x7766554433221100L;
        for(int i=0;i<64;i++) {
            check(nested(side,token,value,i&1,argument)==((i&1)==0 ? value^0x1122334455667788L:value+1));
            check(explicit(side,(i&1)==0 ? state:argument)==((i&1)==0 ? 7:8));
            check(multi(side,(i&1)==0 ? state:argument)==11);
            try { rethrow(side,argument);throw new AssertionError(); } catch(IllegalArgumentException e) {check(e==argument);}
            Object[] made=(Object[])arrays(side,token,3);check(made.length==3);
            check(guards(side,box,array,0,1)==box.value+17);
            Product p=constructor(side,token,value,0,state);check(p.token==token && p.value==value);
            Thread.sleep(1);
        }
        for(Method method:DirectBaselineHandlerTest.class.getDeclaredMethods()) {
            if(java.util.Set.of("nested","explicit","multi","rethrow","arrays","guards","constructor").contains(method.getName()))await(wb,method,1);
        }
        int multiCatches=side.catches;
        check(multi(side,argument)==11 && side.caught==argument && side.catches==multiCatches+1);
        check(multi(side,state)==11 && side.caught==state && side.catches==multiCatches+2);
        int before=side.before,catches=side.catches,finallys=side.finallys,calls=side.calls,rethrows=side.rethrows;
        check(nested(side,token,value,1,state)==value+2 && side.kind==2 && side.caught==state && side.seen==token);
        check(side.before==++before && side.catches==++catches && side.finallys==++finallys && side.calls==++calls && side.value==(value^31));
        check(explicit(side,null)==8 && side.caught instanceof NullPointerException && side.kind==4);
        check(side.before==++before && side.catches==++catches);
        try { rethrow(side,argument);throw new AssertionError(); } catch(IllegalArgumentException e) {check(e==argument);}
        check(side.before==++before && side.rethrows==++rethrows && side.finallys==++finallys);
        check(arrays(side,token,-1)==null && side.seen==token && side.caught instanceof NegativeArraySizeException);
        check(side.before==++before && side.catches==++catches);
        check(guards(side,null,array,0,1)==63 && side.caught instanceof NullPointerException);
        check(side.before==++before && side.catches==++catches && side.finallys==++finallys);
        check(guards(side,box,array,-1,1)==63 && side.caught instanceof IndexOutOfBoundsException);
        check(side.before==++before && side.catches==++catches && side.finallys==++finallys);
        check(guards(side,box,array,0,0)==63 && side.caught instanceof ArithmeticException);
        check(side.before==++before && side.catches==++catches && side.finallys==++finallys);
        check(constructor(side,token,value,1,state)==null && side.caught==state && side.seen==token);
        check(side.before==++before && side.catches==++catches && side.calls==++calls);
        Product escaped=(Product)side.allocated;check(escaped.token==token && escaped.value==value);
        // Replace a C1 constructor callee, then exercise the same exception PC.
        check(wb.enqueueMethodForCompilation(product,4));await(wb,product,4);
        check(constructor(side,token,value+1,1,state)==null && ((Product)side.allocated).value==value+1);
        check(side.before==++before && side.catches==++catches && side.calls==++calls);
        // Recursive catch-class resolution uses the VM's missing-handler
        // deoptimization path. This is an actual athrow, not a guard fallback.
        byte[] bytes;
        try(var in=DirectBaselineHandlerTest.class.getResourceAsStream("/DirectBaselineHandlerLookup.class")) { bytes=in.readAllBytes(); }
        Class<?> lookup=MethodHandles.lookup().defineHiddenClass(bytes,true).lookupClass();
        Method run=lookup.getDeclaredMethod("run",Throwable.class,Side.class,int.class);
        Method shared=lookup.getDeclaredMethod("shared",Throwable.class,Side.class,int.class);
        for(int i=0;i<64;i++) {
            check((int)run.invoke(null,argument,side,0)==0);
            check((int)shared.invoke(null,state,side,i&1)==37 && side.caught==state);
            Thread.sleep(1);
        }
        await(wb,run,1);await(wb,shared,1);
        check((int)shared.invoke(null,argument,side,0)==37 && side.caught==argument);
        check((int)shared.invoke(null,state,side,1)==37 && side.caught==state);
        before=side.before;catches=side.catches;
        if(jdk.test.lib.Platform.isDebugBuild())wb.setBooleanVMFlag("TraceDeoptimization",true);
        try { check((int)run.invoke(null,argument,side,1)==1); }
        finally { if(jdk.test.lib.Platform.isDebugBuild())wb.setBooleanVMFlag("TraceDeoptimization",false); }
        check(side.before==before+1 && side.catches==catches+1 && side.caught instanceof IllegalAccessError);
        System.out.println("DIRECT_HANDLER_LOOKUP_DEOPT_OK");
        System.out.println("DIRECT_HANDLER_OK");
    }
    public static void main(String[] args) throws Throwable {
        if(args.length!=0) { child();return; }
        for(String gc:new String[]{"-XX:+UseSerialGC","-XX:+UseG1GC"}) {
            OutputAnalyzer out=ProcessTools.executeTestJava("-Xbootclasspath/a:.","--add-modules=jdk.management.agent",
                "-XX:+UnlockExperimentalVMOptions","-XX:+UnlockDiagnosticVMOptions","-XX:+WhiteBoxAPI",
                "-XX:+UseDirectBaseline","-XX:-DirectBaselineDedicatedWorker","-XX:+TraceDirectBaseline",
                "-XX:HeapBaseMinAddress=32g","-Xmx64m",gc,
                "-XX:CompileCommand=dontinline,DirectBaselineHandlerTest*::*",
                "-XX:CompileCommand=dontinline,DirectBaselineHandlerLookup*::*",
                DirectBaselineHandlerTest.class.getName(),"child");
            out.shouldHaveExitValue(0).shouldContain("DIRECT_HANDLER_OK").shouldContain("DIRECT_HANDLER_LOOKUP_DEOPT_OK")
                .shouldContain("direct install nested(").shouldContain("direct install arrays(")
                .shouldContain("direct install constructor(").shouldContain("direct install run(")
                .shouldContain("direct install multi(").shouldContain("direct install shared(");
            if(jdk.test.lib.Platform.isDebugBuild())out.shouldContain("DEOPT PACKING");
        }
    }
}
