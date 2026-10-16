import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HexFormat;
import org.openjdk.jmh.runner.CompilerHints;

/** Exercise unmodified JMH autodetection and hints only; never runs a benchmark. */
public class BlackholeReadiness {
    public static void main(String[] args) throws Exception {
        for (String property : new String[] {"jmh.blackhole.mode", "jmh.blackhole.autoDetect",
                                             "jmh.compilerhints.mode"}) {
            if (System.getProperty(property) != null) {
                throw new AssertionError("Unexpected blackhole override: " + property);
            }
        }
        CompilerHints.printHints(System.out);
        if (CompilerHints.compilerHintsSelect() != CompilerHints.CompilerHintsSelect.AUTO_ON) {
            throw new AssertionError("Compiler hints are not automatically enabled");
        }
        var command = new ArrayList<String>();
        CompilerHints.addCompilerHints(command);
        for (String flag : new String[] {"-XX:+UnlockDiagnosticVMOptions",
                                         "-XX:+UnlockExperimentalVMOptions",
                                         "-DcompilerBlackholesEnabled=true"}) {
            if (!command.contains(flag)) throw new AssertionError("Missing compiler blackhole flag: " + flag);
        }
        String hints = command.stream().filter(s -> s.startsWith("-XX:CompileCommandFile="))
                              .findFirst().orElseThrow().substring("-XX:CompileCommandFile=".length());
        byte[] bytes = Files.readAllBytes(Path.of(hints));
        var lines = Files.readAllLines(Path.of(hints));
        if (!lines.contains("blackhole,org/openjdk/jmh/infra/Blackhole.consumeCompiler") ||
            lines.contains("dontinline,org/openjdk/jmh/infra/Blackhole.consumeFull")) {
            throw new AssertionError("Unexpected compiler blackhole hints");
        }
        for (String line : lines) System.out.println("COMPILER_HINT=" + line);
        System.out.println("HINTS_SHA256=" + HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(bytes)));
        for (String flag : command) System.out.println("JMH_ADDED_ARG=" + flag);
        System.out.println("BLACKHOLE_READINESS_PASS_AUTO_COMPILER");
    }
}
