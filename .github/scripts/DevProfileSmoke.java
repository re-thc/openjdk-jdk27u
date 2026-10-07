/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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

import java.lang.module.ModuleFinder;
import java.lang.management.ManagementFactory;
import java.util.Arrays;

class DevProfileSmoke {
    public static void main(String[] args) {
        for (String module : new String[] { "java.desktop", "java.datatransfer", "java.se",
                "jdk.accessibility", "jdk.editpad", "jdk.hotspot.agent", "jdk.jconsole",
                "jdk.jpackage", "jdk.unsupported.desktop" }) {
            if (ModuleFinder.ofSystem().find(module).isPresent()) {
                throw new AssertionError("Unexpected desktop-dependent module: " + module);
            }
        }
        // Exercise allocation, collection, and native code under each supported GC.
        for (int i = 0; i < 100; i++) {
            var bytes = new byte[1024 * 1024];
            Arrays.fill(bytes, (byte) i);
            if (bytes[bytes.length - 1] != (byte) i) {
                throw new AssertionError("Allocation or fill failed");
            }
        }
        System.gc();
        System.out.println(ManagementFactory.getGarbageCollectorMXBeans().stream()
                .map(bean -> bean.getName()).toList());
    }
}
