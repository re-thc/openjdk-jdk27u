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

import java.io.*;
import java.lang.management.*;
import java.lang.reflect.*;
import java.net.URI;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicReference;
import javax.management.*;
import javax.tools.*;
import com.sun.management.HotSpotDiagnosticMXBean;
import jdk.test.whitebox.WhiteBox;

public class MemoryQualification {
    static volatile long sink;
    static volatile Object escape;
    static MBeanServer server;
    static final ObjectName DC;
    static {
        try { DC = new ObjectName("com.sun.management:type=DiagnosticCommand"); }
        catch (Exception e) { throw new ExceptionInInitializerError(e); }
    }
    static String diagnostic(String command, String... args) throws Exception {
        return (String) server.invoke(DC, command, new Object[]{args}, new String[]{"[Ljava.lang.String;"});
    }
    static void initDiagnostics() throws Exception {
        server = ManagementFactory.getPlatformMBeanServer();
        for (int i=0;i<12;i++) diagnostic("vmNativeMemory", "summary", "scale=1");
    }
    static long control(int iterations) {
        long x=0x51a7c3e2L;
        for(int i=0;i<iterations;i++) x=Long.rotateLeft(x ^ (i*0x9e3779b9L),13)*0x2545f4914f6cdd1dL;
        sink=x;
        return x;
    }
    static void timedControl(String label) {
        long start=System.nanoTime(), checksum=control(20_000_000);
        System.out.println("QCONTROL\t"+label+"\t"+(System.nanoTime()-start)+"\t"+checksum);
    }
    static void memorySnapshot(String label) throws Exception {
        System.out.println("QSNAP_BEGIN\t"+label);
        System.out.print(diagnostic("vmNativeMemory",Boolean.getBoolean("memory.nmtDetail")?"detail":"summary","scale=1"));
        System.out.println("QSNAP_END\t"+label);
        System.out.flush();
        if (System.in.read() != '\n') throw new AssertionError("Missing sampling acknowledgement");
    }
    static void threadCohort(int count, String label, boolean report) throws Exception {
        Object gate=new Object();
        CountDownLatch ready=new CountDownLatch(count);
        boolean[] stop={false};
        AtomicReference<Throwable> failed=new AtomicReference<>();
        Thread[] threads=new Thread[count];
        for(int i=0;i<count;i++) {
            threads[i]=new Thread(()->{
                try {
                    synchronized(gate) {
                        ready.countDown();
                        while(!stop[0]) gate.wait();
                    }
                } catch(Throwable t) { failed.compareAndSet(null,t); }
            },"memory-worker-"+i);
        }
        long start=System.nanoTime();
        try {
            for(Thread t:threads) t.start();
            if(!ready.await(5,TimeUnit.SECONDS)) throw new AssertionError("Thread cohort did not become ready");
            System.out.println("QTHREAD_START\t"+label+"\t"+count+"\t"+(System.nanoTime()-start));
            if(report) memorySnapshot(label+"-live");
        } finally {
            synchronized(gate) { stop[0]=true; gate.notifyAll(); }
            for(Thread t:threads) if(t.isAlive()) t.join(5000);
        }
        for(Thread t:threads) if(t.isAlive()) throw new AssertionError("Worker did not exit");
        if(failed.get()!=null) throw new AssertionError("Worker failed",failed.get());
        System.out.println("QTHREAD_END\t"+label+"\t"+count+"\t"+(System.nanoTime()-start));
        if(report) {
            Thread.sleep(50);
            memorySnapshot(label+"-retained");
        }
    }
    static void threads() throws Exception {
        initDiagnostics();
        threadCohort(16,"warm",false);
        Thread.sleep(50);
        memorySnapshot("warm-retained");
        threadCohort(64,"n64",true);
        threadCohort(192,"n192",true);
        threadCohort(192,"reuse192",true);
        System.out.println("QDONE\tthreads\t448");
    }
    static void threadPerformance() throws Exception {
        for(int i=0;i<5;i++) control(2_000_000);
        for(int i=0;i<3;i++) threadCohort(16,"warm"+i,false);
        timedControl("before");
        long start=System.nanoTime();
        for(int i=0;i<8;i++) threadCohort(192,"measured"+i,false);
        long elapsed=System.nanoTime()-start;
        timedControl("after");
        System.out.println("QRESULT\tthreadwork\t"+elapsed+"\t1536\t0\t8");
        System.out.println("QDONE\tthreadwork\t1536");
    }
    static long allocate(int count) {
        byte[][] ring=new byte[1024][];
        long sum=0;
        for(int i=0;i<count;i++) {
            byte[] a=new byte[512];
            a[0]=(byte)i; a[511]=(byte)(i>>>8);
            ring[i & 1023]=a;
            sum+=a[0]+a[511];
        }
        escape=ring;
        return sum;
    }
    static final class Source extends SimpleJavaFileObject {
        final String text;
        Source(String name,String text) { super(URI.create("string:///"+name+".java"),Kind.SOURCE); this.text=text; }
        public CharSequence getCharContent(boolean ignore) { return text; }
    }
    static long compileOnce(int round) throws Exception {
        String name="MemoryCompile"+round;
        StringBuilder text=new StringBuilder("public class "+name+" {");
        for(int i=0;i<192;i++) text.append("public static long m").append(i)
            .append("(long x){return (x*").append(i+3).append("L)^Long.rotateLeft(x,")
            .append(i%63+1).append(");}");
        text.append("}");
        JavaCompiler compiler=ToolProvider.getSystemJavaCompiler();
        long[] bytes={0};
        DiagnosticCollector<JavaFileObject> diagnostics=new DiagnosticCollector<>();
        try(StandardJavaFileManager standard=compiler.getStandardFileManager(diagnostics,null,null);
            JavaFileManager manager=new ForwardingJavaFileManager<StandardJavaFileManager>(standard) {
                public JavaFileObject getJavaFileForOutput(Location loc,String className,JavaFileObject.Kind kind,FileObject sibling) {
                    return new SimpleJavaFileObject(URI.create("bytes:///"+className.replace('.','/')+kind.extension),kind) {
                        public OutputStream openOutputStream() {
                            return new ByteArrayOutputStream() {
                                public void close() throws IOException { bytes[0]+=size(); super.close(); }
                            };
                        }
                    };
                }
            }) {
            if(!compiler.getTask(null,manager,diagnostics,List.of("-proc:none","-g:none"),null,List.of(new Source(name,text.toString()))).call())
                throw new AssertionError(diagnostics.getDiagnostics().toString());
        }
        if(bytes[0]==0) throw new AssertionError("Compiler emitted no class bytes");
        return bytes[0];
    }
    static void performance(String mode) throws Exception {
        CompilationMXBean compilation=ManagementFactory.getCompilationMXBean();
        com.sun.management.ThreadMXBean allocation=ManagementFactory.getPlatformMXBean(com.sun.management.ThreadMXBean.class);
        for(int i=0;i<5;i++) control(2_000_000);
        for(int i=0;i<3;i++) { if(mode.equals("allocation")) allocate(262144); else compileOnce(i); }
        timedControl("before");
        long sum=0;
        int rounds=mode.equals("allocation")?16:8;
        long compileStart=compilation.getTotalCompilationTime();
        long allocatedStart=allocation.getThreadAllocatedBytes(Thread.currentThread().threadId());
        long start=System.nanoTime();
        for(int i=0;i<rounds;i++) {
            long t=System.nanoTime();
            long value=mode.equals("allocation")?allocate(1048576):compileOnce(i+10);
            long workNanos=System.nanoTime()-t;
            if(mode.equals("allocation")) System.gc();
            control(1024);
            sum+=value;
            System.out.println("QROUND\t"+mode+"\t"+i+"\t"+(System.nanoTime()-t)+"\t"+value+"\t"+workNanos);
        }
        long elapsed=System.nanoTime()-start;
        long allocated=allocation.getThreadAllocatedBytes(Thread.currentThread().threadId())-allocatedStart;
        long compileMillis=compilation.getTotalCompilationTime()-compileStart;
        timedControl("after");
        System.out.println("QALLOC\t"+mode+"\t"+allocated);
        System.out.println("QRESULT\t"+mode+"\t"+elapsed+"\t"+sum+"\t"+compileMillis+"\t"+rounds);
        System.out.println("QDONE\t"+mode+"\t"+sum);
    }
    static final class CodeCase {
        static final WhiteBox WB=WhiteBox.getWhiteBox();
        static Set<Integer> oldIds=new HashSet<>(), liveIds=new HashSet<>(), newIds=new HashSet<>();
        static Set<Long> oldAddresses=new HashSet<>();
        static long payload;
        static Object[] nmethod(Method m) {
            Object[] n=WB.getNMethod(m,false);
            if(n==null || ((Integer)n[1])!=1) throw new AssertionError("Missing C1 method "+m);
            return n;
        }
        static Object[] compile(Method m) throws Exception {
            int expected=Integer.parseInt(m.getName().substring(4))+7;
            if(((Integer)m.invoke(null,7))!=expected) throw new AssertionError("Target semantic check "+m);
            if(!WB.enqueueMethodForCompilation(m,1)) throw new AssertionError("Compilation enqueue "+m);
            long limit=System.nanoTime()+TimeUnit.SECONDS.toNanos(3);
            while(WB.isMethodQueuedForCompilation(m)) {
                if(System.nanoTime()>limit) throw new AssertionError("Compilation timeout");
                Thread.sleep(1);
            }
            return nmethod(m);
        }
        static Set<Integer> codelist() throws Exception {
            Set<Integer> ids=new HashSet<>();
            for(String line:diagnostic("compilerCodelist").split("\n")) {
                String[] parts=line.trim().split("\\s+");
                if(parts.length>=4 && parts[3].startsWith("MemoryTargets.")) ids.add(Integer.parseInt(parts[0]));
            }
            return ids;
        }
        static long count(Set<Integer> all,Set<Integer> selected) { return selected.stream().filter(all::contains).count(); }
        static void snapshot(String label) throws Exception {
            long used=0,committed=0,reserved=0;
            for(MemoryPoolMXBean p:ManagementFactory.getMemoryPoolMXBeans()) {
                if(p.getName().startsWith("CodeHeap")||p.getName().equals("CodeCache")) {
                    MemoryUsage u=p.getUsage(); used+=u.getUsed(); committed+=u.getCommitted(); reserved+=u.getMax();
                }
            }
            Set<Integer> ids=codelist();
            System.out.println("QCODE\t"+label+"\t"+used+"\t"+committed+"\t"+reserved+"\t"
                +count(ids,oldIds)+"\t"+count(ids,liveIds)+"\t"+count(ids,newIds));
            System.out.print(diagnostic("compilerCodecache"));
        }
        static void run() throws Exception {
            initDiagnostics();
            boolean g1=Boolean.parseBoolean(ManagementFactory.getPlatformMXBean(HotSpotDiagnosticMXBean.class).getVMOption("UseG1GC").getValue());
            if(g1) WB.concurrentGCAcquireControl();
            try {
                WB.fullGC();
                diagnostic("compilerCodelist"); diagnostic("compilerCodecache");
                List<Method> methods=new ArrayList<>(List.of(MemoryTargets.class.getDeclaredMethods()));
                methods.sort(Comparator.comparing(Method::getName));
                for(Method m:methods) {
                    Object[] n=compile(m);
                    int id=(Integer)n[3];
                    if(m.getName().startsWith("dead")) {
                        oldIds.add(id);
                        Object[] blob=(Object[])n[0];
                        payload+=(Integer)blob[1]; oldAddresses.add((Long)blob[3]);
                    } else liveIds.add(id);
                }
                if(oldIds.size()!=64||liveIds.size()!=64) throw new AssertionError("Incorrect method counts");
                for(Method m:methods) if(m.getName().startsWith("dead") && WB.deoptimizeMethod(m)!=1)
                    throw new AssertionError("Not made not-entrant "+m);
                snapshot("before");
                WB.fullGC();
                snapshot("after-one-gc");
                if(count(codelist(),liveIds)!=64) throw new AssertionError("Live compiled code removed");
                int reused=0;
                for(Method m:methods) if(m.getName().startsWith("dead")) {
                    Object[] n=compile(m); newIds.add((Integer)n[3]);
                    if(oldAddresses.contains((Long)((Object[])n[0])[3])) reused++;
                }
                snapshot("recompiled");
                WB.fullGC();
                snapshot("after-two-gc");
                if(count(codelist(),oldIds)!=0 || count(codelist(),liveIds)!=64 || count(codelist(),newIds)!=64)
                    throw new AssertionError("Code-cache liveness controls failed");
                System.out.println("QREUSE\t"+reused+"\t"+payload);
                System.out.println("QDONE\tcode\t128");
            } finally { if(g1) WB.concurrentGCReleaseControl(); }
        }
    }
    public static void main(String[] args) throws Exception {
        if(Runtime.getRuntime().maxMemory()>256L*1024*1024 || Runtime.getRuntime().availableProcessors()!=4)
            throw new AssertionError("Unexpected heap or processor bound");
        System.out.println("QREADY\t"+args[0]+"\t"+ProcessHandle.current().pid());
        System.out.println("QMETA\t"+Runtime.getRuntime().maxMemory()+"\t"+Runtime.getRuntime().availableProcessors()+"\t"+System.getProperty("java.runtime.version"));
        System.out.flush();
        switch(args[0]) {
            case "threads" -> threads();
            case "threadwork" -> threadPerformance();
            case "allocation", "compile" -> performance(args[0]);
            case "code" -> CodeCase.run();
            default -> throw new IllegalArgumentException(args[0]);
        }
    }
}
