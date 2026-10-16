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
import java.util.concurrent.atomic.AtomicInteger;

/** Internal, bounded library path for Instant.parse. */
final class InstantParser {
    private static volatile boolean failed;

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
                if (!"false".equals(VM.getSavedProperty("jdk.time.instantSpeedate"))) {
                    loaded = BootLoader.getNativeLibraries().loadLibrary("instant") != null;
                }
            } catch (LinkageError ex) {
                // Sticky unavailable state; original formatter remains usable.
            } finally {
                STATE.set(loaded ? READY : UNAVAILABLE);
            }
            return loaded;
        }
    }

    // Eligibility only: Rust independently enforces the complete ASCII grammar,
    // and speedate validates the calendar. No Java fields are used as a result.
    static boolean eligible(String text) {
        int n = text.length();
        if (!(n == 20 || (n >= 22 && n <= 27)) || text.charAt(n - 1) != 'Z'
                || text.charAt(4) != '-' || text.charAt(7) != '-'
                || text.charAt(10) != 'T' || text.charAt(13) != ':'
                || text.charAt(16) != ':' || (n > 20 && text.charAt(19) != '.')) {
            return false;
        }
        int hour = pair(text, 11);
        int minute = pair(text, 14);
        int second = pair(text, 17);
        if (hour < 0 || hour > 23 || minute < 0 || minute > 59 || second < 0 || second > 59) {
            return false;
        }
        int month = pair(text, 5);
        int day = pair(text, 8);
        return month >= 1 && month <= 12 && day >= 1 && day <= 31;
    }

    private static int pair(String text, int offset) {
        return (text.charAt(offset) - '0') * 10 + text.charAt(offset + 1) - '0';
    }

    static Instant tryParse(String text) {
        if (!eligible(text) || !VM.isBooted() || failed) {
            return null;
        }
        try {
            // Preboot calls must not initialize this holder. Calls concurrent
            // with native loading use Java without waiting for the loader.
            if (!Library.available()) {
                return null;
            }
            long packed = parse0(text);
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

    private static native long parse0(String text);
}
