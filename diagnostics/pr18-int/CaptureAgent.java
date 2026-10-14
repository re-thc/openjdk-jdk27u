/* Copyright (c) 2026, Teamoffy Pte. Ltd. GPL version 2. */
package diagnostic;

import java.lang.instrument.ClassFileTransformer;
import java.lang.instrument.Instrumentation;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.ProtectionDomain;
import java.security.MessageDigest;
import java.util.HexFormat;
import java.lang.classfile.ClassFile;
import java.lang.classfile.ClassTransform;
import java.lang.classfile.CodeBuilder;
import java.lang.classfile.CodeElement;
import java.lang.classfile.CodeTransform;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import static java.lang.constant.ConstantDescs.CD_Object;
import static java.lang.constant.ConstantDescs.CD_void;

/** Registers the JMH handler before its profiler callbacks; never transforms timed code. */
public final class CaptureAgent {
    public static void premain(String args, Instrumentation instrumentation) {
        instrumentation.addTransformer(new ClassFileTransformer() {
            @Override public byte[] transform(Module module, ClassLoader loader, String name, Class<?> old,
                                              ProtectionDomain domain, byte[] bytes) {
                if (!"org/openjdk/jmh/runner/BenchmarkHandler".equals(name)) return null;
                ClassFile classFile = ClassFile.of();
                byte[] transformed = classFile.transformClass(classFile.parse(bytes),
                        ClassTransform.transformingMethodBodies(
                                method -> method.methodName().stringValue().equals("startProfilers"),
                                new CodeTransform() {
                                    @Override public void atStart(CodeBuilder builder) {
                                        builder.aload(0).invokestatic(ClassDesc.of("diagnostic.DiagnosticProfiler"),
                                                "registerHandler", MethodTypeDesc.of(CD_void, CD_Object));
                                    }
                                    @Override public void accept(CodeBuilder builder, CodeElement element) {
                                        builder.with(element);
                                    }
                                }));
                try {
                    Path directory = Path.of(System.getProperty("diagnostic.dir"));
                    Files.createDirectories(directory);
                    String a = HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(bytes));
                    String b = HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(transformed));
                    Files.writeString(directory.resolve("agent-" + ProcessHandle.current().pid() + ".json"),
                            "{\"transformed_class\":\"" + name + "\",\"method\":\"startProfilers\",\"before_sha256\":\"" + a + "\",\"after_sha256\":\"" + b + "\",\"benchmark_and_stub_unchanged\":true}");
                } catch (Exception e) {
                    throw new IllegalStateException("Cannot retain diagnostic agent audit", e);
                }
                return transformed;
            }
        });
    }
}
