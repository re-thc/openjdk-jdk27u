// Copyright (c) 2026, Harry Chan. All rights reserved.
// SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0
import java.lang.management.ManagementFactory;
import java.security.MessageDigest;
import java.util.*;
import com.sun.management.ThreadMXBean;

public final class PracticalHex {
    static final HexFormat H = HexFormat.of(), U = H.withUpperCase();
    static final HexFormat D = HexFormat.ofDelimiter(":").withPrefix("[").withSuffix("]");
    static volatile Object sink;
    static final ThreadMXBean MX = (ThreadMXBean)ManagementFactory.getThreadMXBean();
    static final long TID = Thread.currentThread().threadId();
    static final class Case {
        final String name, kind; final int size;
        final byte[][] bytes = new byte[16][];
        final String[] text = new String[16], offset = new String[16], decorated = new String[16];
        final StringBuilder[] seq = new StringBuilder[16];
        final byte[] tiny = new byte[32]; final String tinyText = "00".repeat(32);
        final MessageDigest digest; int index;
        Case(String name) throws Exception {
            this.name=name; int split=name.lastIndexOf(':');kind=name.substring(0,split);size=Integer.parseInt(name.substring(split+1));
            Random random=new Random(42+size); digest=kind.equals("sha256")?MessageDigest.getInstance("SHA-256"):null;
            char[] digits="0123456789abcdef".toCharArray();
            for(int j=0;j<16;j++) {
                bytes[j]=new byte[size];random.nextBytes(bytes[j]);char[] chars=new char[2*size];
                for(int i=0;i<size;i++){int b=bytes[j][i]&255;chars[2*i]=digits[b>>>4];chars[2*i+1]=digits[b&15];}
                text[j]=new String(chars);
                if(kind.equals("late-invalid")||kind.equals("utf16-invalid"))text[j]=text[j].substring(0,text[j].length()-1)+(kind.equals("late-invalid")?"g":"\u1234");
                if(kind.equals("early-invalid"))text[j]="g"+text[j].substring(1);
                if(kind.equals("offset-decode"))offset[j]="!!"+text[j]+"!!";
                if(kind.equals("charsequence"))seq[j]=new StringBuilder(text[j]);
                if(kind.equals("decorated-encode")||kind.equals("decorated-decode")){
                    StringBuilder b=new StringBuilder(5*size);for(int i=0;i<size;i++){if(i>0)b.append(':');b.append('[').append(chars[2*i]).append(chars[2*i+1]).append(']');}decorated[j]=b.toString();
                }
            }
        }
        Object call(){
            int i=index++&15;
            try {
                return switch(kind){
                    case "encode" -> H.formatHex(bytes[i]);
                    case "decode" -> H.parseHex(text[i]);
                    case "upper" -> U.formatHex(bytes[i]);
                    case "offset-encode" -> H.formatHex(bytes[i],7,size-7);
                    case "offset-decode" -> H.parseHex(offset[i],2,2+text[i].length());
                    case "decorated-encode" -> D.formatHex(bytes[i]);
                    case "decorated-decode" -> D.parseHex(decorated[i]);
                    case "charsequence" -> H.parseHex(seq[i]);
                    case "appendable" -> H.formatHex(new StringBuilder(),bytes[i]);
                    case "late-invalid", "utf16-invalid", "early-invalid" -> H.parseHex(text[i]);
                    case "sha256" -> H.formatHex(digest.digest(bytes[i]));
                    case "mixed" -> {for(int n=0;n<100;n++){sink=H.formatHex(tiny);sink=H.parseHex(tinyText);}yield H.parseHex(H.formatHex(bytes[i]));}
                    default -> throw new AssertionError(kind);
                };
            } catch(IllegalArgumentException e){if(!kind.endsWith("invalid"))throw e;return e.getMessage();}
        }
    }
    static long run(Case c,int n){long start=System.nanoTime();for(int i=0;i<n;i++)sink=c.call();return System.nanoTime()-start;}
    static void verify(Case c){
        Object x=c.call();
        if(c.kind.equals("encode")&&!x.equals(manual(c.bytes[0])))throw new AssertionError(c.name);
        if(c.kind.equals("decode")&&!Arrays.equals((byte[])x,c.bytes[0]))throw new AssertionError(c.name);
        if(c.kind.endsWith("invalid")&&!(x instanceof String s&&s.startsWith("not a hexadecimal digit:")))throw new AssertionError(c.name);
    }
    static String manual(byte[] a){char[] d="0123456789abcdef".toCharArray(),r=new char[2*a.length];for(int i=0;i<a.length;i++){r[2*i]=d[(a[i]&255)>>>4];r[2*i+1]=d[a[i]&15];}return new String(r);}
    public static void main(String[] args)throws Exception{
        if(args[0].equals("cold")){
            String mode=args[1];int n=switch(mode){case "empty"->0;case "tiny"->32;case "encode"->1024;case "encode2"->2048;case "encode4"->4096;case "decode"->128;default->65536;};
            byte[] bytes=new byte[n];String text="00".repeat(n);Object result=null;
            if(mode.equals("early-invalid"))text="g"+text.substring(1);
            System.out.println("BEGIN_PUBLIC_CALL");long start=System.nanoTime();
            if(mode.equals("early-invalid")){try{H.parseHex(text);throw new AssertionError();}catch(IllegalArgumentException expected){result=expected.getMessage();}}
            else if(mode.equals("session")){for(int j=0;j<128;j++)sink=H.parseHex(H.formatHex(bytes));result=sink;}
            else if(mode.startsWith("decode"))result=H.parseHex(text);else result=H.formatHex(bytes);
            long elapsed=System.nanoTime()-start;sink=result;
            System.out.println("COLD,"+mode+","+elapsed+","+(result instanceof byte[] a?a.length:((String)result).length()));return;
        }
        if(!MX.isThreadAllocatedMemorySupported())throw new AssertionError("allocation accounting unavailable");
        MX.setThreadAllocatedMemoryEnabled(true);
        int rotate=Integer.parseInt(args[1]);List<Case> cases=new ArrayList<>();for(String name:args[2].split(","))cases.add(new Case(name));
        Collections.rotate(cases,rotate%cases.size());
        System.out.println("# runtime="+System.getProperty("java.runtime.version")+"; gc="+ManagementFactory.getGarbageCollectorMXBeans().stream().map(x->x.getName()).toList()+"; warmupNs="+Long.getLong("hex.warmupNs",400_000_000L)+"; sampleNs="+Long.getLong("hex.sampleNs",80_000_000L)+"; samples=5");
        System.out.println("case,sample,ns_per_call,java_bytes_per_call,calls");
        for(Case c:cases){
            verify(c);int batch=16;while(run(c,batch)<1_000_000&&batch<1_048_576)batch*=2;
            long until=System.nanoTime()+Long.getLong("hex.warmupNs",400_000_000L);do{run(c,batch);}while(System.nanoTime()<until);
            for(int sample=0;sample<5;sample++){
                long before=MX.getThreadAllocatedBytes(TID),ns=0,count=0;
                do{ns+=run(c,batch);count+=batch;}while(ns<Long.getLong("hex.sampleNs",80_000_000L));
                long allocation=MX.getThreadAllocatedBytes(TID)-before;
                System.out.printf(Locale.ROOT,"%s,%d,%.3f,%.1f,%d%n",c.name,sample,(double)ns/count,(double)allocation/count,count);
            }
        }
        boolean available=false;
        try {Class<?> support=Class.forName("jdk.internal.util.HexFormatSupport");available=(boolean)support.getMethod("isAvailable").invoke(null);}
        catch(ClassNotFoundException baseline) { }
        System.out.println("# nativeAvailableAfter="+available);
    }
}
