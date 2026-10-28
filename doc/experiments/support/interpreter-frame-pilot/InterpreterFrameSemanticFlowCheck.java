import java.lang.reflect.Method;
import jdk.test.whitebox.WhiteBox;

// Untimed twin of the five timing shapes. Counting is explicit here only.
public class InterpreterFrameSemanticFlowCheck {
    public static void main(String[] args)throws Exception {
        WhiteBox wb=WhiteBox.getWhiteBox();
        InterpreterFrameSemanticCost.check(wb.getBooleanVMFlag("InterpreterFramePilotTestContinuations"),"counting explicitly enabled");
        Method[] roots=InterpreterFrameSemanticCost.targets(),callers=new Method[5];
        for(int i=0;i<5;i++)callers[i]=InterpreterFrameSemanticCost.class.getDeclaredMethod("run"+InterpreterFrameSemanticCost.NAMES[i],int.class);
        Method[] callees={InterpreterFrameSemanticCost.class.getDeclaredMethod("twice",int.class),
            InterpreterFrameSemanticCost.Token.class.getDeclaredMethod("equals",Object.class),
            InterpreterFrameSemanticCost.Impl.class.getDeclaredMethod("apply",int.class)};
        InterpreterFrameSemanticCost.initialize(roots,callers,callees);
        for(int i=0;i<5;i++) {
            long[] prepared=wb.interpreterFramePilot(roots[i],5);
            InterpreterFrameSemanticCost.check(prepared[0]==1 && prepared[8]!=0,"published root");
            wb.interpreterFramePilot(roots[i],2);int expected=InterpreterFrameSemanticCost.run(i,10_000);
            long[] off=wb.interpreterFramePilot(roots[i],3);wb.interpreterFramePilot(roots[i],1);
            int value=InterpreterFrameSemanticCost.run(i,10_000);long[] on=wb.interpreterFramePilot(roots[i],3);
            InterpreterFrameSemanticCost.check(value==expected,"same semantics");
            InterpreterFrameSemanticCost.check(on[9]-off[9]==10_000,"native root entries");
            InterpreterFrameSemanticCost.check(on[32]-off[32]==(i==1||i==3||i==4?10_000:0),"native post-call continuations");
            wb.interpreterFramePilot(roots[i],2);
            System.out.println("FLOW "+InterpreterFrameSemanticCost.NAMES[i]+" "+(on[9]-off[9])+" "+(on[32]-off[32]));
        }
        System.out.println("SEMANTIC_FLOW_OK");
    }
}
