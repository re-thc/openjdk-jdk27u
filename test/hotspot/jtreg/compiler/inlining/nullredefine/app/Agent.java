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

package compiler.inlining.nullredefine.agent;
import java.lang.instrument.ClassDefinition;
import java.lang.instrument.Instrumentation;
public final class Agent {
    private static Instrumentation instrumentation;
    public static void premain(String options, Instrumentation inst) {
        instrumentation = inst;
        if (!inst.isRedefineClassesSupported()) {
            throw new AssertionError("Class redefinition is not supported");
        }
    }
    public static void requireUnloaded(String phase) {
        if (isULoaded(phase)) throw new AssertionError("U prematurely loaded at " + phase);
    }
    public static boolean isULoaded(String phase) {
        if (instrumentation == null) throw new AssertionError("Startup agent not installed");
        boolean found = false;
        for (Class<?> c : instrumentation.getAllLoadedClasses()) {
            if (c.getName().equals("compiler.inlining.nullredefine.UnloadedU")) found = true;
        }
        System.out.println("PR2_U_STATE " + phase + " " + found);
        return found;
    }
    public static void redefine(Class<?> target, byte[] replacement) throws Exception {
        if (target.getClassLoader() != null || !instrumentation.isModifiableClass(target)) {
            throw new AssertionError("Expected modifiable bootstrap helper");
        }
        instrumentation.redefineClasses(new ClassDefinition(target, replacement));
    }
}
