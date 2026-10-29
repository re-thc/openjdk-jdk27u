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
 * @summary Preserve ordered downcall and upcall layout validation
 * @run main/othervm --enable-native-access=ALL-UNNAMED LinkerValidationOrderTest
 */

import java.lang.foreign.*;
import java.lang.invoke.*;
import static java.lang.foreign.ValueLayout.*;

public class LinkerValidationOrderTest {
    private static int checks;

    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
        checks++;
    }

    private static void rejects(Linker linker, FunctionDescriptor descriptor,
                                MethodHandle target, Arena arena, String first,
                                Linker.Option... options) {
        try {
            if (target == null) linker.downcallHandle(descriptor, options);
            else linker.upcallStub(target, descriptor, arena, options);
            throw new AssertionError("Invalid layout accepted");
        } catch (IllegalArgumentException expected) {
            check(expected.getMessage().contains(first), "Wrong first rejection: " + expected);
        }
    }

    public static void main(String[] args) {
        Linker linker = Linker.nativeLinker();
        var badReturn = MemoryLayout.sequenceLayout(1, JAVA_INT).withName("badReturn");
        var badFirst = MemoryLayout.sequenceLayout(2, JAVA_INT).withName("badFirst");
        var badLater = MemoryLayout.sequenceLayout(3, JAVA_INT).withName("badLater");
        var bothBad = FunctionDescriptor.of(badReturn, badFirst, badLater);
        var target = MethodHandles.empty(MethodType.methodType(void.class));
        try (Arena arena = Arena.ofConfined()) {
            rejects(linker, bothBad, null, arena, "badReturn");
            rejects(linker, FunctionDescriptor.ofVoid(badFirst, badLater), null, arena, "badFirst");
            rejects(linker, FunctionDescriptor.of(JAVA_INT, JAVA_INT, badLater), null, arena, "badLater");
            rejects(linker, bothBad, null, arena, "badReturn", (Linker.Option)null);
            try {
                linker.downcallHandle(bothBad, (Linker.Option[])null);
                throw new AssertionError("Null options accepted");
            } catch (NullPointerException expected) { checks++; }
            rejects(linker, bothBad, target, arena, "badReturn");
            rejects(linker, FunctionDescriptor.ofVoid(badFirst, badLater), target, arena, "badFirst");
            // Upcalls validate layouts before options; downcalls reject a null array first.
            rejects(linker, bothBad, target, arena, "badReturn", (Linker.Option[])null);
            var stub = linker.upcallStub(target, FunctionDescriptor.ofVoid(), arena);
            check(stub.isNative() && stub.address() != 0, "Missing valid upcall stub");
        }
        var descriptors = new FunctionDescriptor[] {
            FunctionDescriptor.ofVoid(), FunctionDescriptor.of(JAVA_INT),
            FunctionDescriptor.of(JAVA_INT, JAVA_INT),
            FunctionDescriptor.of(JAVA_INT, JAVA_INT, JAVA_INT),
            FunctionDescriptor.of(JAVA_INT, JAVA_INT, JAVA_INT, JAVA_INT)
        };
        for (var descriptor : descriptors) {
            var handle = linker.downcallHandle(descriptor);
            check(handle.type().equals(descriptor.toMethodType().insertParameterTypes(0, MemorySegment.class)),
                    "Wrong valid descriptor type");
        }
        System.out.println("LINKER_VALIDATION_ORDER_PASS checks=" + checks);
    }
}
