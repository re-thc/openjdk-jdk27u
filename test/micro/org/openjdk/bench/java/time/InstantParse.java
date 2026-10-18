/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only
 */
package org.openjdk.bench.java.time;

import java.lang.management.GarbageCollectorMXBean;
import java.lang.management.ManagementFactory;
import java.nio.CharBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.time.Instant;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Arrays;
import java.util.HexFormat;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.IterationParams;
import org.openjdk.jmh.runner.IterationType;

/** Public Instant.parse calls; fixed invocation counts and retained per-thread counters. */
@State(Scope.Thread)
@BenchmarkMode(Mode.SingleShotTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 1, batchSize = 16384)
@Measurement(iterations = 4, batchSize = 2048)
@Fork(value = 1, jvmArgsAppend = {"-XX:ActiveProcessorCount=2", "-XX:+UseG1GC",
        "-Xms256m", "-Xmx256m", "-Xbatch"})
@Threads(1)
public class InstantParse {
    static volatile Object sink;
    static final boolean FORMATTER = Boolean.getBoolean("instant.formatter");
    static final int BATCH = 64;

    @Param({"happy", "mixed", "fallback", "syntax", "calendar", "custom"})
    public String input;

    private CharSequence[] inputs;
    private int cursor, startCursor, block;
    private long calls, checksum, beforeBytes, beforeCompiler;
    private com.sun.management.ThreadMXBean allocation;
    private java.lang.management.CompilationMXBean compiler;
    private List<GarbageCollectorMXBean> collectors;
    private long[] beforeGc;
    private final long[][] counters = new long[4][8];
    private final int[] offsets = new int[4];

    @Setup(Level.Trial)
    public void setup() throws Exception {
        if ("M".equals(System.getProperty("instant.route"))) unavailable();
        inputs = corpus(input);
        allocation = (com.sun.management.ThreadMXBean) ManagementFactory.getThreadMXBean();
        compiler = ManagementFactory.getCompilationMXBean();
        collectors = List.copyOf(ManagementFactory.getGarbageCollectorMXBeans());
        beforeGc = new long[collectors.size()];
        if (!allocation.isThreadAllocatedMemorySupported() || compiler == null
                || !compiler.isCompilationTimeMonitoringSupported() || collectors.isEmpty()) {
            throw new IllegalStateException("Required counters unavailable");
        }
        allocation.setThreadAllocatedMemoryEnabled(true);
        // Warm counter access without adding parse calls to the fixed warmup.
        for (int i = 0; i < 10000; i++) {
            sink = allocation.getThreadAllocatedBytes(Thread.currentThread().threadId())
                    + compiler.getTotalCompilationTime();
            for (GarbageCollectorMXBean gc : collectors) sink = gc.getCollectionTime();
        }
    }

    @Setup(Level.Iteration)
    public void before(IterationParams params) {
        int expected = params.getType() == IterationType.WARMUP ? 16384 : 2048;
        int count = params.getType() == IterationType.WARMUP ? 1 : 4;
        if (params.getBatchSize() != expected || params.getCount() != count) {
            throw new IllegalArgumentException("Use the documented fixed SingleShotTime batches");
        }
        calls = checksum = 0;
        startCursor = cursor;
        beforeCompiler = compiler.getTotalCompilationTime();
        for (int i = 0; i < beforeGc.length; i++) {
            beforeGc[i] = collectors.get(i).getCollectionTime();
            if (beforeGc[i] < 0) throw new IllegalStateException("Unsupported GC counter");
        }
        beforeBytes = allocation.getThreadAllocatedBytes(Thread.currentThread().threadId());
        if (beforeBytes < 0 || beforeCompiler < 0) throw new IllegalStateException("Unsupported counter");
    }

    @Benchmark
    public long parse64() {
        long result = batch(inputs, cursor);
        cursor = (cursor + BATCH) % inputs.length;
        checksum += result;
        calls += BATCH;
        return result;
    }

