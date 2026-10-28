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
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import jdk.jfr.Event;
import jdk.jfr.EventFactory;
import jdk.jfr.EventType;
import jdk.jfr.FlightRecorder;
import jdk.jfr.SettingControl;
import jdk.jfr.SettingDefinition;
import jdk.jfr.internal.MetadataRepository;
import jdk.test.lib.Asserts;

/**
 * @test
 * @summary Custom registration can defer JVM controls until enumeration or hook registration
 * @requires vm.flagless & vm.hasJFR
 * @library /test/lib
 * @modules jdk.jfr/jdk.jfr.internal:+open
 * @run main/othervm jdk.jfr.api.flightrecorder.TestLazyJVMEventInitialization enumerate
 * @run main/othervm jdk.jfr.api.flightrecorder.TestLazyJVMEventInitialization reenter
 * @run main/othervm jdk.jfr.api.flightrecorder.TestLazyJVMEventInitialization concurrent
 */
public class TestLazyJVMEventInitialization {
    static class Custom extends Event {
    }

    static class ReentrantEvent extends Event {
        @SettingDefinition
        boolean accept(ReentrantSetting setting) {
            return true;
        }
    }

    public static class ReentrantSetting extends SettingControl {
        public ReentrantSetting() {
            // Event construction may run user code while registration holds the
            // repository monitor and the custom type is already in TypeLibrary.
            MetadataRepository.getInstance().getRegisteredEventTypes();
        }

        public String combine(Set<String> values) { return "true"; }
        public void setValue(String value) { }
        public String getValue() { return "true"; }
    }

    public static void main(String[] args) throws Exception {
        new Custom();
        MetadataRepository repository = MetadataRepository.getInstance();
        Field initialized = MetadataRepository.class.getDeclaredField("nativeInitialized");
        initialized.setAccessible(true);
        Asserts.assertFalse(initialized.getBoolean(repository));
        Asserts.assertFalse(FlightRecorder.isInitialized());
        long id = EventType.getEventType(Custom.class).getId();
        FlightRecorder.unregister(Custom.class);
        FlightRecorder.register(Custom.class);
        Asserts.assertEquals(EventType.getEventType(Custom.class).getId(), id);
        Asserts.assertFalse(initialized.getBoolean(repository));

        switch (args[0]) {
            case "enumerate" -> repository.getRegisteredEventTypes();
            case "reenter" -> new ReentrantEvent();
            case "concurrent" -> {
                Runnable hook = () -> { };
                List<Callable<Void>> actions = List.of(
                    () -> { repository.getRegisteredEventTypes(); return null; },
                    () -> { repository.getEventControls(); return null; },
                    () -> { repository.getVisibleTypes(); return null; },
                    () -> { FlightRecorder.register(Custom.class); return null; },
                    () -> { FlightRecorder.addPeriodicEvent(Custom.class, hook); return null; }
                );
                CountDownLatch ready = new CountDownLatch(actions.size());
                CountDownLatch start = new CountDownLatch(1);
                try (var executor = Executors.newFixedThreadPool(actions.size())) {
                    List<Future<Void>> futures = new ArrayList<>();
                    for (var action : actions) {
                        futures.add(executor.submit(() -> {
                            ready.countDown();
                            start.await();
                            return action.call();
                        }));
                    }
                    ready.await();
                    start.countDown();
                    for (var future : futures) {
                        future.get();
                    }
                }
                Asserts.assertTrue(FlightRecorder.removePeriodicEvent(hook));
                Asserts.assertFalse(FlightRecorder.removePeriodicEvent(hook));
            }
            default -> throw new IllegalArgumentException(args[0]);
        }
        Asserts.assertTrue(initialized.getBoolean(repository));
        Asserts.assertFalse(FlightRecorder.isInitialized());
        List<EventType> types = repository.getRegisteredEventTypes();
        Asserts.assertEquals(types.stream().filter(t -> t.getId() == id).count(), 1L);
        Asserts.assertEquals(types.stream().map(EventType::getId).distinct().count(), (long) types.size());
        Asserts.assertEquals(types.stream().filter(t -> t.getName().equals("jdk.ThreadDump")).count(), 1L);
        Asserts.assertEquals(repository.getEventControls().stream()
            .filter(c -> c.getEventType().getId() == id).count(), 1L);
        EventFactory factory = EventFactory.create(List.of(), List.of());
        factory.newEvent().commit();
        factory.unregister();
        factory.register();
        long dynamicId = factory.getEventType().getId();
        Asserts.assertEquals(repository.getRegisteredEventTypes().stream()
            .filter(t -> t.getId() == dynamicId).count(), 1L);
        factory.unregister();
    }
}
