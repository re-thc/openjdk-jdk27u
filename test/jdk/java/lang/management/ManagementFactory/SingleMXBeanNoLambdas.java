/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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
 * @summary Getting a platform MXBean for the first time does not link
 *          lambdas in the management modules
 * @requires vm.flagless
 * @library /test/lib
 * @run driver SingleMXBeanNoLambdas
 */

import java.lang.management.ManagementFactory;
import java.lang.management.MemoryMXBean;
import java.lang.management.OperatingSystemMXBean;
import java.lang.management.RuntimeMXBean;
import java.lang.management.ThreadMXBean;

import jdk.test.lib.process.ProcessTools;

public class SingleMXBeanNoLambdas {

    public static void main(String[] args) throws Exception {
        ProcessTools.executeLimitedTestJava("-Xlog:class+load", GetMXBeans.class.getName())
                .shouldHaveExitValue(0)
                .shouldContain("MXBeans OK")
                .shouldNotMatch("(java\\.lang\\.management|sun\\.management|com\\.sun\\.management|jdk\\.management)\\.\\S*\\$\\$Lambda");
    }

    public static class GetMXBeans {
        public static void main(String[] args) {
            RuntimeMXBean runtime = ManagementFactory.getRuntimeMXBean();
            MemoryMXBean memory = ManagementFactory.getMemoryMXBean();
            ThreadMXBean thread = ManagementFactory.getThreadMXBean();
            OperatingSystemMXBean os = ManagementFactory.getOperatingSystemMXBean();
            if (runtime.getUptime() < 0 || memory.getHeapMemoryUsage().getUsed() < 0
                    || thread.getThreadCount() < 1 || os.getAvailableProcessors() < 1) {
                throw new AssertionError("Unexpected MXBean values");
            }
            if (ManagementFactory.getPlatformMXBeans(RuntimeMXBean.class).get(0) != runtime
                    || ManagementFactory.getPlatformMXBean(MemoryMXBean.class) != memory) {
                throw new AssertionError("MXBeans differ");
            }
            System.out.println("MXBeans OK");
        }
    }
}
