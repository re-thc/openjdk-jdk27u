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
import java.nio.file.Files;
import java.nio.file.Path;
import compiler.inlining.nullredefine.Driver;
public final class Launcher {
    public static void main(String[] args) throws Exception {
        byte[] replacement = Files.readAllBytes(Path.of(args[0]));
        if (Driver.class.getClassLoader() != null) throw new AssertionError("Driver not bootstrap");
        Class<?> helper = Driver.helperClass(); // Class literal, no method reflection.
        Agent.requireUnloaded("before-warm");
        Driver.warm(1);
        Agent.requireUnloaded("after-warm-before-redefine");
        System.out.println("PR2_BEFORE_REDEFINE");
        Agent.redefine(helper, replacement);
        System.out.println("PR2_AFTER_REDEFINE");
        // Redefinition itself may resolve signature classes. Do not pretend it
        // must preserve unloaded state; the initial compiled edge is the target.
        Agent.isULoaded("after-redefine");
        Driver.warm(2);
        System.out.println("PR2_REDEFINE_PASS");
    }
}
