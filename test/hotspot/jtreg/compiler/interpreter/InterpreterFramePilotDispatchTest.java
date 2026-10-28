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
 * @summary Virtual/interface interpreter-frame calls preserve dispatch, roots, errors and native caller continuation
 * @requires (os.arch == "amd64" | os.arch == "x86_64") & vm.compiler1.enabled & vm.compiler2.enabled
 * @library /test/lib
 * @modules jdk.compiler/com.sun.tools.javac.util
 * @compile ../../runtime/linkResolver/InterfaceObjectMethodSites.jasm
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver InterpreterFramePilotDispatchTest
 */
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.lang.invoke.MethodHandles;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.function.Supplier;
import java.util.function.Predicate;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class InterpreterFramePilotDispatchTest {
    static WhiteBox WB;
    static int effects;
    static final int CONTINUATIONS=32;
    interface Op { int apply(int x); }
    static class Base { int value(int x){effects++;return x*2;}final int finalValue(int x){effects++;return x*11;} }
    static class A extends Base implements Op {
        @Override int value(int x){effects++;return x*5;}
        public int apply(int x){effects++;if(x<0)throw new IllegalArgumentException("target");return x+1;}
    }
    static class B extends A {
        @Override int value(int x){effects++;return x*7;}
        @Override public int apply(int x){effects++;if(x<0)throw new IllegalArgumentException("target");return x*3;}
    }
    interface Parent { default int value(int x){effects++;return x+41;} }
    interface Child extends Parent { }
    interface Private {
        private int secret(int x){effects++;return x+2;}
        default int callPrivate(int x){return secret(x)+17;}
    }
    static class Defaults implements Child,Private { }
    static class Token { int value=379; }
    static class Holder { Object value;Holder(Object value){this.value=value;} }
    interface Ref { Object get(Holder holder); }
    static class GCRef implements Ref {
        boolean returnToken;
        public Object get(Holder holder){effects++;holder.value=null;WB.fullGC();if(!returnToken)return null;Token result=new Token();result.value=853;return result;}
    }
    static int virtualCall(Base receiver,int x){return receiver.value(x)+7;}
    static int finalCall(Base receiver,int x){return receiver.finalValue(x)+11;}
    static int interfaceCall(Op receiver,int x){return receiver.apply(x)+13;}
    static int defaultCall(Child receiver,int x){return receiver.value(x)+19;}
    static Object interfaceRoots(Ref receiver,Holder holder){Object keep=holder.value;Object result=receiver.get(holder);return result==null?keep:result;}
    static int voidInterface(Runnable receiver){receiver.run();return 17;}
    static int booleanInterface(Predicate<Object> receiver,Object value){return receiver.test(value)?1:0;}
    static class RunnableValue implements Runnable {
        public void run(){effects++;}
        public int hashCode(){return 101;}
    }
    static class Named implements InterfaceObjectMethodNamed { public String toString(){return "named";} }
    interface Throwing { void run()throws Throwable; }
    static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);}
    static Method method(String name,Class<?>... args)throws Exception{return InterpreterFramePilotDispatchTest.class.getDeclaredMethod(name,args);}
    static long[] query(Method m,int action){return WB.interpreterFramePilot(m,action);}
    static long resumes(Method m){return query(m,3)[CONTINUATIONS];}
    static void prepare(Method m,int action){
        WB.markMethodProfiled(m);WB.makeMethodNotCompilable(m);WB.testSetDontInlineMethod(m,true);
        long[] data=query(m,action);check(data[0]==1 && data[8]!=0 && !WB.isMethodCompiled(m),"prepare "+m+Arrays.toString(data));
    }
    static void expect(Class<? extends Throwable> type,Throwing action)throws Throwable {
        try{action.run();}catch(Throwable failure){
            if(failure instanceof InvocationTargetException wrapper)failure=wrapper.getCause();
            check(failure.getClass()==type,"expected "+type+", got "+failure);return;
        }
        throw new AssertionError("missing "+type);
    }
    static Method objectSite(String name,ClassDesc owner,String target,MethodTypeDesc type,boolean integer)throws Exception {
        byte[] bytes=ClassFile.of().build(ClassDesc.of(name),c -> c.withFlags(ClassFile.ACC_PUBLIC)
            .withMethodBody("body",MethodTypeDesc.ofDescriptor(integer?"(Ljava/lang/Object;)I":"(Ljava/lang/Object;)Ljava/lang/Object;"),
                ClassFile.ACC_PUBLIC|ClassFile.ACC_STATIC,m -> {
                    m.aload(0);if(type.parameterCount()==1)m.iconst_1();
                    m.invokeinterface(owner,target,type);
                    if(integer)m.iconst_1().iadd().ireturn();else m.astore(1).aload(1).areturn();
                }));
        Class<?> klass=MethodHandles.lookup().defineClass(bytes);WB.linkClass(klass);
        return klass.getDeclaredMethod("body",Object.class);
    }
    static Op missingImplementation()throws Exception {
        byte[] bytes=ClassFile.of().build(ClassDesc.of("PilotMissingImplementation"),c -> c.withFlags(ClassFile.ACC_PUBLIC)
            .withInterfaceSymbols(ClassDesc.of("InterpreterFramePilotDispatchTest$Op"))
            .withMethodBody("<init>",MethodTypeDesc.ofDescriptor("()V"),ClassFile.ACC_PUBLIC,
                m -> m.aload(0).invokespecial(ClassDesc.of("java.lang.Object"),"<init>",MethodTypeDesc.ofDescriptor("()V")).return_()));
        return (Op)MethodHandles.lookup().defineClass(bytes).getDeclaredConstructor().newInstance();
    }
    static void compile(Method target,int level)throws Exception {
        WB.markMethodProfiled(target);WB.testSetDontInlineMethod(target,true);
        check(WB.enqueueMethodForCompilation(target,level),"enqueue "+target+" level "+level);
        long end=System.nanoTime()+20_000_000_000L;
        while(WB.getMethodCompilationLevel(target)!=level){check(System.nanoTime()<end,"compiled target "+target);Thread.sleep(2);}
    }
    static void child(int action,boolean mixed)throws Throwable {
        WB=WhiteBox.getWhiteBox();A a=new A();B b=new B();Defaults defaults=new Defaults();GCRef gc=new GCRef();
        RunnableValue runnable=new RunnableValue();Predicate<Object> predicate=value -> value instanceof Token;
        Method virtual=method("virtualCall",Base.class,int.class),fin=method("finalCall",Base.class,int.class),
            face=method("interfaceCall",Op.class,int.class),def=method("defaultCall",Child.class,int.class),
            roots=method("interfaceRoots",Ref.class,Holder.class),priv=Private.class.getDeclaredMethod("callPrivate",int.class);
        Method voidCall=method("voidInterface",Runnable.class),boolCall=method("booleanInterface",Predicate.class,Object.class);
        virtualCall(a,1);virtualCall(b,1);finalCall(a,1);interfaceCall(a,1);interfaceCall(b,1);defaultCall(defaults,1);defaults.callPrivate(1);
        interfaceRoots(gc,new Holder(new Token()));
        voidInterface(runnable);booleanInterface(predicate,new Token());
        for(Method m:new Method[]{virtual,fin,face,def,roots,priv,voidCall,boolCall})prepare(m,action);
        effects=0;
        for(int x=0;x<20;x++)check(virtualCall(a,x)==x*5+7 && virtualCall(b,x)==x*7+7 && finalCall(a,x)==x*11+11 &&
            interfaceCall(a,x)==x+14 && interfaceCall(b,x)==x*3+13 && defaultCall(defaults,x)==x+60 && defaults.callPrivate(x)==x+19,
            "override/vfinal/itable/default/private results");
        check(effects==140,"dispatch targets execute once");
        for(Method m:new Method[]{virtual,fin,face,def,priv})check(resumes(m)>=20,"generated continuation "+m);
        Object token=interfaceRoots(gc,new Holder(new Token()));check(token instanceof Token && ((Token)token).value==379 && resumes(roots)>0,"sole local oop survives interface GC call");
        gc.returnToken=true;token=interfaceRoots(gc,new Holder(new Token()));check(token instanceof Token && ((Token)token).value==853,"distinct interface oop return survives GC");
        effects=0;check(voidInterface(runnable)==17 && effects==1 && resumes(voidCall)>0,"void interface return stack");
        check(booleanInterface(predicate,new Token())==1 && booleanInterface(predicate,new Object())==0 && resumes(boolCall)>=2,"narrow boolean interface return and branch");
        long before=resumes(face);effects=0;
        expect(IllegalArgumentException.class,()->interfaceCall(a,-1));check(effects==1 && resumes(face)==before,"callee exception not replayed");
        expect(NullPointerException.class,()->interfaceCall(null,1));expect(NullPointerException.class,()->virtualCall(null,1));
        expect(NullPointerException.class,()->finalCall(null,1));
        Op missing=missingImplementation();before=resumes(face);
        expect(AbstractMethodError.class,()->interfaceCall(missing,1));check(resumes(face)==before,"ordinary itable missing-method cleanup");
        Method hash=objectSite("PilotInterfaceHash",ClassDesc.of("java.lang.Runnable"),"hashCode",MethodTypeDesc.ofDescriptor("()I"),true);
        Method klass=objectSite("PilotInterfaceClass",ClassDesc.of("java.lang.Runnable"),"getClass",MethodTypeDesc.ofDescriptor("()Ljava/lang/Class;"),false);
        Method named=objectSite("PilotInterfaceNamed",ClassDesc.of("InterfaceObjectMethodNamed"),"toString",MethodTypeDesc.ofDescriptor("()Ljava/lang/String;"),false);
        Method defaultHash=objectSite("PilotInterfaceDefault",ClassDesc.of("InterfaceObjectMethodDefaultHash"),"hashCode",MethodTypeDesc.ofDescriptor("()I"),true);
        Method apply=objectSite("PilotInterfaceApply",ClassDesc.of("InterpreterFramePilotDispatchTest$Op"),"apply",MethodTypeDesc.ofDescriptor("(I)I"),true);
        Named namedValue=new Named();Object wrong=new Object();
        Object badHash=Class.forName("InterfaceObjectMethodBadHash").getDeclaredConstructor().newInstance();
        Object missingHash=Class.forName("InterfaceObjectMethodMissingHash").getDeclaredConstructor().newInstance();
        Object defaultValue=Class.forName("InterfaceObjectMethodDefaultHashImpl").getDeclaredConstructor().newInstance();
        for(Method m:new Method[]{hash,klass,named,defaultHash,apply})prepare(m,action);
        expect(IncompatibleClassChangeError.class,()->hash.invoke(null,wrong)); // unresolved native fallback
        check((int)hash.invoke(null,runnable)==102 && (int)hash.invoke(null,runnable)==102,"forced virtual hash result");
        check(klass.invoke(null,runnable)==RunnableValue.class && klass.invoke(null,runnable)==RunnableValue.class,"forced vfinal getClass");
        check(named.invoke(null,namedValue).equals("named") && named.invoke(null,namedValue).equals("named"),"redeclared Object method");
        check((int)defaultHash.invoke(null,defaultValue)==System.identityHashCode(defaultValue)+1 &&
            (int)defaultHash.invoke(null,defaultValue)==System.identityHashCode(defaultValue)+1,"Object method ignores interface default");
        check((int)apply.invoke(null,a)==3 && (int)apply.invoke(null,a)==3,"ordinary itable wrapper control");
        for(Method m:new Method[]{hash,klass,named,defaultHash,apply})check(resumes(m)>0,"cached generated post-call operation "+m);
        before=resumes(hash);
        expect(IncompatibleClassChangeError.class,()->hash.invoke(null,wrong));
        expect(IncompatibleClassChangeError.class,()->klass.invoke(null,wrong));
        expect(IncompatibleClassChangeError.class,()->named.invoke(null,wrong));
        expect(IncompatibleClassChangeError.class,()->defaultHash.invoke(null,wrong));
        expect(IncompatibleClassChangeError.class,()->apply.invoke(null,wrong));
        expect(IllegalAccessError.class,()->hash.invoke(null,badHash));
        expect(AbstractMethodError.class,()->hash.invoke(null,missingHash));
        expect(NullPointerException.class,()->hash.invoke(null,new Object[]{null}));
        check(resumes(hash)==before,"dispatch errors do not return/reexecute");
        check((int)hash.invoke(null,runnable)==102 && resumes(hash)>before,"cached error recovery");
        // This complete helper is in the retained startup census (895 entries).
        Class<?> asserts=Class.forName("com.sun.tools.javac.util.Assert");Method actual=asserts.getMethod("checkNonNull",Object.class,Supplier.class);
        Supplier<String> message=()->{effects++;return "pilot-message";};Token keep=new Token();
        check(actual.invoke(null,keep,message)==keep,"javac nonnull oracle");prepare(actual,action);
        check(actual.invoke(null,keep,message)==keep,"javac generated common path");effects=0;
        for(int n=0;n<2;n++)expect(AssertionError.class,()->actual.invoke(null,null,message));
        check(effects==2 && resumes(actual)>0,"real javac supplier/cast/error path returns into generated code");
        if(mixed) {
            check(WB.getBooleanVMFlag("ProfileInterpreter") && WB.getMethodData(face)!=0,"mixed-mode interface profiles enabled");
            Method[] targets={A.class.getDeclaredMethod("value",int.class),B.class.getDeclaredMethod("value",int.class),
                A.class.getDeclaredMethod("apply",int.class),B.class.getDeclaredMethod("apply",int.class),Base.class.getDeclaredMethod("finalValue",int.class)};
            for(int level:new int[]{1,4}) {
                for(Method target:targets)compile(target,level);
                before=resumes(face);effects=0;
                check(virtualCall(a,3)==22 && virtualCall(b,3)==28 && finalCall(b,3)==44 && interfaceCall(a,3)==17 && interfaceCall(b,3)==22 &&
                    effects==5 && resumes(face)>=before+2,"mixed compiled virtual/interface targets level "+level);
                before=resumes(face);effects=0;expect(IllegalArgumentException.class,()->interfaceCall(b,-1));
                check(effects==1 && resumes(face)==before,"compiled interface callee exception level "+level);
                for(Method target:targets)WB.deoptimizeMethod(target);
            }
            before=resumes(face);check(interfaceCall(a,4)==18 && resumes(face)>before,"interpreted interface target after deopt");
        }
        System.out.println("PILOT_DISPATCH_OK action="+action+" mixed="+mixed);
    }
    public static void main(String[] args)throws Throwable {
        if(args.length>0){child(Integer.parseInt(args[0]),args.length>1);return;}
        for(int action:new int[]{0,4,5})for(String collector:new String[]{"-XX:+UseSerialGC","-XX:+UseG1GC"}) {
            ProcessTools.executeTestJava("-Xbootclasspath/a:.","-Xint","-Xmx96m",collector,
                "--add-exports=jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED",
                "-XX:+UnlockExperimentalVMOptions","-XX:+UnlockDiagnosticVMOptions","-XX:+WhiteBoxAPI","-XX:+UseInterpreterFramePilot",
                InterpreterFramePilotDispatchTest.class.getName(),Integer.toString(action)).shouldHaveExitValue(0).shouldContain("PILOT_DISPATCH_OK");
        }
        var profiled=ProcessTools.executeTestJava("-Xbootclasspath/a:.","-Xmx96m","-XX:+UseG1GC","-XX:CompileThresholdScaling=100",
            "--add-exports=jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED",
            "-XX:+UnlockExperimentalVMOptions","-XX:+UnlockDiagnosticVMOptions","-XX:+WhiteBoxAPI","-XX:+UseInterpreterFramePilot",
            "-XX:CompileCommand=print,InterpreterFramePilotDispatchTest::interfaceCall",
            InterpreterFramePilotDispatchTest.class.getName(),"5","mixed").shouldHaveExitValue(0).shouldContain("PILOT_DISPATCH_OK");
        String data=null;
        for(String section:profiled.getOutput().split("-{20,}\\R"))
            if(section.contains("::interfaceCall(")){data=section;break;}
        check(data!=null,"interface method data printed");
        for(String receiver:new String[]{"A","B"}) {
            String pattern=java.util.regex.Pattern.quote("InterpreterFramePilotDispatchTest$"+receiver)+"'?\\(24[ )]";
            check(java.util.regex.Pattern.compile(pattern).matcher(data).results().count()==1,"once-only receiver profile "+receiver+"\n"+data);
        }
        System.out.println(data);System.out.println("PILOT_INTERFACE_PROFILE_COUNTS_OK A=24 B=24");
    }
}
