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

import java.lang.management.ManagementFactory;
import java.nio.file.Files;
import java.nio.file.Path;
import org.renaissance.Plugin;

public final class RetainedHeap implements Plugin.AfterOperationSetUpListener,
        Plugin.BeforeOperationTearDownListener, Plugin.MeasurementResultPublisher {
    private long before, after, nonHeapBefore, nonHeapAfter, rssBefore, rssAfter;
    private static long used() {
        System.gc();
        return ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getUsed();
    }
    private static long nonHeap() {
        return ManagementFactory.getMemoryMXBean().getNonHeapMemoryUsage().getUsed();
    }
    private static long rss() {
        try {
            for (String line : Files.readAllLines(Path.of("/proc/self/status"))) {
                if (line.startsWith("VmRSS:")) return Long.parseLong(line.trim().split("\\s+")[1]) * 1024;
            }
        } catch (Exception ignored) { }
        return -1;
    }
    public void afterOperationSetUp(String benchmark, int iteration, boolean last) {
        rss();
        before = used(); nonHeapBefore = nonHeap(); rssBefore = rss();
    }
    public void beforeOperationTearDown(String benchmark, int iteration, long duration) {
        after = used(); nonHeapAfter = nonHeap(); rssAfter = rss();
    }
    public void onMeasurementResultsRequested(String benchmark, int iteration, Plugin.MeasurementResultListener listener) {
        listener.onMeasurementResult(benchmark, "retained_heap_before_bytes", before);
        listener.onMeasurementResult(benchmark, "retained_heap_after_bytes", after);
        listener.onMeasurementResult(benchmark, "non_heap_before_bytes", nonHeapBefore);
        listener.onMeasurementResult(benchmark, "non_heap_after_bytes", nonHeapAfter);
        listener.onMeasurementResult(benchmark, "rss_before_bytes", rssBefore);
        listener.onMeasurementResult(benchmark, "rss_after_bytes", rssAfter);
    }
}
