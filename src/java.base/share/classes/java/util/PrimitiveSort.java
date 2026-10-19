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

package java.util;

import jdk.internal.loader.BootLoader;
import jdk.internal.util.StaticProperty;
import jdk.internal.vm.annotation.DontInline;

/** Native sorting of bounded long ranges on Linux x64. */
final class PrimitiveSort {
    static final int MIN_SIZE = 4096;
    static final int MAX_SIZE = 1 << 20;

    // This class is initialized only for ranges within the admission bounds.
    static final boolean ENABLED = StaticProperty.osName().equals("Linux")
            && StaticProperty.osArch().equals("amd64")
            && !Boolean.getBoolean("jdk.util.Arrays.disableNativeSort");

    // The caller retains structured and repeated-pivot inputs in Java.
    private static final class Native {
        static final boolean SUPPORTED = initializeNative();
    }

    private PrimitiveSort() {}

    private static boolean initializeNative() {
        try {
            BootLoader.loadLibrary("primitivesort");
            return supported();
        } catch (UnsatisfiedLinkError unavailable) {
            return false;
        }
    }

    @DontInline
    static boolean trySort(long[] a, int low, int size) {
        // The caller has already declined run merging and sorted its pivot
        // sample. Failure leaves that permutation intact and falls through
        // to the original partition with unchanged recursion-depth accounting.
        return Native.SUPPORTED && sortLongs(a, low, size);
    }

    private static native boolean supported();
    static native boolean sortLongs(long[] a, int low, int size);
}
