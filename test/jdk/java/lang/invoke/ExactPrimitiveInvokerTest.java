/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

/*
 * @test
 * @summary Preserve exact primitive invoker checks, customization, caller binding, and initialization order
 * @run main/othervm ExactPrimitiveInvokerTest
 * @run main/othervm -Xint ExactPrimitiveInvokerTest
 * @run main/othervm -Djava.lang.invoke.MethodHandle.CUSTOMIZE_THRESHOLD=0 ExactPrimitiveInvokerTest
 * @run main/othervm -Djava.lang.invoke.MethodHandle.CUSTOMIZE_THRESHOLD=-1 ExactPrimitiveInvokerTest
 */

import java.lang.invoke.*;
import java.util.*;

/** Semantic checks for the four exact-invoker shapes trained in the image. */
public class ExactPrimitiveInvokerTest {
    static int checks;
    static final List<String> events=new ArrayList<>();
    interface Throwing { void run() throws Throwable; }
    static void check(boolean ok) { if(!ok)throw new AssertionError("check "+checks); checks++; }
    static void expect(Class<? extends Throwable> type,Throwing action) throws Throwable {
        try { action.run(); } catch(Throwable e) { if(type.isInstance(e)){checks++;return;} throw e; }
        throw new AssertionError("Missing "+type.getName());
    }
    static class Target {
        static { events.add("initialize"); }
        static long invoke(long x) { events.add("body"); return x+1; }
    }
    static long callerLong(MethodHandles.Lookup lookup) { check(lookup.lookupClass()==ExactPrimitiveInvokerTest.class); return 71L; }
    static int callerInt(MethodHandles.Lookup lookup) { check(lookup.lookupClass()==ExactPrimitiveInvokerTest.class); return 72; }
    public static void main(String[] args) throws Throwable {
        var lookup=MethodHandles.lookup();
        var j=MethodHandles.identity(long.class); var i=MethodHandles.identity(int.class);
        var jj=MethodHandles.dropArguments(j,0,long.class); var ji=MethodHandles.dropArguments(i,0,long.class);
        check((long)j.invokeExact(7L)==7); check((int)i.invokeExact(8)==8);
        check((long)jj.invokeExact(0L,9L)==9); check((int)ji.invokeExact(0L,10)==10);
        expect(WrongMethodTypeException.class,()->{long unused=(long)i.invokeExact(1L);});
        expect(WrongMethodTypeException.class,()->{int unused=(int)j.invokeExact(1);});
        expect(WrongMethodTypeException.class,()->{long unused=(long)ji.invokeExact(0L,1L);});
        expect(WrongMethodTypeException.class,()->{int unused=(int)jj.invokeExact(0L,1);});
        var bool=MethodHandles.identity(boolean.class);
        var boolLeaf=MethodHandles.dropArguments(bool,0,long.class);
        expect(WrongMethodTypeException.class,()->{int unused=(int)bool.invokeExact(1);});
        expect(WrongMethodTypeException.class,()->{int unused=(int)boolLeaf.invokeExact(0L,1);});
        var dbl=MethodHandles.identity(double.class);
        var dblLeaf=MethodHandles.dropArguments(dbl,0,long.class);
        expect(WrongMethodTypeException.class,()->{long unused=(long)dbl.invokeExact(1L);});
        expect(WrongMethodTypeException.class,()->{long unused=(long)dblLeaf.invokeExact(0L,1L);});
        expect(NullPointerException.class,()->{long unused=(long)((MethodHandle)null).invokeExact(1L);});
        expect(NullPointerException.class,()->{int unused=(int)((MethodHandle)null).invokeExact(1);});
        expect(NullPointerException.class,()->{long unused=(long)((MethodHandle)null).invokeExact(0L,1L);});
        expect(NullPointerException.class,()->{int unused=(int)((MethodHandle)null).invokeExact(0L,1);});
        var target=lookup.findStatic(Target.class,"invoke",MethodType.methodType(long.class,long.class));
        check(events.isEmpty());
        expect(WrongMethodTypeException.class,()->{int unused=(int)target.invokeExact(1);});
        check(events.isEmpty()); check((long)target.invokeExact(41L)==42);
        check(events.equals(List.of("initialize","body")));
        var caller=lookup.findStatic(MethodHandles.class,"lookup",MethodType.methodType(MethodHandles.Lookup.class));
        var cj=MethodHandles.dropArguments(MethodHandles.filterReturnValue(caller,lookup.findStatic(ExactPrimitiveInvokerTest.class,"callerLong",MethodType.methodType(long.class,MethodHandles.Lookup.class))),0,long.class);
        var ci=MethodHandles.dropArguments(MethodHandles.filterReturnValue(caller,lookup.findStatic(ExactPrimitiveInvokerTest.class,"callerInt",MethodType.methodType(int.class,MethodHandles.Lookup.class))),0,int.class);
        var cjj=MethodHandles.dropArguments(cj,0,long.class); var cji=MethodHandles.dropArguments(ci,0,long.class);
        check((long)cj.invokeExact(0L)==71); check((int)ci.invokeExact(0)==72);
        check((long)cjj.invokeExact(0L,0L)==71); check((int)cji.invokeExact(0L,0)==72);
        MethodHandle[] js=new MethodHandle[2],is=new MethodHandle[2],jjs=new MethodHandle[2],jis=new MethodHandle[2];
        for(int n=0;n<2;n++){
            js[n]=MethodHandles.dropArguments(MethodHandles.constant(long.class,(long)n+31),0,long.class);
            is[n]=MethodHandles.dropArguments(MethodHandles.constant(int.class,n+41),0,int.class);
            jjs[n]=MethodHandles.dropArguments(js[n],0,long.class); jis[n]=MethodHandles.dropArguments(is[n],0,long.class);
        }
        for(int count=0;count<1000;count++){
            int n=count&1;
            check((long)js[n].invokeExact(1L)==n+31); check((int)is[n].invokeExact(1)==n+41);
            check((long)jjs[n].invokeExact(0L,1L)==n+31); check((int)jis[n].invokeExact(0L,1)==n+41);
        }
        System.out.println("EXACT_HOLDER_CHECKS_PASS checks="+checks);
    }
}
