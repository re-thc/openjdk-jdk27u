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

import java.lang.reflect.Method;
import java.nio.file.Path;
import java.util.concurrent.atomic.AtomicReference;

import jdk.jfr.Event;
import jdk.jfr.Recording;
import jdk.jfr.consumer.RecordingFile;
import jdk.jfr.internal.MetadataRepository;
import jdk.test.lib.Asserts;
import jdk.test.lib.Utils;

/**
 * @test
 * @summary The metadata unhide upcall must run while another thread owns the repository monitor
 * @requires vm.flagless & vm.hasJFR
 * @library /test/lib
 * @modules jdk.jfr/jdk.jfr.internal:+open
 * @run main/othervm jdk.jfr.api.flightrecorder.TestMetadataUnhideMonitor
 */
public class TestMetadataUnhideMonitor {
    static class Custom extends Event {
        int value;
    }

    public static void main(String[] args) throws Exception {
        new Custom();
        MetadataRepository repository = MetadataRepository.getInstance();
        Method unhide = MetadataRepository.class.getDeclaredMethod("unhideInternalTypes");
        unhide.setAccessible(true);
        try (Recording recording = new Recording()) {
            recording.enable(Custom.class);
            recording.start();
            AtomicReference<Throwable> failure = new AtomicReference<>();
            Thread callback = new Thread(() -> {
                try {
                    unhide.invoke(null);
                } catch (Throwable e) {
                    failure.set(e);
                }
            });
            callback.setDaemon(true);
            synchronized (repository) {
                callback.start();
                // Model a Java thread waiting in native flush/setOutput while
                // the recorder thread invokes unhideInternalTypes().
                callback.join(Utils.adjustTimeout(10_000));
                Asserts.assertFalse(callback.isAlive(), "Upcall acquired the repository monitor");
            }
            Asserts.assertNull(failure.get());
            Custom event = new Custom();
            event.value = 42;
            event.commit();
            repository.flush();
            Path snapshot = Path.of("snapshot.jfr");
            recording.dump(snapshot); // rotate while recording
            event.commit();
            recording.stop();
            Path complete = Path.of("complete.jfr");
            recording.dump(complete);
            Asserts.assertEquals(RecordingFile.readAllEvents(snapshot).stream()
                .filter(e -> e.getEventType().getName().equals(Custom.class.getName())).count(), 1L);
            Asserts.assertEquals(RecordingFile.readAllEvents(complete).stream()
                .filter(e -> e.getEventType().getName().equals(Custom.class.getName())).count(), 2L);
        }
    }
}
