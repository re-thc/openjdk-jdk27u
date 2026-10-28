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
 * @summary Interpreter-frame callers resume after ordinary direct calls with GC, exceptions and redefinition
 * @requires (os.arch == "amd64" | os.arch == "x86_64") & vm.compiler1.enabled & vm.compiler2.enabled & vm.jvmti & vm.hasJFR
 * @library /test/lib
 * @modules jdk.compiler/com.sun.tools.javac.code
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/native InterpreterFramePilotCallTest
 */
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.lang.reflect.Method;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicReference;
import jdk.jfr.Recording;
import jdk.test.lib.Utils;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class InterpreterFramePilotCallTest {
    static WhiteBox WB;
    static final int CONTINUATIONS=32;
    static int effects;
    static Method control;
    static boolean disabled,record;
    static Recording recording;
    static class Holder { Object value; Holder(Object value){this.value=value;} }
    static class Token { int value=379; }
    static class Base { int value(int x){effects++;return x*3;} }
    static class Caller extends Base { int special(int x){return super.value(x)+11;} }
    static int helper(int x) { effects++;return x*3; }
    static int direct(int x) { return helper(x)+7; }
    static int tail(int x) { return helper(x); }
    static int unsupportedSuccessor(int x) { return switch(helper(x)){case 3->17;case 6->19;default->23;}; }
    static int twice(int x) { return helper(helper(x))+13; }
    static int recursive(int x) { return x==0?1:recursive(x-1)+3; }
    static int stacked(Object token,int x) { return x+gcNumber(token); }
    static int nativeCall(Object token) { return System.identityHashCode(token)+3; }
    static Object gcRef(Object token) { effects++;WB.fullGC();return token; }
    static Object returnRef(Object token) { Object result=gcRef(token);return result==token?result:null; }
    static void consume(Object token) { effects++;WB.fullGC();check(token instanceof Token,"void callee argument"); }
    static int voidCall(Object token) { consume(token);return 37; }
    static int gcNumber(Object token) { effects++;WB.fullGC();check(token instanceof Token,"argument oop survived");return 31; }
    static int clearAndGC(Holder holder) {
        effects++;holder.value=null;WB.fullGC();
        check(StackWalker.getInstance().walk(s -> s.anyMatch(f -> f.getMethodName().equals("roots"))),"suspended interpreted caller walk");
        return 31;
    }
    static Object roots(Holder holder) { Object keep=holder.value;int x=clearAndGC(holder);return x==31?keep:null; }
    static int fail(int x) { effects++;if(x<0)throw new IllegalArgumentException("callee");return x; }
    static int throwing(int x) { return fail(x)+17; }
    static int switchCallee(int x) {
        effects++;
        if(disabled)WB.interpreterFramePilot(control,2);
        if(record){recording=new Recording();recording.enable("jdk.ExecutionSample");recording.start();}
        return x;
    }
    static int guarded(int x) { return switchCallee(x)+23; }
    static int initEffects;
    static class Lazy { static {initEffects++;}static int value(int x){return x+1;} }
    static int initialize(int x) { return Lazy.value(x)+29; }
    static final Object monitor=new Object();
    static volatile boolean entered,released;
    static void await(Holder holder) {
        holder.value=null;entered=true;
        synchronized(monitor) {
            while(!released)try{monitor.wait();}catch(InterruptedException failure){throw new AssertionError(failure);}
        }
    }
    static Object blocked(Holder holder) { Object keep=holder.value;await(holder);return keep==null?null:keep; }
    static Method activeMethod;static boolean deoptActive;
    static void deoptPoint() { if(deoptActive)check(WB.deoptimizeMethod(activeMethod)>0,"active callee nmethod marked"); }
    static int activeCallee(int x) { deoptPoint();return x*5; }
    static int throughActiveDeopt(int x) { return activeCallee(x)+7; }
    static class Loader extends ClassLoader { Class<?> define(byte[] bytes){return defineClass(null,bytes,0,bytes.length);} }
    static native void redefine(Class<?> klass,byte[] bytes);
    static Class<?> redefinedClass;static byte[] redefinedBytes;static boolean redefineNow;
    public static int redefineCallback(int x) {
        if(redefineNow){redefineNow=false;redefine(redefinedClass,redefinedBytes);WB.fullGC();}
        return x*3;
    }
    static byte[] redefineBytes(int add) {
        return ClassFile.of().build(ClassDesc.of("PilotRedefRoot"),c -> c.withFlags(ClassFile.ACC_PUBLIC)
            .withMethodBody("body",MethodTypeDesc.ofDescriptor("(I)I"),ClassFile.ACC_PUBLIC|ClassFile.ACC_STATIC,
                m -> m.iload(0).invokestatic(ClassDesc.of("InterpreterFramePilotCallTest"),"redefineCallback",MethodTypeDesc.ofDescriptor("(I)I"))
                    .bipush(add).iadd().ireturn()));
    }
    static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);}
    static Method method(String name,Class<?>... args)throws Exception{return InterpreterFramePilotCallTest.class.getDeclaredMethod(name,args);}
    static long[] query(Method m,int action){return WB.interpreterFramePilot(m,action);}
    static long resumes(Method m){return query(m,3)[CONTINUATIONS];}
    static void prepare(Method m,int action){
        WB.markMethodProfiled(m);WB.makeMethodNotCompilable(m);WB.testSetDontInlineMethod(m,true);
        long[] data=query(m,action);check(data[0]==1 && data[8]!=0,"prepare "+m+Arrays.toString(data));
        check(!WB.isMethodCompiled(m) && data[27]==0,"real interpreter frame/no nmethod");
    }
    static void compile(Method method,int level)throws Exception {
        check(WB.enqueueMethodForCompilation(method,level),"enqueue callee level "+level);
        long end=System.nanoTime()+20_000_000_000L;
        while(WB.getMethodCompilationLevel(method)!=level){if(System.nanoTime()>end)throw new AssertionError("callee compile");Thread.sleep(2);}
    }
    static void child(int action,String mode)throws Exception {
        WB=WhiteBox.getWhiteBox();
        System.load(System.getProperty("pilot.library"));
        if(mode.equals("returns")) {
            tail(1);unsupportedSuccessor(1);
            Method tail=method("tail",int.class),truncated=method("unsupportedSuccessor",int.class);
            prepare(tail,action);prepare(truncated,action);effects=0;
            for(int i=0;i<20;i++) {
                check(tail(i)==i*3,"tail keeps ordinary return semantics");
                check(unsupportedSuccessor(i)==(i==1?17:i==2?19:23),"unsupported next bytecode executes once");
            }
            check(effects==40 && query(tail,3)[9]==20 && query(truncated,3)[9]==20,
                "both no-successor call prefixes execute and call once");
            check(resumes(tail)==0 && resumes(truncated)==0,"no native successor uses ordinary typed return");
            System.out.println("PILOT_DIRECT_CALL_OK action="+action+" mode="+mode);return;
        }
        Method direct=method("direct",int.class),twice=method("twice",int.class),stacked=method("stacked",Object.class,int.class),
            roots=method("roots",Holder.class),throwing=method("throwing",int.class),guarded=method("guarded",int.class),initialize=method("initialize",int.class);
        Caller caller=new Caller();Method special=Caller.class.getDeclaredMethod("special",int.class);
        Method nativeCall=method("nativeCall",Object.class),returnRef=method("returnRef",Object.class),voidCall=method("voidCall",Object.class);
        Method recursive=method("recursive",int.class),blocked=method("blocked",Holder.class);
        direct(2);twice(2);stacked(new Token(),4);roots(new Holder(new Token()));throwing(1);caller.special(2);guarded(0);
        nativeCall(new Token());returnRef(new Token());voidCall(new Token());
        recursive(2);released=true;blocked(new Holder(new Token()));released=false;entered=false;
        for(Method m:new Method[]{direct,twice,stacked,roots,throwing,guarded,initialize,special,nativeCall,returnRef,voidCall,recursive,blocked})prepare(m,action);
        effects=0;
        for(int i=0;i<20;i++)check(direct(i)==i*3+7 && twice(i)==i*9+13 && caller.special(i)==i*3+11,"static/special nested call results");
        check(effects==80,"calls execute exactly once");
        for(Method m:new Method[]{direct,twice,special})check(resumes(m)>=20,"returned into generated caller "+m);
        check(stacked(new Token(),7)==38,"operand stack and argument roots");
        Object token=roots(new Holder(new Token()));check(token instanceof Token && ((Token)token).value==379,"only suspended local root survives moving GC");
        check(resumes(stacked)>0 && resumes(roots)>0,"GC callees resume native caller");
        Token returned=new Token();int identity=System.identityHashCode(returned);
        check(nativeCall(returned)==identity+3 && resumes(nativeCall)>0,"native callee resumes native caller");
        check(returnRef(returned)==returned && resumes(returnRef)>0,"oop result across returning GC callee");
        check(voidCall(returned)==37 && resumes(voidCall)>0,"void callee restores stack and resumes");
        check(recursive(16)==49 && resumes(recursive)>=16,"recursive interpreter frames resume independently");
        AtomicReference<Object> blockedResult=new AtomicReference<>();AtomicReference<Throwable> blockedFailure=new AtomicReference<>();
        Thread worker=new Thread(() -> {
            try{blockedResult.set(blocked(new Holder(new Token())));}catch(Throwable failure){blockedFailure.set(failure);}
        });
        worker.setDaemon(true);worker.start();
        try {
            long end=System.nanoTime()+20_000_000_000L;
            while(!entered){check(System.nanoTime()<end,"callee reached wait");Thread.sleep(1);}
            while(worker.getState()!=Thread.State.WAITING){check(System.nanoTime()<end,"callee blocked in wait");Thread.sleep(1);}
            WB.fullGC();
            check(Arrays.stream(worker.getStackTrace()).anyMatch(f -> f.getMethodName().equals("blocked")),"blocked suspended caller walk");
        } finally {
            synchronized(monitor){released=true;monitor.notifyAll();}worker.join(20_000);
        }
        check(!worker.isAlive() && blockedFailure.get()==null && blockedResult.get() instanceof Token &&
            ((Token)blockedResult.get()).value==379 && resumes(blocked)>0,"sole local oop survives blocked callee GC and resumes");
        long before=resumes(throwing);effects=0;
        try{throwing(-1);throw new AssertionError("callee exception");}catch(IllegalArgumentException expected){}
        check(effects==1 && resumes(throwing)==before,"exception unwinds invoke without normal continuation");
        check(throwing(2)==19 && resumes(throwing)>before,"normal return after throwing control");
        check(initEffects==0,"target class not initialized by producer");
        check(initialize(1)==31 && initEffects==1,"unresolved/static initialization fallback once");
        check(initialize(2)==32 && initEffects==1 && resumes(initialize)>0,"cached call becomes native without regenerating body");
        control=guarded;disabled=true;effects=0;before=resumes(guarded);
        check(guarded(3)==26 && effects==1 && resumes(guarded)==before,"disable during callee resumes next BCI once");
        disabled=false;query(guarded,1);check(guarded(4)==27 && resumes(guarded)>before,"reenabled continuation");
        // Actual javac integer-field/reference predicate from the retained census.
        Class<?> tags=Class.forName("com.sun.tools.javac.code.TypeTag");Method predicate=tags.getMethod("isStrictSubRangeOf",tags);
        Object byteTag=tags.getField("BYTE").get(null),intTag=tags.getField("INT").get(null);
        check((boolean)predicate.invoke(byteTag,intTag),"javac ordinary oracle");prepare(predicate,action);
        check((boolean)predicate.invoke(byteTag,intTag) && !(boolean)predicate.invoke(intTag,intTag),"javac predicate result");
        check(query(predicate,3)[9]>0,"real javac method executes native body");
        if(mode.equals("mixed")) {
            Method helper=method("helper",int.class);
            for(int level:new int[]{1,4}) {
                compile(helper,level);before=resumes(direct);effects=0;
                check(direct(7)==28 && effects==1 && resumes(direct)>before,"compiled callee level "+level);
                WB.deoptimizeMethod(helper);
            }
            before=resumes(direct);check(direct(8)==31 && resumes(direct)>before,"interpreted callee after deoptimization");
            throughActiveDeopt(1);Method through=method("throughActiveDeopt",int.class);prepare(through,action);
            activeMethod=method("activeCallee",int.class);WB.markMethodProfiled(activeMethod);deoptActive=true;
            for(int level:new int[]{1,4}) {
                compile(activeMethod,level);before=resumes(through);
                check(throughActiveDeopt(3)==22 && !WB.isMethodCompiled(activeMethod) && resumes(through)>before,
                    "active compiled callee deoptimizes with suspended interpreter caller level "+level);
            }
            // A genuine virtual-thread suspension copies/patches the same
            // ordinary return word. Deoptimize the compiled blocked callee
            // while frozen; the sole caller local must survive moving GC.
            Method awaitMethod=method("await",Holder.class);
            for(int level:new int[]{1,4}) {
                compile(awaitMethod,level);released=false;entered=false;
                AtomicReference<Object> virtualResult=new AtomicReference<>();
                AtomicReference<Throwable> virtualFailure=new AtomicReference<>();
                long resumesBefore=resumes(blocked);
                Thread virtual=Thread.ofVirtual().unstarted(() -> {
                    try{virtualResult.set(blocked(new Holder(new Token())));}
                    catch(Throwable failure){virtualFailure.set(failure);}
                });
                virtual.start();
                try {
                    long end=System.nanoTime()+20_000_000_000L;
                    while(!entered || virtual.getState()!=Thread.State.WAITING) {
                        check(System.nanoTime()<end,"virtual callee blocked in wait");Thread.sleep(1);
                    }
                    check(Arrays.stream(virtual.getStackTrace()).anyMatch(f -> f.getMethodName().equals("blocked")),
                        "frozen virtual caller stack walk");
                    check(WB.isMethodCompiled(awaitMethod) && WB.deoptimizeMethod(awaitMethod)>0,
                        "compiled blocked callee deoptimized while virtual thread suspended level "+level);
                    WB.fullGC();
                } finally {
                    synchronized(monitor){released=true;monitor.notifyAll();}virtual.join(20_000);
                }
                check(!virtual.isAlive() && virtualFailure.get()==null && virtualResult.get() instanceof Token &&
                    ((Token)virtualResult.get()).value==379 && resumes(blocked)==resumesBefore+1,
                    "virtual frozen caller sole oop survives GC/deopt and resumes exactly once level "+level);
            }
        }
        if(mode.equals("redefine")) {
            redefinedClass=new Loader().define(redefineBytes(7));redefinedBytes=redefineBytes(13);
            Method old=redefinedClass.getDeclaredMethod("body",int.class);check((int)old.invoke(null,2)==13,"pre-redefine oracle");prepare(old,action);
            check((int)old.invoke(null,3)==16 && resumes(old)>0,"native caller before redefinition");
            redefineNow=true;check((int)old.invoke(null,4)==19,"active old frame completes original post-call bytecodes");
            check(query(old,3)[8]==0 && (int)old.invoke(null,4)==25,"new Method has no stale codelet");
        }
        if(mode.equals("tooling")) {
            control=guarded;record=true;before=resumes(guarded);effects=0;
            check(guarded(5)==28 && effects==1 && resumes(guarded)==before,"tooling enabled in callee stops native resume");
            recording.close();
        }
        System.out.println("PILOT_DIRECT_CALL_OK action="+action+" mode="+mode);
    }
    public static void main(String[] args)throws Exception {
        if(args.length>0){child(Integer.parseInt(args[0]),args[1]);return;}
        String agent=Path.of(Utils.TEST_NATIVE_PATH,"libInterpreterFramePilotCalls.so").toAbsolutePath().toString();
        for(int action:new int[]{0,4,5})for(String collector:new String[]{"-XX:+UseSerialGC","-XX:+UseG1GC"}) {
            ArrayList<String> options=new ArrayList<>(Arrays.asList("-Xbootclasspath/a:.","-Xint","-Xmx96m",collector,
                "--add-exports=jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED","-Dpilot.library="+agent,
                "-XX:+UnlockExperimentalVMOptions","-XX:+UnlockDiagnosticVMOptions","-XX:+WhiteBoxAPI","-XX:+UseInterpreterFramePilot","-XX:+InterpreterFramePilotTestContinuations"));
            options.addAll(Arrays.asList(InterpreterFramePilotCallTest.class.getName(),Integer.toString(action),"int"));
            ProcessTools.executeTestJava(options).shouldHaveExitValue(0).shouldContain("PILOT_DIRECT_CALL_OK");
        }
        for(String mode:new String[]{"mixed","returns","redefine","tooling"}) {
        ProcessTools.executeTestJava("-Xbootclasspath/a:.","-Xmx96m","-XX:+UseG1GC","-Dpilot.library="+agent,
            "--add-exports=jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED","-XX:CompileThresholdScaling=100",
            "-XX:CompileCommand=dontinline,InterpreterFramePilotCallTest::*",
            "-XX:+UnlockExperimentalVMOptions","-XX:+UnlockDiagnosticVMOptions","-XX:+WhiteBoxAPI","-XX:+UseInterpreterFramePilot","-XX:+InterpreterFramePilotTestContinuations",
            InterpreterFramePilotCallTest.class.getName(),"5",mode).shouldHaveExitValue(0).shouldContain("PILOT_DIRECT_CALL_OK");
        }
    }
}
