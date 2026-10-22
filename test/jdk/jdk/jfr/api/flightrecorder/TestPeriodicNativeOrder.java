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

import java.nio.file.Path;
import java.time.Duration;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import jdk.jfr.Event;
import jdk.jfr.FlightRecorder;
import jdk.jfr.Name;
import jdk.jfr.Period;
import jdk.jfr.Recording;
import jdk.jfr.consumer.RecordedEvent;
import jdk.jfr.consumer.RecordingFile;
import jdk.test.lib.Asserts;

/**
 * @test
 * @summary JVM periodic hooks must precede Java hooks added before recorder initialization
 * @requires vm.flagless & vm.hasJFR
 * @library /test/lib
 * @run main/othervm jdk.jfr.api.flightrecorder.TestPeriodicNativeOrder
 */
public class TestPeriodicNativeOrder {
    @Name("test.Periodic")
    @Period("beginChunk")
    static class Custom extends Event {
    }

    private static Recording active;

    public static void main(String[] args) throws Exception {
        new Custom();
        Asserts.assertFalse(FlightRecorder.isInitialized());
        List<Integer> order = new CopyOnWriteArrayList<>();
        Runnable first = () -> {
            order.add(1);
            new Custom().commit();
            active.disable("jdk.ThreadDump");
        };
        Runnable second = () -> order.add(2);
        FlightRecorder.addPeriodicEvent(Custom.class, first);
        FlightRecorder.addPeriodicEvent(Custom.class, second);
        Asserts.assertFalse(FlightRecorder.isInitialized());
        try {
            for (int round = 0; round < 3; round++) {
                order.clear();
                try (Recording recording = new Recording()) {
                    active = recording;
                    recording.enable(Custom.class).with("period", "beginChunk");
                    recording.enable("jdk.ThreadDump").with("period", "beginChunk");
                    recording.enable("jdk.ThreadSleep").withThreshold(Duration.ZERO);
                    recording.start();
                    Thread.sleep(1);
                    recording.stop();
                    Path path = Path.of("order-" + round + ".jfr");
                    recording.dump(path);
                    List<RecordedEvent> events = RecordingFile.readAllEvents(path);
                    Asserts.assertEquals(events.stream().filter(e -> e.getEventType().getName()
                        .equals("jdk.ThreadDump")).count(), 1L);
                    Asserts.assertEquals(events.stream().filter(e -> e.getEventType().getName()
                        .equals("test.Periodic")).count(), 1L);
                    Asserts.assertTrue(events.stream().anyMatch(e -> e.getEventType().getName()
                        .equals("jdk.ThreadSleep")));
                    Asserts.assertEquals(order, List.of(1, 2));
                }
                FlightRecorder.unregister(Custom.class);
                FlightRecorder.register(Custom.class);
                Asserts.assertEquals(FlightRecorder.getFlightRecorder().getEventTypes().stream()
                    .filter(t -> t.getName().equals("test.Periodic")).count(), 1L);
            }
        } finally {
            Asserts.assertTrue(FlightRecorder.removePeriodicEvent(first));
            Asserts.assertTrue(FlightRecorder.removePeriodicEvent(second));
            Asserts.assertFalse(FlightRecorder.removePeriodicEvent(first));
        }
    }
}