    @TearDown(Level.Iteration)
    public void after(IterationParams params) {
        long bytes = allocation.getThreadAllocatedBytes(Thread.currentThread().threadId()) - beforeBytes;
        long compiled = compiler.getTotalCompilationTime();
        long gcMillis = 0;
        for (int i = 0; i < beforeGc.length; i++) {
            long end = collectors.get(i).getCollectionTime();
            if (end < beforeGc[i]) throw new IllegalStateException("GC counter moved backward");
            gcMillis += end - beforeGc[i];
        }
        if (bytes < 0 || compiled < beforeCompiler) throw new IllegalStateException("Counter moved backward");
        if (calls != (long) params.getBatchSize() * BATCH) throw new AssertionError("Invocation count");
        if (params.getType() == IterationType.MEASUREMENT) {
            if (block >= counters.length) throw new AssertionError("Unexpected measurement iteration");
            counters[block] = new long[] {block, calls, bytes, beforeCompiler, compiled, gcMillis, checksum, 0};
            offsets[block++] = startCursor;
        }
    }

    @TearDown(Level.Trial)
    public void finish() throws Exception {
        if (block != 4) throw new AssertionError("Incomplete measurement cohort");
        route(input);
        for (int i = 0; i < block; i++) {
            counters[i][7] = expected(inputs, offsets[i], (int) counters[i][1]);
            if (counters[i][6] != counters[i][7]) throw new AssertionError("Checksum block " + i);
        }
        // JMH supplies the four elapsed SingleShotTime scores; counters are outside its timing loop.
        System.out.println("instant-counters,block,calls,bytes,compiler_before_ms,compiler_after_ms,gc_ms,checksum,expected_checksum");
        for (long[] row : counters) {
            System.out.print("instant-counters");
            for (long value : row) System.out.print("," + value);
            System.out.println();
        }
    }

    static final String[] HAPPY = {
        "2026-10-16T12:34:56Z", "2000-02-29T01:02:03.123456Z",
        "1969-12-31T23:59:59.999999Z", "0000-02-29T12:34:56.000001Z",
        "9999-12-31T23:59:59.9Z", "1970-01-01T00:00:00.01Z",
        "1900-01-01T01:01:01.123Z", "2400-02-29T12:34:56.12345Z"
    };
    static final String[] FALLBACK = {
        "2000-01-01T00:00:00.1234567Z", "2000-01-01T00:00:00.12345678Z",
        "2000-01-01T00:00:00.123456789Z", "2000-01-01t00:00:00z",
        "2000-01-01T24:00:00Z", "2016-12-31T23:59:60.5Z",
        "2000-01-01T00:00:00+00:00", "2000-01-01T12:34:56-07:30",
        "+10000-01-01T00:00:00Z", "-0001-01-01T00:00:00Z",
        "2000-01-01T00:00:00+00:00:30", "2000-01-01T00:00:00.000000000Z"
    };
    static final String[] SYNTAX = {
        "2000-00-01T00:00:00Z", "2000-01-00T00:00:00Z",
        "2000-01-01T24:00:01Z", "2000-01-01T00:00:60Z",
        "2000-01-01T00:00:00,1Z", "2000-01-01 00:00:00Z",
        " 2000-01-01T00:00:00Z", "2000-01-01T00:00:00Z ", "", "garbage"
    };
    static final String[] CALENDAR = {"1900-02-29T00:00:00Z", "2000-04-31T00:00:00.1Z"};

    static CharSequence[] corpus(String name) {
        return switch (name) {
            case "happy" -> HAPPY;
            case "mixed" -> new String[] {HAPPY[0],HAPPY[1],FALLBACK[0],CALENDAR[0],
                    HAPPY[2],HAPPY[3],FALLBACK[6],CALENDAR[1]};
            case "fallback" -> FALLBACK;
            case "syntax" -> SYNTAX;
            case "calendar" -> CALENDAR;
            case "custom" -> new CharSequence[] {new StringBuilder(HAPPY[0]),CharBuffer.wrap(HAPPY[1]),
                    new StringBuilder(HAPPY[2]),CharBuffer.wrap(HAPPY[3])};
            default -> throw new IllegalArgumentException(name);
        };
    }

    static Instant parse(CharSequence input) {
        return FORMATTER ? DateTimeFormatter.ISO_INSTANT.parse(input,Instant::from) : Instant.parse(input);
    }

    static Object outcome(CharSequence input, boolean oracle) {
        try {
            return oracle ? DateTimeFormatter.ISO_INSTANT.parse(input,Instant::from) : parse(input);
        } catch (DateTimeParseException error) {
            return List.of(error.getClass().getName(),error.getErrorIndex(),
                    error.getParsedString(),error.getMessage());
        }
    }

