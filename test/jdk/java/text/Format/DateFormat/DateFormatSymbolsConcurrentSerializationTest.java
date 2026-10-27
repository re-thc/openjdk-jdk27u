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
 * @summary Clone must not share symbol arrays exposed by concurrent serialization
 * @requires vm.jvmti
 * @library /test/lib
 * @modules jdk.jdi
 * @run driver DateFormatSymbolsConcurrentSerializationTest
 */

import com.sun.jdi.Bootstrap;
import com.sun.jdi.ClassType;
import com.sun.jdi.ObjectReference;
import com.sun.jdi.ThreadReference;
import com.sun.jdi.VirtualMachine;
import com.sun.jdi.event.BreakpointEvent;
import com.sun.jdi.event.ClassPrepareEvent;
import com.sun.jdi.event.Event;
import com.sun.jdi.event.EventSet;
import com.sun.jdi.event.MethodEntryEvent;
import com.sun.jdi.event.MethodExitEvent;
import com.sun.jdi.event.ModificationWatchpointEvent;
import com.sun.jdi.event.MonitorContendedEnterEvent;
import com.sun.jdi.event.StepEvent;
import com.sun.jdi.event.VMDeathEvent;
import com.sun.jdi.event.VMDisconnectEvent;
import com.sun.jdi.request.EventRequest;
import com.sun.jdi.request.StepRequest;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.text.DateFormatSymbols;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import jdk.test.lib.Utils;

public class DateFormatSymbolsConcurrentSerializationTest {
    private static final String TARGET = Target.class.getName();
    private static final String SNAPSHOT_TARGET = SnapshotTarget.class.getName();
    private static final String SYMBOLS = DateFormatSymbols.class.getName();
    private static final String WRITER = "symbols-writer";
    private static final String CLONER = "symbols-cloner";
    private static final long TIMEOUT = Utils.adjustTimeout(30_000);

    public static void main(String[] args) throws Exception {
        run(false);
        run(true);
        run(SNAPSHOT_TARGET, "", true);
    }

    private static void run(boolean withSetter) throws Exception {
        run(TARGET, Boolean.toString(withSetter), false);
    }

    private static void run(String target, String argument, boolean snapshot) throws Exception {
        var launcher = Bootstrap.virtualMachineManager().defaultConnector();
        var arguments = launcher.defaultArguments();
        arguments.get("home").setValue(System.getProperty("test.jdk"));
        arguments.get("main").setValue(target + " " + argument);
        var options = new ArrayList<>(List.of(Utils.getTestJavaOpts()));
        options.add("-cp");
        options.add(System.getProperty("test.class.path", System.getProperty("java.class.path")));
        arguments.get("options").setValue(String.join(" ",
                options.stream().map(s -> "\"" + s + "\"").toList()));
        VirtualMachine vm = launcher.launch(arguments);
        Process process = vm.process();
        Thread output = copy(process.getInputStream());
        Thread errors = copy(process.getErrorStream());
        try {
            if (snapshot) exerciseSnapshot(vm);
            else exercise(vm);
            if (!process.waitFor(TIMEOUT, TimeUnit.MILLISECONDS)) {
                throw new AssertionError("Debuggee did not terminate");
            }
            output.join();
            errors.join();
            if (process.exitValue() != 0) {
                throw new AssertionError("Debuggee exit: " + process.exitValue());
            }
        } finally {
            if (process.isAlive()) {
                process.destroyForcibly();
            }
        }
    }

