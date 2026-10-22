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

package jdk.jfr.api.flightrecorder;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import jdk.jfr.AnnotationElement;
import jdk.jfr.Event;
import jdk.jfr.FlightRecorder;
import jdk.jfr.internal.Level;
import jdk.jfr.internal.MetadataRepository;
import jdk.jfr.internal.PlatformEventType;
import jdk.jfr.internal.Type;
import jdk.jfr.internal.TypeLibrary;
import jdk.test.lib.Asserts;

/**
 * @test
 * @summary Failed JVM control initialization must not complete or retry partial state
 * @requires vm.flagless & vm.hasJFR
 * @library /test/lib
 * @modules jdk.jfr/jdk.jfr.internal:+open
 * @run main/othervm jdk.jfr.api.flightrecorder.TestJVMEventInitializationFailure direct
 * @run main/othervm jdk.jfr.api.flightrecorder.TestJVMEventInitializationFailure recorder
 */
public class TestJVMEventInitializationFailure {
    static class Custom extends Event {
    }

    public static void main(String[] args) throws Exception {
        new Custom();
        MetadataRepository repository = MetadataRepository.getInstance();
        var types = TypeLibrary.getTypes().stream()
            .filter(t -> t instanceof PlatformEventType p && p.isJVM()).toList();
        Type broken = types.get(1);
        List<AnnotationElement> original = broken.getAnnotationElements();
        var annotations = new ArrayList<>(original);
        // Native Level metadata requires at least one level. Corrupt the second
        // native type so initialization fails after one control was installed.
        annotations.addFirst(new AnnotationElement(Level.class, new String[0]));
        Method setAnnotations = Type.class.getDeclaredMethod("setAnnotations", List.class);
        setAnnotations.setAccessible(true);
        setAnnotations.invoke(broken, annotations);
        try {
            if (args[0].equals("recorder")) {
                FlightRecorder.getFlightRecorder();
            } else {
                repository.ensureJVMEventTypes();
            }
            throw new AssertionError("Initialization succeeded with invalid metadata");
        } catch (ExceptionInInitializerError e) {
            // Indexing the required first Level entry is the injected failure.
            Asserts.assertTrue(e.getCause() instanceof ArrayIndexOutOfBoundsException);
            Asserts.assertFalse(FlightRecorder.isInitialized());
            verifyFailure(repository, e.getCause(), broken, original, setAnnotations);
        }
    }

    private static void verifyFailure(MetadataRepository repository, Throwable failure,
                                      Type broken, List<AnnotationElement> original,
                                      Method setAnnotations) throws Exception {
        setAnnotations.invoke(broken, original);
        Field initialized = MetadataRepository.class.getDeclaredField("nativeInitialized");
        initialized.setAccessible(true);
        Field controls = MetadataRepository.class.getDeclaredField("nativeControls");
        controls.setAccessible(true);
        Map<?, ?> partial = (Map<?, ?>) controls.get(repository);
        Asserts.assertEquals(partial.size(), 1);
        for (Runnable action : List.<Runnable>of(repository::ensureJVMEventTypes,
                repository::getRegisteredEventTypes, repository::getEventControls,
                repository::getVisibleTypes, repository::flush, FlightRecorder::getFlightRecorder)) {
            try {
                action.run();
                throw new AssertionError("Partial initialization was accepted");
            } catch (InternalError e) {
                Asserts.assertTrue(e.getCause() == failure, "Original failure was not retained");
            }
            Asserts.assertFalse(FlightRecorder.isInitialized());
            Asserts.assertFalse(initialized.getBoolean(repository));
            Asserts.assertEquals(partial.size(), 1, "Initialization was retried");
        }
    }
}
