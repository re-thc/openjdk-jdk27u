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

package org.openjdk.bench.memory;

import java.nio.file.Files;

// Standalone functional coverage; no JMH or workload timing is launched.
public class FileChannelStateRegression {
    public static void main(String[] args) throws Exception {
        for (int size : new int[] {1, 3}) {
            VerifiedFileChannelRead read = new VerifiedFileChannelRead();
            VerifiedFileChannelWrite write = new VerifiedFileChannelWrite();
            read.fileSize = write.fileSize = size;
            read.beforeRun();
            write.beforeRun();
            try {
                for (int iteration = 0; iteration < 2; iteration++) {
                    int count = size * 3 + 2;
                    read.beforeIteration();
                    try {
                        for (int i = 0; i < count; i++) {
                            if (read.test() != (i % size)) throw new AssertionError("Read sequence");
                        }
                        if (read.operations != count || read.bytes != count ||
                            read.rewinds != (count - 1) / size) throw new AssertionError("Read EOF work");
                    } finally {
                        read.afterIteration();
                    }
                    write.beforeIteration();
                    try {
                        for (int i = 0; i < count; i++) {
                            if (write.test() != 1) throw new AssertionError("Write byte count");
                        }
                        if (write.operations != count || write.bytes != count ||
                            write.rewinds != count / size) throw new AssertionError("Write repetition work");
                    } finally {
                        write.afterIteration();
                    }
                    byte[] contents = Files.readAllBytes(write.f.toPath());
                    if (contents.length != size) throw new AssertionError("Write file bound");
                    for (byte b : contents) if (b != 47) throw new AssertionError("Write contents");
                }
            } finally {
                read.afterRun();
                write.afterRun();
            }
        }
        System.out.println("FILE_IO_STATE_OK sizes=1,3 iterations=2 positive_bytes=true");
    }
}
