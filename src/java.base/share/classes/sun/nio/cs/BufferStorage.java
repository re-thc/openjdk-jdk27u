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
 *
 */

package sun.nio.cs;

import java.nio.Buffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import jdk.internal.access.JavaNioAccess;
import jdk.internal.access.SharedSecrets;
import sun.nio.ch.DirectBuffer;

/**
 * The backing storage of a buffer, as an (object, address) pair, for the coder
 * loops that hand a range to an intrinsic. Heap buffers expose their array and
 * direct buffers a null base and a native address, so one pair covers every
 * source and destination combination.
 */
final class BufferStorage {
    private static final JavaNioAccess NIO = SharedSecrets.getJavaNioAccess();

    private BufferStorage() { }

    /**
     * Returns true if the buffer's elements are in memory the intrinsic can access
     * directly: a heap array, or native memory that is not a mapped file.
     * A write is declined for a read-only buffer, and a char buffer in non-native
     * byte order stores its elements swapped.
     */
    static boolean accessible(Buffer buffer, boolean write) {
        if (write && buffer.isReadOnly()) {
            return false;
        }
        if (buffer instanceof CharBuffer chars && chars.order() != ByteOrder.nativeOrder()) {
            return false;
        }
        if (!buffer.isDirect()) {
            // A heap buffer without an array, such as one wrapping a CharSequence, has no storage.
            return NIO.getBufferBase(buffer) != null;
        }
        // A fault in a truncated mapped file is reported as an InternalError for the
        // accesses of the Java loops, but would terminate the VM inside the intrinsic.
        for (Buffer b = buffer; ; ) {
            if (NIO.unmapper(b) != null) {
                return false;
            }
            var segment = NIO.bufferSegment(b);
            if (segment != null && segment.isMapped()) {
                return false;
            }
            if (b instanceof DirectBuffer direct && direct.attachment() instanceof Buffer parent) {
                b = parent;
            } else {
                return true;
            }
        }
    }

    static Object base(Buffer buffer) {
        return NIO.getBufferBase(buffer);
    }

    /** {@return the address of the buffer's element at its position} */
    static long address(Buffer buffer, int shift) {
        return NIO.getBufferAddress(buffer) + ((long) buffer.position() << shift);
    }

    /** {@return true if the byte ranges may share memory} */
    static boolean overlaps(Object base1, long address1, long length1,
                            Object base2, long address2, long length2) {
        return base1 == base2
                && (Long.compareUnsigned(address1 - address2, length2) < 0
                    || Long.compareUnsigned(address2 - address1, length1) < 0);
    }

    /** Keeps the sessions of both buffers open until {@link #release}. */
    static void acquire(Buffer first, Buffer second) {
        NIO.acquireSession(first);
        try {
            NIO.acquireSession(second);
        } catch (Throwable t) {
            NIO.releaseSession(first);
            throw t;
        }
    }

    static void release(Buffer first, Buffer second) {
        try {
            NIO.releaseSession(second);
        } finally {
            NIO.releaseSession(first);
        }
    }
}
