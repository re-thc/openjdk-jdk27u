import java.lang.reflect.Method;
import org.openjdk.bench.recovery.SplitFallbackBench;
import org.openjdk.bench.java.lang.ZmijFormatting;
import org.openjdk.jmh.infra.Blackhole;
import jdk.test.whitebox.WhiteBox;

/** Fixed counts only: separate compiler evidence, no performance score. */
public class CodeInputsProbe {
    public static void main(String[] args) throws Exception {
        String input=args[0];
        int level=Integer.parseInt(args[1]);
        Object state;
        Method target;
        if (input.equals("ordinary")) {
            SplitFallbackBench bench=new SplitFallbackBench();
            bench.dataset="ordinary";
            bench.setup();
            state=bench;
            target=SplitFallbackBench.class.getDeclaredMethod("bigDecimalValueOf",Blackhole.class);
        } else {
            ZmijFormatting bench=new ZmijFormatting();
            bench.setup();
            state=bench;
            target=ZmijFormatting.class.getDeclaredMethod(input.equals("short")?"bigDecimalShortInteger":"bigDecimalValueOf",Blackhole.class);
        }
        Blackhole hole=new Blackhole("Today's password is swordfish. I understand instantiating Blackholes directly is dangerous.");
        for(int i=0;i<4096;i++)target.invoke(state,hole);
        WhiteBox wb=WhiteBox.getWhiteBox();
        wb.deoptimizeMethod(target);
        System.out.println("BEFORE_EXPLICIT_ROOT "+target);
        if(!wb.enqueueMethodForCompilation(target,level))throw new AssertionError("Root enqueue failed");
        int actual=wb.getMethodCompilationLevel(target);
        if(actual!=level)throw new AssertionError("Unexpected root level "+actual);
        System.out.println("DIAG_ROOT_INSTALLED input="+input+" level="+actual);
        for(int i=0;i<512;i++)target.invoke(state,hole);
        System.out.println("DIAG_PASS");
    }
}
