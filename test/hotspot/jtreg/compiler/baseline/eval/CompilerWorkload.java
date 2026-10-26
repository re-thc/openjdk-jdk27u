import java.net.URI;
import java.util.List;
import java.util.ArrayList;
import javax.tools.*;
public class CompilerWorkload {
    static volatile int sink;
    static class Source extends SimpleJavaFileObject {
        final String text;
        Source(String name, String text) { super(URI.create("string:///"+name+".java"), Kind.SOURCE); this.text=text; }
        @Override public CharSequence getCharContent(boolean ignore) { return text; }
    }
    static class MemoryFile extends SimpleJavaFileObject {
        MemoryFile(String name, Kind kind) { super(URI.create("mem:///"+name.replace('.','/')+kind.extension),kind); }
        @Override public java.io.OutputStream openOutputStream() { return java.io.OutputStream.nullOutputStream(); }
    }
    static class Files extends ForwardingJavaFileManager<StandardJavaFileManager> {
        Files(StandardJavaFileManager f) { super(f); }
        @Override public JavaFileObject getJavaFileForOutput(Location l, String n, JavaFileObject.Kind k, FileObject s) { return new MemoryFile(n,k); }
    }
    static List<Source> sources() {
        List<Source> files=new ArrayList<>();
        for(int i=0;i<4;i++) files.add(new Source("Generated"+i,
            "import java.util.*; public class Generated"+i+" { public static int run(List<String> items) { int n=0; for(String s:items) n+=s.length(); return n; } public static String text(int x) { return Integer.toString(x*17); } }"));
        return files;
    }
    public static void main(String[] args) throws Exception {
        JavaCompiler compiler=ToolProvider.getSystemJavaCompiler();
        List<Source> files=sources();
        boolean warm=args.length>0 && args[0].equals("warm");
        int count=warm?1600:1;
        try(Files manager=new Files(compiler.getStandardFileManager(null,null,null))) {
            for(int i=0;i<count;i++) {
                if (warm && i == 1500) {
                    // Let queued compilation finish before the measurement window.
                    // This does not change thresholds or suppress future compilations.
                    var compilation = java.lang.management.ManagementFactory.getCompilationMXBean();
                    Thread.sleep(2000);
                    long previous = compilation.getTotalCompilationTime();
                    int stable = 0;
                    for (int attempts=0; attempts<50 && stable<5; attempts++) {
                        Thread.sleep(200);
                        long current = compilation.getTotalCompilationTime();
                        stable = current == previous ? stable+1 : 0;
                        previous = current;
                    }
                }
                long begin=System.nanoTime();
                if(!compiler.getTask(null,manager,null,List.of("-proc:none","-g:none"),null,files).call()) throw new AssertionError();
                sink=i;
                if(warm && i>=1500) System.out.println("warm_ns="+(System.nanoTime()-begin));
            }
        }
        System.out.println("JAVAC_OK");
    }
}