    static long value(Object object) {
        return object instanceof Instant result ? result.getEpochSecond() ^ result.getNano()
                : (Integer)((List<?>)object).get(1);
    }

    static long expected(CharSequence[] inputs, int offset, int count) {
        long[] cycle = new long[inputs.length];
        for (int i=0;i<inputs.length;i++) cycle[i]=value(outcome(inputs[i],true));
        long result=0;
        for (int i=0;i<count;i++) result+=cycle[(offset+i)%cycle.length];
        return result;
    }

    static long batch(CharSequence[] inputs, int offset) {
        long checksum=0;
        for (int i=0;i<BATCH;i++) {
            try {
                Instant result=parse(inputs[offset]);
                sink=result;
                checksum+=result.getEpochSecond() ^ result.getNano();
            } catch (DateTimeParseException error) {
                sink=error;
                checksum+=error.getErrorIndex();
            }
            if (++offset==inputs.length) offset=0;
        }
        return checksum;
    }

    static String canonical(Object object) {
        if (object instanceof Instant instant) return "I:"+instant.getEpochSecond()+":"+instant.getNano();
        StringBuilder result=new StringBuilder("E:");
        for (Object field:(List<?>)object) {
            String text=field.toString();result.append(text.length()).append(':').append(text);
        }
        return result.toString();
    }

    static void update(MessageDigest digest, CharSequence input, Object result) {
        String text=input.toString();
        digest.update((text.length()+":"+text+canonical(result)+"\n").getBytes(StandardCharsets.UTF_8));
    }

    static void route(String corpus) throws Exception {
        String requested=System.getProperty("instant.route");
        if (requested==null || requested.equals("B") || requested.equals("J")) return;
        // Inspection occurs only after the complete cohort/cold timer. Initializing
        // the state holder here creates state0; it never invokes the loader.
        var helper=Class.forName("java.time.InstantParser");
        var failed=helper.getDeclaredField("failed");failed.setAccessible(true);
        var state=Class.forName("java.time.InstantParser$Library").getDeclaredField("STATE");state.setAccessible(true);
        int actual=((java.util.concurrent.atomic.AtomicInteger)state.get(null)).get();
        int wanted=requested.equals("M")?3:(!requested.equals("D")&&!FORMATTER
                &&(corpus.equals("happy")||corpus.equals("mixed")||corpus.equals("calendar"))?2:0);
        if (actual!=wanted || failed.getBoolean(null)!=requested.equals("M"))
            throw new AssertionError("Wrong backend route state: "+requested+"/"+corpus+" state="+actual);
    }

    static void audit(boolean nativeRoute) throws Exception {
        var helper=nativeRoute?Class.forName("java.time.InstantParser"):null;
        var eligible=nativeRoute?helper.getDeclaredMethod("eligible",String.class):null;
        var fast=nativeRoute?helper.getDeclaredMethod("tryParse",String.class):null;
        if (nativeRoute) {eligible.setAccessible(true);fast.setAccessible(true);}
        String[] names={"happy","mixed","fallback","syntax","calendar","custom"};
        int[] attempts={8,6,0,0,2,0},hits={8,4,0,0,0,0};
        for (int n=0;n<names.length;n++) {
            var inputs=corpus(names[n]);int actualAttempts=0,actualHits=0;
            var digest=MessageDigest.getInstance("SHA-256");
            for (var input:inputs) {
                Object wanted=outcome(input,true),actual=outcome(input,false);
                if (!wanted.equals(actual)) throw new AssertionError(names[n]+": "+input);
                update(digest,input,actual);
                boolean invalid=names[n].equals("syntax")||names[n].equals("calendar");
                if (!names[n].equals("mixed") && invalid==(wanted instanceof Instant))
                    throw new AssertionError("Wrong corpus classification: "+input);
                if (nativeRoute && input instanceof String string) {
                    if ((boolean)eligible.invoke(null,string)) actualAttempts++;
                    if (fast.invoke(null,string)!=null) actualHits++;
                }
            }
            if (nativeRoute && (actualAttempts!=attempts[n]||actualHits!=hits[n]))
                throw new AssertionError("Wrong native distribution: "+names[n]);
            // Small functional smoke only: no warmup, timers or allocation counters.
            long actual=batch(inputs,0),wanted=expected(inputs,0,BATCH);
            if (actual!=wanted) throw new AssertionError("Batch checksum: "+names[n]);
            System.out.println("audit,"+names[n]+","+wanted+","+actualAttempts+","+actualHits);
            System.out.println("oracle,"+names[n]+","+inputs.length+","+HexFormat.of().formatHex(digest.digest()));
        }
        var random=new Random(0x496e7374616e74L);var digest=MessageDigest.getInstance("SHA-256");
        for (int i=0;i<4096;i++) {
            int digits=random.nextInt(10);
            String fraction=String.format(Locale.ROOT,"%09d",random.nextInt(1_000_000_000)).substring(0,digits);
            String input=String.format(Locale.ROOT,"%04d-%02d-%02dT%02d:%02d:%02d",
                    random.nextInt(10000),random.nextInt(14),random.nextInt(33),
                    random.nextInt(25),random.nextInt(61),random.nextInt(61))+(digits==0?"":"."+fraction)+"Z";
            Object wanted=outcome(input,true),actual=outcome(input,false);
            if (!wanted.equals(actual)) throw new AssertionError("Fuzz mismatch: "+input);
            update(digest,input,actual);
        }
        System.out.println("oracle,fuzz,4096,"+HexFormat.of().formatHex(digest.digest()));
    }

