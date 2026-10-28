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
 * @summary Check recursive linker name normalization and preserved layout properties
 * @modules java.base/jdk.internal.foreign.abi
 * @compile --patch-module java.base=${test.src} LinkerStripNamesTest.java
 * @run main/othervm --enable-native-access=java.base --patch-module java.base=${test.classes} jdk.internal.foreign.abi.LinkerStripNamesTest
 */

package jdk.internal.foreign.abi;

import java.lang.foreign.*;
import java.lang.invoke.MethodHandle;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteOrder;
import java.util.List;

public class LinkerStripNamesTest {
    private record Case(MemoryLayout named, MemoryLayout stripped) { }
    private static int checks;

    private static void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }

    public static void main(String[] args) throws Throwable {
        Method strip = AbstractLinker.class.getDeclaredMethod("stripNames", MemoryLayout.class);
        strip.setAccessible(true);
        var integer = ValueLayout.JAVA_INT;
        var wide = ValueLayout.JAVA_LONG;
        var padding = MemoryLayout.paddingLayout(4);
        var namedStruct = MemoryLayout.structLayout(integer.withName("i"), padding.withName("pad"),
                wide.withName("j")).withName("struct");
        var plainStruct = MemoryLayout.structLayout(integer, padding, wide);
        var namedUnion = MemoryLayout.unionLayout(integer.withName("i"), wide.withName("j")).withName("union");
        var plainUnion = MemoryLayout.unionLayout(integer, wide);
        var namedSequence = MemoryLayout.sequenceLayout(3, namedUnion).withName("sequence");
        var plainSequence = MemoryLayout.sequenceLayout(3, plainUnion);
        var namedAddress = ValueLayout.ADDRESS.withTargetLayout(namedSequence).withName("pointer");
        var plainAddress = ValueLayout.ADDRESS.withTargetLayout(plainSequence);
        var unusualPrimitive = integer.withOrder(ByteOrder.BIG_ENDIAN).withByteAlignment(2);
        var unusualAddress = namedAddress.withByteAlignment(1).withOrder(ByteOrder.BIG_ENDIAN);
        List<Case> cases = List.of(
                new Case(integer.withName("primitive"), integer),
                new Case(padding.withName("padding"), padding),
                new Case(namedStruct, plainStruct),
                new Case(namedUnion, plainUnion),
                new Case(namedSequence, plainSequence),
                new Case(namedAddress, plainAddress),
                new Case(ValueLayout.ADDRESS.withName("noTarget"), ValueLayout.ADDRESS),
                new Case(unusualPrimitive.withName("unaligned"), unusualPrimitive),
                new Case(unusualAddress, plainAddress.withByteAlignment(1).withOrder(ByteOrder.BIG_ENDIAN)));
        for (Case test : cases) {
            MemoryLayout actual = (MemoryLayout) strip.invoke(null, test.named());
            check(actual.equals(test.stripped()), "Wrong normalization: " + test.named() + " -> " + actual);
            check(actual.byteAlignment() == test.stripped().byteAlignment(), "Alignment changed");
            check(actual.byteSize() == test.named().byteSize(), "Size changed");
        }
        try {
            strip.invoke(null, (MemoryLayout) null);
            throw new AssertionError("Null layout accepted");
        } catch (InvocationTargetException ex) {
            check(ex.getCause() instanceof NullPointerException, "Null must throw NPE");
        }
        Linker linker = Linker.nativeLinker();
        FunctionDescriptor plain = FunctionDescriptor.of(integer, integer);
        MethodHandle retained = linker.downcallHandle(plain);
        MethodHandle normalized = linker.downcallHandle(FunctionDescriptor.of(
                integer.withName("return"), integer.withName("argument")));
        check(retained == normalized, "Names must share the retained public downcall cache entry");
        try {
            linker.downcallHandle(FunctionDescriptor.of(integer.withByteAlignment(1), integer));
            throw new AssertionError("Invalid alignment accepted");
        } catch (IllegalArgumentException expected) {
            checks++;
        }
        System.out.println("LINKER_STRIP_NAMES_PASS checks=" + checks);
    }
}
