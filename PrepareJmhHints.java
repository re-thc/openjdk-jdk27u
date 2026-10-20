import java.nio.file.*;
import java.util.*;
import org.openjdk.jmh.runner.CompilerHints;
public class PrepareJmhHints {
    public static void main(String[] args) throws Exception {
        var flags = new ArrayList<String>();
        CompilerHints.addCompilerHints(flags);
        Path retained = Path.of(args[0]).toAbsolutePath();
        Files.createDirectories(retained.getParent());
        String prefix = "-XX:CompileCommandFile=";
        boolean found = false;
        for (int i = 0; i < flags.size(); i++) {
            String flag = flags.get(i);
            if (flag.startsWith(prefix)) {
                Files.copy(Path.of(flag.substring(prefix.length())), retained, StandardCopyOption.REPLACE_EXISTING);
                flags.set(i, prefix + retained);
                found = true;
            }
        }
        if (!found) throw new AssertionError("JMH did not provide compiler hints");
        Files.write(Path.of(args[1]), flags);
        for (String flag : flags) System.out.println(flag);
    }
}
