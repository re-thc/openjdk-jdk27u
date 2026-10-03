/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

/*
 * @test
 * @summary Interpreter cold admission preserves startup field watches and late capability-free class events
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.jvmti & vm.flagless
 * @library /test/lib
 * @modules java.base/java.lang:+open java.base/jdk.internal.access
 * @build compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmission
 * @run main/othervm/native -Xint -Xshare:off -XX:+UseG1GC --enable-native-access=ALL-UNNAMED -agentlib:StringCodingInterpreterAdmissionTooling=watch compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmissionTooling watch
 * @run main/othervm/native -Xint -Xshare:off -XX:+UseG1GC --enable-native-access=ALL-UNNAMED -agentlib:StringCodingInterpreterAdmissionTooling=late compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmissionTooling hook
 * @run main/othervm/native -Xint -Xshare:off -XX:+UseG1GC --enable-native-access=ALL-UNNAMED -agentlib:StringCodingInterpreterAdmissionTooling=late compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmissionTooling load
 * @run main/othervm/native -Xint -Xshare:off -XX:+UseG1GC --enable-native-access=ALL-UNNAMED -agentlib:StringCodingInterpreterAdmissionTooling=late compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmissionTooling prepare
 */
package compiler.intrinsics.tmfy;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import static compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmission.SMALL_UNITS;
import static compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmission.check;
import static compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmission.convert;
import static compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmission.prefix;
import static compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmission.readiness;
import static compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmission.strict;

public class TestStringCodingInterpreterAdmissionTooling {
    static { System.loadLibrary("StringCodingInterpreterAdmissionTooling"); }
    private static native int watch(Class<?> holder, Method origin);
    private static native long reads();
    private static native int events(int kind, boolean enabled);
    private static native long deliveries(int kind);
    private static native int callbackError();

    public static class Marker { }

    private static class MarkerLoader extends ClassLoader {
        MarkerLoader() { super(null); }

        void defineAndInitialize(byte[] bytes) throws Exception {
            Class<?> type = defineClass(
                    "compiler.intrinsics.tmfy.TestStringCodingInterpreterAdmissionTooling$Marker",
                    bytes, 0, bytes.length);
            resolveClass(type);
            Class.forName(type.getName(), true, this);
        }
    }

    private static void startupWatch(Field ready) throws Exception {
        Method origin = String.class.getDeclaredMethod("encodeUTF8_UTF16", byte[].class, Class.class);
        check(watch(ready.getDeclaringClass(), origin) == 0, "could not install utf8Ready field watch");
        long before = reads();
        long expected = 0;
        for (int repeat = 0; repeat < 17; ++repeat) {
            for (int units : SMALL_UNITS) {
                convert(prefix(units, '\u0100'));
                // convert makes two ordinary public calls. Strict calls leave
                // the guard at BCI 53, before the watched getstatic at BCI 64.
                if (units >= 16) expected += 2;
                strict(prefix(units, '\u0100'), -1);
                strict(prefix(units, '\ud800'), units - 1);
            }
        }
        check(reads() - before == expected, "cold origin suppressed a watched readiness read");
        check(!ready.getBoolean(null), "watched small work initialized converter");
        before = reads();
        convert(prefix(512, '\u0100'));
        check(ready.getBoolean(null), "watched boundary work did not initialize converter");
        check(reads() == before, "512-unit guard unexpectedly read the small-work readiness field");
        convert(prefix(17, '\u0100'));
        check(reads() - before == 2, "ready origin suppressed a watched readiness read");
    }

    private static void lateEvents(Field ready, String mode) throws Exception {
        int kind = switch (mode) {
            case "hook" -> 0;
            case "load" -> 1;
            case "prepare" -> 2;
            default -> throw new AssertionError(mode);
        };
        byte[] marker;
        try (var input = TestStringCodingInterpreterAdmissionTooling.class.getResourceAsStream(
                "TestStringCodingInterpreterAdmissionTooling$Marker.class")) {
            check(input != null, "marker class resource missing");
            marker = input.readAllBytes();
        }
        // The agent has obtained a JVMTI environment and installed callbacks,
        // but has neither requested capabilities nor enabled any events.
        convert(prefix(17, '\u0100'));
        check(!ready.getBoolean(null), "initial cold conversion initialized converter");
        check(deliveries(kind) == 0, "class event arrived before enabling");
        for (int cycle = 0; cycle < 3; ++cycle) {
            check(events(kind, true) == 0, "late class-event enable failed");
            long before = deliveries(kind);
            new MarkerLoader().defineAndInitialize(marker);
            check(deliveries(kind) == before + 1, "late class event was not delivered exactly once");
            for (int units : SMALL_UNITS) {
                convert(prefix(units, '\u0100'));
                strict(prefix(units, '\ud800'), units - 1);
            }
            check(!ready.getBoolean(null), "late tooling initialized converter for small work");
            check(events(kind, false) == 0, "class-event disable failed");
            new MarkerLoader().defineAndInitialize(marker);
            check(deliveries(kind) == before + 1, "disabled class event was delivered");
        }
        // Re-enable after the sticky revocation has already happened, and
        // retain ordinary admission when cold work finally reaches 512 units.
        check(events(kind, true) == 0, "final class-event enable failed");
        convert(prefix(512, '\u0100'));
        check(ready.getBoolean(null), "late tooling blocked boundary admission");
        strict(prefix(512, '\ud800'), 511);
        check(events(kind, false) == 0, "final class-event disable failed");
        // These capability-free modes check actual late/repeated event delivery
        // and conversion semantics. The separate field watch is the direct
        // observation that the optional admission bytecodes remain executable.
    }

    public static void main(String[] args) throws Exception {
        Field ready = readiness();
        check(!ready.getBoolean(null), "converter initialized before tooling test");
        if (args[0].equals("watch")) startupWatch(ready);
        else lateEvents(ready, args[0]);
        check(callbackError() == 0, "JVMTI class callback failed");
        System.out.println("STRING_CODING_INTERPRETER_TOOLING_OK " + args[0]);
    }
}
