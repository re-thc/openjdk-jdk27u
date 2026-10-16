/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Stable native copies preserve captures across GC and Pattern promotion
 * @modules java.base/java.util.regex:open java.base/jdk.internal.access
 *          java.base/jdk.internal.util.regex
 * @run main/othervm -Xint RustRegexSafepoint
 * @run main/othervm -Xint -XX:-UseRustRegexIntrinsics RustRegexSafepoint
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch RustRegexSafepoint
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch -XX:-UseRustRegexIntrinsics RustRegexSafepoint
 * @run main/othervm -XX:-TieredCompilation -Xbatch RustRegexSafepoint
 * @run main/othervm -XX:-TieredCompilation -Xbatch -XX:-UseRustRegexIntrinsics RustRegexSafepoint
 * @run main/othervm -XX:-UseRustRegex RustRegexSafepoint
 * @run main/othervm -XX:-CompactStrings RustRegexSafepoint
 */

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Objects;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.internal.access.SharedSecrets;
import jdk.internal.util.regex.RustRegex;

public class RustRegexSafepoint {
    private static final Method JAVA;
    private static final Field BACKEND, GROUPS;
    static {
        try {
            JAVA = Pattern.class.getDeclaredMethod("ensureJava");
            BACKEND = Pattern.class.getDeclaredField("rustRegex");
            GROUPS = Matcher.class.getDeclaredField("groups");
            JAVA.setAccessible(true); BACKEND.setAccessible(true); GROUPS.setAccessible(true);
        } catch (ReflectiveOperationException e) { throw new ExceptionInInitializerError(e); }
    }

    private static void equal(Matcher a, Matcher b, boolean av, boolean bv) {
        if (av != bv) throw new AssertionError("result " + a.pattern());
        if (av) for (int g = 0; g <= a.groupCount(); g++) {
            if (a.start(g) != b.start(g) || a.end(g) != b.end(g) || !Objects.equals(a.group(g), b.group(g)))
                throw new AssertionError("capture " + g + " " + a.pattern());
        }
    }

    public static void main(String[] args) throws Exception {
        Matcher warm = Pattern.compile("(ab)+").matcher("ab".repeat(64));
        for (int i = 0; i < 20_000; i++) warm.reset().find();
        for (String regex : new String[]{"[ab]{1000}[cd]", "([ab]{32,64})+([cd]+)", "([^x]{32,64})+(x+)"}) {
            String body = regex.startsWith("[ab]") ? "a".repeat(1000) + "c"
                    : regex.startsWith("([^x]") ? "\u00ff".repeat(2048) + "x" : "a".repeat(2048) + "c";
            String input = "!!" + body + "?";
            for (int mode = 0; mode < 3; mode++) {
                Pattern p = Pattern.compile(regex), ref = Pattern.compile(regex);
                JAVA.invoke(ref);
                Matcher a = p.matcher(input).region(2, input.length()-1);
                Matcher b = ref.matcher(input).region(2, input.length()-1);
                byte[] bytes = SharedSecrets.getJavaLangAccess().getLatin1Bytes(input);
                if (bytes != null) System.identityHashCode(bytes);
                System.identityHashCode(GROUPS.get(a));
                System.gc();
                boolean av = mode == 0 ? a.find() : mode == 1 ? a.lookingAt() : a.matches();
                boolean bv = mode == 0 ? b.find() : mode == 1 ? b.lookingAt() : b.matches();
                equal(a, b, av, bv);
                if (RustRegex.ENABLED && BACKEND.get(p) == null) throw new AssertionError("native copying route promoted");
            }
        }
        if (!RustRegex.ENABLED) return;
        Pattern slow = Pattern.compile("(?:[ab]{0,500})*[bc]");
        Matcher matcher = slow.matcher("a".repeat(65536));
        System.identityHashCode(GROUPS.get(matcher));
        CountDownLatch go = new CountDownLatch(1);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread worker = new Thread(() -> {
            try { go.countDown(); if (matcher.find()) throw new AssertionError("slow miss"); }
            catch (Throwable t) { failure.set(t); }
        });
        worker.start(); go.await();
        boolean observed = false;
        while (worker.isAlive()) {
            for (StackTraceElement frame : worker.getStackTrace()) {
                if (frame.getMethodName().equals("matchSafepoint0")) observed = true;
            }
            if (observed) break;
            Thread.sleep(1);
        }
        if (!observed) throw new AssertionError("safepoint-capable native frame was not observed");
        JAVA.invoke(slow); // Drop the Pattern's engine reference while its call is in flight.
        for (int i = 0; i < 4; i++) System.gc();
        worker.join();
        if (failure.get() != null) throw new AssertionError(failure.get());
        System.out.println("Native copies, capture offsets, GC and in-flight promotion passed");
    }
}
