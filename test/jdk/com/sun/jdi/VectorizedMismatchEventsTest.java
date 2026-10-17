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
 * @summary Interpreted ArraysSupport.vectorizedMismatch reports breakpoints and
 *          method entry events, although the interpreter may run it through a stub
 * @run build TestScaffold VMConnection TargetListener TargetAdapter
 * @run compile -g VectorizedMismatchEventsTest.java
 * @run driver VectorizedMismatchEventsTest -Xint VectorizedMismatchEventsTarg
 */

import com.sun.jdi.ReferenceType;
import com.sun.jdi.ThreadReference;
import com.sun.jdi.event.BreakpointEvent;
import com.sun.jdi.event.MethodEntryEvent;
import com.sun.jdi.request.EventRequest;
import com.sun.jdi.request.MethodEntryRequest;
import java.util.Arrays;

class VectorizedMismatchEventsTarg {
    static int result;

    static void compare() {
        byte[] a = new byte[256];
        byte[] b = new byte[256];
        b[200] = 1;
        result = Arrays.mismatch(a, b);
        if (result != 200) {
            throw new AssertionError("mismatch " + result);
        }
    }

    public static void main(String[] args) {
        compare(); // reaches the breakpoint
        compare(); // reports a method entry
    }
}

public class VectorizedMismatchEventsTest extends TestScaffold {
    private static final String CLASS = "jdk.internal.util.ArraysSupport";
    private static final String METHOD = "vectorizedMismatch";

    VectorizedMismatchEventsTest(String[] args) {
        super(args);
    }

    public static void main(String[] args) throws Exception {
        new VectorizedMismatchEventsTest(args).startTests();
    }

    protected void runTests() throws Exception {
        BreakpointEvent main = startToMain("VectorizedMismatchEventsTarg");
        ThreadReference thread = main.thread();

        BreakpointEvent bp = resumeTo(CLASS, METHOD, "(Ljava/lang/Object;JLjava/lang/Object;JII)I");
        if (!bp.location().method().name().equals(METHOD) || !bp.thread().equals(thread)) {
            failure("unexpected breakpoint " + bp.location() + " in " + bp.thread());
        }
        eventRequestManager().deleteEventRequest(bp.request());

        MethodEntryRequest entry = eventRequestManager().createMethodEntryRequest();
        entry.addClassFilter(CLASS);
        entry.addThreadFilter(thread);
        entry.setSuspendPolicy(EventRequest.SUSPEND_ALL);
        entry.enable();
        boolean found = false;
        // ArraysSupport.mismatch precedes vectorizedMismatch in each comparison.
        for (int i = 0; i < 16 && !found; i++) {
            MethodEntryEvent event = (MethodEntryEvent) waitForRequestedEvent(entry);
            found = event.method().name().equals(METHOD);
        }
        entry.disable();
        if (!found) {
            failure("no method entry event for " + CLASS + "." + METHOD);
        }

        listenUntilVMDisconnect();
        if (!testFailed) {
            println("VectorizedMismatchEventsTest: passed");
        } else {
            throw new Exception("VectorizedMismatchEventsTest: failed");
        }
    }
}
