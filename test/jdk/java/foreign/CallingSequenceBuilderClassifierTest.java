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
 * @summary Check every binding classifier result, null rejection, and sealed kind coverage
 * @modules java.base/jdk.internal.foreign.abi
 * @compile --patch-module java.base=${test.src} CallingSequenceBuilderClassifierTest.java
 * @run main/othervm --patch-module java.base=${test.classes} jdk.internal.foreign.abi.CallingSequenceBuilderClassifierTest
 */

package jdk.internal.foreign.abi;

import java.lang.foreign.ValueLayout;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class CallingSequenceBuilderClassifierTest {
    private record Case(Binding binding, boolean unbox, boolean box) { }
    private static int checks;

    private static void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }

    private static void checkClassification(Case test) {
        check(CallingSequenceBuilder.isUnbox(test.binding()) == test.unbox(),
                "Wrong unbox classification: " + test.binding());
        check(CallingSequenceBuilder.isBox(test.binding()) == test.box(),
                "Wrong box classification: " + test.binding());
    }

    private static void checkNull(Runnable action) {
        try {
            action.run();
            throw new AssertionError("Null binding accepted");
        } catch (NullPointerException expected) {
            checks++;
        }
    }

    public static void main(String[] args) {
        List<Case> cases = List.of(
                new Case(Binding.vmStore(null, int.class), true, false),
                new Case(Binding.vmLoad(null, int.class), false, true),
                new Case(Binding.bufferStore(0, int.class), false, true),
                new Case(Binding.bufferLoad(0, int.class), true, false),
                new Case(Binding.copy(ValueLayout.JAVA_LONG), true, true),
                new Case(Binding.allocate(ValueLayout.JAVA_LONG), false, true),
                new Case(Binding.segmentBase(), true, false),
                new Case(Binding.segmentOffsetNoAllowHeap(), true, false),
                new Case(Binding.boxAddress(8), false, true),
                new Case(Binding.dup(), true, true),
                new Case(Binding.shiftLeft(1), true, true),
                new Case(Binding.shiftRight(1), true, true),
                new Case(Binding.Cast.INT_TO_BYTE, true, true));
        Set<Class<?>> testedKinds = new HashSet<>();
        for (Case test : cases) {
            checkClassification(test);
            testedKinds.add(test.binding().getClass());
        }
        // Keep kind coverage equivalent to the old exhaustive pattern switches,
        // including the complete kind set handled by BindingSpecializer.doBindings.
        // Move and Dereference group the concrete operators. Cast remains one
        // operator kind, including constants with their own implementation class.
        Set<Class<?>> permittedKinds = new HashSet<>();
        for (Class<?> kind : Binding.class.getPermittedSubclasses()) {
            if (kind == Binding.Move.class || kind == Binding.Dereference.class) {
                permittedKinds.addAll(List.of(kind.getPermittedSubclasses()));
            } else {
                permittedKinds.add(kind);
            }
        }
        check(testedKinds.size() == 13, "Expected 13 distinct binding kinds");
        check(testedKinds.equals(permittedKinds),
                "Update classifier truth table for permitted binding kinds: " + permittedKinds);
        for (Binding.Cast cast : Binding.Cast.values()) {
            checkClassification(new Case(cast, true, true));
        }
        checkNull(() -> CallingSequenceBuilder.isUnbox(null));
        checkNull(() -> CallingSequenceBuilder.isBox(null));
        System.out.println("BINDING_CLASSIFIER_PASS checks=" + checks);
    }
}
