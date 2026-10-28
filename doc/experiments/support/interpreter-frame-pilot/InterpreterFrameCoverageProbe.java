import java.lang.invoke.MethodType;
import java.lang.reflect.*;
import java.nio.file.*;
import java.util.*;
import jdk.test.whitebox.WhiteBox;

// Diagnostic requests only. Producer clocks here are never substituted for
// the uninstrumented full requests in the separate timed captures.
public class InterpreterFrameCoverageProbe {
    static final WhiteBox WB=WhiteBox.getWhiteBox();
    public static void main(String[] args)throws Exception {
        Map<Executable,long[]> existing=new HashMap<>();
        if(args[0].equals("0")) {
            Method[] targets=InterpreterFrameSemanticCost.targets(),callers=new Method[5];
            for(int i=0;i<5;i++)callers[i]=InterpreterFrameSemanticCost.class.getDeclaredMethod("run"+InterpreterFrameSemanticCost.NAMES[i],int.class);
            Method[] callees={InterpreterFrameSemanticCost.class.getDeclaredMethod("twice",int.class),
                InterpreterFrameSemanticCost.Token.class.getDeclaredMethod("equals",Object.class),
                InterpreterFrameSemanticCost.Impl.class.getDeclaredMethod("apply",int.class)};
            InterpreterFrameSemanticCost.initialize(targets,callers,callees);
            for(int i=0;i<5;i++){
                long[] data=WB.interpreterFramePilot(targets[i],4);existing.put(targets[i],data);
                InterpreterFrameSemanticCost.check(data[0]==1,"diagnostic preparation");
                System.out.println("CUT "+InterpreterFrameSemanticCost.NAMES[i]+" "+Arrays.toString(data));
            }
        }
        int accepted=0;
        for(String full:Files.readAllLines(Path.of(args[1]))) {
            int paren=full.indexOf('('),dot=full.lastIndexOf('.',paren);
            String owner=full.substring(0,dot),name=full.substring(dot+1,paren),descriptor=full.substring(paren);
            try {
                ClassLoader loader=ClassLoader.getSystemClassLoader();Class<?> klass=Class.forName(owner,false,loader);WB.linkClass(klass);
                MethodType type=MethodType.fromMethodDescriptorString(descriptor,loader);Executable executable=null;
                if(name.equals("<init>"))executable=klass.getDeclaredConstructor(type.parameterArray());
                else for(Method m:klass.getDeclaredMethods())if(m.getName().equals(name) &&
                    MethodType.methodType(m.getReturnType(),m.getParameterTypes()).equals(type)){executable=m;break;}
                if(executable==null)throw new NoSuchMethodException(full);
                long[] data=existing.get(executable);boolean prior=data!=null;
                if(!prior)data=WB.interpreterFramePilot(executable,4);
                if(data[0]==1)accepted++;
                System.out.println("PROBE "+full+" "+prior+" "+Arrays.toString(data));
            }catch(ReflectiveOperationException|LinkageError failure){System.out.println("UNAVAILABLE "+full+" "+failure);}
        }
        System.out.println("COVERAGE_PROBE_OK "+accepted);
    }
}
