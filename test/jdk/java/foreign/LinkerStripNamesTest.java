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
        checkIdentityReuse(strip);
        try {
            linker.downcallHandle(FunctionDescriptor.of(integer.withByteAlignment(1), integer));
            throw new AssertionError("Invalid alignment accepted");
        } catch (IllegalArgumentException expected) {
            checks++;
        }
        System.out.println("LINKER_STRIP_NAMES_PASS checks=" + checks);
    }

    private static void checkIdentityReuse(Method strip) throws Throwable {
        Method stripDescriptor = AbstractLinker.class.getDeclaredMethod("stripNames", FunctionDescriptor.class);
        stripDescriptor.setAccessible(true);
        var integer = ValueLayout.JAVA_INT;
        var wide = ValueLayout.JAVA_LONG;
        var struct = MemoryLayout.structLayout(integer, MemoryLayout.paddingLayout(4), wide);
        var union = MemoryLayout.unionLayout(integer, wide);
        var sequence = MemoryLayout.sequenceLayout(3, union);
        var pointer = ValueLayout.ADDRESS.withTargetLayout(sequence);
        List<MemoryLayout> unchanged = List.of(integer, wide, MemoryLayout.paddingLayout(4),
                struct, union, sequence, pointer, ValueLayout.ADDRESS,
                MemoryLayout.structLayout(), MemoryLayout.unionLayout(), MemoryLayout.sequenceLayout(0, integer),
                integer.withByteAlignment(1).withOrder(ByteOrder.BIG_ENDIAN),
                pointer.withByteAlignment(1).withOrder(ByteOrder.BIG_ENDIAN));
        for (var layout : unchanged) {
            check(strip.invoke(null, layout) == layout, "Unchanged immutable layout was recreated: " + layout);
            var named = layout.withName("outer");
            check(strip.invoke(null, named).equals(layout), "Outer name normalization changed properties");
            check(named.name().orElseThrow().equals("outer"), "Input layout was modified");
        }
        // Address targets bypass the linker's by-value alignment checks. Keep the
        // existing normalization of their non-natural group/sequence alignment.
        for (MemoryLayout target : List.of(struct.withByteAlignment(16), union.withByteAlignment(16),
                sequence.withByteAlignment(16))) {
            var address = ValueLayout.ADDRESS.withTargetLayout(target);
            var actual = (AddressLayout) strip.invoke(null, address);
            check(actual != address, "Non-natural pointee normalization was skipped");
            check(actual.targetLayout().orElseThrow().byteAlignment() == 8, "Pointee alignment reset changed");
            check(target.byteAlignment() == 16, "Pointee input was modified");
        }
        var oddScalar = integer.withByteAlignment(1).withOrder(ByteOrder.BIG_ENDIAN);
        var oddAddress = ValueLayout.ADDRESS.withTargetLayout(oddScalar).withByteAlignment(1).withOrder(ByteOrder.BIG_ENDIAN);
        check(strip.invoke(null, oddAddress) == oddAddress, "Scalar pointee order/alignment must remain unchanged");
        var emptyAligned = MemoryLayout.structLayout().withByteAlignment(16);
        check(strip.invoke(null, emptyAligned).equals(MemoryLayout.structLayout()), "Empty aggregate alignment reset");
        var nestedAligned = ValueLayout.ADDRESS.withTargetLayout(ValueLayout.ADDRESS.withTargetLayout(emptyAligned));
        var nestedPlain = ValueLayout.ADDRESS.withTargetLayout(ValueLayout.ADDRESS.withTargetLayout(MemoryLayout.structLayout()));
        check(strip.invoke(null, nestedAligned).equals(nestedPlain), "Nested pointee alignment reset");

        List<FunctionDescriptor> descriptors = List.of(FunctionDescriptor.ofVoid(), FunctionDescriptor.ofVoid(integer),
                FunctionDescriptor.of(wide), FunctionDescriptor.of(wide, integer, wide, pointer),
                FunctionDescriptor.of(struct, union, pointer));
        for (var descriptor : descriptors) {
            check(stripDescriptor.invoke(null, descriptor) == descriptor, "Unchanged descriptor was recreated");
        }
        // Exercise first/middle/last changed children and return-only changes.
        for (int changed = 0; changed < 4; changed++) {
            MemoryLayout[] args = {integer, wide, pointer};
            MemoryLayout result = wide;
            if (changed < 3) args[changed] = args[changed].withName("changed");
            else result = result.withName("changed");
            var descriptor = FunctionDescriptor.of(result, args);
            var actual = (FunctionDescriptor) stripDescriptor.invoke(null, descriptor);
            check(actual.equals(FunctionDescriptor.of(wide, integer, wide, pointer)), "Changed child normalization");
            check(actual != descriptor, "Named descriptor was reused");
            check(stripDescriptor.invoke(null, actual) == actual, "Normalization is not identity-idempotent");
        }
        var nested = MemoryLayout.structLayout(integer.withName("i"), MemoryLayout.paddingLayout(4),
                MemoryLayout.sequenceLayout(2, wide.withName("j")).withName("seq")).withName("struct");
        var expected = MemoryLayout.structLayout(integer, MemoryLayout.paddingLayout(4), MemoryLayout.sequenceLayout(2, wide));
        var address = ValueLayout.ADDRESS.withTargetLayout(nested).withName("address");
        check(strip.invoke(null, address).equals(ValueLayout.ADDRESS.withTargetLayout(expected)), "Nested names survived");
        var namedVoid = FunctionDescriptor.ofVoid(address);
        var normalizedVoid = (FunctionDescriptor) stripDescriptor.invoke(null, namedVoid);
        check(normalizedVoid.equals(FunctionDescriptor.ofVoid(ValueLayout.ADDRESS.withTargetLayout(expected))), "Void descriptor normalization");
        check(stripDescriptor.invoke(null, normalizedVoid) == normalizedVoid, "Void descriptor was recreated twice");
        var linker = Linker.nativeLinker();
        var retained = linker.downcallHandle(FunctionDescriptor.of(ValueLayout.ADDRESS.withTargetLayout(expected)));
        var renamed = linker.downcallHandle(FunctionDescriptor.of(address));
        check(retained == renamed, "Renamed pointees must share the public downcall cache entry");
        var different = linker.downcallHandle(FunctionDescriptor.of(ValueLayout.ADDRESS.withTargetLayout(integer)));
        check(retained != different, "Different pointees must retain distinct public cache entries");
        try {
            linker.downcallHandle(FunctionDescriptor.of(struct.withByteAlignment(16)));
            throw new AssertionError("Over-aligned aggregate accepted");
        } catch (IllegalArgumentException expectedException) {
            checks++;
        }
        try {
            stripDescriptor.invoke(null, (FunctionDescriptor) null);
            throw new AssertionError("Null descriptor accepted");
        } catch (InvocationTargetException ex) {
            check(ex.getCause() instanceof NullPointerException, "Null descriptor must throw NPE");
        }
    }
}
