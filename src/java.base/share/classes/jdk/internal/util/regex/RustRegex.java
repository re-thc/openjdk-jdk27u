/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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
package jdk.internal.util.regex;

import java.lang.ref.Reference;
import java.nio.charset.StandardCharsets;
import jdk.internal.access.SharedSecrets;
import jdk.internal.ref.CleanerFactory;
import jdk.internal.vm.annotation.IntrinsicCandidate;

/** Internal, conservative rejection filter. Java remains the matching engine. */
public final class RustRegex {
    public static final boolean ENABLED;
    public static final int MIN_LENGTH = 2048;
    public static final int MAX_LENGTH = 65536;
    private final long handle;

    static {
        registerNatives();
        ENABLED = enabled0();
    }

    private RustRegex(long handle) {
        this.handle = handle;
        try {
            CleanerFactory.cleaner().register(this, new Releaser(handle));
        } catch (Throwable t) {
            free0(handle);
            throw t;
        }
    }

    private record Releaser(long handle) implements Runnable {
        public void run() { free0(handle); }
    }

    public static RustRegex compile(String pattern, int flags) {
        if (!ENABLED || flags != 0 || !supported(pattern)) return null;
        long handle = compile0(pattern.getBytes(StandardCharsets.US_ASCII));
        return handle == 0 ? null : new RustRegex(handle);
    }

    // Accept a shared syntax subset. Dot is deliberately widened to include
    // all bytes by the native compiler. A false result is therefore definitive.
    // Avoid literals: Java already has a Boyer-Moore fast path for them.
    private static boolean supported(String pattern) {
        if (pattern.length() > 4096) return false;
        boolean inClass = false;
        boolean complex = false;
        for (int i = 0; i < pattern.length(); i++) {
            char c = pattern.charAt(i);
            if (c > 127) return false;
            if (c == '\\') {
                if (++i == pattern.length()) return false;
                c = pattern.charAt(i);
                if ("dDwWsStnrf\\.[](){}*+?|^$-".indexOf(c) < 0) return false;
                complex |= "dDwWsS".indexOf(c) >= 0;
            } else if (c == '[') {
                if (inClass) return false;
                inClass = true;
                complex = true;
            } else if (c == ']') {
                inClass = false;
            } else if (inClass) {
                if (c == '&' || c == '~' || c == '|' ||
                        (c == '-' && i + 1 < pattern.length() && pattern.charAt(i + 1) == '-')) return false;
            } else {
                if (c == '^' || c == '$') return false;
                if (c == '(' && i + 1 < pattern.length() && pattern.charAt(i + 1) == '?') {
                    if (i + 2 >= pattern.length() || pattern.charAt(i + 2) != ':') return false;
                }
                complex |= c == '*' || c == '+' || c == '?' || c == '{' || c == '|';
            }
        }
        return complex;
    }

    public boolean mayMatch(String input, int offset, int length) {
        byte[] bytes = SharedSecrets.getJavaLangAccess().getLatin1Bytes(input);
        if (bytes == null || offset < 0 || length < 0 || length > MAX_LENGTH ||
                offset > bytes.length - length) return true;
        try {
            return mayMatch0(handle, bytes, offset, length);
        } finally {
            Reference.reachabilityFence(this);
        }
    }

    private static native void registerNatives();
    private static native boolean enabled0();
    private static native long compile0(byte[] pattern);
    private static native void free0(long handle);
    @IntrinsicCandidate
    private static native boolean mayMatch0(long handle, byte[] input, int offset, int length);
}
