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
 */

/*
 * @test
 * @summary Run the generated accumulator oracle with platform-neutral C2 options.
 * @requires vm.debug == true & vm.compiler2.enabled
 * @build TestSharedSpillLoads
 * @run main/othervm -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:+VerifyRegisterAllocator
 *      -XX:-OmitStackTraceInFastThrow
 *      -XX:CompileCommand=dontinline,TestSharedSpillLoads::kernel*
 *      -XX:CompileCommand=dontinline,TestSharedSpillLoads::cold
 *      -XX:CompileCommand=exclude,TestSharedSpillLoads::reference
 *      TestSharedSpillSharingPortable
 */
public class TestSharedSpillSharingPortable {
    public static void main(String[] args) {
        TestSharedSpillLoads.main(args);
    }
}
