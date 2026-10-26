/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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

/*
 * This file is available under and governed by the GNU General Public
 * License version 2 only, as published by the Free Software Foundation.
 * However, the following notice accompanied the original version of this
 * file:
 *
 * Copyright (c) 2007-2012, Stephen Colebourne & Michael Nascimento Santos
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *  * Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 *  * Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 *  * Neither the name of JSR-310 nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
package java.time;

import jdk.internal.loader.BootLoader;
import jdk.internal.misc.VM;
import jdk.internal.vm.annotation.IntrinsicCandidate;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.atomic.AtomicInteger;

/** Internal, bounded library path for Instant.parse. */
final class InstantParser {
    private static volatile boolean failed;

    private static final class RuntimeConfig {
        // Read only after VM boot. Later System.setProperty changes must not
        // enable a route disabled at startup. No library is loaded here.
        private static final boolean ENABLED =
                !"false".equals(VM.getSavedProperty("jdk.time.instantSpeedate"));
    }

    private static final class Library {
        private static final int LOADING = 1;
        private static final int READY = 2;
        private static final int UNAVAILABLE = 3;
        private static final AtomicInteger STATE = new AtomicInteger();

        static boolean available() {
            int state = STATE.get();
            if (state == READY) {
                return true;
            }
            if (state != 0 || !STATE.compareAndSet(0, LOADING)) {
                return false;
            }
            // No class-initialization lock is held while loading.
            // JNI_OnLoad callbacks may parse while another thread is waiting
            // on a library lock; they must be able to fall back without waiting.
            boolean loaded = false;
            try {
                loaded = BootLoader.getNativeLibraries().loadLibrary("instant") != null;
            } catch (LinkageError ex) {
                // Sticky unavailable state; original formatter remains usable.
            } finally {
                if (!loaded) {
                    // Only the loading thread publishes a permanent failure.
                    // A caller observing LOADING must not disable the backend.
                    failed = true;
                }
                STATE.set(loaded ? READY : UNAVAILABLE);
            }
            return loaded;
        }
    }

    // Route common UTC strings; speedate parses and validates their fields.
    static boolean eligible(String text) {
        int n = text.length();
        return n >= 20 && n <= 27 && (text.charAt(n - 1) | 0x20) == 'z';
    }

    static Instant parse(String text) {
        Instant parsed = tryParse(text);
        return parsed != null ? parsed : DateTimeFormatter.ISO_INSTANT.parse(text, Instant::from);
    }

    static Instant tryParse(String text) {
        // Keep the boot check before RuntimeConfig initialization. A disabled
        // route must bypass input inspection and the loader state entirely.
        if (!VM.isBooted()) {
            return null;
        }
        try {
            if (!RuntimeConfig.ENABLED || failed || !eligible(text)) {
                return null;
            }
            // Preboot calls must not initialize this holder. Calls concurrent
            // with native loading use Java without waiting for the loader.
            if (!Library.available()) {
                return null;
            }
            long packed = parse0(text);
            // Java retains ownership of parse failures and their error details.
            if (packed == Long.MIN_VALUE) {
                return null;
            }
            return Instant.ofEpochSecond(packed >> 20, (packed & 0xfffffL) * 1000L);
        } catch (LinkageError ex) {
            // Also covers a holder linkage failure, without reentering it.
            failed = true;
            return null;
        }
    }

    @IntrinsicCandidate
    private static native long parse0(String text);
}
