// Hold only after the application work, so a separate jcmd Compiler.codelist
// snapshot can account for baseline nmethods still resident in the code cache.
public class RetainedWorkload {
    public static void main(String[] args) throws Exception {
        CompilerWorkload.main(new String[]{"startup"});
        System.out.println("RETAINED_READY");
        System.in.read();
    }
}
