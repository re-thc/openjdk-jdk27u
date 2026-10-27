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
 * @summary Optional service absence creates no discarded NoSuchAlgorithmException
 * @requires vm.hasJFR
 * @modules java.base/jdk.internal.access java.base/sun.security.jca jdk.jfr
 * @run main/othervm OptionalParametersExceptions
 */

import java.nio.file.Path;
import java.security.AlgorithmParameters;
import java.security.NoSuchAlgorithmException;
import jdk.internal.access.SharedSecrets;
import jdk.jfr.Recording;
import jdk.jfr.consumer.RecordedClass;
import jdk.jfr.consumer.RecordingFile;
import sun.security.jca.ProviderList;
import sun.security.jca.Providers;

public class OptionalParametersExceptions {
    public static void main(String[] args) throws Exception {
        String publicName = "PublicMissingParametersExceptionControl";
        String optionalName = "OptionalMissingParametersExceptionProbe";
        SharedSecrets.getJavaSecurityAlgorithmParametersAccess();
        Path path = Path.of("parameters-exceptions.jfr");
        try (Recording recording = new Recording()) {
            recording.enable("jdk.JavaExceptionThrow").withStackTrace();
            recording.start();
            // Initialize recording infrastructure with the normal provider
            // list. Restrict only the two calls being observed.
            ProviderList saved = Providers.beginThreadProviderList(ProviderList.newList());
            try {
                try {
                    AlgorithmParameters.getInstance(publicName);
                    throw new AssertionError("Public lookup did not throw");
                } catch (NoSuchAlgorithmException expected) {
                    // Positive control: an otherwise identical public miss
                    // records the allocation the optional path must avoid.
                }
                optionalMiss(optionalName);
            } finally {
                Providers.endThreadProviderList(saved);
            }
            recording.stop();
            recording.dump(path);
        }
        int controls = 0;
        for (var event : RecordingFile.readAllEvents(path)) {
            if (!event.getEventType().getName().equals("jdk.JavaExceptionThrow")) continue;
            RecordedClass type = event.getValue("thrownClass");
            if (!type.getName().equals(NoSuchAlgorithmException.class.getName())) continue;
            String message = event.getString("message");
            var stack = event.getStackTrace();
            if ((publicName + " AlgorithmParameters not available").equals(message)) {
                controls++;
                if (stack == null || stack.getFrames().isEmpty()) {
                    throw new AssertionError("Positive control has no stack trace");
                }
            }
            if (stack != null) {
                for (var frame : stack.getFrames()) {
                    var method = frame.getMethod();
                    if (method.getType().getName().equals(OptionalParametersExceptions.class.getName()) &&
                            method.getName().equals("optionalMiss")) {
                        throw new AssertionError("Optional miss created an exception: " + event);
                    }
                }
            }
        }
        if (controls != 1) throw new AssertionError("Expected one exception control, got " + controls);
    }

    private static void optionalMiss(String algorithm) throws NoSuchAlgorithmException {
        if (SharedSecrets.getJavaSecurityAlgorithmParametersAccess()
                .getInstanceOrNull(algorithm) != null) {
            throw new AssertionError("Optional lookup did not return null");
        }
    }
}