    private static Thread copy(InputStream input) {
        return Thread.ofPlatform().start(() -> {
            try (input) {
                input.transferTo(System.out);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        });
    }

    private static void exerciseSnapshot(VirtualMachine vm) throws Exception {
        var requests = vm.eventRequestManager();
        var captured = requests.createMethodEntryRequest();
        captured.addClassFilter(SYMBOLS + "$SymbolArrays");
        captured.setSuspendPolicy(EventRequest.SUSPEND_EVENT_THREAD);
        captured.enable();
        var finished = requests.createMethodEntryRequest();
        finished.addClassFilter(SNAPSHOT_TARGET);
        finished.setSuspendPolicy(EventRequest.SUSPEND_EVENT_THREAD);
        EventSet stoppedClone = null;
        boolean copiedAfterExposure = false;
        boolean disconnected = false;
        while (!disconnected) {
            EventSet events = vm.eventQueue().remove(TIMEOUT);
            if (events == null) throw new AssertionError("Snapshot schedule timed out");
            boolean resume = true;
            for (Event event : events) {
                if (event instanceof MethodEntryEvent entry
                        && entry.thread().name().equals(CLONER)
                        && entry.method().name().equals("copyTo")) {
                    // The clone captured its immutable snapshot but has not
                    // copied any references. Let serialization finish and
                    // mutate the exposed source array before resuming it.
                    captured.disable();
                    stoppedClone = events;
                    resume = false;
                    finished.addThreadFilter(vm.allThreads().stream()
                            .filter(t -> t.name().equals(WRITER)).findFirst().orElseThrow());
                    finished.enable();
                    ClassType target = (ClassType) vm.classesByName(SNAPSHOT_TARGET).getFirst();
                    target.invokeMethod(entry.thread(), target.methodsByName("startWriter").getFirst(),
                            List.of(), ClassType.INVOKE_SINGLE_THREADED);
                } else if (event instanceof MethodEntryEvent entry
                        && entry.thread().name().equals(WRITER)
                        && entry.method().name().equals("writerFinished")) {
                    if (stoppedClone == null) throw new AssertionError("No captured snapshot");
                    copiedAfterExposure = true;
                    stoppedClone.resume();
                    stoppedClone = null;
                    finished.disable();
                } else if (event instanceof VMDeathEvent || event instanceof VMDisconnectEvent) {
                    disconnected = true;
                }
            }
            if (resume && !disconnected) events.resume();
        }
        if (!copiedAfterExposure) throw new AssertionError("Snapshot schedule did not execute");
    }

    private static void exercise(VirtualMachine vm) throws Exception {
        var requests = vm.eventRequestManager();
        for (String name : List.of(TARGET, SYMBOLS)) {
            var prepare = requests.createClassPrepareRequest();
            prepare.addClassFilter(name);
            prepare.setSuspendPolicy(EventRequest.SUSPEND_EVENT_THREAD);
            prepare.enable();
        }
        // If no symbol-array detachment event occurs, stop before serialization
        // callbacks so the child can still verify clone isolation.
        var defaultWrite = requests.createMethodEntryRequest();
        defaultWrite.addClassFilter(ObjectOutputStream.class.getName());
        defaultWrite.setSuspendPolicy(EventRequest.SUSPEND_EVENT_THREAD);
        defaultWrite.enable();
        EventSet stoppedWriter = null;
        ObjectReference detached = null;
        ClassType target = null;
        boolean cloning = false;
        boolean verified = false;
        boolean disconnected = false;
        while (!disconnected) {
            EventSet events = vm.eventQueue().remove(TIMEOUT);
            if (events == null) {
                throw new AssertionError("Timed out waiting for debugger event");
            }
            boolean resume = true;
            for (Event event : events) {
                if (event instanceof ClassPrepareEvent prepare) {
                    if (prepare.referenceType().name().equals(SYMBOLS)) {
                        var watch = requests.createModificationWatchpointRequest(
                                prepare.referenceType().fieldByName("eras"));
                        watch.setSuspendPolicy(EventRequest.SUSPEND_EVENT_THREAD);
                        watch.enable();
                    } else {
                        target = (ClassType) prepare.referenceType();
                        var verify = requests.createBreakpointRequest(
                                target.methodsByName("verify").getFirst().location());
                        verify.setSuspendPolicy(EventRequest.SUSPEND_EVENT_THREAD);
                        verify.enable();
                    }
                } else if (event instanceof ModificationWatchpointEvent watch
                        && watch.thread().name().equals(WRITER)
                        && watch.object().equals(target.getValue(target.fieldByName("source")))) {
                    requests.deleteEventRequest(watch.request());
                    detached = (ObjectReference) watch.valueToBe();
                    System.out.println("Detaching eras: " + watch.valueCurrent()
                            + " -> " + detached);
                    // Watchpoints stop before putfield. Step past the store,
                    // then keep the writer suspended in the vulnerable window.
                    var step = requests.createStepRequest(watch.thread(),
                            StepRequest.STEP_MIN, StepRequest.STEP_OVER);
                    step.addCountFilter(1);
                    step.setSuspendPolicy(EventRequest.SUSPEND_EVENT_THREAD);
                    step.enable();
                } else if (event instanceof StepEvent step) {
                    requests.deleteEventRequest(step.request());
                    ObjectReference source = (ObjectReference) target.getValue(
                            target.fieldByName("source"));
                    ObjectReference eras = array(source);
                    if (!eras.equals(detached)) {
                        throw new AssertionError("Step did not pass the eras store");
                    }
                    var flag = source.referenceType().fieldByName("canShareSymbolArrays");
                    if (!source.getValue(flag).equals(vm.mirrorOf(true))) {
                        throw new AssertionError("Writer passed the sharing transition");
                    }
                    defaultWrite.disable();
                    stoppedWriter = events;
                    resume = false;
                    startClone(vm, target, step.thread());
                    cloning = true;
                } else if (event instanceof MethodEntryEvent entry
                        && entry.method().name().equals("defaultWriteObject")
                        && entry.thread().name().equals(WRITER) && !cloning) {
                    defaultWrite.disable();
                    stoppedWriter = events;
                    resume = false;
                    startClone(vm, target, entry.thread());
                    cloning = true;
                } else if (event instanceof MonitorContendedEnterEvent enter) {
                    ObjectReference source = (ObjectReference) target.getValue(
                            target.fieldByName("source"));
                    if (!enter.monitor().equals(source) || stoppedWriter == null) {
                        throw new AssertionError("Unexpected clone contention");
                    }
                    System.out.println("Clone waits for symbol-array detachment");
                    stoppedWriter.resume();
                    stoppedWriter = null;
                    requests.deleteEventRequest(enter.request());
                } else if (event instanceof MethodExitEvent exit
                        && exit.method().name().equals("clone")) {
                    ObjectReference clone = (ObjectReference) exit.returnValue();
                    System.out.println("Clone eras: " + array(clone));
                    if (stoppedWriter != null) {
                        stoppedWriter.resume();
                        stoppedWriter = null;
                    }
                    requests.deleteEventRequest(exit.request());
                } else if (event instanceof BreakpointEvent) {
                    ObjectReference source = (ObjectReference) target.getValue(
                            target.fieldByName("source"));
                    ObjectReference clone = (ObjectReference) target.getValue(
                            target.fieldByName("clone"));
                    ObjectReference retained = (ObjectReference) target.getValue(
                            target.fieldByName("retained"));
                    System.out.println("Escaping eras: source=" + array(source)
                            + ", clone=" + array(clone) + ", retained=" + retained);
                    if (!array(source).equals(retained)) {
                        throw new AssertionError("Hook did not retain source's eras");
                    }
                    verified = true;
                } else if (event instanceof VMDeathEvent || event instanceof VMDisconnectEvent) {
                    disconnected = true;
                }
            }
            if (resume && !disconnected) {
                events.resume();
            }
        }
        if (!cloning || !verified) {
            throw new AssertionError("Controlled interleaving was not exercised");
        }
    }

    private static ObjectReference array(ObjectReference symbols) {
        return (ObjectReference) symbols.getValue(symbols.referenceType().fieldByName("eras"));
    }

    private static void startClone(VirtualMachine vm, ClassType target,
                                   ThreadReference writer) throws Exception {
        ThreadReference cloner = vm.allThreads().stream()
                .filter(t -> t.name().equals(CLONER)).findFirst().orElseThrow();
        var requests = vm.eventRequestManager();
        requests.deleteEventRequests(requests.modificationWatchpointRequests());
        var exit = requests.createMethodExitRequest();
        exit.addClassFilter(SYMBOLS);
        exit.addThreadFilter(cloner);
        exit.setSuspendPolicy(EventRequest.SUSPEND_EVENT_THREAD);
        exit.enable();
        var contention = requests.createMonitorContendedEnterRequest();
        contention.addClassFilter(SYMBOLS);
        contention.addThreadFilter(cloner);
        contention.setSuspendPolicy(EventRequest.SUSPEND_EVENT_THREAD);
        contention.enable();
        target.invokeMethod(writer, target.methodsByName("startClone").getFirst(),
                List.of(), ClassType.INVOKE_SINGLE_THREADED);
    }

    public static class SnapshotTarget {
        private static final CountDownLatch write = new CountDownLatch(1);
        private static DateFormatSymbols source;
        private static DateFormatSymbols clone;
        private static Throwable failure;

        public static void main(String[] args) throws Exception {
            source = new DateFormatSymbols(Locale.US);
            source.setZoneStrings(new String[][] {{"GMT", "GMT", "GMT", "GMT", "GMT"}});
            String[] expected = source.getEras();
            Thread cloner = new Thread(() -> {
                try {
                    clone = (DateFormatSymbols) source.clone();
                } catch (Throwable t) {
                    failure = t;
                }
            }, CLONER);
            Thread writer = new Thread(() -> {
                try {
                    write.await();
                    try (var out = new ObjectOutputStream(new ByteArrayOutputStream()) {
                        { enableReplaceObject(true); }
                        @Override
                        protected Object replaceObject(Object object) {
                            if (object instanceof String[] array && Arrays.equals(array, expected)) {
                                array[0] = "snapshot-hook-mutation";
                            }
                            return object;
                        }
                    }) {
                        out.writeObject(source);
                    }
                    writerFinished();
                } catch (Throwable t) {
                    failure = t;
                }
            }, WRITER);
            writer.start();
            cloner.start();
            writer.join();
            cloner.join();
            if (failure != null) throw new AssertionError(failure);
            if (!source.getEras()[0].equals("snapshot-hook-mutation")
                    || !Arrays.equals(clone.getEras(), expected)
                    || !Arrays.equals(new DateFormatSymbols(Locale.US).getEras(), expected)) {
                throw new AssertionError("Captured snapshot shared the exposed source array");
            }
        }

        private static void startWriter() { write.countDown(); }
        private static void writerFinished() { }
    }

    public static class Target {
        private static final CountDownLatch start = new CountDownLatch(1);
        private static final CountDownLatch setterStart = new CountDownLatch(1);
        private static final CountDownLatch setterDone = new CountDownLatch(1);
        private static DateFormatSymbols source;
        private static DateFormatSymbols clone;
        private static String[] retained;
        private static boolean withSetter;
        private static String[] setterInput;
        private static Throwable failure;

        public static void main(String[] args) throws Exception {
            withSetter = Boolean.parseBoolean(args[0]);
            source = new DateFormatSymbols(Locale.US);
            source.setZoneStrings(new String[][] {{"GMT", "GMT", "GMT", "GMT", "GMT"}});
            DateFormatSymbols peer = new DateFormatSymbols(Locale.US);
            String[] expected = peer.getEras();
            Thread setter = new Thread(() -> {
                try {
                    setterStart.await();
                    if (withSetter) {
                        setterInput = new String[] {"setter-BC", "setter-AD"};
                        source.setEras(setterInput);
                    }
                } catch (Throwable t) {
                    failure = t;
                } finally {
                    setterDone.countDown();
                }
            }, "symbols-setter");
            Thread cloner = new Thread(() -> {
                try {
                    start.await();
                    clone = (DateFormatSymbols) source.clone();
                } catch (Throwable t) {
                    failure = t;
                }
            }, CLONER);
            setter.start();
            cloner.start();
            Thread writer = new Thread(() -> {
                try (var out = new ObjectOutputStream(new ByteArrayOutputStream()) {
                    { enableReplaceObject(true); }
                    @Override
                    protected Object replaceObject(Object object) {
                        if (object instanceof String[] array
                                && Arrays.equals(array, source.getEras())) {
                            retained = array;
                        }
                        return object;
                    }
                }) {
                    out.writeObject(source);
                } catch (Throwable t) {
                    failure = t;
                }
            }, WRITER);
            writer.start();
            writer.join();
            cloner.join();
            setterStart.countDown();
            setter.join();
            if (failure != null) {
                throw new AssertionError(failure);
            }
            verify();
            if (!Arrays.equals(peer.getEras(), expected)
                    || !Arrays.equals(new DateFormatSymbols(Locale.US).getEras(), expected)) {
                throw new AssertionError("Locale cache or peer was exposed");
            }
        }

        private static void startClone() throws InterruptedException {
            if (withSetter) {
                setterStart.countDown();
                setterDone.await();
            }
            start.countDown();
        }

        private static void verify() {
            if (retained == null || clone == null) {
                throw new AssertionError("Missing hook array or clone");
            }
            String[] expected = clone.getEras();
            retained[0] = "hook-retained-mutation";
            if (setterInput != null) {
                setterInput[1] = "setter-input-mutation";
            }
            if (!Arrays.equals(clone.getEras(), expected)) {
                throw new AssertionError("Clone shares the escaping serialization array");
            }
            if (!source.getEras()[0].equals("hook-retained-mutation")) {
                throw new AssertionError("Source serialization alias was lost");
            }
            if (source.getEras()[1].equals("setter-input-mutation")) {
                throw new AssertionError("Setter input was exposed");
            }
        }
    }
}