    static void unavailable() throws Exception {
        // Resolve formatter/filesystem before altering the isolated JVM loader path.
        DateTimeFormatter.ISO_INSTANT.parse(HAPPY[0],Instant::from);
        var directory=Files.createTempDirectory("instant-missing-");
        var paths=Class.forName("jdk.internal.loader.NativeLibraries$LibraryPaths").getDeclaredField("SYS_PATHS");
        paths.setAccessible(true);String[] live=(String[])paths.get(null),saved=live.clone();
        var helper=Class.forName("java.time.InstantParser");
        var fast=helper.getDeclaredMethod("tryParse",String.class);fast.setAccessible(true);
        var failed=helper.getDeclaredField("failed");failed.setAccessible(true);
        var state=Class.forName("java.time.InstantParser$Library").getDeclaredField("STATE");state.setAccessible(true);
        if (failed.getBoolean(null) || ((java.util.concurrent.atomic.AtomicInteger)state.get(null)).get()!=0)
            throw new AssertionError("Missing-library lane was already initialized");
        try {
            Arrays.fill(live,directory.toString());
            if (fast.invoke(null,HAPPY[0])!=null || !failed.getBoolean(null))
                throw new AssertionError("Permanent loader failure was not observed");
            if (((java.util.concurrent.atomic.AtomicInteger)state.get(null)).get()!=3)
                throw new AssertionError("Library did not become permanently unavailable");
        } finally {
            System.arraycopy(saved,0,live,0,live.length);Files.delete(directory);
        }
        if (fast.invoke(null,new Object[]{null})!=null)
            throw new AssertionError("Failed backend did not bypass input inspection");
    }

    static void cold(String name) throws Exception {
        String input=switch(name) {
            case "happy" -> "1969-12-31T23:59:59.000001Z";
            case "fallback" -> "1969-12-31T23:59:59.123456789Z";
            case "calendar" -> "1900-02-29T00:00:00Z";
            default -> throw new IllegalArgumentException(name);
        };
        long begin=System.nanoTime();Object result;
        try {result=Instant.parse(input);} catch (DateTimeParseException error) {result=error;}
        long ns=System.nanoTime()-begin;
        sink=result;
        route(name);
        if (name.equals("calendar")) {
            if (!(result instanceof DateTimeParseException error) || error.getErrorIndex()!=0
                    || !error.getParsedString().equals(input)) throw new AssertionError("Wrong cold error");
        } else if (!(result instanceof Instant instant) || instant.getEpochSecond()!=-1
                || instant.getNano()!=(name.equals("happy")?1000:123456789))
            throw new AssertionError("Wrong cold result");
        System.out.println("cold,"+ns);
    }

    /** Untimed differential audit or one fresh-process first public parse. */
    public static void main(String[] args) throws Exception {
        switch (args[0]) {
            case "audit" -> audit(args.length > 1 && args[1].equals("native"));
            case "cold" -> cold(args[1]);
            default -> throw new IllegalArgumentException(args[0]);
        }
    }
}
