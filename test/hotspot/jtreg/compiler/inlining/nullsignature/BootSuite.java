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

package compiler.inlining.nullsignature;

import jdk.internal.vm.annotation.ForceInline;

/** Bootstrap-only source fixture. No timing assertions. */
public final class BootSuite {
    static volatile int effects;
    static volatile Object source;
    static volatile Object sink;
    static final BootSuite receiver = new BootSuite();
    static final class WarmupComplete { }
    interface Face { int accept(U u); }
    interface StaticFace {
        @ForceInline static int acceptStatic(U u) { effects++; return u == null ? 31 : 32; }
    }
    static final class FaceImpl implements Face {
        @ForceInline public int accept(U u) { effects++; return u == null ? 29 : 30; }
    }
    static final Face face = new FaceImpl();

    @ForceInline static int argument(U value) { effects++; return value == null ? 7 : 9; }
    @ForceInline static U result() { effects++; return (U) source; }
    @ForceInline static long wide(long a, U first, double b, U second, int c) {
        effects++;
        return a + (long)b + c + (first == null ? 0 : 100) + (second == null ? 0 : 1000);
    }
    @ForceInline long instanceWide(long a, U first, double b, U second, int c) {
        effects++;
        return a + (long)b + c + (first == null ? 0 : 100) + (second == null ? 0 : 1000);
    }
    @ForceInline static MissingU missingResult() { effects++; return null; }
    @ForceInline static int missingArgument(MissingU u) { effects++; return u == null ? 11 : 12; }
    @ForceInline static int arrayArgument(U[] u) { effects++; return u == null ? 13 : 14; }
    static int unannotated(U u) { effects++; return u == null ? 17 : 18; }
    @ForceInline static int throwing(U u) {
        effects++;
        if (u == null) throw new IllegalArgumentException("expected");
        return 19;
    }

    public static int driverArgument() { return argument(null); }
    public static Object driverReturn() { return result(); }
    public static int driverDiscard() { result(); return effects; }
    public static int driverInterface() { return face.accept(null); }
    public static int driverStaticInterface() { return StaticFace.acceptStatic(null); }
    public static long driverWide() { return wide(3L, null, 5.0, null, 7); }
    public static long driverInstanceWide() { return receiver.instanceWide(3L, null, 5.0, null, 7); }
    public static int driverMissing() { return missingResult() == null ? missingArgument(null) : -1; }
    public static int driverArray() { return arrayArgument(null); }
    public static int driverUnannotated() { return unannotated(null); }
    public static int driverThrowing() {
        try { return throwing(null); }
        catch (IllegalArgumentException e) { return 23; }
    }
    public static int driverMerge(boolean choose, Object other) {
        U value = choose ? null : (U) other;
        return argument(value);
    }
    public static int driverLoop() {
        int sum = 0;
        for (int i=0;i<4;i++) sum += argument(null);
        return sum;
    }
    static void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); }
    static Object materialize() throws Exception {
        return Class.forName("compiler.inlining.nullsignature.U").getDeclaredConstructor().newInstance();
    }
    public static void main(String[] args) throws Exception {
        String mode=args[0];
        int n=50000;
        for(int i=0;i<n;i++) {
            switch(mode) {
                case "argument" -> check(driverArgument()==7,"arg");
                case "return" -> check(driverReturn()==null,"return");
                case "discard" -> check(driverDiscard()==i+1,"discard");
                case "interface" -> check(driverInterface()==29,"interface");
                case "static-interface" -> check(driverStaticInterface()==31,"static-interface");
                case "wide" -> check(driverWide()==15,"wide");
                case "instance-wide" -> check(driverInstanceWide()==15,"instance-wide");
                case "missing" -> check(driverMissing()==11,"missing");
                case "array" -> check(driverArray()==13,"array");
                case "unannotated" -> check(driverUnannotated()==17,"unannotated");
                case "throwing" -> check(driverThrowing()==23,"throwing");
                case "merge" -> check(driverMerge(true,null)==7,"merge");
                case "loop" -> check(driverLoop()==28,"loop");
                default -> throw new AssertionError(mode);
            }
        }
        check(effects == n*(mode.equals("missing")?2:mode.equals("loop")?4:1),"warm effects "+effects);
        sink=new WarmupComplete();
        System.out.println("WARM,"+mode+",effects="+effects);
        if (mode.equals("return") || mode.equals("discard") || mode.equals("merge")) {
            Object real=materialize();
            int before=effects;
            source=real;
            if(mode.equals("return")) check(driverReturn()==real,"nonnull return");
            else if(mode.equals("discard")) check(driverDiscard()==before+1,"nonnull discard");
            else check(driverMerge(false,real)==9,"nonnull merge");
            check(effects==before+1,"callee replayed after deopt");
            source=null;
            before=effects;
            if(mode.equals("return")) check(driverReturn()==null,"return back to null");
            else if(mode.equals("discard")) check(driverDiscard()==before+1,"discard back to null");
            else check(driverMerge(false,null)==7,"merge back to null");
            check(effects==before+1,"second callee replay");
            System.out.println("TRANSITION,"+mode+",exactly-once");
        }
        if(mode.equals("missing")) {
            try { Class.forName("compiler.inlining.nullsignature.MissingU"); throw new AssertionError("missing class present"); }
            catch(ClassNotFoundException expected) { System.out.println("MISSING,absent-no-eager-error"); }
        }
        System.out.println("PASS,"+mode);
    }
}
