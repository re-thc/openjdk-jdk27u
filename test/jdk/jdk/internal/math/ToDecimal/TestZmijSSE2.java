/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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
 * @summary Exercise Zmij's portable backend when SSE4.1 is disabled
 * @requires os.arch == "amd64"
 * @modules java.base/jdk.internal.math:+open
 * @build TestZmij
 * @run main/othervm -Xint -XX:UseSSE=2 TestZmij
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:UseSSE=2 TestZmij
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:UseSSE=2 TestZmij
 * @run main/othervm -Xint -XX:UseSSE=2 -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_formatZmij,_decimalZmij TestZmij
 */

public class TestZmijSSE2 {
    // The actions deliberately reuse the complete differential/canary test.
}
