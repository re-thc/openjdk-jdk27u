import java.lang.classfile.Attribute;
import java.lang.classfile.ClassFile;
import java.nio.file.Files;
import java.nio.file.Path;

public class StripModuleHashes {
    public static void main(String[] args) throws Exception {
        Path file = Path.of(args[0]);
        ClassFile cf = ClassFile.of();
        byte[] result = cf.transformClass(cf.parse(Files.readAllBytes(file)),
            (builder, element) -> {
                if (!(element instanceof Attribute<?> attribute &&
                      attribute.attributeName().equalsString("ModuleHashes"))) {
                    builder.with(element);
                }
            });
        Files.write(file, result);
    }
}
